"""Offline model-family and numerical compiler checks; no Hub downloads."""
import tempfile
import json
import subprocess
import sys
import unittest
from pathlib import Path
from unittest.mock import patch

import numpy as np
import torch
from transformers import CLIPConfig, CLIPModel, ViTConfig, ViTModel

from compilerlens.models.adapters import adapter_for, clip_inputs
from compilerlens.models.detect import detect, UnsupportedModelError
from compilerlens.models.hf_wrapper import wrap


def tiny_model(family):
    vision = dict(image_size=8, patch_size=4, num_channels=3, hidden_size=8,
                  intermediate_size=16, num_hidden_layers=1, num_attention_heads=2)
    if family == 'vit':
        config = ViTConfig(**vision)
        model_class = ViTModel
    else:
        text = dict(vocab_size=16, hidden_size=8, intermediate_size=16,
                    num_hidden_layers=1, num_attention_heads=2,
                    max_position_embeddings=8, bos_token_id=1, eos_token_id=15,
                    pad_token_id=0)
        config = CLIPConfig(text_config=text, vision_config=vision, projection_dim=4)
        model_class = CLIPModel
    config._attn_implementation = 'eager'
    with torch.random.fork_rng():
        torch.manual_seed(0)
        model = model_class(config).eval()
    return config, model


def detect_config(config, seq_len=4):
    with patch('compilerlens.models.detect._resolve_revision', return_value='a' * 40), \
         patch('compilerlens.models.detect._raw_config', return_value=config.to_dict()), \
         patch('transformers.AutoConfig.from_pretrained', return_value=config):
        return detect('test/model', seq_len=seq_len, offline=True)


class ModelAdapterTests(unittest.TestCase):
    def test_existing_text_models_keep_their_adapter(self):
        from transformers import BertConfig, BertModel, GPT2Config, GPT2LMHeadModel
        for config, model_class in (
            (BertConfig(vocab_size=16, hidden_size=8, intermediate_size=16,
                        num_hidden_layers=1, num_attention_heads=2), BertModel),
            (GPT2Config(vocab_size=16, n_embd=8, n_layer=1, n_head=2, n_positions=16,
                        bos_token_id=1, eos_token_id=2), GPT2LMHeadModel),
        ):
            detected = detect_config(config)
            self.assertEqual(detected.adapter, 'text')
            with patch.object(detected, 'load_model', return_value=model_class(config).eval()):
                module, inputs, info = wrap(detected)
            self.assertEqual(info['modalities'], ['text'])
            with torch.no_grad():
                self.assertEqual(module(*inputs).shape[:2], (1, 4))

    def test_clip_legacy_pooling_and_seed_reproducibility(self):
        profile = dict(image_size=[8, 8], num_channels=3, vocab_size=16,
                       bos_token_id=14, eos_token_id=2)
        with torch.random.fork_rng():
            torch.manual_seed(19)
            first = clip_inputs(profile, 4)
            torch.manual_seed(19)
            second = clip_inputs(profile, 4)
        for a, b in zip(first, second):
            torch.testing.assert_close(a, b)
        self.assertEqual(first[0].argmax().item(), 3)

    def test_profiles_and_outputs(self):
        for family in ('vit', 'clip'):
            with self.subTest(family=family):
                config, model = tiny_model(family)
                detected = detect_config(config)
                with patch.object(detected, 'load_model', return_value=model):
                    module, inputs, info = wrap(detected)
                self.assertEqual(detected.adapter, family)
                self.assertEqual(info['input_profile']['kind'], 'synthetic')
                self.assertEqual(len(info['input_profile']['inputs']), len(inputs))
                self.assertEqual(info['modalities'], ['image'] if family == 'vit' else ['image', 'text'])
                with torch.no_grad():
                    outputs = module(*inputs)
                self.assertEqual(len(info['output_names']), len(outputs) if isinstance(outputs, tuple) else 1)
                if family == 'clip':
                    self.assertEqual(inputs[0][0, -1].item(), config.text_config.eos_token_id)
                    self.assertFalse((inputs[0][0, :-1] == config.text_config.eos_token_id).any())

    def test_invalid_vision_profiles_fail_before_loading(self):
        config, _ = tiny_model('vit')
        config.image_size = 4096
        with self.assertRaisesRegex(UnsupportedModelError, '512'):
            detect_config(config)
        config, _ = tiny_model('clip')
        for length in (1, 9):
            with self.assertRaisesRegex(UnsupportedModelError, 'sequence length'):
                detect_config(config, seq_len=length)

    def test_parameter_guard_precedes_weight_download(self):
        for family in ('vit', 'clip'):
            with self.subTest(family=family):
                config, model = tiny_model(family)
                detected = detect_config(config)
                count = sum(p.numel() for p in model.parameters())
                with patch.object(detected, 'load_model', return_value=model) as load:
                    with self.assertRaisesRegex(ValueError, 'before weight download'):
                        wrap(detected, max_parameters=count - 1)
                    load.assert_not_called()
                    wrap(detected, max_parameters=count)
                    load.assert_called_once()

    def test_loading_uses_correct_class_and_pinned_offline_revision(self):
        for family, class_name in (('vit', 'ViTModel'), ('clip', 'CLIPModel')):
            config, model = tiny_model(family)
            detected = detect_config(config)
            with patch(f'transformers.{class_name}.from_pretrained', return_value=model) as load:
                detected.load_model(dtype=torch.float32)
            self.assertEqual(load.call_args.kwargs['revision'], 'a' * 40)
            self.assertTrue(load.call_args.kwargs['local_files_only'])
            self.assertFalse(load.call_args.kwargs['trust_remote_code'])
            self.assertEqual(load.call_args.kwargs['attn_implementation'], 'eager')

    def test_native_hf_forward_export_and_compiled_outputs_agree(self):
        import iree.compiler as compiler
        import iree.runtime as runtime
        import iree.turbine.aot as aot
        from compilerlens.models.architecture import export_program, capture_architecture

        for family in ('vit', 'clip'):
            with self.subTest(family=family), torch.random.fork_rng():
                torch.manual_seed(7)
                config, model = tiny_model(family)
                detected = detect_config(config)
                adapter = adapter_for(detected)
                module, inputs = adapter.prepare(detected, model)
                with torch.no_grad():
                    expected = module(*inputs)
                    if family == 'clip':
                        # Independent HF path: normal 2D mask, not our export mask.
                        native = model(input_ids=inputs[0], pixel_values=inputs[1],
                                       attention_mask=torch.ones_like(inputs[0]))
                        native = (native.image_embeds, native.text_embeds, native.logits_per_image)
                    else:
                        native = (model(pixel_values=inputs[0]).last_hidden_state,)
                expected = expected if isinstance(expected, tuple) else (expected,)
                for actual, reference in zip(expected, native):
                    torch.testing.assert_close(actual, reference)
                program = export_program(module, inputs)
                mlir = str(aot.export(program).mlir_module)
                architecture = capture_architecture(module, program, mlir,
                    {'model_id': 'test/model', **adapter.metadata(detected, inputs)})
                self.assertEqual(architecture['mapping_status'], 'exact')
                binary = compiler.compile_str(mlir, target_backends=['llvm-cpu'],
                                              extra_args=['--iree-llvmcpu-target-cpu=generic'])
                vm = runtime.load_vm_flatbuffer(binary, driver='local-sync')
                actual = vm.main(*(tensor.numpy() for tensor in inputs))
                actual = actual if isinstance(actual, (list, tuple)) else (actual,)
                self.assertEqual(len(actual), len(expected))
                for result, reference in zip(actual, expected):
                    np.testing.assert_allclose(result.to_host(), reference.numpy(), rtol=1e-4, atol=1e-4)

    def test_cli_demo_capture_has_viewable_artifact_and_verification(self):
        from compilerlens.storage import load_run
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory) / 'vit'
            result = subprocess.run([sys.executable, '-m', 'compilerlens', 'compile',
                '--example', 'tiny_vit', '--out', str(root), '--format', 'json'],
                capture_output=True, text=True, timeout=120)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(result.stdout)['status'], 'complete')
            _, artifact, _ = load_run(root)
            self.assertIn('asm', {stage['language'] for stage in artifact['stages']})
            facts = artifact['architecture']['model']
            self.assertEqual(facts['modalities'], ['image'])
            self.assertEqual(facts['weights'], 'random')
            self.assertEqual(facts['input_profile']['inputs'][0]['shape'], [1, 3, 8, 8])
            self.assertEqual(json.loads((root / 'verification.json').read_text())['status'], 'passed')

    def test_web_explore_clip_uses_shared_adapter_and_publishes_artifact(self):
        from fastapi.testclient import TestClient
        from compilerlens.backend.api import app as api
        config, model = tiny_model('clip')
        detected = detect_config(config)
        with tempfile.TemporaryDirectory() as directory, \
             patch.object(api, 'REPO_ROOT', Path(directory)), patch.object(api, 'JOBS', {}), \
             patch('compilerlens.models.detect.detect', return_value=detected), \
             patch.object(detected, 'load_model', return_value=model), TestClient(api.app) as client:
            response = client.post('/explore', json={'model_id': 'test/model', 'seq_len': 4})
            self.assertEqual(response.status_code, 200)
            job_id = response.json()['job_id']
            job = client.get(f'/compile/{job_id}').json()
            self.assertEqual(job['status'], 'done', job['error'])
            artifact = json.loads((Path(directory) / 'frontend/public/artifacts' /
                                   f'{job["artifact_id"]}.json').read_text())
            self.assertEqual(artifact['architecture']['model']['modalities'], ['image', 'text'])
            self.assertEqual(artifact['architecture']['mapping_status'], 'exact')
            self.assertTrue(any(stage['language'] == 'asm' for stage in artifact['stages']))
            report = json.loads((Path(directory) / 'runs' / job_id / 'verification.json').read_text())
            self.assertEqual(report['status'], 'passed')
            self.assertEqual(len(report['outputs']), 3)

    def test_verification_failure_is_recorded(self):
        from compilerlens.models.verification import verify_forward
        from types import SimpleNamespace
        bad_output = SimpleNamespace(to_host=lambda: np.array([99.0], dtype=np.float32))
        vm = SimpleNamespace(main=lambda *args: bad_output)
        with tempfile.TemporaryDirectory() as directory, \
             patch('iree.runtime.load_vm_flatbuffer', return_value=vm):
            root = Path(directory)
            (root / 'module.vmfb').touch()
            with self.assertRaisesRegex(RuntimeError, 'verification failed'):
                verify_forward(root / 'module.vmfb', torch.nn.Identity(),
                               (torch.ones(1),), ['value'], root / 'verification.json')
            self.assertEqual(json.loads((root / 'verification.json').read_text())['status'], 'failed')

    def test_playground_clip_uses_adapter_and_verifies_outputs(self):
        from fastapi.testclient import TestClient
        from compilerlens.backend.api import app as api
        config, model = tiny_model('clip')
        detected = detect_config(config)
        with tempfile.TemporaryDirectory() as directory, \
             patch.object(api, 'REPO_ROOT', Path(directory)), patch.object(api, 'JOBS', {}), \
             patch('compilerlens.models.detect.detect', return_value=detected), \
             patch.object(detected, 'load_model', return_value=model), TestClient(api.app) as client:
            response = client.post('/compile', json={'model_id': 'test/model', 'seq_len': 4,
                'stages': ['input'], 'options': {'target-cpu': 'generic'}})
            self.assertEqual(response.status_code, 200)
            job_id = response.json()['job_id']
            job = client.get(f'/compile/{job_id}').json()
            self.assertEqual(job['status'], 'done', job['error'])
            self.assertEqual(job['model_info']['adapter'], 'clip')
            self.assertEqual(job['stages_available'], ['input'])
            report = json.loads((Path(directory) / 'jobs' / job_id / 'verification.json').read_text())
            self.assertEqual(report['status'], 'passed')


if __name__ == '__main__':
    unittest.main()

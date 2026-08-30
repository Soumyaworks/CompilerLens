"""Work out how to load and trace a HuggingFace model from nothing but its id.

The point of this module is that adding a model costs no code: `compile_hf_model.py
prajjwal1/bert-tiny` should work without anyone registering anything. What makes that
awkward is that Hub configs are not uniform -- `prajjwal1/bert-tiny`, one of the models we
most want to demo, has neither `model_type` nor `architectures` in its config.json, and
`AutoConfig.from_pretrained` raises ValueError on it. So detection is a chain that falls
back to sniffing the raw config keys, and fails loudly rather than guessing when it cannot
tell.
"""

from __future__ import annotations

import json
from dataclasses import dataclass
from pathlib import Path

from huggingface_hub import HfApi, hf_hub_download

# Architecture suffixes that mean "generates tokens left to right", which is what decides
# whether the attention mask we build is causal.
_CAUSAL_ARCH_SUFFIXES = ("ForCausalLM", "LMHeadModel")

# Encoder-decoder models. Rejected up front rather than misdetected: they need
# `decoder_input_ids` alongside `input_ids`, which the two-argument wrapper does not supply,
# and `ForConditionalGeneration` would otherwise look causal. Without this, t5-small gets as
# far as AutoModelForCausalLM and dies with a transformers class-mismatch error that says
# nothing about the real problem.
_SEQ2SEQ_ARCH_SUFFIXES = ("ForConditionalGeneration", "ForSeq2SeqLM")
_SEQ2SEQ_MODEL_TYPES = frozenset({"t5", "mt5", "bart", "marian", "pegasus", "mbart", "blenderbot", "led"})

# model_type values we know trace cleanly. Anything else still works if transformers can
# build it -- this table only drives the causal/encoder decision and the output attribute.
_CAUSAL_MODEL_TYPES = frozenset({"gpt2", "gpt_neo", "gpt_neox", "gptj", "llama", "mistral", "opt", "bloom"})


class UnsupportedModelError(RuntimeError):
    """Raised when we cannot determine how to load or trace a model.

    Deliberately fatal: emitting a half-understood dump set would produce IR that looks
    authoritative but describes the wrong computation.
    """


@dataclass
class DetectedModel:
    model_id: str
    revision: str  # resolved commit sha -- always concrete, so a run is reproducible
    causal: bool
    vocab_size: int
    seq_len: int
    output_attr: str  # "logits" for causal LMs, "last_hidden_state" for encoders
    model_type: str  # for the record, e.g. "bert"; "unknown" when only sniffing worked
    detected_via: str  # "autoconfig" | "config-keys" -- reported so the user sees which path ran

    @property
    def slug(self) -> str:
        """Filesystem/URL-safe id: prajjwal1/bert-tiny -> prajjwal1_bert-tiny."""
        return self.model_id.replace("/", "_")

    def load_model(self):
        """Instantiate the model in eval mode. Imported lazily so --dry-run stays fast.

        When detection had to fall back to sniffing config keys, the Auto classes cannot load
        the model either -- `AutoModel.from_pretrained` raises the same "should have a
        model_type key" ValueError that `AutoConfig` did. In that case we build the config
        ourselves for the family we identified and hand it over explicitly, which is what
        makes models like prajjwal1/bert-tiny loadable at all.
        """
        from transformers import AutoConfig, AutoModel, AutoModelForCausalLM

        model_class = AutoModelForCausalLM if self.causal else AutoModel

        if self.detected_via == "autoconfig":
            return model_class.from_pretrained(self.model_id, revision=self.revision).eval()

        config = AutoConfig.for_model(self.model_type, **self._config_overrides())
        model = model_class.from_pretrained(self.model_id, revision=self.revision, config=config)
        return model.eval()

    def _config_overrides(self) -> dict:
        """Raw config.json values to seed an explicitly-constructed config with.

        Only the fields that change the architecture are forwarded; anything absent falls
        back to the family default, which is exactly what a config lacking model_type is
        relying on anyway.
        """
        raw = _raw_config(self.model_id, self.revision)
        return {k: v for k, v in raw.items() if k not in {"model_type", "architectures"}}


def _cached_revision(model_id: str) -> str | None:
    """The commit sha of the locally cached snapshot, read from the cache itself.

    `models/prefetch.py` exists so a demo can run with no network, but resolving a revision
    through the Hub API needs one -- so without this, offline mode (and a Hub rate-limit)
    fails even when the model is fully cached. Falling back to the cache is what makes
    prefetch deliver what it promises.

    `refs/main` is the right source: a repo can have several snapshots cached from different
    times, and this file records which one `main` actually points at. Counting snapshot
    directories and hoping for one would pick arbitrarily.
    """
    try:
        from huggingface_hub.constants import HF_HUB_CACHE
    except ImportError:
        return None

    repo_dir = Path(HF_HUB_CACHE) / f"models--{model_id.replace('/', '--')}"
    snapshots_dir = repo_dir / "snapshots"
    if not snapshots_dir.is_dir():
        return None

    def _valid(sha: str) -> bool:
        """A snapshot is only useful to us if it actually holds the config we will read next.

        Caches are not uniform: a repo can have several snapshots where only one was fully
        downloaded, and refs can point at an empty one (e.g. a PR revision fetched for a
        single file). Checking for config.json is what makes the choice correct rather than
        merely plausible.
        """
        return bool(sha) and (snapshots_dir / sha / "config.json").exists()

    ref_main = repo_dir / "refs" / "main"
    if ref_main.is_file():
        sha = ref_main.read_text().strip()
        if _valid(sha):
            return sha

    # A repo can be cached with no `main` ref at all -- e.g. downloaded via a PR revision,
    # which lands under refs/refs/pr/<n>. Any single unambiguous ref is still better than
    # guessing between snapshot directories.
    refs = [p for p in (repo_dir / "refs").rglob("*") if p.is_file()] if (repo_dir / "refs").is_dir() else []
    ref_shas = {sha for p in refs if _valid(sha := p.read_text().strip())}
    if len(ref_shas) == 1:
        return ref_shas.pop()

    snapshots = [p.name for p in snapshots_dir.iterdir() if p.is_dir() and _valid(p.name)]
    if len(snapshots) == 1:
        return snapshots[0]
    return None


def _resolve_revision(model_id: str, revision: str | None) -> str:
    if revision:
        return revision
    try:
        return HfApi().model_info(model_id).sha
    except Exception as exc:  # network, offline mode, 404, gated repo, rate limit
        cached = _cached_revision(model_id)
        if cached:
            return cached
        raise UnsupportedModelError(
            f"could not resolve a revision for '{model_id}': {exc}\n"
            f"  If the model is cached, pass --revision <sha> to skip the Hub lookup."
        ) from exc


def _raw_config(model_id: str, revision: str) -> dict:
    try:
        path = hf_hub_download(model_id, "config.json", revision=revision)
    except Exception as exc:
        raise UnsupportedModelError(f"'{model_id}' has no downloadable config.json: {exc}") from exc
    return json.loads(open(path).read())


def _causal_from(model_type: str, architectures: list[str] | None, is_decoder) -> bool:
    if architectures:
        if any(arch.endswith(_CAUSAL_ARCH_SUFFIXES) for arch in architectures):
            return True
    if model_type in _CAUSAL_MODEL_TYPES:
        return True
    return bool(is_decoder)


def detect(model_id: str, revision: str | None = None, seq_len: int = 32) -> DetectedModel:
    """Determine how to load and trace `model_id`.

    Tries transformers' own AutoConfig first, then falls back to reading config.json
    directly. Raises UnsupportedModelError if neither identifies the model.
    """
    resolved = _resolve_revision(model_id, revision)
    config = _raw_config(model_id, resolved)

    model_type = config.get("model_type")
    architectures = config.get("architectures")
    detected_via = "config-keys"

    if model_type:
        # transformers can parse it, so prefer its view: it normalises aliases and fills in
        # defaults the raw file omits.
        try:
            from transformers import AutoConfig

            parsed = AutoConfig.from_pretrained(model_id, revision=resolved)
            model_type = parsed.model_type
            architectures = getattr(parsed, "architectures", None) or architectures
            detected_via = "autoconfig"
        except Exception:
            # Fall through to the raw config -- AutoConfig is a nicety, not a requirement.
            pass

    vocab_size = config.get("vocab_size")
    if not vocab_size:
        raise UnsupportedModelError(
            f"'{model_id}' config.json has no vocab_size, so we cannot build example input "
            f"ids for it. Only text models taking input_ids are supported."
        )

    if (model_type or "") in _SEQ2SEQ_MODEL_TYPES or any(
        arch.endswith(_SEQ2SEQ_ARCH_SUFFIXES) for arch in (architectures or [])
    ):
        raise UnsupportedModelError(
            f"'{model_id}' is an encoder-decoder ({model_type}). Those need decoder_input_ids "
            f"in addition to input_ids, which the wrapper in models/hf_wrapper.py does not "
            f"supply. Encoder-only (BERT-like) and decoder-only (GPT-like) models work."
        )

    if not model_type and not architectures:
        # No declared identity (bert-tiny's case). Sniff the keys instead: GPT-style configs
        # use n_positions/n_layer, BERT-style use num_hidden_layers with type_vocab_size.
        if "n_layer" in config or "n_positions" in config:
            model_type, architectures = "gpt2", ["GPT2LMHeadModel"]
        elif "num_hidden_layers" in config:
            model_type, architectures = "bert", ["BertModel"]
        else:
            raise UnsupportedModelError(
                f"could not identify '{model_id}': config.json declares no model_type or "
                f"architectures, and its keys match no known family. "
                f"Keys present: {sorted(config)[:12]}"
            )

    causal = _causal_from(model_type or "", architectures, config.get("is_decoder"))

    return DetectedModel(
        model_id=model_id,
        revision=resolved,
        causal=causal,
        vocab_size=vocab_size,
        seq_len=seq_len,
        output_attr="logits" if causal else "last_hidden_state",
        model_type=model_type or "unknown",
        detected_via=detected_via,
    )

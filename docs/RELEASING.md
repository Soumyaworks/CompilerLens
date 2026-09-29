# Releasing CompilerLens

[Project overview](../README.md) · [CLI guide](CLI.md) · [0.2.1 notes](releases/0.2.1.md)

## Release status

**0.2.1 is being prepared, not published.** The last confirmed production release is
[0.1.1](https://pypi.org/project/compilerlens/0.1.1/); historical checks and its checksum
are preserved in [the 0.1.1 notes](releases/0.1.1.md).
The `v0.2.0` tag remains unchanged: its GitHub build failed at wheel repair before publication.
Version 0.2.1 pins the tested repair tools and verifies full wheel builds before tagging.

Target: Linux x86-64, glibc 2.35+, Python 3.10. The repaired wheel bundles the browser,
native analyzer and private libraries. macOS, Windows and ARM are not release targets.
The LLVM 22 analyzer is tested on the pinned IREE output; arbitrary LLVM versions and
the optional full IREE source-build integration are not validated.

### Local verification — 30 September 2026

Passed on Python 3.10.12 / Linux x86-64 / glibc 2.35:

- 48 Python tests, including regression checks for old/shadowed `patchelf` and tag-only
  publication; native CTest, TypeScript checking and bundled frontend build.
- Fresh packaging-tool environment with the workflow's requirements: `auditwheel 6.8.2`
  and pip package `patchelf 0.19.1.0` (binary reports 0.19.1). The workflow's actual preflight,
  wheel repair, metadata validation and manylinux platform check all passed.
- A separate fresh runtime venv, dependency resolution from PyPI/PyTorch CPU indexes,
  `pip check`, and installed `doctor`. Python and packaged native versions both report 0.2.1.
- Required-native matmul (33 stages), `tiny_vit` (53) and `tiny_clip` (79) captures;
  both vision demos passed numerical verification.
- Pinned ViT-Tiny CLI (52 stages) and TinyCLIP Web Explore (78), with exact module mappings,
  numerical checks and native LLVM/assembly links. Model weights were reused from the HF cache.
- Installed matmul trace (208 assembly matches), HTTP/browser checks, and both pretrained
  model viewers including desktop/mobile architecture, compiler workspace and Monaco.
- All three workflows pass `actionlint` 1.7.7. Component-version checks accept a branch build
  and `v0.2.1`, and reject `v0.2.0` or a prerelease-form tag. The wheel's Python sources,
  README metadata and native executable match the current checkout.

Local wheel: `compilerlens-0.2.1-py3-none-manylinux_2_35_x86_64.whl` (about 18 MB).
SHA-256: `a036cee1f1a8766ba240672082c09449c7bce554f4254ee9cd4b6352043f5585`.
Build/runtime environments, installation report, captures and screenshots are retained
outside the checkout in `../compilerlens-release-0.2.1.nW8wS8/` (not for git).

**Pending:** push the release commit and wait for both ordinary CI and its full GitHub wheel
build before tagging. The tag build, PyPI upload, and fresh PyPI-download verification are
not yet run. The GitHub runner is a separate environment; local validation cannot guarantee
external downloads or publisher permissions. Its rebuilt wheel may have a different checksum.

## Build and verify locally

Activate the source/build environment described in the README. The release script uses
`build/llvm`; configure with a matching LLVM SDK or reuse its existing configuration.
Do not reuse an incompatible CMake cache. Move old Python package staging directories
out of `build/` before building, so stale modules cannot enter the wheel.

```bash
python -m pip install --upgrade pip "setuptools>=77" wheel twine tomli \
  "auditwheel==6.8.2" "patchelf==0.19.1.0"
patchelf --version
python -m unittest discover -s tests -v
python scripts/build_release.py --llvm-dir "$CONDA_PREFIX/lib/cmake/llvm"
auditwheel repair dist/compilerlens-0.2.1-py3-none-linux_x86_64.whl --wheel-dir wheelhouse
python -m twine check wheelhouse/compilerlens-0.2.1-py3-none-manylinux_2_35_x86_64.whl
auditwheel show wheelhouse/compilerlens-0.2.1-py3-none-manylinux_2_35_x86_64.whl
```

Use the pip-provided `patchelf`, not Ubuntu 22.04's older apt package. The workflow
checks its installed version and executable path before building. Pass
`--cmake /path/to/cmake` for a configured toolchain that requires it. Use auditwheel's
actual platform tag if different, and investigate stricter requirements before release:
Conda LLVM builds can depend on different runtime libraries from GitHub's system LLVM build.

Install the repaired wheel with dependencies in a **fresh venv outside the checkout**,
using PyPI and the PyTorch CPU index; do not use `--no-deps` or system site packages.
Clear `PYTHONPATH` and `COMPILERLENS_NATIVE`. Check `pip check`, `doctor`,
required-native matmul/`tiny_vit`/`tiny_clip` captures, assembly tracing and the viewer.

Validate pretrained models with the installed Python; set `HF_HOME` to a disk with space.
Cached model weights are fine, but Python dependencies must belong to the clean venv:

```bash
python scripts/validate_hf_models.py vit-tiny --installed \
  --python /absolute/path/to/venv/bin/python --out build/release-vit --lineage required
python scripts/validate_hf_models.py tinyclip --installed --mode web \
  --python /absolute/path/to/venv/bin/python --out build/release-clip --lineage required
```

Use fresh output paths. Test both installed model viewers, including architecture,
compiler workspace and Monaco. Source-browser success alone does not validate a wheel.

## Before pushing the tag: GitHub and PyPI

1. GitHub **Settings → Environments → pypi**: create/review the environment. If deployment
   restrictions are enabled, allow release **tags**, such as `v*`; branch-only rules can
   block publication. Add required reviewers if desired and supported by your plan.
2. In the existing PyPI `compilerlens` project's Publishing settings, review/add its
   GitHub Trusted Publisher with **owner `Soumyaworks`**, **repository `CompilerLens`**,
   **workflow `publish.yml`**, and **environment `pypi`**. No API-token secret is required.
3. Confirm `0.2.1` is not already published and `v0.2.1` is not already a remote tag.
   Do not move published tags or reuse uploaded versions.
4. Review and commit the explicit release files, push the branch, and wait for both ordinary
   CI and **Publish to PyPI → Build and verify Linux wheel** to pass. On branches/PRs,
   that workflow builds/tests only; its publish job is skipped.
   Merging to main is not required. Tag the exact tested release commit.

```bash
git switch feature/experiments-cli
git diff --check
# Stage the explicit release files and review git diff --cached first.
git commit -m "release: prepare CompilerLens 0.2.1"
git push origin feature/experiments-cli
# Wait for ordinary CI AND the full wheel-build job on that commit before tagging:
git tag -a v0.2.1 -m "CompilerLens 0.2.1"
git push origin v0.2.1
```

**Pushing the tag starts production publication, not a dry run.** It pauses for approval
only when required environment reviewers are configured. Do not also upload manually.

## On GitHub after pushing the tag

1. Open **Actions → Publish to PyPI** for `v0.2.1`. It checks all component versions,
   runs Python/native/frontend tests, repairs the wheel and tests a fresh dependency
   installation, packaged demos, native lineage and HTTP routes.
2. Approve the `pypi` deployment if configured. The workflow uploads the **same wheel
   produced and tested by that GitHub run**, not the separately built local wheel.
3. Confirm [PyPI](https://pypi.org/project/compilerlens/) shows 0.2.1, then perform the
   fresh-download checks below. Local checks do not prove successful publication.
4. Open **Releases → Draft a new release**, choose the **existing `v0.2.1` tag**,
   title it **CompilerLens 0.2.1**, and use [the release notes](releases/0.2.1.md).
   Replace the draft-status sentence only after publication is confirmed.
   If attaching a wheel, use the workflow's `pypi-wheel` artifact, not the local build.
5. Record production verification in this checklist. The default-branch README updates
   only when merged; PyPI's description is embedded in the uploaded wheel.

The separate **Pretrained model compatibility** workflow is manual and must exist on the
default branch before GitHub exposes **Run workflow**. Its tests can be run locally
while the merge is deferred; it does not publish anything.

## Verify the actual PyPI download

Use a fresh directory outside the checkout after publication:

```bash
python3.10 -m venv .venv
source .venv/bin/activate
unset PYTHONPATH COMPILERLENS_NATIVE
python -m pip install --upgrade pip
python -m pip install --no-cache-dir compilerlens==0.2.1 \
  --index-url https://pypi.org/simple/ --extra-index-url https://download.pytorch.org/whl/cpu
python -m pip check
compilerlens --version
compilerlens doctor
compilerlens compile --example matmul --out runs/matmul --lineage required
compilerlens trace runs/matmul --module model --to asm
compilerlens compile --example tiny_clip --out runs/tiny-clip --lineage required
compilerlens view runs/tiny-clip
```

Repeat real-model/browser checks as appropriate. For a remote server, keep the viewer
running and follow the README's SSH tunnel instructions. Existing users can upgrade with
`python -m pip install --upgrade compilerlens==0.2.1` using the same indexes; existing
venvs do not update automatically.

## Future releases

Update versions together in `pyproject.toml`, `compilerlens/__init__.py`,
`llvm/CMakeLists.txt`, `llvm/tools/main.cpp`, `llvm/lib/Plugin.cpp` and
`llvm/lib/Lineage.cpp`; the tag workflow checks they agree. Update release notes and
installation examples. Only bump artifact/sidecar schemas when their format changes.
Rebuild and verify after changes to runtime code, dependencies or packaged metadata.

TestPyPI is optional: use separate TestPyPI credentials for a manual upload of a repaired
wheel if needed. The tag workflow targets **production PyPI**, not TestPyPI.

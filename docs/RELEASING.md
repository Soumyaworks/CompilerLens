# Releasing CompilerLens

[Project overview](../README.md) · [CLI guide](CLI.md) · [0.2.1 notes](releases/0.2.1.md)

## Release status

**0.2.1 is published on [PyPI](https://pypi.org/project/compilerlens/0.2.1/), and its
[GitHub Release](https://github.com/Soumyaworks/CompilerLens/releases/tag/v0.2.1) is complete**,
as confirmed by the maintainer. Historical checks and the 0.1.1 checksum are preserved in
[the 0.1.1 notes](releases/0.1.1.md).
The `v0.2.0` tag remains unchanged: its GitHub build failed at wheel repair before publication.
Version 0.2.1 pins the tested repair tools and verifies full wheel builds before tagging.

Target: Linux x86-64, glibc 2.35+, Python 3.10. The repaired wheel bundles the browser,
native analyzer and private libraries. macOS, Windows and ARM are not release targets.
The LLVM 22 analyzer is tested on the pinned IREE output; arbitrary LLVM versions and
the optional full IREE source-build integration are not validated.

### Local verification — 30 September 2026 (0.2.1)

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

**Publication versus verification:** publication is confirmed, but an independent fresh-download
verification of the production 0.2.1 wheel is not recorded here. The checksum above belongs
to the local wheel, not necessarily GitHub's independently rebuilt wheel.

## Prepare a future release

The procedure below is reusable; **do not recreate `v0.2.1` or upload 0.2.1 again**.
Merging an already released branch into `main` does not require a version bump or a tag.
Branch/PR builds test the wheel; only a version-tag push can publish it.

For a new release, choose an unused version and update it together in `pyproject.toml`,
`compilerlens/__init__.py`, `llvm/CMakeLists.txt`, `llvm/tools/main.cpp`,
`llvm/lib/Plugin.cpp` and `llvm/lib/Lineage.cpp`. The workflow checks they agree.
Add `docs/releases/<version>.md`, update installation examples and keep publication status
as pending until confirmed. Only bump artifact/sidecar schemas when their format changes.
Rebuild and verify after changes to runtime code, dependencies or packaged metadata.

## Build and verify locally

Activate the source/build environment described in the README. The release script uses
`build/llvm`; configure with a matching LLVM SDK or reuse its existing configuration.
Do not reuse an incompatible CMake cache. Move old Python package staging directories
out of `build/` before building, so stale modules cannot enter the wheel.

```bash
python -m pip install --upgrade pip "setuptools>=77" wheel twine tomli \
  "auditwheel==6.8.2" "patchelf==0.19.1.0"
export CLENS_VERSION="$(python -c 'import pathlib, tomli; print(tomli.loads(pathlib.Path("pyproject.toml").read_text())["project"]["version"])')"
patchelf --version
python -m unittest discover -s tests -v
python scripts/build_release.py --llvm-dir "$CONDA_PREFIX/lib/cmake/llvm"
auditwheel repair "dist/compilerlens-${CLENS_VERSION}-py3-none-linux_x86_64.whl" --wheel-dir wheelhouse
python -m twine check "wheelhouse/compilerlens-${CLENS_VERSION}-py3-none-manylinux_2_35_x86_64.whl"
auditwheel show "wheelhouse/compilerlens-${CLENS_VERSION}-py3-none-manylinux_2_35_x86_64.whl"
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
3. Confirm your selected version is not already published and its `vX.Y.Z` tag does not
   already exist locally or remotely. Check PyPI, `git tag --list` and `git ls-remote --tags origin`.
   Do not move published tags or reuse uploaded versions.
4. Review and commit the explicit release files, push your working branch and open a PR
   into `main`. Wait for both ordinary CI and **Publish to PyPI → Build and verify Linux
   wheel** to pass. Both workflows run on PRs and pushes to `main`; a push to another branch
   without a PR does not automatically run them. On PRs and `main` pushes, the publish job
   is skipped. After merging, wait for both workflows on the resulting `main` commit and
   tag that exact tested commit.

```bash
git diff --check
# Stage the explicit release files and review git diff --cached first.
git commit -m "release: prepare CompilerLens ${CLENS_VERSION}"
git push
```

Use your normal PR process; these commands do not bypass protection on `main`. For a new
branch without an upstream, first use `git push -u origin YOUR_BRANCH_NAME` with its actual
name. After any merge, wait for ordinary CI and the full wheel build on the resulting commit.
Check out the exact tested release commit with a clean working tree before tagging.
If using a new terminal, reactivate the build environment and read the version again:

```bash
export CLENS_VERSION="$(python -c 'import pathlib, tomli; print(tomli.loads(pathlib.Path("pyproject.toml").read_text())["project"]["version"])')"
git log -1 --oneline
# Only after checking this version/tag is unused and this exact commit passed both workflows:
git tag -a "v${CLENS_VERSION}" -m "CompilerLens ${CLENS_VERSION}"
git push origin "v${CLENS_VERSION}"
```

**Pushing the tag starts production publication, not a dry run.** It pauses for approval
only when required environment reviewers are configured. Do not also upload manually.

## On GitHub after pushing the tag

1. Open **Actions → Publish to PyPI** for your new `vX.Y.Z` tag. It checks all component versions,
   runs Python/native/frontend tests, repairs the wheel and tests a fresh dependency
   installation, packaged demos, native lineage and HTTP routes.
2. Approve the `pypi` deployment if configured. The workflow uploads the **same wheel
   produced and tested by that GitHub run**, not the separately built local wheel.
3. Confirm [PyPI](https://pypi.org/project/compilerlens/) shows the new version, then perform the
   fresh-download checks below. Local checks do not prove successful publication.
4. Open **Releases → Draft a new release**, choose the **existing new version tag**,
   title it **CompilerLens X.Y.Z**, and use that version's release notes.
   Replace the draft-status sentence only after publication is confirmed.
   If attaching a wheel, use the workflow's `pypi-wheel` artifact, not the local build.
5. Record production verification and the downloaded wheel's checksum in that version's
   release notes, separately from local-wheel results. The default-branch README updates
   only when merged; PyPI's description is embedded in the uploaded wheel.

The separate **Pretrained model compatibility** workflow is manual: open **Actions →
Pretrained model compatibility → Run workflow**, select `main` and start the run.
These real-download tests can also be run locally; they do not publish anything.

## Verify the actual PyPI download

Use a fresh directory outside the checkout after publication. Enter the exact published
version when prompted (for example, `0.2.1` to verify the current release):

```bash
python3.10 -m venv .venv
source .venv/bin/activate
unset PYTHONPATH COMPILERLENS_NATIVE
python -m pip install --upgrade pip
read -r -p "Published version to verify (X.Y.Z): " CLENS_VERSION
python -m pip install --no-cache-dir "compilerlens==${CLENS_VERSION:?Enter the published version}" \
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
`python -m pip install --upgrade "compilerlens==${CLENS_VERSION:?Set the published version}"`
using the same indexes; existing
venvs do not update automatically.

## Optional TestPyPI validation

TestPyPI is optional: use separate TestPyPI credentials for a manual upload of a repaired
wheel if needed. The tag workflow targets **production PyPI**, not TestPyPI.

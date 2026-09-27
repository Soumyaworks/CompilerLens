# Releasing CompilerLens

[Project overview](../README.md) · [CLI guide](CLI.md) · [LLVM component](../llvm/README.md)

## Current release: 0.1.1

Version 0.1.1 contains the current CLI, LLVM directory and lineage terminology changes,
updated installation documentation, and project URL metadata. See the
[release notes](releases/0.1.1.md) for compatibility details.

The release wheel is:

```text
wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
```

It targets Linux x86-64 with glibc 2.35 or newer. Python 3.10 is the validated interpreter.
macOS, Windows and ARM wheels are not provided. The optional full IREE source-build
integration remains unvalidated; the wheel analyzes emitted LLVM snapshots.

**Status (28 September 2026):** local verification passed: 22 Python tests, native CTest,
TypeScript/viewer build, wheel metadata/platform checks, fresh dependency installation,
`pip check`, installed `doctor`, required-native matmul capture (33 stages), assembly tracing
(208 matches), benchmarking, and installed HTTP/browser checks. Benchmark timings were
flagged as noisy and are not a performance result.

TestPyPI 0.1.1 is uploaded and verified. A fresh download matched the local wheel SHA-256.
A separate clean environment installed that downloaded wheel and resolved all dependencies
from PyPI and the PyTorch CPU index. `pip check`, installed-version/import-path checks,
`doctor`, required-native matmul capture (33 stages), forward/reverse tracing (208 assembly
matches), benchmarking, and installed HTTP/browser checks all passed. Production publication
and installation testing remain pending; publish this exact wheel using the commands below.

Wheel SHA-256:

```text
053579416e9c84de30994329018aaf3fd94be905ff0d20770bb14d76998fcc7d
```

Local build and verification records are retained in `build/release-0.1.1/` (not tracked).

The existing 0.1.0 release remains on TestPyPI. Its historical checks do not validate the
new 0.1.1 wheel. Do not overwrite an uploaded artifact or rebuild it between TestPyPI and
production publication.

## Build and check

Use a repository environment with the Python/frontend dependencies installed and the LLVM
build configured as described in the [CLI guide](CLI.md#builddevelop-the-native-pass).
On this workstation:

```bash
cd /local/mnt/workspace/compilers/CompilerLens
source .venv/bin/activate
python -m unittest discover -s tests -v
python scripts/build_release.py --cmake /pkg/qct/software/cmake/3.31.5/bin/cmake
auditwheel repair dist/compilerlens-0.1.1-py3-none-linux_x86_64.whl --wheel-dir wheelhouse
python -m twine check wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
auditwheel show wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
sha256sum wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
```

The release build runs native CTest, TypeScript checking and the bundled viewer build.
Activating the environment also makes its `patchelf` executable available to auditwheel.
Use the actual platform tag emitted by auditwheel if the build environment changes.
When renaming/removing modules, use a fresh Python package staging tree so obsolete files
in `build/lib.*` cannot enter the wheel. Keep the CMake build in `build/llvm/`.

## Upload to TestPyPI

Configure a **TestPyPI** API token in your local keyring or a private `~/.pypirc` entry:

```ini
[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = YOUR_TESTPYPI_TOKEN
```

Keep this file outside the repository and restrict it with `chmod 600 ~/.pypirc`.
Do not put tokens in commands, source files, release logs or screenshots.

```bash
.venv/bin/python -m twine upload --repository testpypi \
  --repository-url https://test.pypi.org/legacy/ \
  wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
```

## Verify the downloaded release

Use a new environment outside the checkout. Do not reuse installed development dependencies
or interpret `--no-deps` installation as a complete installation test. Download CompilerLens
separately from TestPyPI, then resolve dependencies from PyPI and the PyTorch CPU index.

```bash
CLENS_REPO=/local/mnt/workspace/compilers/CompilerLens
CLENS_CHECK_DIR="$(mktemp -d /tmp/compilerlens-release.XXXXXX)"
python3.10 -m venv --without-pip "$CLENS_CHECK_DIR/venv"
"$CLENS_REPO/.venv/bin/python" -m pip \
  --python "$CLENS_CHECK_DIR/venv/bin/python" install --upgrade pip

"$CLENS_CHECK_DIR/venv/bin/python" -m pip download \
  --index-url https://test.pypi.org/simple/ --no-deps --only-binary=:all: \
  --dest "$CLENS_CHECK_DIR/downloads" compilerlens==0.1.1

"$CLENS_CHECK_DIR/venv/bin/python" -m pip install \
  --index-url https://pypi.org/simple/ \
  --extra-index-url https://download.pytorch.org/whl/cpu \
  "$CLENS_CHECK_DIR/downloads/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl"

cd "$CLENS_CHECK_DIR"
source venv/bin/activate
python -m pip check
compilerlens --version
compilerlens doctor
compilerlens compile --example matmul --out runs/matmul --lineage required
compilerlens inspect runs/matmul
compilerlens trace runs/matmul --module model --to asm
compilerlens bench runs/matmul --workers 2 --repetitions 5
compilerlens view runs/matmul --port 8001
```

Open `http://127.0.0.1:8001`, select the workload and inspect its architecture and compiler
pipeline. Stop the server with Ctrl+C. Timings may be flagged as noisy on a busy host;
that is not an installation failure or a performance result.

Compare the downloaded wheel's SHA-256 with the repaired local wheel. For automated browser
checks, using this workstation's existing Playwright installation:

```bash
cd "$CLENS_REPO"
.venv/bin/python scripts/check_installed.py \
  "$CLENS_CHECK_DIR/venv/bin/python" "$CLENS_CHECK_DIR/runs/matmul" \
  --browser --browsers-path /tmp/compilerlens-browsers
```

## Publish the exact tested wheel to production PyPI

Finish TestPyPI verification first. Review and commit the release source changes so that
there is a source revision corresponding to the tested wheel. If runtime code, dependencies
or packaged metadata change, build and test a new version before publishing.

Production PyPI requires its own API token. A TestPyPI token does not work there, and
TestPyPI project ownership does not reserve the name on production PyPI. The first public
production release may be 0.1.1; uploading 0.1.0 first is unnecessary.

From the repository, verify the saved checksum and upload only this wheel:

```bash
cd /local/mnt/workspace/compilers/CompilerLens
(cd wheelhouse && sha256sum -c compilerlens-0.1.1.SHA256SUMS)
.venv/bin/python -m twine upload \
  --repository-url https://upload.pypi.org/legacy/ \
  --username __token__ \
  wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
```

Enter your **production PyPI token** when prompted. Do not use a wildcard selecting multiple
wheel versions, and do not use the unrepaired wheel from `dist/`.

After publication, install in another fresh environment using:

```bash
python -m pip install --index-url https://pypi.org/simple/ \
  --extra-index-url https://download.pytorch.org/whl/cpu compilerlens==0.1.1
```

Repeat `pip check`, `doctor`, matmul compilation, tracing and the viewer check. Then update
the README installation instructions to use production PyPI. Tag the exact released source
commit as `v0.1.1` and create a GitHub Release with the tested wheel and release notes.
Publishing to PyPI does not automatically publish a GitHub Release.

## Later releases

Keep the package name and command `compilerlens`. Publish a new version for subsequent
changes; uploaded distribution files cannot be overwritten. Update version strings in:

```text
pyproject.toml                         project.version
compilerlens/__init__.py               __version__
llvm/CMakeLists.txt                    project version
llvm/tools/main.cpp                    --version output
llvm/lib/Plugin.cpp                    plugin version
llvm/lib/Lineage.cpp                   pass_version
```

Update installation examples and release notes. Change artifact/sidecar schema versions only
when their formats require it. Document CLI/JSON or Python API compatibility changes.

Repeat build, repair, testing and publication for the new version. TestPyPI is optional
for later releases, but useful for validating packaging and dependency changes. GitHub Actions
and PyPI Trusted Publishing can automate this workflow later; they are not configured here.
Users choose when to upgrade with `python -m pip install --upgrade compilerlens`.

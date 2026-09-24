# CompilerLens: TestPyPI to GitHub and PyPI

Run these steps in order. They describe actions for you to perform; creating this checklist
has not committed, pushed, merged, tagged or published anything.

Verified on 25 September 2026:

- TestPyPI has `compilerlens` version `0.1.0` at https://test.pypi.org/project/compilerlens/0.1.0/.
- Its uploaded wheel's SHA-256 matches the local repaired wheel in `wheelhouse/`.
- The wheel is `compilerlens-0.1.0-py3-none-manylinux_2_35_x86_64.whl`.
- GitHub remote: `git@github.com:Soumyaworks/CompilerLens.git`; default branch: `main`.
- Current branch: `feature/experiments-cli`; implementation changes are not yet committed.
- No production PyPI project is publicly visible under `compilerlens` at the time of checking.
  TestPyPI does not reserve that name on production PyPI.

Local prepublication checks for this uploaded wheel are now complete: fresh TestPyPI download,
fresh dependency installation from the normal indexes, `pip check`, required native matmul
capture (33 stages), assembly tracing (208 matches), benchmarking, and the installed browser
flow all ran successfully. All 21 Python tests, native CTest and wheel metadata checks passed.
The benchmark flagged its timings as noisy; it is not a performance result. The release source
files are staged, with generated artifacts and unrelated experiments excluded. No commit, push
or production publication was performed during these checks.

Keep the uploaded `0.1.0` wheel unchanged while following these steps. If code, dependencies or
packaged metadata need fixing, use a new version and repeat the TestPyPI checks. Git-only
publication notes and ignore rules can be committed alongside the existing release.

## 1. Start in the repository

Use one terminal for the commands so the temporary-directory variables remain available.

```bash
cd /local/mnt/workspace/compilers/CompilerLens
CLENS_REPO="$PWD"
git branch --show-current
git status --short
```

The branch should be `feature/experiments-cli`. Do not use `git add .`: the working directory
also contains unrelated, untracked experimental models and presentation files.

## 2. Install the actual TestPyPI release in a fresh environment

This verifies what another user downloads, including resolving real dependencies. Earlier
isolated wheel checks reused local dependency files, so this step still matters.

Use a Linux x86-64 machine with glibc 2.35 or newer. Python 3.10 is the tested interpreter.
The current release does not provide macOS, Windows or ARM wheels.

```bash
CLENS_CHECK_DIR="$(mktemp -d /tmp/compilerlens-release.XXXXXX)"
python3 -m venv --without-pip "$CLENS_CHECK_DIR/venv"

# Bootstrap pip using the working repository environment. This also works on this
# workstation, where ordinary `python3 -m venv` previously lacked ensurepip.
"$CLENS_REPO/.venv/bin/python" -m pip \
  --python "$CLENS_CHECK_DIR/venv/bin/python" install --upgrade pip

# Download only CompilerLens from TestPyPI.
"$CLENS_CHECK_DIR/venv/bin/python" -m pip download \
  --index-url https://test.pypi.org/simple/ \
  --no-deps --only-binary=:all: \
  --dest "$CLENS_CHECK_DIR/downloads" \
  compilerlens==0.1.0

# Install that downloaded wheel; resolve dependencies from their normal indexes.
"$CLENS_CHECK_DIR/venv/bin/python" -m pip install \
  --index-url https://pypi.org/simple/ \
  --extra-index-url https://download.pytorch.org/whl/cpu \
  "$CLENS_CHECK_DIR/downloads/compilerlens-0.1.0-py3-none-manylinux_2_35_x86_64.whl"

"$CLENS_CHECK_DIR/venv/bin/python" -m pip check
```

Downloading the package separately keeps TestPyPI out of dependency resolution. Do not treat
an installation with `--no-deps` as a successful test of the complete user installation.

## 3. Exercise the installed CLI and viewer

Run outside the checkout, so Python cannot accidentally import the source directory.

```bash
cd "$CLENS_CHECK_DIR"
"$CLENS_CHECK_DIR/venv/bin/compilerlens" --version
"$CLENS_CHECK_DIR/venv/bin/compilerlens" doctor

"$CLENS_CHECK_DIR/venv/bin/compilerlens" compile \
  --example matmul --out "$CLENS_CHECK_DIR/matmul" --lineage required

"$CLENS_CHECK_DIR/venv/bin/compilerlens" inspect "$CLENS_CHECK_DIR/matmul"
"$CLENS_CHECK_DIR/venv/bin/compilerlens" inspect "$CLENS_CHECK_DIR/matmul" --show stages
"$CLENS_CHECK_DIR/venv/bin/compilerlens" trace \
  "$CLENS_CHECK_DIR/matmul" --module model --to asm

"$CLENS_CHECK_DIR/venv/bin/compilerlens" bench \
  "$CLENS_CHECK_DIR/matmul" --workers 2 --repetitions 5

"$CLENS_CHECK_DIR/venv/bin/compilerlens" view \
  "$CLENS_CHECK_DIR/matmul" --port 8001
```

Open `http://127.0.0.1:8001`. Select the workload, open its architecture, then open the compiler
pipeline and inspect IR/assembly. On a remote machine, forward port 8001 through SSH to your
browser machine. Press Ctrl+C in the server terminal when finished.

Expected: `doctor` reports ready, native analysis succeeds, the trace has matching instructions,
and the existing architecture/workspace/editor load. A benchmark can legitimately be marked
unreliable on a busy machine; that is not an installation failure.

Optional automated browser check, using the existing local Playwright installation:

```bash
cd "$CLENS_REPO"
.venv/bin/python scripts/check_installed.py \
  "$CLENS_CHECK_DIR/venv/bin/python" "$CLENS_CHECK_DIR/matmul" \
  --browser --browsers-path /tmp/compilerlens-browsers
```

That browser directory was downloaded during implementation. If it has been removed, install
Playwright's Chromium again as described in `docs/CLI.md`.

## 4. Run the source checks and validate the release file

```bash
cd "$CLENS_REPO"
.venv/bin/python -m unittest discover -s tests -v
/pkg/qct/software/cmake/3.31.5/bin/ctest --test-dir build/native --output-on-failure
.venv/bin/python -m twine check \
  wheelhouse/compilerlens-0.1.0-py3-none-manylinux_2_35_x86_64.whl
```

The current suite has 21 Python tests and the native CTest integration check. The CTest command
assumes the existing configured native build on this workstation; use `docs/CLI.md` to build
it on another machine. The release script already runs TypeScript checking when building assets.

Keep the repaired wheel in `wheelhouse/`. That is the file to publish, not the original generic
`linux_x86_64` wheel in `dist/`.

## 5. Stage exactly the release's source files

The following files/directories belong in this feature commit:

| Path | Purpose |
|---|---|
| `compilerlens/` | Canonical Python package, CLI, capture/query services, examples and migrated implementation |
| `backend/`, `ingest/`, `models/` | Compatibility imports and removal of the old implementation paths |
| `native/` | C++ pass/analyzer, CMake, LLVM license, fixtures and optional IREE hook |
| `pyproject.toml`, `setup.py`, `MANIFEST.in` | Package metadata and wheel/source packaging |
| `frontend/vite.release.config.ts` | Bundle the existing frontend for installation |
| `scripts/build_release.py`, `scripts/check_installed.py`, `scripts/check_viewer.mjs` | Release build and installation/browser validation |
| `scripts/compile_hf_model.py` | Updated imports for the package move |
| `tests/test_architecture.py`, `tests/test_llvm_lineage.py`, `tests/test_cli_provenance.py` | Existing adjusted tests and new regression tests |
| `.gitignore`, `README.md`, `FINALS_5_DAY_PLAN.md`, `docs/CLI.md`, `docs/RELEASING.md` | Ignore rules and documentation |

Run these scoped staging commands:

```bash
cd "$CLENS_REPO"

git add -A -- compilerlens/ backend/ ingest/ models/ native/ \
  ':(exclude)**/__pycache__/**'

git add -- \
  .gitignore README.md FINALS_5_DAY_PLAN.md \
  pyproject.toml setup.py MANIFEST.in \
  docs/CLI.md docs/RELEASING.md \
  frontend/vite.release.config.ts \
  scripts/build_release.py scripts/check_installed.py scripts/check_viewer.mjs \
  scripts/compile_hf_model.py \
  tests/test_architecture.py tests/test_llvm_lineage.py tests/test_cli_provenance.py

git diff --cached --check
git diff --cached --stat
git diff --cached --name-status
git status --short
```

`-A` is scoped to the listed source directories so the package moves include both additions
and removals. The current `.gitignore` excludes build products, including `wheelhouse/`.
The explicit exclusion avoids staging the old tracked bytecode file as part of this release.

Leave these local/generated paths out of the feature commit:

- `.venv/`, `build/`, `dist/`, `wheelhouse/`, `*.egg-info/`, `node_modules/`, `__pycache__/`.
- `compilerlens/_bin/`, `compilerlens/_web/`, `frontend/public/artifacts/`, `lib/*.so`.
- `runs/`, `jobs/`, `compilerlens-runs/` and generated `.vmfb`, `.bc`, `.o`, `.so` files.
- Currently untracked `archived_models/`, `experiments/`, `presentation/` and the generated
  model directories under `examples/`. They are separate work, not required by this package.
- API tokens, `.pypirc` credentials and any environment file containing secrets.

This does not remove existing tracked example fixtures. Generated native/web assets belong in
the wheel and GitHub Release attachments; their sources and build instructions belong in Git.
Remaining `??` entries for unrelated experiments are expected after staging.

## 6. Commit and push the feature branch

After reviewing the staged diff:

```bash
git commit -m "Add installable CLI and native LLVM provenance"
git push -u origin feature/experiments-cli
```

The code will then be visible on the feature branch at:

https://github.com/Soumyaworks/CompilerLens/tree/feature/experiments-cli

Open a pull request into `main`:

https://github.com/Soumyaworks/CompilerLens/compare/main...feature/experiments-cli

Suggested title: `Add installable CLI and native LLVM provenance`.

Describe the packaged CLI, native reporting pass, source/assembly/DWARF tracing, unchanged
viewer and validation results. State that the release wheel targets Linux x86-64/glibc 2.35+,
and that the optional full IREE source build has not been validated.

Review and merge the PR. If review changes runtime code or package metadata, build and test a
new version before continuing; do not publish the old wheel as if it contained those changes.

## 7. Publish the tested wheel to production PyPI

Create/log in to your account at https://pypi.org, verify your email, complete account security
setup and create a **production PyPI** API token at https://pypi.org/manage/account/token/.
For the first upload use an account-wide token; after the project exists, a project-scoped token
can be used. Your TestPyPI token will not work on production PyPI.

You may publish the same `0.1.0` artifact to production: the two indexes are independent.

```bash
cd "$CLENS_REPO"
.venv/bin/python -m twine upload \
  --repository-url https://upload.pypi.org/legacy/ \
  wheelhouse/compilerlens-0.1.0-py3-none-manylinux_2_35_x86_64.whl
```

Enter the production API token when prompted. If Twine asks for a username, use `__token__`.
Keep tokens out of shell commands, Git and screenshots. Explicitly naming the endpoint avoids
accidentally uploading to TestPyPI through a local repository configuration.

Confirm the new release at https://pypi.org/project/compilerlens/0.1.0/.
If the name cannot be registered, TestPyPI ownership does not grant production ownership; resolve
that before announcing an installation command under this name.

## 8. Verify installation from production PyPI

Use another fresh environment, so an already installed TestPyPI package cannot satisfy the request.

```bash
CLENS_PROD_CHECK="$(mktemp -d /tmp/compilerlens-pypi.XXXXXX)"
python3 -m venv --without-pip "$CLENS_PROD_CHECK/venv"
"$CLENS_REPO/.venv/bin/python" -m pip \
  --python "$CLENS_PROD_CHECK/venv/bin/python" install --upgrade pip

"$CLENS_PROD_CHECK/venv/bin/python" -m pip install \
  --index-url https://pypi.org/simple/ \
  --extra-index-url https://download.pytorch.org/whl/cpu \
  compilerlens==0.1.0

cd "$CLENS_PROD_CHECK"
"$CLENS_PROD_CHECK/venv/bin/python" -m pip check
"$CLENS_PROD_CHECK/venv/bin/compilerlens" doctor
"$CLENS_PROD_CHECK/venv/bin/compilerlens" compile \
  --example matmul --out "$CLENS_PROD_CHECK/matmul" --lineage required
```

Once verified, ordinary users can use `pip install compilerlens` on supported systems. The
PyTorch CPU extra index is recommended when explicitly choosing CPU-only PyTorch dependencies.

## 9. Tag the merged source and create a GitHub Release

After the PR is merged, update local `main` and inspect the commit being tagged:

```bash
cd "$CLENS_REPO"
git switch main
git pull --ff-only origin main
git log -1 --oneline
git tag --list v0.1.0
```

If the tag does not already exist, and this commit contains the released implementation:

```bash
git tag -a v0.1.0 -m "CompilerLens 0.1.0"
git push origin v0.1.0
```

If `main` has acquired other runtime changes since your release commit, tag the actual reviewed
release commit instead. Never move an existing published tag to different code.

On https://github.com/Soumyaworks/CompilerLens/releases/new:

1. Select tag `v0.1.0` and title `CompilerLens 0.1.0`.
2. Describe the CLI/native pass, supported platform and install command.
3. Link to https://pypi.org/project/compilerlens/0.1.0/ and `docs/CLI.md`.
4. Attach `wheelhouse/compilerlens-0.1.0-py3-none-manylinux_2_35_x86_64.whl`.
5. Publish the release.

Use the exact tested wheel as the release attachment. GitHub's automatic source archive is
useful for development, but building a wheel from source also requires the native/web build
steps. The binary wheel is the easy installation path.

Your source appears in the repository and its release appears under **Releases**. Publishing
to PyPI does not automatically create a GitHub Release or a GitHub Packages entry.

## 10. Make subsequent changes without renaming the project

Keep `name = "compilerlens"`, the `compilerlens` import and console command, and the GitHub
repository name. Release new versions instead of overwriting existing files.

For a `0.1.1` release, update the version strings in these six places:

```text
pyproject.toml                         project.version
compilerlens/__init__.py               __version__
native/CMakeLists.txt                  project version
native/tools/main.cpp                  --version output
native/lib/Plugin.cpp                  plugin version
native/lib/Provenance.cpp              pass_version
```

Do not bump artifact/provenance schema versions merely because the package version changed.
Update documentation examples as needed; historical release notes should retain their versions.

The existing uploaded wheel has no project URL metadata. Add this for the next version in
`pyproject.toml` so the PyPI page links back to GitHub:

```toml
[project.urls]
Repository = "https://github.com/Soumyaworks/CompilerLens"
Issues = "https://github.com/Soumyaworks/CompilerLens/issues"
Documentation = "https://github.com/Soumyaworks/CompilerLens/blob/main/docs/CLI.md"
```

Then build and test that new version on this workstation:

```bash
cd "$CLENS_REPO"
.venv/bin/python scripts/build_release.py \
  --cmake /pkg/qct/software/cmake/3.31.5/bin/cmake

.venv/bin/auditwheel repair \
  dist/compilerlens-0.1.1-py3-none-linux_x86_64.whl --wheel-dir wheelhouse

.venv/bin/python -m twine check \
  wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl

.venv/bin/python -m twine upload --repository testpypi \
  wheelhouse/compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl
```

Repeat the clean-install checks, commit/review the source, upload that exact new wheel to
production, and create tag/release `v0.1.1`. Use the actual tag emitted by auditwheel if the
build environment changes. Avoid `wheelhouse/*.whl` once it contains multiple releases.

Users choose when to upgrade:

```bash
pip install --upgrade compilerlens
# Or keep a specific release:
pip install compilerlens==0.1.0
```

Older installations are not automatically changed by a new PyPI upload. Keep CLI/Python
interfaces compatible where possible and document breaking changes. Once manual releases
are working, GitHub Actions plus PyPI Trusted Publishing can automate this same tested
sequence without storing a long-lived upload token; that automation is not configured here yet.

# CompilerLens

CompilerLens is an interactive explorer for AI compiler pipelines. It compiles a PyTorch or
Hugging Face model through IREE and presents the resulting Torch, MLIR, LLVM IR, and x86-64
stages in one navigable interface.

## What it provides

- A searchable timeline of compiler stages and passes
- Side-by-side textual and semantic diffs
- Compiler evidence linked directly to the IR that produced it
- Operation lineage from framework-level operations to lower-level representations
- A landing-page search flow that compiles a Hugging Face model and adds it as a workload
- A Sandbox for changing selected compiler options and benchmarking the result

## How the project is organized

```text
Hugging Face / PyTorch model
            │
            ▼
   models/ + backend/compiler/
       model loading and IREE compilation
            │
            ▼
        examples/<model>/
          raw compiler dumps
            │
            ▼
           ingest/
      normalized artifact JSON
            │
            ▼
          frontend/
   interactive pipeline explorer
```

```text
CompilerLens/
├── backend/
│   ├── api/                 FastAPI server for search and Sandbox jobs
│   ├── compiler/            PyTorch-to-IREE compilation pipeline
│   └── measure/             Whole-model benchmarks and comparisons
├── models/                  Hugging Face detection, loading, and wrappers
├── ingest/                  Dumps → normalized artifact JSON
│   └── workloads/           Hand-written and generated workload definitions
├── frontend/
│   ├── src/                 React application and explorer panes
│   ├── public/artifacts/    Generated artifacts served by Vite
│   └── scripts/verify.mjs   Browser-level regression checks
├── scripts/
│   └── compile_hf_model.py  Command-line Hugging Face compilation
├── examples/                Source programs and compiler dump directories
├── requirements.txt         Pinned Python environment
└── README.md                Setup and usage guide
```

The normalized artifact is the boundary between the compiler and the frontend. Static examples,
command-line compilations, and landing-page searches all feed the same ingest pipeline and UI.

## Requirements

- Linux x86-64
- Python 3.10
- Node.js 20.19+ or 22.12+; Node 22 is recommended
- Internet access for the initial dependency installation and uncached Hugging Face models
- Enough disk space for compiler dumps; even small models can produce tens or hundreds of MB

The pinned Python dependencies include the IREE compiler/runtime tools and CPU-only PyTorch.
No separate LLVM or IREE installation is required.

## Install

From the repository root:

```bash
python3.10 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

cd frontend
npm ci
npm run artifact
cd ..
```

`npm run artifact` converts the compiler dumps under `examples/` into the JSON artifacts used
by the website. Run it again after changing ingest code or adding a model from the command line.

## Run locally

Start the API from the repository root:

```bash
source .venv/bin/activate
python -m backend.api.run_server
```

In a second terminal, start the frontend:

```bash
cd frontend
npm run dev
```

Open the **Local** URL printed by Vite after `npm run dev` (for example,
`http://localhost:5173`). Vite may choose a different port when 5173 is already occupied.
Keep both processes running while using model search or the Sandbox. The existing,
pre-generated workload viewer only needs the frontend.

If port 8000 is already in use, an API server is probably running in another terminal. Reuse
that process or stop it before starting another one.

## Compile a model from the website

1. Open the landing page.
2. Select the search icon beside the CompilerLens title.
3. Enter a Hugging Face repository ID.
4. Select **Compile & open**.

The API downloads the model, exports it through Turbine, captures the compiler stages, creates
the normalized artifact, updates the landing-page index, and opens the new workload.

Good small models to try:

```text
hf-internal-testing/tiny-random-BertModel
hf-internal-testing/tiny-random-DistilBertModel
sshleifer/tiny-gpt2
prajjwal1/bert-tiny
```

The web flow currently accepts models below 100 million parameters. Compatibility depends on
whether the installed PyTorch, Transformers, and IREE versions can export every operation in
the model.

## Supported model shapes

The automatic wrapper currently supports:

- Encoder-only text models returning `last_hidden_state`
- Decoder-only text models returning `logits`
- Inputs shaped as `input_ids` plus a static 4D floating-point attention mask

Vision, audio, multimodal, and encoder-decoder models need additional input wrappers and are
rejected instead of being compiled with an incorrect signature. Sequence length is fixed at
compile time; the website uses 16 tokens for a compact first run.

## Command-line compilation

To compile without the landing-page UI:

```bash
source .venv/bin/activate
python scripts/compile_hf_model.py prajjwal1/bert-tiny --seq-len 16
cd frontend
npm run artifact
```

Useful options:

```bash
python scripts/compile_hf_model.py MODEL_ID --dry-run
python scripts/compile_hf_model.py MODEL_ID --revision COMMIT_SHA
python scripts/compile_hf_model.py MODEL_ID --out-dir /path/to/output
python scripts/compile_hf_model.py MODEL_ID --full
python -m models.prefetch MODEL_ID [MODEL_ID ...]
```

`--full` disables dump trimming and can generate several GB of data. The default mode retains
the stages needed by the UI while removing embedded weight payloads and redundant pass dumps.

## Sandbox and benchmarking

Choose **Open the Compiler Sandbox** from the landing page to:

- Compile selected stages
- Compare allowlisted compiler options such as target CPU and optimization level
- Inspect the resulting IR and compiler signals
- Run an explicit whole-model benchmark

Sandbox jobs are stored in memory and disappear when the API restarts. Hugging Face models
compiled through landing-page search are persisted under `examples/` and remain available after
artifact regeneration.

## Verification

Run the backend syntax checks and frontend production build:

```bash
source .venv/bin/activate
python -m py_compile backend/api/app.py backend/api/run_server.py ingest/build.py ingest/schema.py

cd frontend
npm run build
```

For browser-level checks, leave `npm run dev` running and execute:

```bash
cd frontend
npx playwright install chromium   # first run only
npm run verify
```

## Troubleshooting

- `iree-compile not found`: activate `.venv` before starting the API or compiler script.
- API unavailable in the UI: confirm `python -m backend.api.run_server` is listening on port
  8000.
- Hugging Face download failure: check the model ID, network access, authentication for gated
  repositories, and available disk space.
- Export or compilation failure: the architecture may use PyTorch operations unsupported by
  the current IREE pipeline. The API terminal contains the detailed compiler traceback.
- Frontend has no workloads: run `cd frontend && npm run artifact`.

## License

See [LICENSE](LICENSE).

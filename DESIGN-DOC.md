# CompilerLens --- AI Compiler Optimization Explorer

**Team:** Dead_Code_Society\
**Members:** Soumya, Ananya\
**Hackathon timeline:** \~20 days

## 1. Executive Summary

CompilerLens is an interactive platform for understanding how AI models
are transformed by a compiler from high-level PyTorch code down to
MLIR/LLVM and, eventually, machine-level representations.

The core idea is to make compiler transformations observable and
understandable. Instead of manually comparing IR dumps and compiler
logs, developers can follow an operation across compiler stages, inspect
transformations, view semantic diffs, and understand why optimizations
succeeded or failed.

The project should be positioned as **"GitLens for compiler
transformations"** or an **"AI Compiler Explorer."**

The hackathon MVP should focus on one excellent end-to-end vertical
slice rather than attempting to support every compiler, model, or
optimization.

## 2. Problem Statement

Modern AI compiler pipelines perform transformations such as:

-   Canonicalization
-   Constant folding
-   Operation fusion
-   Tiling
-   Loop transformations
-   Vectorization
-   Layout conversion
-   Dead-code elimination
-   Lowering

These transformations are powerful but often opaque to developers.

Typical questions include:

-   What happened to my `matmul` during lowering?
-   Which compiler pass transformed this operation?
-   When did two operations get fused?
-   Where was a tensor copied or converted?
-   Why did an operation fail to vectorize?
-   Where was a performance opportunity lost?

Answering these questions today often requires collecting IR dumps from
multiple stages, reading compiler logs, and manually comparing
representations.

## 3. Proposed Solution

CompilerLens creates a unified view of the compilation process:

``` text
PyTorch
   ↓
Torch / FX / Frontend Representation
   ↓
MLIR
   ↓
Linalg / SCF / Vector
   ↓
LLVM IR
   ↓
Machine-level Representation
```

For each compilation, CompilerLens produces a structured **CompilerLens
Artifact** containing:

-   Compilation stages
-   IR snapshots
-   Compiler passes
-   Operation metadata
-   Transformations
-   Operation lineage
-   Optimization remarks
-   Evidence for optimization decisions
-   AI-generated explanations

The frontend visualizes this information through an interactive
compiler-explorer-style interface.

## 4. Core MVP Features

### 4.1 Compilation Pipeline Explorer

Display every important compilation stage and allow users to inspect the
corresponding IR.

Example:

``` text
PyTorch → Linalg → SCF → Vector → LLVM

Import
  ↓
Canonicalize
  ↓
Fusion
  ↓
Tiling
  ↓
Vectorization
  ↓
LLVM Lowering
```

Clicking a stage or pass displays its IR.

### 4.2 Operation Lineage

Allow a developer to select an operation and trace it across
representations.

Example:

``` text
aten.matmul
    ↓
torch.aten.matmul
    ↓
linalg.matmul
    ↓
tiled loops
    ↓
vector.contract
    ↓
LLVM operations
```

Classify changes as:

-   Created
-   Modified
-   Lowered
-   Fused
-   Split
-   Eliminated

### 4.3 Transformation Timeline

Show the evolution of the selected operation through compiler passes.

Each transformation should expose:

-   Pass name
-   Before IR
-   After IR
-   Operations added
-   Operations removed
-   Operations modified
-   Transformation type

### 4.4 Semantic Diff

Go beyond textual IR diffs.

Example:

``` text
Before:
  linalg.matmul

After:
  scf.for × 3
  vector.contract
  vector.transfer_read
  vector.transfer_write

Detected transformation:
  MATMUL → TILED + VECTORIZED MATMUL
```

The UI should explain what the transformation means.

### 4.5 Optimization Doctor

Identify optimization successes and missed opportunities.

Example:

``` text
🔴 Missed Vectorization

Operation: %42
Pass: vectorize

Reason:
Dynamic loop bound prevented vectorization.

Evidence:
- Dynamic iteration count
- Vector width = 8

Suggestion:
Specialize common static dimensions or introduce
padding/versioning where appropriate.
```

Initial optimization analyses:

1.  Missed vectorization
2.  Missed fusion
3.  Unnecessary memory/layout conversion

### 4.6 AI Explanation Layer

The LLM should not guess compiler behavior.

Architecture:

``` text
Compiler Output
      ↓
Structured Evidence
      ↓
Optimization Analyzer
      ↓
Evidence JSON
      ↓
LLM
      ↓
Human-readable explanation
```

The model should answer:

1.  What happened?
2.  Why did it happen?
3.  What is the likely performance implication?
4.  What could a developer investigate or change?

The explanation must be grounded exclusively in compiler-generated
evidence.

## 5. Technical Architecture

``` text
                     React / TypeScript
                            │
                            │ REST / WebSocket
                            ▼
                       FastAPI Backend
                            │
             ┌──────────────┼──────────────┐
             ▼              ▼              ▼
       Compiler Runner   Analyzer          LLM
             │              │              │
             ▼              ▼              ▼
        MLIR / LLVM      Lineage &       Explanation
                         Optimization
             │
             ▼
       Compiler Artifacts
```

### Frontend

Recommended stack:

-   React
-   TypeScript
-   Vite
-   Tailwind CSS
-   Monaco Editor
-   React Flow or Cytoscape
-   Diff viewer

Major components:

``` text
Pipeline.tsx
IRViewer.tsx
OperationGraph.tsx
TransformationCard.tsx
SemanticDiff.tsx
ExplanationPanel.tsx
```

### Backend

Recommended stack:

-   Python
-   FastAPI
-   Pydantic
-   SQLite for MVP

Suggested endpoints:

``` text
POST /compile
GET  /compilation/{id}
GET  /stage/{id}
GET  /transformation/{id}
GET  /operation/{id}/lineage
GET  /analysis/{id}
POST /explain
```

## 6. CompilerLens Artifact Schema

The compiler backend should produce a normalized representation so the
frontend does not depend directly on raw compiler output.

Conceptual schema:

``` json
{
  "compilation_id": "abc123",
  "stages": [],
  "passes": [],
  "operations": [],
  "transformations": [],
  "lineage": [],
  "remarks": [],
  "analysis": []
}
```

A transformation can be represented as:

``` json
{
  "id": "t17",
  "pass": "vectorize",
  "type": "vectorization",
  "before": ["op12"],
  "after": ["op19"],
  "status": "success",
  "evidence": []
}
```

The normalized artifact is a key architectural decision because it
allows future support for additional compiler backends without
redesigning the UI.

## 7. Lineage Engine

The lineage engine should be implemented incrementally.

### Level 1 --- Explicit identifiers

Use operation names, locations, IDs, and compiler metadata where
available.

### Level 2 --- Structural matching

Compare:

-   Operation type
-   Operands
-   Result types
-   Attributes
-   Locations
-   Parent regions

### Level 3 --- Transformation rules

Introduce specialized rules for:

-   Fusion
-   Tiling
-   Lowering
-   Vectorization
-   Dead-code elimination

The goal is not perfect semantic equivalence. The goal is reliable
lineage for the supported demo workloads.

## 8. Optimization Evidence

Every optimization analysis should produce structured evidence.

Example:

``` json
{
  "pass": "vectorization",
  "status": "missed",
  "confidence": 0.91,
  "evidence": [
    "dynamic loop bound",
    "non-unit stride"
  ]
}
```

This evidence becomes the source of truth for the AI explanation layer.

LLVM optimization remarks and MLIR pass instrumentation/IR printing can
provide useful foundations for collecting compiler decisions and
before/after IR.

## 9. Demo Workloads

Do not attempt arbitrary PyTorch model support.

Use three controlled examples.

### Demo 1 --- Matrix Multiplication

``` python
y = torch.matmul(a, b)
```

Demonstrates:

-   Lowering
-   Tiling
-   Vectorization
-   LLVM generation
-   Operation lineage

### Demo 2 --- Linear + ReLU

``` python
y = torch.relu(x @ w + b)
```

Demonstrates:

-   Fusion
-   Canonicalization
-   Lineage
-   Semantic diff

### Demo 3 --- Intentionally Difficult / Poorly Optimized Workload

Use a workload that produces an interesting missed optimization, such
as:

-   Dynamic loop bounds
-   Non-unit memory access
-   An operation that cannot be fused
-   Redundant operations

This demonstrates that CompilerLens can explain not only what the
compiler optimized, but also what it failed to optimize.

## 10. 20-Day Development Plan

### Week 1 --- Compiler Pipeline + Product Skeleton

#### Soumya

-   Set up LLVM/MLIR and required frontend.
-   Establish a working PyTorch → MLIR → LLVM path.
-   Build the compiler runner.
-   Capture stage IR and pass information.
-   Define and freeze the CompilerLens Artifact Schema.
-   Implement basic transformation extraction.
-   Capture LLVM optimization remarks.
-   Produce a complete artifact for `matmul`.

#### Ananya

-   Set up React/TypeScript frontend.
-   Build application shell and navigation.
-   Build IR viewer using Monaco.
-   Integrate basic backend APIs.
-   Build compilation pipeline timeline.
-   Build initial text diff viewer.
-   Integrate frontend and backend.

### Week 2 --- Core Differentiating Features

#### Soumya

-   Implement operation IDs and lineage.
-   Track operations across stages.
-   Detect basic transformations.
-   Implement fusion detection.
-   Implement lowering detection.
-   Implement elimination detection.
-   Implement vectorization detection.
-   Generate structured optimization evidence.

#### Ananya

-   Build interactive operation graph.
-   Connect graph nodes to IR viewer.
-   Build transformation cards.
-   Build semantic diff UI.
-   Build timeline interactions.
-   Add filtering by operation/pass/transformation.
-   Improve navigation between source, transformation, and result.

### Week 3 --- Optimization Intelligence + AI

#### Soumya

Implement initial optimization rules:

1.  Missed vectorization
2.  Missed fusion
3.  Unnecessary memory/layout conversion

Integrate compiler remarks and evidence.

Build the structured explanation API.

#### Ananya

Build:

-   Optimization Doctor UI
-   AI explanation panel
-   Evidence display
-   Suggestion UI
-   Loading/error states
-   Visual polish
-   Interactive transitions

### Days 16--20 --- Integration, Polish, Demo

#### Both

-   End-to-end compilation workflow.
-   Fix lineage edge cases.
-   Add caching for deterministic demos.
-   Improve compiler error handling.
-   Optimize frontend performance.
-   Polish visual design.
-   Prepare three demo workloads.
-   Create a five-minute demo flow.
-   Prepare presentation and architecture diagrams.
-   Freeze features before final submission.

## 11. Repository Structure

``` text
compilerlens/
├── frontend/
│   └── src/
│       ├── components/
│       ├── pages/
│       └── api/
│
├── backend/
│   ├── api/
│   ├── models/
│   └── compiler/
│       ├── runner.py
│       ├── mlir/
│       ├── llvm/
│       └── instrumentation/
│
├── analyzer/
│   ├── transformations/
│   ├── lineage/
│   └── rules/
│
├── examples/
│   ├── matmul.py
│   ├── linear_relu.py
│   └── missed_vectorization.py
│
├── docs/
└── docker/
```

## 12. Team Ownership

  Area                       Soumya    Ananya
  -------------------------- --------- ---------
  MLIR / LLVM pipeline       Owner     
  Compiler instrumentation   Owner     
  Pass extraction            Owner     
  Operation lineage          Owner     Support
  Transformation detection   Owner     
  Optimization rules         Owner     
  Backend API                Owner     Support
  Artifact schema            Owner     Support
  Frontend architecture                Owner
  IR viewer                            Owner
  Pipeline UI                          Owner
  Diff UI                              Owner
  Operation graph            Support   Owner
  AI UX                      Support   Owner
  Visual design                        Owner
  Demo                       Owner     Owner
  Presentation               Owner     Owner

## 13. Scope Control

### Must Have

-   Real compiler pipeline
-   IR snapshots
-   Pass timeline
-   Operation lineage
-   Semantic transformation diff
-   At least 2--3 transformation types
-   Optimization evidence
-   AI explanation
-   Interactive UI
-   Three strong demo workloads

### Nice to Have

-   Machine-code view
-   Performance metrics
-   Execution-time comparison
-   More optimization rules
-   Compiler pipeline customization
-   Saved compilations
-   Search across IR

### Explicitly Out of Scope

-   User authentication
-   Complex database infrastructure
-   Kubernetes
-   Multi-user collaboration
-   Arbitrary compiler support
-   Full IDE
-   Full debugger
-   Training a custom AI model
-   Supporting every PyTorch model
-   Perfect operation matching
-   Dozens of optimization analyses

## 14. Hero Demo

The entire project should revolve around one memorable workflow:

``` text
1. Upload / select PyTorch model
              ↓
2. Compile
              ↓
3. View compilation pipeline
              ↓
4. Select MATMUL
              ↓
5. View operation lineage
              ↓
6. Inspect transformation timeline
              ↓
7. View semantic diff
              ↓
8. Select missed/successful optimization
              ↓
9. View compiler evidence
              ↓
10. Ask "Why?"
              ↓
11. Receive grounded AI explanation
              ↓
12. See optimization suggestion
```

The ideal reaction from a judge should be:

> "I clicked on a PyTorch operation and CompilerLens showed me exactly
> how the compiler transformed it and why an optimization succeeded or
> failed."

## 15. Winning Strategy

The project should not position AI as a generic chatbot layered on top
of compiler output.

The core hierarchy should be:

``` text
REAL COMPILER DATA
        ↓
TRANSFORMATION ANALYSIS
        ↓
OPTIMIZATION EVIDENCE
        ↓
AI EXPLANATION
```

The strongest differentiator is **compiler observability**, not the LLM
itself.

CompilerLens should feel like an **IDE for understanding compiler
behavior**, with the AI acting as the intelligent interpreter of
grounded compiler evidence.

## 16. Success Criteria

By the end of the hackathon, CompilerLens should reliably demonstrate:

-   A PyTorch workload entering the system.
-   Compilation through a real MLIR/LLVM pipeline.
-   IR visible at multiple stages.
-   Compiler passes visible on a timeline.
-   A selected operation traceable across stages.
-   Transformations automatically detected and classified.
-   Before/after semantic diffs.
-   At least one successful optimization and one missed optimization
    explained.
-   Compiler evidence presented alongside the explanation.
-   AI-generated explanations grounded in that evidence.
-   A polished, interactive web experience.
-   A deterministic five-minute live demo.

## 17. Core Product Statement

> **CompilerLens makes compiler optimizations visible, traceable, and
> understandable.**

**Tagline:**

> **Understand what your compiler did.**

# Stage 2: Operation Lineage Implementation Plan

## Overview
Implemented end-to-end operation lineage tracing, allowing users to click on a source code line and trace that operation through all compilation stages (IR representations).

## User Flow
1. User opens CompilerLens and views the PyTorch source code
2. User clicks on a highlighted source line (e.g., line 3: `matmul` operation)
3. Lineage pane opens showing all stages where this operation appears
4. User clicks on any stage in the lineage (e.g., "ConvertTorchToSCF")
5. Stage pane jumps to that stage with ALL lines of the operation highlighted in yellow
6. User can trace the operation through the entire lowering pipeline

## Architecture

### Data Flow
```
Backend (lineage data in artifact)
    ↓
artifact.lineage.lines[sourceLine]
    ↓
LineagePane (displays timeline)
    ↓
onJumpToStage(stageId, lines[])
    ↓
Workspace.navigateToStage(stageId, revealLine, highlightLines)
    ↓
StagePane receives StagePaneState with highlightLines
    ↓
IRViewer highlights all lines in the array
```

### Key Components

#### 1. **LineagePane** (`frontend/src/panes/LineagePane.tsx`)
- Main pane component for displaying operation lineage
- Accepts `sourceLine` from state
- Looks up lineage entry from `artifact.lineage.lines[sourceLine]`
- Renders `LineageTimeline` component
- Interface: `LineagePaneState { sourceLine: string }`
- Callback: `onJumpToStage(stageId: string, lines: number[])`

#### 2. **LineageTimeline** (`frontend/src/components/LineageTimeline.tsx`)
- Renders timeline of stages where operation appears
- Displays:
  - Operation name and source location
  - Total operations count and stage count
  - All operation names the source line becomes (op_names)
  - For each stage: stage name, phase tag, operation snippet
- Buttons to jump to each stage, passing ALL lines for that operation
- Signature: `onJumpToStage(stageId: string, lines: number[])`

#### 3. **IRViewer** (`frontend/src/components/IRViewer.tsx`)
- Updated to accept `highlightLines?: number[]` prop
- Highlights ALL lines in the array with yellow background
- Adds glyph margin indicator on first line only
- Decorations logic:
  - Lineage highlighting: yellow background (rgba(255, 193, 7, 0.4))
  - Jump highlighting: same yellow for consistency
  - Glyph margin: yellow circle for clickable indicator

#### 4. **SourcePane** (`frontend/src/panes/SourcePane.tsx`)
- Updated to accept `artifact` and `onOpenLineage` callback
- Automatically switches from pytorch-source to torch-input stage (pytorch-source has no operations)
- Passes lineage data and callback to IRViewer

#### 5. **StagePane** (`frontend/src/panes/StagePane.tsx`)
- Extended `StagePaneState` with `highlightLines?: number[]` field
- Passes `highlightLines` to `StageViewerBody`

#### 6. **StageViewerBody** (`frontend/src/panes/StageViewerBody.tsx`)
- Added `highlightLines?: number[]` prop
- Passes `highlightLines` to IRViewer

#### 7. **Workspace** (`frontend/src/Workspace.tsx`)
- Registered LineagePane with golden-layout
- Updated SourcePane registration to pass artifact and onOpenLineage callback
- `onOpenLineage` opens Lineage pane with sourceLine state
- Updated `navigateToStage` to accept optional `revealLine` and `highlightLines` parameters
- LineagePane registration passes full `lines` array to `navigateToStage`

### Styling (`frontend/src/styles/lineage.css`)
```css
.lineage-highlight-line: yellow background (rgba(255, 193, 7, 0.4)) with yellow left border
.lineage-glyph: yellow circle in glyph margin for clickable indicator
.lineage-jump-highlight: yellow highlighting for jumped-to lines
.lineage-jump-glyph: yellow glyph marker
```

## Data Structure

### Backend Lineage Schema
```typescript
interface Lineage {
  anchor_stage: string;  // e.g., "torch-input"
  lines: {
    [sourceLine: string]: LineageEntry;
  };
  summary: {
    source_lines_covered: number;
    total_anchored_ops: number;
  };
}

interface LineageEntry {
  source_location: string;  // e.g., "line 3"
  op_names: string[];       // e.g., ["torch.aten.matmul"]
  total_ops: number;        // Total operations across all stages
  stage_count: number;      // Number of stages where operation appears
  stages: {
    [stageId: string]: number[];  // Array of line numbers in this stage
  };
}
```

## Implementation Details

### Highlighting Strategy
- **Source stage (torch-input)**: Skip function signatures (lines < 3)
- **Other stages**: Highlight ALL lines from lineage data for each operation
- **Multi-line operations**: Pass entire array of lines, not just first line
- **Consistency**: Same highlighting logic across all 50+ stages

### Pane Reuse
- When jumping from lineage to a stage, reuses existing Stage pane if open
- Passes `revealLine` (first line) and `highlightLines` (all lines) to Stage pane
- Avoids pane clutter by not opening new panes unnecessarily

### Click Handling
- Click on glyph margin (yellow circle) in source code opens Lineage pane
- Click on stage in Lineage pane jumps to that stage with highlighting
- All interactions preserve the lineage context

## Testing Checklist

- [x] Click source line 3 (matmul) in torch-input stage
- [x] Lineage pane opens showing all 50 stages
- [x] Click "ConvertTorchToSCF" in lineage
- [x] Stage pane jumps to ConvertTorchToSCF with lines 2-13 highlighted
- [x] Verify highlighting is consistent across all stages
- [x] Verify multi-line operations are fully highlighted
- [x] Verify function signatures are not highlighted in torch-input
- [x] Verify other stages highlight all lines from lineage data

## Known Limitations

- Lineage data is generated by backend; frontend only displays it
- Only operations with loc() metadata are traceable
- Lineage is anchored to torch-input stage (source location)

## Future Improvements

1. **UI Clarity** (planned)
   - Guided workflow overlay for new users
   - Better visual hierarchy with color-coded panes
   - Inline lineage drawer instead of separate pane
   - Breadcrumb navigation

2. **Performance**
   - Lazy-load lineage data for large artifacts
   - Cache lineage lookups

3. **Features**
   - Search/filter operations in lineage
   - Export lineage traces
   - Compare lineage across different compilations

## Files Changed

### New Files
- `frontend/src/panes/LineagePane.tsx`
- `frontend/src/components/LineageTimeline.tsx`
- `frontend/src/styles/lineage.css`

### Modified Files
- `frontend/src/api/artifact.ts` - Added Lineage types
- `frontend/src/components/IRViewer.tsx` - Added lineage highlighting
- `frontend/src/panes/SourcePane.tsx` - Integrated lineage triggering
- `frontend/src/panes/StagePane.tsx` - Added highlightLines support
- `frontend/src/panes/StageViewerBody.tsx` - Added highlightLines prop
- `frontend/src/Workspace.tsx` - Registered LineagePane and wired navigation

## Commit Message
```
Implement Stage 2: Operation lineage tracing

Add end-to-end operation lineage tracking through all compilation stages.
Users can click a source line to trace how that operation transforms across
all IR representations (torch-input → ConvertTorchToSCF → ... → final LLVM).

Key features:
- Click highlighted source lines to open Lineage pane
- Lineage pane shows all 50+ stages where operation appears
- Click any stage in lineage to jump to that stage with operation highlighted
- All lines of multi-line operations are highlighted consistently
- Reuses existing Stage panes instead of opening new ones
```

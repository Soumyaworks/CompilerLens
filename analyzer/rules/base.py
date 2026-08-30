"""What a rule produces, and what a rule is.

The `Finding` fields exist to stop the Doctor from sounding more certain than it is. Two in
particular:

  confidence  -- "measured" (we timed it both ways) vs "structural" (the IR plainly shows it)
                 vs "heuristic" (this pattern usually means trouble). A heuristic finding must
                 not look like a measured one.
  measured_cost_ms -- None until something actually timed it. The UI renders None as
                 "unmeasured", never as zero or as an estimate.

Every finding also has to quote the IR it came from. A diagnosis without a citation is the
thing this project exists to replace.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass, field

SEVERITY_MISSED = "missed"  # an optimization that could have applied and did not
SEVERITY_SUBOPTIMAL = "suboptimal"  # applied, but not as well as it could have
SEVERITY_INFO = "info"  # worth knowing, not a problem

CONFIDENCE_MEASURED = "measured"
CONFIDENCE_STRUCTURAL = "structural"
CONFIDENCE_HEURISTIC = "heuristic"


@dataclass
class Finding:
    rule_id: str
    severity: str
    title: str
    detail: str
    stage_id: str  # which stage it was observed in
    stage_name: str
    confidence: str
    evidence: list = field(default_factory=list)  # quoted IR, verbatim
    line: int | None = None  # 1-based, so the UI can jump Monaco there
    measured_cost_ms: float | None = None
    suggestion: str | None = None

    def as_dict(self) -> dict:
        return {
            "rule_id": self.rule_id,
            "severity": self.severity,
            "title": self.title,
            "detail": self.detail,
            "stage_id": self.stage_id,
            "stage_name": self.stage_name,
            "confidence": self.confidence,
            "evidence": self.evidence,
            "line": self.line,
            "measured_cost_ms": self.measured_cost_ms,
            "suggestion": self.suggestion,
        }


class Rule(ABC):
    id: str = ""
    title: str = ""
    what_it_looks_for: str = ""

    @abstractmethod
    def check(self, artifact: dict) -> list:
        """Findings for this artifact. Empty list means the rule found nothing."""

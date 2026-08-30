"""Run every rule over an artifact and rank what comes back.

Ranking matters as much as detection: a list of twelve findings in arbitrary order is a wall of
text. Ordering is (1) anything measured, because a number beats a guess, (2) severity, (3)
confidence -- so the most defensible, most consequential finding is first.
"""

from __future__ import annotations

import json
from pathlib import Path

from .rules.base import (
    CONFIDENCE_HEURISTIC,
    CONFIDENCE_MEASURED,
    CONFIDENCE_STRUCTURAL,
    SEVERITY_INFO,
    SEVERITY_MISSED,
    SEVERITY_SUBOPTIMAL,
)
from .rules.fusion import MissedFusion
from .rules.layout import LayoutChurn
from .rules.vectorization import MissedVectorization

RULES = (MissedVectorization(), MissedFusion(), LayoutChurn())

_SEVERITY_ORDER = {SEVERITY_MISSED: 0, SEVERITY_SUBOPTIMAL: 1, SEVERITY_INFO: 2}
_CONFIDENCE_ORDER = {CONFIDENCE_MEASURED: 0, CONFIDENCE_STRUCTURAL: 1, CONFIDENCE_HEURISTIC: 2}


def diagnose(artifact: dict) -> dict:
    """Findings for one artifact, ranked, with a summary the UI can lead with."""
    findings = []
    for rule in RULES:
        try:
            findings.extend(rule.check(artifact))
        except Exception as exc:
            # One broken rule must not sink the diagnosis. Report it as a finding so the
            # failure is visible rather than silently absent.
            findings.append(_rule_error(rule.id, exc))

    findings.sort(
        key=lambda f: (
            0 if f.measured_cost_ms is not None else 1,
            _SEVERITY_ORDER.get(f.severity, 9),
            _CONFIDENCE_ORDER.get(f.confidence, 9),
        )
    )

    by_severity = {}
    for finding in findings:
        by_severity[finding.severity] = by_severity.get(finding.severity, 0) + 1

    return {
        "findings": [f.as_dict() for f in findings],
        "summary": {
            "total": len(findings),
            "by_severity": by_severity,
            "measured": sum(1 for f in findings if f.measured_cost_ms is not None),
            "headline": _headline(findings),
        },
        "rules_run": [{"id": r.id, "title": r.title, "looks_for": r.what_it_looks_for} for r in RULES],
        "notes": [
            "Findings come from pattern-matching the compiler's own output. `confidence` says "
            "how much to trust each one: structural means the IR plainly shows it, heuristic "
            "means the pattern usually indicates it.",
            "`measured_cost_ms` is null unless something actually timed the difference. Run "
            "backend.measure to attach real numbers.",
        ],
    }


def _rule_error(rule_id: str, exc: Exception):
    from .rules.base import Finding

    return Finding(
        rule_id=f"{rule_id}-error",
        severity=SEVERITY_INFO,
        title=f"Rule '{rule_id}' failed to run",
        detail=f"{type(exc).__name__}: {exc}",
        stage_id="",
        stage_name="",
        confidence=CONFIDENCE_HEURISTIC,
    )


def _headline(findings: list) -> str:
    if not findings:
        return "No issues detected by the current rules."
    missed = [f for f in findings if f.severity == SEVERITY_MISSED]
    if not missed:
        return f"{len(findings)} observation(s), none of them faults."
    first = missed[0]
    return f"{len(missed)} missed optimisation(s). Most significant: {first.title}."


def diagnose_file(artifact_path: Path) -> dict:
    return diagnose(json.loads(Path(artifact_path).read_text()))

"""Source-checkout compatibility; installed API is compilerlens.ingest."""
from compilerlens import ingest as _package
__path__ = _package.__path__

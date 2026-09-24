"""Source-checkout compatibility; installed API is compilerlens.backend."""
from compilerlens import backend as _package
__path__ = _package.__path__

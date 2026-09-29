"""CompilerLens: model-aware compiler inspection and lineage."""

__version__ = "0.2.1"


def capture(*args, **kwargs):
    from .services import capture as implementation
    return implementation(*args, **kwargs)


def load_report(path):
    from .storage import load_run
    return load_run(path)

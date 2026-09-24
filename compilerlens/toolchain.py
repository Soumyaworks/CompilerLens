"""Resolve installed console tools even when Python was invoked by absolute path."""
from pathlib import Path
import shutil
import sys


def find_tool(name):
    sibling = Path(sys.executable).parent / name
    return str(sibling) if sibling.is_file() else shutil.which(name)

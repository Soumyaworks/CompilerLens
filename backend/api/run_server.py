"""Start the Sandbox API.

    source .venv/bin/activate
    python -m backend.api.run_server

Checks the toolchain first, because a server that starts and then fails every request is worse
than one that refuses to start.
"""

from __future__ import annotations

import shutil
import sys

import uvicorn

REQUIRED_TOOLS = ("iree-compile", "iree-benchmark-module")

# Bind all interfaces, matching what Vite does for the frontend. Loopback-only would work when
# you browse from the machine itself and fail from anywhere else -- and since the frontend is
# reachable remotely, a loopback API means the browser asks *its own* localhost for the API and
# finds nothing there.
HOST, PORT = "0.0.0.0", 8000


def main() -> int:
    missing = [t for t in REQUIRED_TOOLS if shutil.which(t) is None]
    if missing:
        print(f"Missing on PATH: {', '.join(missing)}", file=sys.stderr)
        print("Activate the project venv first: source .venv/bin/activate", file=sys.stderr)
        return 1

    # Report a reachable address, not the bind wildcard: "0.0.0.0:8000" is not something you
    # can paste into a browser.
    try:
        import socket

        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as probe:
            probe.connect(("8.8.8.8", 80))
            reachable = probe.getsockname()[0]
    except Exception:
        reachable = "localhost"

    print(f"CompilerLens Sandbox API listening on {HOST}:{PORT}")
    print(f"  local:   http://localhost:{PORT}")
    print(f"  network: http://{reachable}:{PORT}   <- use this from another machine")
    print(f"  GET  /options                          the knobs, and why each matters")
    print(f"  POST /compile                          {{model_id, seq_len, stages[], options{{}}}}")
    print(f"  GET  /compile/{{id}}                     status + signals")
    print(f"  GET  /compile/{{id}}/stage/{{stage}}       raw IR")
    print(f"  POST /compile/{{id}}/benchmark           opt-in timing")
    print(f"  POST /compile/{{id}}/diagnose            run the Doctor")
    uvicorn.run("backend.api.app:app", host=HOST, port=PORT, reload=False)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

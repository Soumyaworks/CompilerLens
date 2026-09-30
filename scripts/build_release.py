#!/usr/bin/env python3
"""Build native analyzer, existing web app and a platform-specific pip wheel.

Configure build/llvm with a matching LLVM SDK first, or pass --llvm-dir.
No dependency downloads: install frontend/node and Python build dependencies first.
"""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def run(*args, cwd=ROOT):
    print('+', ' '.join(map(str, args)), flush=True)
    subprocess.run(list(map(str, args)), cwd=cwd, check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--llvm-dir')
    parser.add_argument('--cmake', default='cmake')
    parser.add_argument('--assets-only', action='store_true')
    args = parser.parse_args()
    if args.llvm_dir:
        run(args.cmake, '-S', 'llvm', '-B', 'build/llvm', '-DCMAKE_BUILD_TYPE=Release', f'-DLLVM_DIR={args.llvm_dir}')
    if not (ROOT / 'build/llvm/CMakeCache.txt').exists(): parser.error('Configure build/llvm first or supply --llvm-dir.')
    run(args.cmake, '--build', 'build/llvm', '--parallel', '2')
    run(str(Path(args.cmake).with_name("ctest")) if "/" in args.cmake else "ctest", "--test-dir", "build/llvm", "--output-on-failure")
    run(args.cmake, '--install', 'build/llvm', '--prefix', ROOT, '--strip')
    binary = ROOT / 'compilerlens/_bin/compilerlens-native'
    # LLVM is statically linked. Bundle zstd (outside the manylinux baseline) and
    # libz so the private executable needs only the host C/C++ runtime libraries.
    libs = binary.parent / 'lib'
    libs.mkdir(exist_ok=True)
    linked = subprocess.check_output(['ldd', str(binary)], text=True)
    for line in linked.splitlines():
        fields = line.split()
        if fields and fields[0] in ('libzstd.so.1', 'libz.so.1'):
            if Path(fields[2]).resolve() != (libs / fields[0]).resolve():
                shutil.copy2(fields[2], libs / fields[0])
    licenses = binary.parent / 'licenses'
    licenses.mkdir(exist_ok=True)
    for name, path in [('zstd', '/usr/share/doc/libzstd1/copyright'), ('zlib', '/usr/share/doc/zlib1g/copyright')]:
        if Path(path).exists(): shutil.copy2(path, licenses / (name + '.txt'))
    # LLVM license is maintained alongside the native source, and bundled in wheels.
    shutil.copy2(ROOT / 'llvm/LLVM-LICENSE.txt', licenses / 'LLVM.txt')
    run('npm', 'exec', '--', 'tsc', '--noEmit', cwd=ROOT / 'frontend')
    run('npm', 'exec', '--', 'vite', 'build', '--config', 'vite.release.config.ts', cwd=ROOT / 'frontend')
    if not args.assets_only:
        run(sys.executable, '-m', 'pip', 'wheel', '.', '--no-deps', '--no-build-isolation', '--wheel-dir', 'dist')


if __name__ == '__main__': main()

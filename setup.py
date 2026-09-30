"""Platform wheel: private native executable, independent of CPython's ABI."""
from pathlib import Path
from setuptools import setup, Distribution
from setuptools.command.bdist_wheel import bdist_wheel
from setuptools.command.build_py import build_py


class PlatformDistribution(Distribution):
    def has_ext_modules(self):
        return True


class BuildPackage(build_py):
    def run(self):
        for name in ('compilerlens/_bin/compilerlens-native', 'compilerlens/_web/index.html'):
            if not Path(name).is_file():
                raise RuntimeError(f'Missing {name}. Prepare native/web assets with python scripts/build_release.py --assets-only before building a wheel.')
        super().run()


class PlatformWheel(bdist_wheel):
    def get_tag(self):
        _, _, platform = super().get_tag()
        return 'py3', 'none', platform


setup(distclass=PlatformDistribution, cmdclass={'bdist_wheel': PlatformWheel, 'build_py': BuildPackage})

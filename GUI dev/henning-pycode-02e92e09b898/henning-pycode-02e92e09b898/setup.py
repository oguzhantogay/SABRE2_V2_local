#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup, find_packages

if __name__ == "__main__":
    setup(
        name="pycode",
        version="0.1",
        description="Python coding library for IDE integration",
        author="Henning Schroeder",
        author_email="henning.schroeder@gmail.com",
        zip_safe=True,
        license="GPL2",
        keywords="python source code pyqt pyqt4 ide autocomplete completition codeassist rope",
        packages=find_packages(),
    )

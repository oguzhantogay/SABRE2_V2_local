#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup, find_packages

if __name__ == "__main__":
    setup(
        name="pyqtdesigner",
        version="0.1",
        description="QtDesigner intergration for PyQt",
        author="Henning Schroeder",
        author_email="henning.schroeder@gmail.com",
        zip_safe=False,
        license="GPL2",
        keywords="python source code pyqt pyqt4 designer qtdesigner gui editor",
        packages=find_packages(),
    )

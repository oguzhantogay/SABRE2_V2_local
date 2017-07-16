#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup, find_packages

if __name__ == "__main__":
    setup(
        name="qtwidgets",
        version="0.1",
        description="Widgets for PyQt4",
        author="Henning Schroeder",
        author_email="henning.schroeder@gmail.com",
        zip_safe=True,
        license="GPL2",
        keywords="pyqt pyqt4 widgets",
        packages=find_packages(),
    )

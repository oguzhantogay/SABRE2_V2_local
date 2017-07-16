#!/usr/bin/env python
# -*- coding: utf-8 -*-
from distutils.core import setup, Extension
from Cython.Distutils import build_ext

if __name__ == "__main__":
    setup(name="tokenize",
          version="2.7",
          description="Python module for tokenizing source",
          cmdclass={'build_ext': build_ext},
          ext_modules=[
              Extension("tokenize", ["tokenize.pyx"])
          ]
          )

Comparison of free available Python solutions
=============================================

rope (https://bitbucket.org/agr/rope)
 * refactoring library with codeassist module
 * type inference for Python code
 * tries to fix syntax errors if ast cannot be generated
 * dynamic object information for extension modules
   (has to be enabled)
 * last update: 2012

jedi (http://github.com/davidhalter/jedi/)
 * fault-tolerant autocompletion library which can ignore syntax errors
 * uses tokenize for "fuzzy-parsing" instead of abstract syntax tree
 * last update: 2013

Ninja-IDE (http://github.com/ninja-ide/ninja-ide)
 * autocompletion built into Ninja-IDE, created because Rope was too slow
   (resides in ninja_ide/tools/completion)
 * last update: 2013

Supplement (http://github.com/baverman/supplement)
 * claims to be faster than rope
 * multi-process and virtualenv support
 * last update: 2012

Pysmell (http://code.google.com/p/pysmell/)
 * last update: 2010

Komodo-IDE
 * code-intelligence library
 * type inference and xml api files
 * has some extension module depedencies
 * fork at https://github.com/Kronuz/SublimeCodeIntel
 
vim-python-ftplugin (http://github.com/tarmack/vim-python-ftplugin)
 * type inference based on ast
 * last update: 2011

Pyntch (http://www.unixuser.org/~euske/python/pyntch/index.html)
 * contains some stub modules for extensions
 * last update: 2010

Pysonar (https://github.com/yinwang0/mini-pysonar)
  * see also http://yinwang0.wordpress.com/2010/09/12/pysonar/
  * last update: 2012

Pyty (https://github.com/jruberg/Pyty)
  * static typechecker
  * paper at http://wesscholar.wesleyan.edu/cgi/viewcontent.cgi?article=1941&context=etd_hon_theses

KDevelop-Python-Plugin (http://scummos.blogspot.de/search/label/kdev-python)
 * C++ based on KDevelop-DU-chain-Framework
 * incremental type inference
 * stubs for some extension-modules (e.g. PyQt)
 * last update: 2012

Python Tools for Visual Studio (http://pytools.codeplex.com/)
 * Python parser and ast inference engine
 * implemented in C# but looks clean and complete 
   (might be useful for reference?)
 * last update: 2012


Other programs which contain type inference
* pylint
* Mypy
* PyPy
* ShedSkin
* PyDev-Plugin for Eclipse (implemented in Java)
* non-free: PyCharm, WingIDE


Related Papers
 * John Aycock: Aggressive Type Inference
   http://www.python.org/workshops/2000-01/proceedings/papers/aycock/aycock.html
 * Starkiller: A Static Type Inferencer and Compiler for Python 
 * Type Inference Using the Cartesian Product Algorithm on a Dynamically Typed Language

Additional links
 * http://www.smallshire.org.uk/sufficientlysmall/2010/04/11/a-hindley-milner-type-inference-implementation-in-python/
 * http://lambda-the-ultimate.org/node/1519
 * https://sites.google.com/site/jburnim/python-type-inference 
 * http://code.google.com/p/python-type-inference/wiki/Resources
 
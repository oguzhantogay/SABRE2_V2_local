#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from PyQt4.QtCore import Qt
from PyQt4.QtGui import QApplication, QPlainTextEdit, QMainWindow, QFont

from pycode.pyqtfrontend import PyCode

sys.path.append("syntaxhighlighter")
try:
    from highlighter import SyntaxHighlighter, load_syntax
    from highlighter.python27 import syntax
except ImportError:
    SyntaxHighlighter = None

scheme = {
    "syntax_comment": dict(color="green", italic=True),
    "syntax_string": "magenta",
    "syntax_builtin": "red",
    "syntax_keyword": ("darkred", True),
    "syntax_number": "blue",
}


if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = QMainWindow()
    edit = QPlainTextEdit(None)

    font = QFont()
    font.setFamily("Courier")
    font.setPointSize(10)

    edit.setFont(font)
    if SyntaxHighlighter:
        parts_scanner, code_scanner, formats = load_syntax(syntax, scheme)
        hl = SyntaxHighlighter(edit.document(),
                               parts_scanner, code_scanner, formats, default_font=font)

    pc = PyCode(".", edit)
    edit.setPlainText(open("testedit.py").read())
    win.setCentralWidget(edit)
    win.resize(640, 480)
    win.show()
    app.exec_()

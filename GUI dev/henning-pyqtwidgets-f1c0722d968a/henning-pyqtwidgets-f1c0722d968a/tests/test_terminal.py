#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.x11.terminal import XTerm


def test_terminal():
    import sys
    app = QApplication(sys.argv)
    win = QDialog()
    l = QVBoxLayout(win)
    xterm = XTerm(win)
    win.layout().addWidget(xterm)
    win.resize(640, 480)
    xterm.show_term()
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_terminal()

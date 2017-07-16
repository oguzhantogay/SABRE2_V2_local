#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.splitter import Splitter


def test_splitter():
    import sys
    app = QApplication(sys.argv)
    win = QDialog()
    win.resize(640, 480)
    l = QVBoxLayout(win)
    s = Splitter(win)
    l.addWidget(s)
    a = QPushButton(s)
    a.setText("Button A")
    b = QPushButton(s)
    b.setText("Button B")
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_splitter()

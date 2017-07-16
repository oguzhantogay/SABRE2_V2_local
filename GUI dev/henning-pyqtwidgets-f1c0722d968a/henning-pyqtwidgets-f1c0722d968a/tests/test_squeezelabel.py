#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.squeezelabel import SqueezeLabel


def test_squeezelabel():
    import sys
    app = QApplication(sys.argv)
    win = QDialog()
    win.resize(100, 100)
    layout = QHBoxLayout(win)
    l = SqueezeLabel(win)
    l.setText("This is a very long label which should be sqeezed. " * 3)
    l.setFixedWidth(320)
    win.layout().addWidget(l)
    b = QPushButton(win)
    b.setText("Close")
    win.layout().addWidget(b)
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_squeezelabel()

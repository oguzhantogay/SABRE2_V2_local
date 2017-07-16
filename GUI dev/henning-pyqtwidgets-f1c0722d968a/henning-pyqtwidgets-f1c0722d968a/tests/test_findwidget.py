#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.findwidget import ReplaceWidget


def test_findwidget():
    import sys
    app = QApplication(sys.argv)
    win = QDialog()
    win.setLayout(QVBoxLayout(win))
    edit = QTextEdit()
    edit.setPlainText("Hello, world!" * 4)
    win.layout().addWidget(edit)
    find = ReplaceWidget(edit)
    win.layout().addWidget(find)
    win.resize(640, 480)
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_findwidget()

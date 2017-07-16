#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.tabwidget import TabWidget


def test_tabwidget():
    import sys
    app = QApplication(sys.argv)
    win = TabWidget()
    win.addTab(QLabel("tab 1", win), "&Foo")
    win.addTab(QLabel("tab 2", win), "&Bar")
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_tabwidget()

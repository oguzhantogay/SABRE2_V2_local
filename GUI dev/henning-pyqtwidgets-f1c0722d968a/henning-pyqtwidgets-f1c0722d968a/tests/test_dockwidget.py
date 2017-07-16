#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.dockwidget import DockWidget


def test_dockwidget():
    import sys
    app = QApplication(sys.argv)
    win = QMainWindow()
    dock1 = DockWidget("1st dockwidget", win)
    combo = QComboBox(dock1)
    dock1.setWidget(combo)
    win.addDockWidget(Qt.TopDockWidgetArea, dock1)
    dock2 = DockWidget("2nd dockwidget")
    dock2.setFeatures(
        dock1.features() | QDockWidget.DockWidgetVerticalTitleBar)
    button = QPushButton("Hello, world!", dock2)
    dock2.setWidget(button)
    win.addDockWidget(Qt.RightDockWidgetArea, dock2)
    edit = QTextEdit(win)
    win.setCentralWidget(edit)
    win.resize(640, 480)
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_dockwidget()

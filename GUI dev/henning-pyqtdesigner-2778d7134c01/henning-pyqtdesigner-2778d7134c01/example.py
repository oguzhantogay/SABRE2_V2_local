#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from PyQt4.QtGui import QApplication, QMainWindow, QToolButton
from pyqtdesigner import FormEditor


if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = QMainWindow()
    win.setWindowTitle("Embedded Designer Test")
    win.resize(1024, 768)
    formedit = FormEditor(win)
    formedit.load_file("example.ui")

    tool_toggle = QToolButton(text="Toggle toolbox",
                              checkable=True, checked=True, autoRaise=True,
                              toggled=formedit.toolbox.setVisible)
    win.statusBar().addWidget(tool_toggle)

    win.setCentralWidget(formedit)
    win.show()
    app.exec_()

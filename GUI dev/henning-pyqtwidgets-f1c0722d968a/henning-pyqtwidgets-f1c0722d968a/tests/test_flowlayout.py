#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.flowlayout import FlowLayout


def test_flowlayout():
    class Window(QWidget):

        def __init__(self, parent=None):
            QWidget.__init__(self, parent)
            flowLayout = FlowLayout()
            flowLayout.addWidget(QPushButton(self.tr("Short")))
            flowLayout.addWidget(QPushButton(self.tr("Longer")))
            flowLayout.addWidget(QPushButton(self.tr("Different text")))
            flowLayout.addWidget(QPushButton(self.tr("More text")))
            flowLayout.addWidget(
                QPushButton(self.tr("Even longer button text")))
            self.setLayout(flowLayout)
            self.setWindowTitle(self.tr("Flow Layout"))

    import sys
    app = QApplication(sys.argv)
    mainWin = Window()
    mainWin.show()
    app.exec_()


if __name__ == "__main__":
    test_flowlayout()

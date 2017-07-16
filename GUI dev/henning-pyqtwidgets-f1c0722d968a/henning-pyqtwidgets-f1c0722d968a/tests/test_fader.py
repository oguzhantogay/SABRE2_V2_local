#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.fader import Fader


def test_switch_fader():
    class StackedWidget(QStackedWidget):

        def __init__(self, parent=None):
            QStackedWidget.__init__(self, parent)

        def setCurrentIndex(self, index):
            self.fader_widget = SwitchFader(
                self.currentWidget(), self.widget(index))
            QStackedWidget.setCurrentIndex(self, index)

        def setPage1(self):
            self.setCurrentIndex(0)

        def setPage2(self):
            self.setCurrentIndex(1)

    app = QApplication(sys.argv)
    window = QWidget()
    stack = StackedWidget()
    stack.addWidget(QCalendarWidget())
    editor = QTextEdit()
    editor.setPlainText("Hello world! " * 100)
    stack.addWidget(editor)
    page1Button = QPushButton("Page 1")
    page2Button = QPushButton("Page 2")
    page1Button.clicked.connect(stack.setPage1)
    page2Button.clicked.connect(stack.setPage2)
    layout = QGridLayout(window)
    layout.addWidget(stack, 0, 0, 1, 2)
    layout.addWidget(page1Button, 1, 0)
    layout.addWidget(page2Button, 1, 1)
    window.show()
    app.exec_()


def test_fader():
    import sys
    app = QApplication(sys.argv)
    b = QPushButton(None)
    b.resize(320, 240)
    b.setText("Hello, world")
    b.connect(b, SIGNAL("clicked()"), app.quit)
    b.show()
    f = Fader(b)
    f.start()
    app.exec_()


if __name__ == "__main__":
    test_fader()

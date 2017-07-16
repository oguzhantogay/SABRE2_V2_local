#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qtwidgets.overlay import Overlay


class TestOverlay(Overlay):

    def paintEvent(self, event):
        painter = QPainter()
        painter.begin(self)
        painter.setRenderHint(QPainter.Antialiasing)
        painter.setPen(QPen(QColor(255, 0, 0)))
        painter.drawLine(
            self.width() / 8, self.height() / 8, 7 * self.width() / 8, 7 * self.height() / 8)
        painter.drawLine(
            self.width() / 8, 7 * self.height() / 8, 7 * self.width() / 8, self.height() / 8)
        painter.end()


class MainWindow(QMainWindow):

        def __init__(self, parent=None):
            QMainWindow.__init__(self, parent)
            widget = QWidget(self)
            self.editor = QTextEdit()
            layout = QGridLayout(widget)
            layout.addWidget(self.editor, 0, 0, 1, 2)
            layout.addWidget(QPushButton("Refresh"), 1, 0)
            layout.addWidget(QPushButton("Cancel"), 1, 1)
            self.setCentralWidget(widget)
            self.overlay = TestOverlay(self.centralWidget())

        def resizeEvent(self, event):
            self.overlay.resize(event.size())
            event.accept()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())

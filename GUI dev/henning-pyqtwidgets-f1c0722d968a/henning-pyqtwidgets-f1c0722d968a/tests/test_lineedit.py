#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.lineedit import LineEdit, LineEditButton, LineEditSide


def test_lineedit():
    class SearchEngine(QAction):

        def __init__(self, text, iconname, parent=None):
            QAction.__init__(self, parent)
            self.setText(text)
            self.setIcon(QIcon(QPixmap(iconname)))
            self.connect(self, SIGNAL("triggered(bool)"), self.change)

        def change(self):
            searchengine.setIcon(self.icon())
            searchengine.setToolTip(self.text())

    import sys
    app = QApplication(sys.argv)
    win = QDialog()
    l = QVBoxLayout(win)
    edit = LineEdit(win, "Search...")
    edit.add_clear_button()
    searchengine = LineEditButton(edit, "google.png")
    menu = QMenu(searchengine)
    google = SearchEngine("Google", "google.png")
    menu.addAction(google)
    wikipedia = SearchEngine("Wikipedia", "wikipedia.png")
    menu.addAction(wikipedia)
    searchengine.setMenu(menu)
    edit.add_widget(searchengine, LineEditSide.Left)

    l.addWidget(edit)

    close = QPushButton(win)
    close.setText("Close")
    close.setFocus()
    l.addWidget(close)

    win.resize(640, 320)
    win.show()
    app.exec_()


if __name__ == "__main__":
    test_lineedit()

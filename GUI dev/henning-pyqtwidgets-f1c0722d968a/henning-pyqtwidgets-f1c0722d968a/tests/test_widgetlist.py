#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.widgetlist import WidgetList


def test_widgetlist():
    # Firefox-like add-list
    class AddOn(QWidget):
        active = None

        def __init__(self, parent, name):
            QWidget.__init__(self, parent)
            self.hblayout = QHBoxLayout(self)
            self.label = QLabel("Addon <b>%s</b>" % name, self)
            self.label.setFocusProxy(parent)
            self.hblayout.addWidget(self.label)
            self.hblayout.addStretch()

            self.buttons = QWidget(self)
            self.hblayout.addWidget(self.buttons)
            self.vblayout = QVBoxLayout(self.buttons)

            self.prefs = QPushButton("Preferences", self.buttons)
            self.vblayout.addWidget(self.prefs)
            self.uninstall = QPushButton("Uninstall", self.buttons)
            self.vblayout.addWidget(self.uninstall)

            self.buttons.hide()
            self.setFixedHeight(self.sizeHint().height())

        def show_actions(self):
            self.buttons.show()
            self.setFixedHeight(self.sizeHint().height())
            self.parent().update()

        def hide_actions(self):
            self.buttons.hide()
            self.setFixedHeight(self.sizeHint().height())

    import sys
    app = QApplication(sys.argv)
    win = WidgetList()
    win.resize(640, 480)
    win.show()

    def toggle(add_on):
        if AddOn.active:
            AddOn.active.hide_actions()
        add_on.show_actions()
        AddOn.active = add_on

    win.connect(win, SIGNAL("widget_clicked"), toggle)
    add_ons = []
    for i in range(5):
        a = AddOn(win, i)
        win.add_widget(a)
        add_ons.append(a)
        # print a.sizeHint(), a.size(), a.label.size(), a.uninstall.size(),
        # a.prefs.size()
    l = QLabel("<a href='http://www.google.de'>Updates available</a>", win)
    win.insert_widget(0, l)
    app.exec_()
    print win.current_row_index()


if __name__ == "__main__":
    test_widgetlist()

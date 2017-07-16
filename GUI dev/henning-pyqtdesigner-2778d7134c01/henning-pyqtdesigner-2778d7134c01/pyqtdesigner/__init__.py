# -*- coding: utf-8 -*-
import os
import tempfile

import sip
from PyQt4.QtCore import pyqtSignal
from PyQt4.QtGui import QWidget, QVBoxLayout

from wrapper import LibWrapper


_lib = None


def init():
    global _lib
    path = os.path.dirname(os.path.abspath(__file__))
    lib_filename = os.path.join(
        path, "EmbeddedDesigner", "libEmbeddedDesigner.so")
    _lib = LibWrapper(lib_filename)


def EmbeddedDesigner(parent, **properties):
    if not _lib:
        init()
    obj = _lib.EmbeddedDesigner(parent, **properties)
    return obj


class FormEditor(QWidget):

    def __init__(self, parent=None):
        super(FormEditor, self).__init__(parent)
        self._layout = QVBoxLayout(self)
        self._designer = EmbeddedDesigner(self)
        self.layout().addWidget(self._designer)
        self.inspector = self._designer.findChild(QWidget, "inspector")
        self.propedit = self._designer.findChild(QWidget, "properties")
        self.toolbox = self._designer.findChild(QWidget, "toolbox")
        self.signals2slots = self._designer.findChild(QWidget, "signals2slots")
        # self.signals2slots.show()
        self._designer.changed.connect(self.on_changed)

    def on_changed(self):
        print "form changed"

    def load_file(self, filename):
        self._designer.load(filename)

    def save(self):
        self._designer.save()


__all__ = ["FormEditor"]

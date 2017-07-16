#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qtwidgets.downloadialog import download


def test_download():
    def on_clicked():
        print download("http://slashdot.org/")
        qApp.quit()
    import sys
    app = QApplication(sys.argv)
    b = QPushButton(None)
    b.resize(320, 240)
    b.setText("Start downloading")
    b.connect(b, SIGNAL("clicked()"), on_clicked)
    b.show()
    app.exec_()


if __name__ == "__main__":
    test_download()

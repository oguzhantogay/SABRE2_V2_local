# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainwindow.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
#
# WARNING! All changes made in this file will be lost!

import sys
from PyQt4 import QtCore, QtGui
from mywidget import *

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8

    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)


class MainWindow(QtGui.QMainWindow):

    def __init__(self):
        super(MainWindow, self).__init__()

    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(408, 230)
        self.centralWidget = QtGui.QWidget()
        self.setcentralWidget(self.centralWidget)
        self.verticalLayout = QtGui.QVBoxLayout(self.centralWidget)
        self.verticalLayout.setMargin(11)
        self.verticalLayout.setSpacing(6)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.verticalLayout.addWidget(self.widget)
        self.verticalLayout.addWidget(self.widget_2)
        self.verticalLayout.addWidget(self.widget_3)
        MainWindow.setCentralWidget(self.centralWidget)
        self.menuBar = QtGui.QMenuBar(MainWindow)
        self.menuBar.setGeometry(QtCore.QRect(0, 0, 408, 21))
        self.menuBar.setObjectName(_fromUtf8("menuBar"))
        MainWindow.setMenuBar(self.menuBar)
        self.mainToolBar = QtGui.QToolBar(MainWindow)
        self.mainToolBar.setObjectName(_fromUtf8("mainToolBar"))
        MainWindow.addToolBar(QtCore.Qt.TopToolBarArea, self.mainToolBar)
        self.statusBar = QtGui.QStatusBar(MainWindow)
        self.statusBar.setObjectName(_fromUtf8("statusBar"))
        MainWindow.setStatusBar(self.statusBar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))


class MyWidget(QtGui.QWidget):

    def __init__(self, parent):
        super(MyWidget, self).__init__(parent)
        self.widget = MyWidget(self.centralWidget)
        self.widget.setObjectName(_fromUtf8("widget"))


class MyWidget2(QtGui.QWidget):

    def __init__(self, parent):
        super(MyWidget2, self).__init__(parent)
        self.widget_2 = MyWidget(self.centralWidget)
        self.widget_2.setObjectName(_fromUtf8("widget_2"))


class MyWidget3(QtGui.QWidget):

    def __init__(self, parent):
        super(MyWidget3, self).__init__(parent)
        self.widget_3 = MyWidget(self.centralWidget)
        self.widget_3.setObjectName(_fromUtf8("widget_3"))


app = QtGui.QApplication(sys.argv)
myapp = MainWindow()

myapp.show()
# QtCore.QObject.connect(myapp.pushButton)
sys.exit(app.exec_())

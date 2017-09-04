# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'customwidget.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

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


class Ui_CustomWidget(object):
    def setupUi(self, CustomWidget):
        CustomWidget.setObjectName(_fromUtf8("CustomWidget"))
        CustomWidget.resize(464, 78)
        self.centralWidget = QtGui.QWidget(CustomWidget)
        self.centralWidget.setObjectName(_fromUtf8("centralWidget"))
        self.horizontalLayout = QtGui.QHBoxLayout(self.centralWidget)
        self.horizontalLayout.setMargin(11)
        self.horizontalLayout.setSpacing(6)
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.textEdit = QtGui.QTextEdit(self.centralWidget)
        self.textEdit.setMaximumSize(QtCore.QSize(16777215, 28))
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.horizontalLayout.addWidget(self.textEdit)
        self.pushButton = QtGui.QPushButton(self.centralWidget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.horizontalLayout.addWidget(self.pushButton)
        self.pushButton_2 = QtGui.QPushButton(self.centralWidget)
        self.pushButton_2.setObjectName(_fromUtf8("pushButton_2"))
        self.horizontalLayout.addWidget(self.pushButton_2)
        CustomWidget.setCentralWidget(self.centralWidget)
        self.mainToolBar = QtGui.QToolBar(CustomWidget)
        self.mainToolBar.setObjectName(_fromUtf8("mainToolBar"))
        CustomWidget.addToolBar(QtCore.Qt.TopToolBarArea, self.mainToolBar)
        self.statusBar = QtGui.QStatusBar(CustomWidget)
        self.statusBar.setObjectName(_fromUtf8("statusBar"))
        CustomWidget.setStatusBar(self.statusBar)

        self.retranslateUi(CustomWidget)
        QtCore.QObject.connect(self.pushButton_2, QtCore.SIGNAL(_fromUtf8("clicked()")), self.textEdit.clear)
        QtCore.QMetaObject.connectSlotsByName(CustomWidget)

    def retranslateUi(self, CustomWidget):
        CustomWidget.setWindowTitle(_translate("CustomWidget", "CustomWidget", None))
        self.pushButton.setText(_translate("CustomWidget", "Press Me", None))
        self.pushButton_2.setText(_translate("CustomWidget", "Clear", None))


if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    CustomWidget = QtGui.QMainWindow()
    ui = Ui_CustomWidget()
    ui.setupUi(CustomWidget)
    CustomWidget.show()
    sys.exit(app.exec_())

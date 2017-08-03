# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'table.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui
from functools import partial
import numpy
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


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(420, 155)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.horizontalLayout = QtGui.QHBoxLayout(self.centralwidget)
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.pushButton = QtGui.QPushButton(self.centralwidget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.horizontalLayout.addWidget(self.pushButton)
        self.tableWidget = QtGui.QTableWidget(self.centralwidget)
        self.tableWidget.setObjectName(_fromUtf8("tableWidget"))
        self.tableWidget.setColumnCount(3)
        self.tableWidget.setRowCount(3)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(2, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(2, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(0, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(0, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(0, 2, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(1, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(1, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(1, 2, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(2, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(2, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(2, 2, item)
        self.horizontalLayout.addWidget(self.tableWidget)
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)
        row = self.tableWidget.rowCount()
        column = self.tableWidget.columnCount()
        w, h = row, column
        column_location = 1
        table_list = [[0 for x in range(w)] for y in range(h)]  # initialize table values
        column_list = [0 for x in range(w)]  # initialize combo_box values
        self.retranslateUi(MainWindow)
        self.tableWidget.itemChanged.connect(lambda: self.data_reader(self.tableWidget, table_list))
        self.tableWidget.itemChanged.connect(lambda: self.read_combo_box_values(self.tableWidget, column_list, column_location))
        table_list = self.data_reader(self.tableWidget, table_list)
        column_list = self.read_combo_box_values(self.tableWidget, column_list, column_location)
        self.tableWidget.itemChanged.connect(lambda: print(table_list))
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def read_combo_box_values(self, edit, combo_values, combo_column):
        row = edit.rowCount()
        for i in range(row):
            combo_values[i] = edit.item(i, combo_column).text()
        return combo_values

    def data_reader(self, edit, values):
        row = edit.rowCount()
        column = edit.columnCount()
        # w, h = row, column
        # # values = [[0 for x in range(w)] for y in range(h)]
        for i in range(row):
            for j in range(column):
                values[i][j] = edit.item(i, j).text()
        return values

    def cell_changed(self, edit, values):
        self.data_reader(edit, values)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.pushButton.setText(_translate("MainWindow", "Click", None))
        item = self.tableWidget.verticalHeaderItem(0)
        item.setText(_translate("MainWindow", "1", None))
        item = self.tableWidget.verticalHeaderItem(1)
        item.setText(_translate("MainWindow", "2", None))
        item = self.tableWidget.verticalHeaderItem(2)
        item.setText(_translate("MainWindow", "3", None))
        item = self.tableWidget.horizontalHeaderItem(0)
        item.setText(_translate("MainWindow", "first", None))
        item = self.tableWidget.horizontalHeaderItem(1)
        item.setText(_translate("MainWindow", "second", None))
        item = self.tableWidget.horizontalHeaderItem(2)
        item.setText(_translate("MainWindow", "third", None))
        __sortingEnabled = self.tableWidget.isSortingEnabled()
        self.tableWidget.setSortingEnabled(False)
        item = self.tableWidget.item(0, 0)
        item.setText(_translate("MainWindow", "asd", None))
        item = self.tableWidget.item(0, 1)
        item.setText(_translate("MainWindow", "123", None))
        item = self.tableWidget.item(0, 2)
        item.setText(_translate("MainWindow", "tew", None))
        item = self.tableWidget.item(1, 0)
        item.setText(_translate("MainWindow", "5435", None))
        item = self.tableWidget.item(1, 1)
        item.setText(_translate("MainWindow", "12321.546", None))
        item = self.tableWidget.item(1, 2)
        item.setText(_translate("MainWindow", "49874", None))
        item = self.tableWidget.item(2, 0)
        item.setText(_translate("MainWindow", "9879", None))
        item = self.tableWidget.item(2, 1)
        item.setText(_translate("MainWindow", "jdfgg", None))
        item = self.tableWidget.item(2, 2)
        item.setText(_translate("MainWindow", "yti", None))
        self.tableWidget.setSortingEnabled(__sortingEnabled)


if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    MainWindow = QtGui.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    # this code is to generate combo box inside the table
    combo_box_options = ["Option 1", "Option 2", "Option 3"]
    combo_box = QtGui.QComboBox()
    for t in combo_box_options:
        combo_box.addItem(t)
    r = ui.tableWidget.rowCount()
    c = ui.tableWidget.columnCount()
    for i in range(r):
        combo_box_options = ["Option 1", "Option 2", "Option 3"]
        combo_box = QtGui.QComboBox()
        for t in combo_box_options:
            combo_box.addItem(t)
        ui.tableWidget.setCellWidget(i, 1, combo_box)
        combo_box.activated.connect(lambda: DataCollection.update_values(self, tableName, r, c, position))


sys.exit(app.exec_())

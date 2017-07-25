#!/usr/bin/env python
#-*- coding:utf-8 -*-

#---------
# IMPORT
#---------
from PyQt4 import QtGui, QtCore

#---------
# MAIN
#---------


class MyWindow(QtGui.QWidget):
    def __init__(self, parent=None):
        super(MyWindow, self).__init__(parent)

        numberRows = 3
        numberColumns = 3

        self.tableWidget = QtGui.QTableWidget(self)
        self.tableWidget.setRowCount(numberRows)
        self.tableWidget.setColumnCount(numberColumns)

        self.signalMapper = QtCore.QSignalMapper(self)
        self.signalMapper.mapped[QtGui.QWidget].connect(self.on_signalMapper_mapped)

        for rowNumber in range(numberRows):
            for columnNumber in range(numberColumns):
                comboBox = QtGui.QComboBox()
                comboBox.currentIndexChanged.connect(self.signalMapper.map)
                comboBox.addItems([
                    "{0}-{1}-{2}".format(rowNumber, columnNumber, itemNumber)
                    for itemNumber in range(3)
                ])
                comboBox.row = rowNumber
                comboBox.column = columnNumber

                self.tableWidget.setCellWidget(rowNumber, columnNumber, comboBox)

                self.signalMapper.setMapping(comboBox, comboBox)

        self.layoutVertical = QtGui.QVBoxLayout(self)
        self.layoutVertical.addWidget(self.tableWidget)

    @QtCore.pyqtSlot(QtGui.QWidget)
    def on_signalMapper_mapped(self, comboBox):
        print "row: {0} column: {1} text: {2}".format(
            comboBox.row,
            comboBox.column,
            comboBox.currentText()
        )

if __name__ == "__main__":
    import sys

    app = QtGui.QApplication(sys.argv)
    app.setApplicationName('MyWindow')

    main = MyWindow()
    main.resize(333, 111)
    main.show()

    sys.exit(app.exec_())

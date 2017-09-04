import sys
from PyQt4 import QtGui, QtCore


class table1(QtGui.QWidget):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)
        self.resize(500, 700)

        self.comb = QtGui.QComboBox()
        self.comb.addItem("raton")

        self.table = QtGui.QTableWidget(self)
        self.table.setColumnCount(3)
        self.table.setRowCount(4)

        self.table.cellClicked.connect(self.addcomb)

    def addcomb(self, row, col):
        self.table.setCellWidget(row, col, self.comb)

if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    table1 = QtGui.QWidget()
    ui = table1()
    ui.setupUi(table1)
    table1.show()
    sys.exit(app.exec_())

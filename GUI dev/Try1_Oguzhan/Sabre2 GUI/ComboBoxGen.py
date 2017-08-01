from PyQt4 import QtGui, QtCore


class CoBoxGen(QtGui.QWidget):

    def __init__(self, parent=None):
        super(CoBoxGen, self).__init__(parent)

    def Assign_comboBox(self, tableName, options, position):
        numberRows    = tableName.rowCount()

        for i in range(numberRows):
            comboBox = QtGui.QComboBox()
            comboBox.column = position
            for t in options:
                comboBox.addItem(t)
                comboBox.row = i
                comboBox.row = t
                comboBox.column = position
            tableName.setCellWidget(i, position, comboBox)
            self.signalMapper.setMapping(comboBox, comboBox)
        return tableName

    @QtCore.pyqtSlot(QtGui.QWidget)
    def on_signalMapper_mapped(self, comboBox):
        print("test")
        print("row: {0} column: {1} text: {2}".format(
            comboBox.row,
            comboBox.column,
            comboBox.currentText()
        ))

from PyQt4.QtGui import *
from PyQt4 import QtGui, QtCore


class TableCombo(QMainWindow):
    cb_index_changed_signal = QtCore.pyqtSignal(QtGui.QWidget)

    def __init__(self, parent=None):
        QMainWindow.__init__(self)

        self.signalMapper = QtCore.QSignalMapper()
        self.signalMapper.mapped[QtGui.QWidget].connect(self.on_signalMapper_mapped)

    def Assign_comboBox(self, tableName, options, position):
        combo_box = QtGui.QComboBox()
        combo_box.currentIndexChanged.connect(self.signalMapper.map)

        for t in options:
            combo_box.addItem(t)
        r = tableName.rowCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            combo_box.column = position
            for t in options:
                combo_box.addItem(t)
                combo_box.row = i

            tableName.setCellWidget(i, position, combo_box)
            self.signalMapper.setMapping(combo_box, combo_box)
        return tableName

    def on_signalMapper_mapped(self, combo_box):
        self.combo_box_index_changed_signal.emit(combo_box)
        print("test")

    def combo_box_index_changed_signal(self, combo_box):
        print("row: " + str(combo_box.row) + " column: " + str(combo_box.column) + " text: " + combo_box.currentText())

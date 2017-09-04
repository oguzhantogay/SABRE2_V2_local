from PyQt4 import QtGui, QtCore

class DataTable(QtCore.QObject):
cb_index_changed_signal = QtCore.pyqtSignal(QtGui.QWidget)
def __init__(self, parent = None):
    QtCore.QObject.__init__(self)

    self.signalMapper = QtCore.QSignalMapper()
    self.signalMapper.mapped[QtGui.QWidget].connect(self.on_signalMapper_mapped)

def insert_row_cb(self, table, cb_col):
    rows = table.rowCount()
    table.insertRow(rows)
    self.set_row_items_cb(table, cb_col)
    self.resize_rows(table)
    return table

def set_row_items_cb(self, table, cb_col):
    cb = QtGui.QComboBox()
    cb.currentIndexChanged.connect(self.signalMapper.map)

    rows = table.rowCount()
    cols = table.columnCount()
    for col in range(cols):
        if col == cb_col:
            table.setCellWidget(rows - 1, cb_col, cb)
            cb.row = rows - 1
            cb.column = cb_col
            self.signalMapper.setMapping(cb, cb)
        else:
            table.setItem(rows - 1, col, QtGui.QTableWidgetItem(''))
    return table

def on_signalMapper_mapped(self, cb):
    self.cb_index_changed_signal.emit(cb)

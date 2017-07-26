import sys
from PyQt4 import QtGui, QtCore

class QCustomDelegate (QtGui.QItemDelegate):
    def __init__(self, *args, **kwargs):
        QtGui.QItemDelegate.__init__(self, *args, **kwargs)
        self.listsData = ['Data 1', 'Data 2', 'Data 3']

    def createEditor (self, parentQWidget, optionQStyleOptionViewItem, indexQModelIndex):
        column = indexQModelIndex.column()
        if column == 0:
            editorQWidget = QtGui.QComboBox(parentQWidget)
            editorQWidget.clear()
            for data in self.listsData:
                editorQWidget.addItem(data)
            return editorQWidget
        else:
            return QtGui.QItemDelegate.createEditor(self, parentQWidget, optionQStyleOptionViewItem, indexQModelIndex)

    def setEditorData (self, editorQWidget, indexQModelIndex):
        column = indexQModelIndex.column()
        if column == 0:
            index, _ = indexQModelIndex.model().data(indexQModelIndex, QtCore.Qt.EditRole).toInt()
            editorQWidget.setCurrentIndex(index)
        else:
            QtGui.QItemDelegate.setEditorData(self, editorQWidget, indexQModelIndex)

    def setModelData (self, editorQWidget, modelQAbstractItemModel, indexQModelIndex):
        column = indexQModelIndex.column()
        if column == 0:
            index = editorQWidget.currentIndex()
            modelQAbstractItemModel.setData(indexQModelIndex, index, QtCore.Qt.EditRole)
        else:
            QtGui.QItemDelegate.setModelData(self, editorQWidget, modelQAbstractItemModel, indexQModelIndex)

    def updateEditorGeometry(self, editorQWidget, optionQStyleOptionViewItem, indexQModelIndex):
        column = indexQModelIndex.column()
        if column == 0:
            editorQWidget.setGeometry(optionQStyleOptionViewItem.rect)
        else:
            QtGui.QItemDelegate.updateEditorGeometry(self, editorQWidget, optionQStyleOptionViewItem, indexQModelIndex)

    def paint (self, painterQPainter, optionQStyleOptionViewItem, indexQModelIndex):
        column = indexQModelIndex.column()
        if column == 0:
            value, _ = indexQModelIndex.model().data(indexQModelIndex, QtCore.Qt.EditRole).toInt()
            self.drawDisplay(painterQPainter, optionQStyleOptionViewItem, optionQStyleOptionViewItem.rect, QtCore.QString(self.listsData[value]));
        else:
            QtGui.QItemDelegate.paint(self, painterQPainter, optionQStyleOptionViewItem, indexQModelIndex)

class QCustomTableWidget (QtGui.QTableWidget):
    def __init__ (self, parent = None):
        super(QCustomTableWidget, self).__init__(parent)
        # Setup row & column data
        listsVerticalHeaderItem = ['Device 1', 'Device 2', 'Device 3', 'Device 4', 'Device 5']
        self.setRowCount(len(listsVerticalHeaderItem))
        for index in range(self.rowCount()):
            self.setVerticalHeaderItem(index, QtGui.QTableWidgetItem(listsVerticalHeaderItem[index]))
        self.setColumnCount(5)
        listsHorizontalHeaderItem = ['Option 1', 'Option 2']
        self.setColumnCount(len(listsHorizontalHeaderItem))
        for index in range(self.columnCount()):
            self.setHorizontalHeaderItem(index, QtGui.QTableWidgetItem(listsHorizontalHeaderItem[index]))
        self.myQCustomDelegate = QCustomDelegate()
        self.setItemDelegate(self.myQCustomDelegate)
        # Test insert data
        index = 2
        self.setItem(0, 0, QtGui.QTableWidgetItem(str(index)))
        # Test read data
        index = int(self.item(0, 0).text())
        print (self.myQCustomDelegate.listsData[index])


if __name__ == '__main__':
    myQApplication = QtGui.QApplication(sys.argv)
    myQCustomTableWidget = QCustomTableWidget()
    myQCustomTableWidget.show()
    sys.exit(myQApplication.exec_())

import sys
from PyQt4 import QtCore, QtGui


class MainWindow(QtGui.QMainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__()
        self.setWindowTitle("MainWindow Window!")
        self.setGeometry(400, 400, 100, 100)
        self.centerWidget = QtGui.QWidget()
        self.setCentralWidget(self.centerWidget)

        self.pushButton = QtGui.QPushButton("&Button")
        layout = QtGui.QVBoxLayout()
        layout.addWidget(self.pushButton)
        self.centerWidget.setLayout(layout)


class ChildWindow(QtGui.QMainWindow):
    def __init__(self, parent=None):
        super(ChildWindow, self).__init__(parent)
        #QtGui.QMainWindow.__init__(self, parent)
        self.setWindowTitle("Child Window!")
        self.centerWidget = Widget(parent)
        self.setCentralWidget(self.centerWidget)


class Widget(QtGui.QWidget):
    def __init__(self, parent=None):
        super(Widget, self).__init__()

        self.messageLabel = QtGui.QLabel()
        self.messageLabel.setText("Message Popup")
        layout = QtGui.QVBoxLayout()
        layout.addWidget(self.messageLabel)
        self.setLayout(layout)

app = QtGui.QApplication(sys.argv)
myapp = MainWindow()


def showChildWindow():
    child_win = ChildWindow(myapp)
    child_win.show()
    childLabel = child_win.centerWidget.messageLabel().text().__str__().__str__()  # how to call the messageLabel?
    print(childLabel)

myapp.show()
QtCore.QObject.connect(myapp.pushButton, QtCore.SIGNAL("clicked()"), showChildWindow)
sys.exit(app.exec_())

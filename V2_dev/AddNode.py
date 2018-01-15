from PyQt4.QtGui import *
from PyQt4 import QtCore
from PyQt4 import QtGui
import SABRE2_GUI
import numpy as np

class AddNodeClass(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(AddNodeClass, self).__init__(parent)
        self.ui = ui_layout
        AddNodeClass.btnChecked= False

    def radioButtonState1(self):
        AddNodeClass.btnChecked = self.ui.StepRB1.isChecked()
        print("step =", AddNodeClass.btnChecked)

    def radioButtonState2(self):
        AddNodeClass.btnChecked = self.ui.StepRB1.isChecked()
        print("no step =  ", AddNodeClass.btnChecked)
    # def radioButtonState(self, buttonName):
    #     button_name = buttonName.text()
    #     print(buttonName.ischecked())
    #     if button_name == "Step":
    #         if buttonName.isChecked() == True:
    #             print(buttonName.text(), "is selected")
    #         else:
    #             print(buttonName.text(), "is deselected")
    #
    #     else:
    #         if buttonName.isChecked() == True:
    #             print(buttonName.text(), "is selected")
    #         else:
    #             print(buttonName.text(), "is deselected")

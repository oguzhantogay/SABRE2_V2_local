import numpy as np
import SABRE2_main_subclass as sMain
from PyQt4.QtGui import *
import SABRE2_GUI


class MemberModel(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(MemberModel, self).__init__(parent)
        self.ui = ui_layout

        self.JNodevalue = None

    def coordinates(self):
        self.JNodevalue = sMain.SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)
        print("JNodevalue in membModel", self.JNodevalue)


        for k in range(13):
            for i in tableName.rowCount():
                SASSEM[i][1][k] = self.JNodevalue_i[i][k]
                if np.amax(self.BNodevalue[i,:,1]) == 0:
                    pass
                else:
                    for i in range(np.amax(self.BNodevalue[i,:,1])):
                        SASSEM[i][j+1][k] = self.BNodevalue[i,j,k]

                SASSEM[i][np.amax(self.BNodevalue[i,:,1])+1][k] = self.JNodevalue_j[i][k]



from PyQt4.QtGui import *


class MemberVariables(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(MemberVariables, self).__init__(parent)
        self.ui = ui_layout
        self.JNodeValue = None
        self.members_table_values = None
        self.JNodeValue_i = None
        self.JNodeValue_j = None
        self.MAssemble = None

    def MemVariables(self):
        from SABRE2_main_subclass import SABRE2_main_subclass
        row = self.ui.Members_table.currentRow()
        # self.JNodeValue =  SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)
        # self.members_table_values, self.JNodeValue_i, self.JNodeValue_j = SABRE2_main_subclass.update_members_table(
        #     self, self.ui.Members_table, 3)
        self.MAssemble, = SABRE2_main_subclass.AISC_update_fun(self,self.ui, self.ui.Members_table)
        print("assemble = ", self.MAssemble)

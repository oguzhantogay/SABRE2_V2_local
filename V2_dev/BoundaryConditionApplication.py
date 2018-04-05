import h5_file
import numpy as np
from PyQt4.QtGui import *


class SettingTables(QMainWindow):
    """ put the doc in here"""

    def __init__(self, ui_layout, parent=None):
        super(SettingTables, self).__init__(parent)
        self.ui = ui_layout

class BoundaryConditionArrays(QMainWindow):
    def __init__(self, ui_layout, parent=None):
        super(BoundaryConditionArrays, self).__init__(parent)
        self.ui = ui_layout

    def BC_arrays(self):
        Lnode = self.ui.Fixities_table.currentRow()
        SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        DUP1 = h5_file.h5_Class.read_array(self, 'DUP1')
        DUP2 = h5_file.h5_Class.read_array(self, 'DUP2')
        RNCc = h5_file.h5_Class.read_array(self, 'RNCc')
        PNC = h5_file.h5_Class.read_array(self, 'RNCc')
        PNC1 = h5_file.h5_Class.read_array(self, 'PNC1')
        PNC2 = h5_file.h5_Class.read_array(self, 'PNC2')

        number_of_nodes = RNCc[:,0].shape[0]





        if PNC.shape[0] == 1:
            xn = int(np.sum(np.sum(SNodevalue[:, :, 2]))[:, 0].shape[0])
            PNC = np.zeros((RNCc[:,0].shape[0], 14))
            PNC1 = np.zeros((xn, 14))
            PNC2 = np.zeros((xn, 14))

            for i in range(DUP1[:,0].shape[0]):
                if np.isclose(PNC1[i,12], 0):
                    PNC1[i,12] = 1

                if np.isclose(PNC2[i, 12], 0):
                    PNC2[i, 12] = 1

        import SABRE2_main_subclass

        fixities_table_values = SABRE2_main_subclass.Boundary_Conditions.get_checkbox_values(self, self.ui.Fixities_table)

        PNC[RNCc[:,0].shape[0], 14] = 0
        PNC[Lnode, 14] = Lnode
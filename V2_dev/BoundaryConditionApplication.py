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
        # Lnode = self.ui.Fixities_table.currentRow()
        SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        DUP1 = h5_file.h5_Class.read_array(self, 'DUP1')
        DUP2 = h5_file.h5_Class.read_array(self, 'DUP2')
        RNCc = h5_file.h5_Class.read_array(self, 'RNCc')
        PNC = h5_file.h5_Class.read_array(self, 'PNC')
        PNC1 = h5_file.h5_Class.read_array(self, 'PNC1')
        PNC2 = h5_file.h5_Class.read_array(self, 'PNC2')

        number_of_nodes = RNCc[:,0].shape[0]




        # print('SNodevalue in BC arrays = ', SNodevalue)
        if PNC.shape[0] == 1:
            xn = int(np.sum(np.sum(SNodevalue[:, :, 2])))
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

        h5_file.h5_Class.update_array(self, fixities_table_values, 'fixities_vals')

        PNC[RNCc[:,0].shape[0]-1, 13] = 0
        for i in range(PNC.shape[0]):
            PNC[i, 0] = i + 1
            PNC[i, 1] = fixities_table_values[i][9]
            PNC[i, 2] = fixities_table_values[i][10]
            PNC[i, 3] = fixities_table_values[i][11]
            PNC[i, 4] =  fixities_table_values[i][2]
            PNC[i, 5] =  fixities_table_values[i][3]
            PNC[i, 6] =  fixities_table_values[i][4]
            PNC[i, 7] =  fixities_table_values[i][5]
            PNC[i, 8] =  fixities_table_values[i][6]
            PNC[i, 9] =  fixities_table_values[i][7]
            PNC[i, 10] = fixities_table_values[i][8]
            PNC[i, 12] = fixities_table_values[i][1]

        PNC1[DUP1[:, 0].shape[0] - 1, 13] = 0
        PNC2[DUP2[:, 0].shape[0] - 1, 13] = 0

        for i in range(DUP1.shape[0]):
            if np.isclose(PNC1[i][12], 0):
                PNC1[i][12] = 1

            if np.isclose(PNC2[i][12], 0):
                PNC2[i][12] = 1

        for j in range(RNCc.shape[0]):
            for i in range(DUP1.shape[0]):
                if np.isclose(j+1, DUP1[i][1]):
                    PNC1[i][0] = i + 1
                    PNC1[i][1] = fixities_table_values[j][9]
                    PNC1[i][2] = fixities_table_values[j][10]
                    PNC1[i][3] = fixities_table_values[j][11]
                    PNC1[i][4] =  fixities_table_values[j][2]
                    PNC1[i][5] =  fixities_table_values[j][3]
                    PNC1[i][6] =  fixities_table_values[j][4]
                    PNC1[i][7] =  fixities_table_values[j][5]
                    PNC1[i][8] =  fixities_table_values[j][6]
                    PNC1[i][9] =  fixities_table_values[j][7]
                    PNC1[i][10] = fixities_table_values[j][8]
                    PNC1[i][12] = fixities_table_values[j][1]

            for i in range(DUP2.shape[0]):
                if np.isclose(j+1, DUP2[i][1]):
                    PNC2[i][0] = i + 2
                    PNC2[i][1] = fixities_table_values[j][9]
                    PNC2[i][2] = fixities_table_values[j][10]
                    PNC2[i][3] = fixities_table_values[j][11]
                    PNC2[i][4] =  fixities_table_values[j][2]
                    PNC2[i][5] =  fixities_table_values[j][3]
                    PNC2[i][6] =  fixities_table_values[j][4]
                    PNC2[i][7] =  fixities_table_values[j][5]
                    PNC2[i][8] =  fixities_table_values[j][6]
                    PNC2[i][9] =  fixities_table_values[j][7]
                    PNC2[i][10] = fixities_table_values[j][8]
                    PNC2[i][12] = fixities_table_values[j][1]

        # print('PNC = \n', PNC)
        # print('PNC1 = \n', PNC1)
        # print('PNC2 = \n', PNC2)

        h5_file.h5_Class.update_array(self, PNC , 'PNC')
        h5_file.h5_Class.update_array(self, PNC1, 'PNC1')
        h5_file.h5_Class.update_array(self, PNC2, 'PNC2')

class ShearPanelApplication(QMainWindow):

    def __init__(self, ui_layout, parent=None):
        super(BoundaryConditionArrays, self).__init__(parent)
        self.ui = ui_layout

    def shear_panel_values(self):
        number_of_shear_panel = self.ui.Shear_panel_table.rowCount()
        BC1 = np.zeros((number_of_shear_panel, 11))
        BC2 = np.zeros((number_of_shear_panel, 11))
        shear_panel_values = h5_file.h5_Class.read_array(self,'shear_panel_values')
        RNCc = h5_file.h5_Class.read_array(self,'RNCc')

        for i in range(number_of_shear_panel):
            if shear_panel_values[i][5] != 0:
                BC1[i][0] = shear_panel_values[i][0]
                BC1[i][1] = shear_panel_values[i][3]
                BC1[i][2] = RNCc[int(shear_panel_values[i][3] - 1)][1]
                BC1[i][3] = RNCc[int(shear_panel_values[i][3] - 1)][2]
                BC1[i][4] = RNCc[int(shear_panel_values[i][3] - 1)][4]
                BC1[i][7] = shear_panel_values[i][5]
                BC1[i][8] = shear_panel_values[i][2]
                BC1[i][9] = shear_panel_values[i][1]

                BC2[i][0] = shear_panel_values[i][0]
                BC2[i][1] = shear_panel_values[i][4]
                BC2[i][2] = RNCc[int(shear_panel_values[i][4] - 1)][1]
                BC2[i][3] = RNCc[int(shear_panel_values[i][4] - 1)][2]
                BC2[i][4] = RNCc[int(shear_panel_values[i][4] - 1)][4]
                BC2[i][7] = shear_panel_values[i][5]
                BC2[i][8] = shear_panel_values[i][2]
                BC2[i][9] = shear_panel_values[i][1]

        print('BC2 = ', BC1)
        print('BC1 = ', BC2)
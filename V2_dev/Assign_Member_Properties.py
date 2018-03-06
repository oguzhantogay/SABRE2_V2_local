import numpy as np
import h5_file
from PyQt4.QtGui import *
from PyQt4 import QtGui
import DropDownActions


class Assign_All_Class(QMainWindow):
    """This class is activated when user wants to use one material properties and segment numbers to all others.
    It is activated automatically. If one wants to use different values for any member, the following class will be
    employed"""

    def __init__(self, ui_layout, parent=None):
        super(Assign_All_Class, self).__init__(parent)
        self.ui = ui_layout

    def check_existing_array(self):
        """ The method read SNodevalue array from the process or saved file.h5"""
        SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        Massemble = h5_file.h5_Class.read_array(self, 'Massemble')
        BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        return SNodevalue, Massemble, BNodevalue

    def assign_SNodevalue(self):
        """ Assign the SNodevalue array with the values from Member Properties Tab"""

        SNodevalue, Massemble, BNodevalue = Assign_All_Class.check_existing_SNodevalue(self)
        from SABRE2_main_subclass import SABRE2_main_subclass
        member_properties_values = SABRE2_main_subclass.update_member_properties_table(self,
                                                                                       self.ui.Member_Properties_Table)
        if SNodevalue.shape[1] == 0:
            if Massemble.shape[1] == 0 and BNodevalue.shape[1]:
                for i in range(Massemble.shape[0]):
                    for j in range(int(np.amax(BNodevalue[i, :, 1]) + 1):
                        SNodevalue[i][j][0] = i + 1
                        SNodevalue[i][j][1] = j + 1

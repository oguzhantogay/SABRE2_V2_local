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

    def assign_SNodevalue(self, flag = 'test'):
        """ Assign the SNodevalue array with the values from Member Properties Tab"""
        check_array = h5_file.h5_Class.read_array(self, 'check_array')
        from SABRE2_main_subclass import SABRE2_main_subclass
        SABRE2_main_subclass.members_defined_check(self)
        # print('flag = ', flag)
        # print('assign check = ' , check_array)
        non_zeros = np.count_nonzero(check_array)
        # print('non zero = ', non_zeros)
        if non_zeros == check_array.shape[0]:
            #### delete for separation of analysis
            self.ui.Member_Properties_Table.setEnabled(True)
            self.ui.BoundaryConditionsTabs.setEnabled(True)
            self.ui.LC_tabs.setEnabled(True)
            ####

            # print('in loop')
            # SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
            # Massemble = h5_file.h5_Class.read_array(self, 'Massemble')
            BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
            total_member_number = int(BNodevalue.shape[0])
            # print('BNodevalue = ', BNodevalue)
            from SABRE2_main_subclass import SABRE2_main_subclass
            member_properties_values = SABRE2_main_subclass.update_member_properties_table(self,
                                                                                           self.ui.Member_Properties_Table)

            max_b = 0
            max_c = 0

            for i in range(int(BNodevalue.shape[0])):
                max_c = np.amax(BNodevalue[i, :, 1])
                if max_b < max_c:
                    max_b = max_c


            SNodevalue = np.zeros((int(BNodevalue.shape[0]),int(max_b + 1), 11))
            # print('member prob values = ', member_properties_values)
            p= 0
            for i in range(int(BNodevalue.shape[0])):
                for j in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                    # print(member_properties_values[i][1])
                    SNodevalue[i][j][0] = i + 1
                    SNodevalue[i][j][1] = j + 1
                    SNodevalue[i][j][2] = member_properties_values[p][1]
                    SNodevalue[i][j][3] = member_properties_values[p][2]
                    SNodevalue[i][j][4] = member_properties_values[p][3]
                    SNodevalue[i][j][6] = member_properties_values[p][4]
                    SNodevalue[i][j][7] = member_properties_values[p][5]
                    SNodevalue[i][j][8] = member_properties_values[p][6]
                    SNodevalue[i][j][9] = member_properties_values[p][7]
                    if SNodevalue[i][j][7] == SNodevalue[i][j][8] ==SNodevalue[i][j][9]:
                        HomoType = 0
                        SNodevalue[i][j][5] = SNodevalue[i][j][7]

                    else:
                        HomoType = 1
                        SNodevalue[i][j][5] = 50
                    SNodevalue[i][j][10] = HomoType
                    p+=1

            # print('\n \n \n \nSNodevalue in assign =', SNodevalue)

            h5_file.h5_Class.update_array(self,SNodevalue, 'SNodevalue')

            import SABRE2LBCODE

            SABRE2LBCODE.SABRE2LBCODE.modelWithBC(self, flag)

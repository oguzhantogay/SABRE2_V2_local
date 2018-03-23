import numpy as np
import h5_file
from PyQt4.QtGui import *

class SABRE2LBCODE(QMainWindow):
    """ put the doc in here"""

    def __init__(self, ui_layout, parent=None):
        super(SABRE2LBCODE, self).__init__(parent)
        self.ui = ui_layout

    def LBCode(self):
        BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        import OpenGLcode
        joint_nodes_length, JNodevalue = OpenGLcode.glWidget.JointTableValues(self)
        member_count, member_values, JNodeValues_i, JNodeValues_j, _, Rval = OpenGLcode.glWidget.memberTableValues(self)

        print('BNodevalue = ', BNodevalue)
        # print('SNodevalue = ', SNodevalue)
        # print('joint_nodes_length = ', joint_nodes_length)
        # print('JNodevalue = ', JNodevalue)
        # print('member_count = ', member_count)
        # print('member_values = ', member_values)
        # print('JNodeValues_i = ', JNodeValues_i)
        # print('JNodeValues_j = ', JNodeValues_j)
        # print('Rval = ', Rval)

        # The following code is to determine whether Material Assignment done or not ? Not Required for Table type.
        # error = 0
        # xn = np.sum(np.sum(SNodevalue[:,:,2]))      # Total Number of Elements
        # mem = member_count                          # Total Nuber of Members
        # smem = np.amax(SNodevalue[:,0,0])
        #
        # snu = np.zeros((mem, 1))
        # bnu = np.zeros((mem, 1))
        #
        # for i in range(mem):
        #     if smem < mem:
        #         error += 1
        #     else:
        #         snu[i][0] = np.amax(SNodevalue[i,:,1])
        #         bnu[i][0] = np.amax(BNodevalue[i,:,1]) + 1

        max_b = 0

        for i in range(int(BNodevalue.shape[0])):
            max_c = np.amax(BNodevalue[i, :, 1])
            if max_b < max_c:
                max_b = max_c


        xn = np.sum(np.sum(SNodevalue[:,:,2]))      # Total Number of Elements
        mem = member_count                          # Total Nuber of Members
        smem = np.amax(SNodevalue[:,0,0])
        Sassemble = np.zeros((mem,int(max_b)+2,14))
        print('max b + 1 = ' ,max_b+1)
        for k in range(14):
            for i in range(mem):
                Sassemble[i][0][k] = JNodeValues_i[i][k]

                if not np.isclose(np.amax(BNodevalue[i,:,1]),0):
                    for j in range(int(np.amax(BNodevalue[i,:,1]))):
                        Sassemble[i,j+1,k] = BNodevalue[i,j,k]
                print('test =', int(np.amax(BNodevalue[i,:,1])))
                Sassemble[i][int(np.amax(BNodevalue[i,:,1]))+1][k] = JNodeValues_j[i][k]

        # print('Sassemble in LBCode =', Sassemble)


import numpy as np
import h5_file
from PyQt4.QtGui import *
from scipy.interpolate import interp1d

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

        # print('BNodevalue = ', BNodevalue)
        print('SNodevalue = ', SNodevalue)
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
        # print('max b + 1 = ' ,max_b+1)
        for k in range(14):
            for i in range(mem):
                Sassemble[i][0][k] = JNodeValues_i[i][k]

                if not np.isclose(np.amax(BNodevalue[i,:,1]),0):
                    for j in range(int(np.amax(BNodevalue[i,:,1]))):
                        Sassemble[i,j+1,k] = BNodevalue[i,j,k]
                # print('test =', int(np.amax(BNodevalue[i,:,1])))
                Sassemble[i][int(np.amax(BNodevalue[i,:,1]))+1][k] = JNodeValues_j[i][k]

        # print('Sassemble in LBCode =', Sassemble)

        # NJbode sizing
        q = 1
        a = 1
        for i in range(mem - 1):
            q += np.amax(SNodevalue[i,:,1]) + 1

        for i in range(mem):
            a = (int(np.amax(SNodevalue[i,:,1])))

        size_1 = q + a
        # print('size_1 = ', size_1)
        # print('Sassemble = ', Sassemble)

        NJbode = np.zeros((int(size_1), 15))
        # print('NJbode first = ', NJbode)

        q = 1
        r = 1
        for i in range(mem):
            # print('NJbode loop = ', q)
            NJbode[q - 1][0] = r
            NJbode[q - 1][1] = Sassemble[i][0][0]
            NJbode[q - 1][2] = Sassemble[i][0][2]
            NJbode[q - 1][3] = Sassemble[i][0][3]
            NJbode[q - 1][4] = Sassemble[i][0][4]
            NJbode[q - 1][5] = Sassemble[i][0][5]
            NJbode[q - 1][6] = Sassemble[i][0][6]
            NJbode[q - 1][7] = Sassemble[i][0][7]
            NJbode[q - 1][8] = Sassemble[i][0][8]
            NJbode[q - 1][9] = Sassemble[i][0][9]
            NJbode[q - 1][10] = Sassemble[i][0][10]
            NJbode[q - 1][11] = Sassemble[i][0][11]
            NJbode[q - 1][12] = Sassemble[i][0][12]
            NJbode[q - 1][13] = Sassemble[i][0][13]
            NJbode[q - 1][14] = q

            for j in range(int(np.amax(SNodevalue[i,:,1]))):
                NJbode[q + j][0] = NJbode[q+j-1][0] + SNodevalue[i][j][2]
                NJbode[q + j][1] =  Sassemble[i][j+1][0]
                NJbode[q + j][2] =  Sassemble[i][j+1][2]
                NJbode[q + j][3] =  Sassemble[i][j+1][3]
                NJbode[q + j][4] =  Sassemble[i][j+1][4]
                NJbode[q + j][5] =  Sassemble[i][j+1][5]
                NJbode[q + j][6] =  Sassemble[i][j+1][6]
                NJbode[q + j][7] =  Sassemble[i][j+1][7]
                NJbode[q + j][8] =  Sassemble[i][j+1][8]
                NJbode[q + j][9] =  Sassemble[i][j+1][9]
                NJbode[q + j][10] = Sassemble[i][j+1][10]
                NJbode[q + j][11] = Sassemble[i][j+1][11]
                NJbode[q + j][12] = Sassemble[i][j+1][12]
                NJbode[q + j][13] = Sassemble[i][j+1][13]
                NJbode[q + j][14] = q +j + 1
            # print('NJbode loop last = ', NJbode)
            r += int(np.sum(SNodevalue[i,:,2]))
            q += int(np.amax(SNodevalue[i,:,1])) + 1
            # print('sum = ' , np.sum(SNodevalue[i,:,2]))
            # print('q = ', q)
            # print('r = ', r)

        # print('NJBode = ', NJbode)
        nodes = np.zeros((2,1))
        xgs =np.zeros((2,1))
        ygs =np.zeros((2,1))
        zgs =np.zeros((2,1))
        bfbs =np.zeros((2,1))
        tfbs = np.zeros((2,1))
        bfts = np.zeros((2,1))
        tfts = np.zeros((2,1))
        dws = np.zeros((2,1))
        tws = np.zeros((2,1))
        ds = np.zeros((2,1))
        hs = np.zeros((2,1))
        Afil = np.zeros((2,1))
        q = 0
        for i in range(mem):
            for j in range(int(np.amax(SNodevalue[i,:2]))):
                nodes[0][0] = NJbode[q+j][0]
                nodes[1][0] = NJbode[q+j+1][0]
                xgs [0][0] = NJbode[q+j][2]
                xgs [1][0] = NJbode[q+j+1][2]
                ygs [0][0] = NJbode[q+j][3]
                ygs [1][0] = NJbode[q+j+1][3]
                zgs [0][0] = NJbode[q+j][4]
                zgs [1][0] = NJbode[q+j+1][4]
                bfbs [0][0] = NJbode[q+j][5]
                bfbs [1][0] = NJbode[q+j+1][5]
                tfbs [0][0] = NJbode[q+j][6]
                tfbs [1][0] = NJbode[q+j+1][6]
                bfts [0][0] = NJbode[q+j][7]
                bfts [1][0] = NJbode[q+j+1][7]
                tfts [0][0] = NJbode[q+j][8]
                tfts [1][0] = NJbode[q+j+1][8]
                dws [0][0] = NJbode[q+j][9]
                dws [1][0] = NJbode[q+j+1][9]
                tws [0][0] = NJbode[q+j][10]
                tws [1][0] = NJbode[q+j+1][10]
                ds [0][0] = NJbode[q+j][11]
                ds [1][0] = NJbode[q+j+1][11]
                hs [0][0] = NJbode[q+j][12]
                hs [1][0] = NJbode[q+j+1][12]
                Afil [0][0] = NJbode[q+j][13]
                Afil [1][0] = NJbode[q+j+1][13]
                if np.isclose(j+1,np.amax(SNodevalue[i,:,1])):
                    node_1 = int(NJbode[q+1+j][0])
                    node_2 = int(NJbode[q+2+j][0])
                    inter = np.vstack(np.linspace(node_1,node_2,(node_2 - node_1) + 1))
                    nodesb = interp1d(nodes,nodes,inter)
                    xgsb =   interp1d(nodes,xgs,inter)
                    ygsb =   interp1d(nodes,ygs,inter)
                    zgsb =   interp1d(nodes,zgs,inter)
                    bfbsb =  interp1d(nodes,bfbs,inter)
                    tfbsb =  interp1d(nodes,tfbs,inter)
                    bftsb =  interp1d(nodes,bfts,inter)
                    tftsb =  interp1d(nodes,tfts,inter)
                    dwsb =   interp1d(nodes,dws,inter)
                    twsb =   interp1d(nodes,tws,inter)
                    dsb =    interp1d(nodes,ds ,inter)
                    hsb =    interp1d(nodes,hs ,inter)
                    Afilb =  interp1d(nodes,Afil,inter)
                else:
                    node_1 = int(NJbode[q + 1 + j][0])
                    node_2 = int(NJbode[q + 2 + j][0]) -1
                    inter = np.vstack(np.linspace(node_1, node_2, (node_2 - node_1) + 1))
                    nodesb = interp1d(nodes, nodes, inter)
                    xgsb = interp1d(nodes, xgs, inter)
                    ygsb = interp1d(nodes, ygs, inter)
                    zgsb = interp1d(nodes, zgs, inter)
                    bfbsb = interp1d(nodes, bfbs, inter)
                    tfbsb = interp1d(nodes, tfbs, inter)
                    bftsb = interp1d(nodes, bfts, inter)
                    tftsb = interp1d(nodes, tfts, inter)
                    dwsb = interp1d(nodes, dws, inter)
                    twsb = interp1d(nodes, tws, inter)
                    dsb = interp1d(nodes, ds, inter)
                    hsb = interp1d(nodes, hs, inter)
                    Afilb = interp1d(nodes, Afil, inter)

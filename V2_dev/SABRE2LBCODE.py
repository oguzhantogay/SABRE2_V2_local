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
        # print('LBcode ran')
        BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        # print('SNodevalue in LBCode =', SNodevalue)

        import OpenGLcode
        joint_nodes_length, JNodevalue = OpenGLcode.glWidget.JointTableValues(self)
        member_count, member_values, JNodeValues_i, JNodeValues_j, _, Rval = OpenGLcode.glWidget.memberTableValues(self)

        # print('BNodevalue = ', BNodevalue)
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
        # xn = int(np.sum(np.sum(SNodevalue[:,:,2])))      # Total Number of Elements
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

        xn = np.sum(np.sum(SNodevalue[:, :, 2]))  # Total Number of Elements
        mem = member_count  # Total Nuber of Members
        smem = np.amax(SNodevalue[:, 0, 0])
        Sassemble = np.zeros((mem, int(max_b) + 2, 14))
        # print('max b + 1 = ' ,max_b+1)
        for k in range(14):
            for i in range(mem):
                Sassemble[i][0][k] = JNodeValues_i[i][k]

                if not np.isclose(np.amax(BNodevalue[i, :, 1]), 0):
                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        Sassemble[i, j + 1, k] = BNodevalue[i, j, k]
                # print('test =', int(np.amax(BNodevalue[i,:,1])))
                Sassemble[i][int(np.amax(BNodevalue[i, :, 1])) + 1][k] = JNodeValues_j[i][k]

        # print('Sassemble in LBCode =', Sassemble)

        # NJbode sizing
        q = 1
        a = 1
        for i in range(mem - 1):
            q += np.amax(SNodevalue[i, :, 1]) + 1

        for i in range(mem):
            a = (int(np.amax(SNodevalue[i, :, 1])))

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

            for j in range(int(np.amax(SNodevalue[i, :, 1]))):
                NJbode[q + j][0] = NJbode[q + j - 1][0] + SNodevalue[i][j][2]
                NJbode[q + j][1] = Sassemble[i][j + 1][0]
                NJbode[q + j][2] = Sassemble[i][j + 1][2]
                NJbode[q + j][3] = Sassemble[i][j + 1][3]
                NJbode[q + j][4] = Sassemble[i][j + 1][4]
                NJbode[q + j][5] = Sassemble[i][j + 1][5]
                NJbode[q + j][6] = Sassemble[i][j + 1][6]
                NJbode[q + j][7] = Sassemble[i][j + 1][7]
                NJbode[q + j][8] = Sassemble[i][j + 1][8]
                NJbode[q + j][9] = Sassemble[i][j + 1][9]
                NJbode[q + j][10] = Sassemble[i][j + 1][10]
                NJbode[q + j][11] = Sassemble[i][j + 1][11]
                NJbode[q + j][12] = Sassemble[i][j + 1][12]
                NJbode[q + j][13] = Sassemble[i][j + 1][13]
                NJbode[q + j][14] = q + j + 1
            # print('NJbode loop last = ', NJbode)
            r += int(np.sum(SNodevalue[i, :, 2]))
            q += int(np.amax(SNodevalue[i, :, 1])) + 1
            # print('sum = ' , np.sum(SNodevalue[i,:,2]))
            # print('q = ', q)
            # print('r = ', r)

        # print('NJBode = ', NJbode)
        nodep = None
        xgp = None
        ygp = None
        zgp = None
        bfbp = None
        bftp = None
        tfbp = None
        tftp = None
        dp = None
        twp = None
        dwp = None
        hp = None
        Afilp = None
        nodes = np.zeros((2, 1))
        xgs = np.zeros((2, 1))
        ygs = np.zeros((2, 1))
        zgs = np.zeros((2, 1))
        bfbs = np.zeros((2, 1))
        tfbs = np.zeros((2, 1))
        bfts = np.zeros((2, 1))
        tfts = np.zeros((2, 1))
        dws = np.zeros((2, 1))
        tws = np.zeros((2, 1))
        ds = np.zeros((2, 1))
        hs = np.zeros((2, 1))
        Afil = np.zeros((2, 1))
        q = 0
        for i in range(mem):

            for j in range(int(np.amax(SNodevalue[i, :, 1]))):
                nodes[0][0] = NJbode[q + j][0]
                nodes[1][0] = NJbode[q + j + 1][0]
                xgs[0][0] = NJbode[q + j][2]
                xgs[1][0] = NJbode[q + j + 1][2]
                ygs[0][0] = NJbode[q + j][3]
                ygs[1][0] = NJbode[q + j + 1][3]
                zgs[0][0] = NJbode[q + j][4]
                zgs[1][0] = NJbode[q + j + 1][4]
                bfbs[0][0] = NJbode[q + j][5]
                bfbs[1][0] = NJbode[q + j + 1][5]
                tfbs[0][0] = NJbode[q + j][6]
                tfbs[1][0] = NJbode[q + j + 1][6]
                bfts[0][0] = NJbode[q + j][7]
                bfts[1][0] = NJbode[q + j + 1][7]
                tfts[0][0] = NJbode[q + j][8]
                tfts[1][0] = NJbode[q + j + 1][8]
                dws[0][0] = NJbode[q + j][9]
                dws[1][0] = NJbode[q + j + 1][9]
                tws[0][0] = NJbode[q + j][10]
                tws[1][0] = NJbode[q + j + 1][10]
                ds[0][0] = NJbode[q + j][11]
                ds[1][0] = NJbode[q + j + 1][11]
                hs[0][0] = NJbode[q + j][12]
                hs[1][0] = NJbode[q + j + 1][12]
                Afil[0][0] = NJbode[q + j][13]
                Afil[1][0] = NJbode[q + j + 1][13]
                if np.isclose(j + 1, np.amax(SNodevalue[i, :, 1])):
                    # print('# if in LB code')
                    node_1 = int(NJbode[q + j][0])
                    node_2 = int(NJbode[q + 1 + j][0])
                    # print('node 1 = ', node_1, '\nnode 2 = ', node_2)
                    inter = np.vstack(np.linspace(node_1, node_2, (node_2 - node_1) + 1))
                    # print('\ninter = ', inter)
                    nodesb = np.interp(inter[:, 0], nodes[:, 0], nodes[:, 0])
                    # print('nodesb = ', nodesb)
                    xgsb = np.interp(inter[:, 0], nodes[:, 0], xgs[:, 0])
                    ygsb = np.interp(inter[:, 0], nodes[:, 0], ygs[:, 0])
                    zgsb = np.interp(inter[:, 0], nodes[:, 0], zgs[:, 0])
                    bfbsb = np.interp(inter[:, 0], nodes[:, 0], bfbs[:, 0])
                    tfbsb = np.interp(inter[:, 0], nodes[:, 0], tfbs[:, 0])
                    bftsb = np.interp(inter[:, 0], nodes[:, 0], bfts[:, 0])
                    tftsb = np.interp(inter[:, 0], nodes[:, 0], tfts[:, 0])
                    dwsb = np.interp(inter[:, 0], nodes[:, 0], dws[:, 0])
                    twsb = np.interp(inter[:, 0], nodes[:, 0], tws[:, 0])
                    dsb = np.interp(inter[:, 0], nodes[:, 0], ds[:, 0])
                    hsb = np.interp(inter[:, 0], nodes[:, 0], hs[:, 0])
                    Afilb = np.interp(inter[:, 0], nodes[:, 0], Afil[:, 0])
                else:
                    # print('else in LB code')
                    # print('q = ', q, '\nj = ' , j)
                    node_1 = int(NJbode[q + j][0])
                    node_2 = int(NJbode[q + 1 + j][0])
                    # print('node 1 = ', node_1, '\nnode 2 = ', node_2)
                    inter = np.vstack(np.linspace(node_1, node_2 - 1, (node_2 - node_1)))
                    # print('\ninter = ', inter)

                    nodesb = np.interp(inter[:, 0], nodes[:, 0], nodes[:, 0])
                    # print('nodesb = ', nodesb)
                    xgsb = np.interp(inter[:, 0], nodes[:, 0], xgs[:, 0])
                    # print('xgsb = ', xgsb)
                    ygsb = np.interp(inter[:, 0], nodes[:, 0], ygs[:, 0])
                    zgsb = np.interp(inter[:, 0], nodes[:, 0], zgs[:, 0])
                    bfbsb = np.interp(inter[:, 0], nodes[:, 0], bfbs[:, 0])
                    tfbsb = np.interp(inter[:, 0], nodes[:, 0], tfbs[:, 0])
                    bftsb = np.interp(inter[:, 0], nodes[:, 0], bfts[:, 0])
                    tftsb = np.interp(inter[:, 0], nodes[:, 0], tfts[:, 0])
                    dwsb = np.interp(inter[:, 0], nodes[:, 0], dws[:, 0])
                    twsb = np.interp(inter[:, 0], nodes[:, 0], tws[:, 0])
                    dsb = np.interp(inter[:, 0], nodes[:, 0], ds[:, 0])
                    hsb = np.interp(inter[:, 0], nodes[:, 0], hs[:, 0])
                    Afilb = np.interp(inter[:, 0], nodes[:, 0], Afil[:, 0])
                # print('nodep = ', nodep)
                if nodep is None:
                    nodenum = np.vstack(nodesb)
                    nodep = nodenum
                    xgnum = np.vstack(xgsb)
                    xgp = xgnum
                    ygnum = np.vstack(ygsb)
                    ygp = ygnum
                    zgnum = np.vstack(zgsb)
                    zgp = zgnum
                    bfbnum = np.vstack(bfbsb)
                    bfbp = bfbnum
                    tfbnum = np.vstack(tfbsb)
                    tfbp = tfbnum
                    bftnum = np.vstack(bftsb)
                    bftp = bftnum
                    tftnum = np.vstack(tftsb)
                    tftp = tftnum
                    dwnum = np.vstack(dwsb)
                    dwp = dwnum
                    twnum = np.vstack(twsb)
                    twp = twnum
                    dnum = np.vstack(dsb)
                    dp = dnum
                    hnum = np.vstack(hsb)
                    hp = hnum
                    Afilnum = np.vstack(Afilb)
                    Afilp = Afilnum
                else:
                    nodenum = np.vstack((nodep, np.vstack(nodesb)))
                    nodep = nodenum
                    xgnum = np.vstack((xgp, np.vstack(xgsb)))
                    xgp = xgnum
                    ygnum = np.vstack((ygp, np.vstack(ygsb)))
                    ygp = ygnum
                    zgnum = np.vstack((zgp, np.vstack(zgsb)))
                    zgp = zgnum
                    bfbnum = np.vstack((bfbp, np.vstack(bfbsb)))
                    bfbp = bfbnum
                    tfbnum = np.vstack((tfbp, np.vstack(tfbsb)))
                    tfbp = tfbnum
                    bftnum = np.vstack((bftp, np.vstack(bftsb)))
                    bftp = bftnum
                    tftnum = np.vstack((tftp, np.vstack(tftsb)))
                    tftp = tftnum
                    dwnum = np.vstack((dwp, np.vstack(dwsb)))
                    dwp = dwnum
                    twnum = np.vstack((twp, np.vstack(twsb)))
                    twp = twnum
                    dnum = np.vstack((dp, np.vstack(dsb)))
                    dp = dnum
                    hnum = np.vstack((hp, np.vstack(hsb)))
                    hp = hnum
                    Afilnum = np.vstack((Afilp, np.vstack(Afilb)))
                    Afilp = Afilnum

            # print('amax = ', np.amax(SNodevalue[i,:,1]))
            q = int(np.amax(SNodevalue[i, :, 1])) + q + 1

        # print('nodenum = ', nodenum)
        # print('xgnum = ', xgnum)
        # print('ygnum = ', ygnum)
        # print('zgnum = ', zgnum)
        # print('bfbnum = ', bfbnum)
        # print('tfbnum = ', tfbnum)
        # print('bftnum = ', bftnum)
        # print('tftnum = ', tftnum)
        # print('dwp = ', dwp)
        # print('twnum = ', twnum)
        # print('dp = ', dp)
        # print('hp = ', hp)
        # print('Afilnum = ', Afilnum)

        nodenum = nodenum.astype(int)

        NC = np.zeros((nodenum.shape[0], 13))
        NC[:, 0] = nodenum[:, 0]
        NC[:, 1] = xgnum[:, 0]
        NC[:, 2] = ygnum[:, 0]
        NC[:, 3] = zgnum[:, 0]
        NC[:, 4] = bfbnum[:, 0]
        NC[:, 5] = tfbnum[:, 0]
        NC[:, 6] = bftnum[:, 0]
        NC[:, 7] = tftnum[:, 0]
        NC[:, 8] = dwnum[:, 0]
        NC[:, 9] = twnum[:, 0]
        NC[:, 10] = dnum[:, 0]
        NC[:, 11] = hnum[:, 0]
        NC[:, 12] = Afilnum[:, 0]

        q = 0
        size = 0
        a = 0
        # print('SNodevalue = ', SNodevalue)
        for i in range(mem):
            # print('sum =',  np.sum(SNodevalue[i,:,2]))
            size += np.sum(SNodevalue[i, :, 2])
        # print('size =', size)
        NCa = np.zeros((int(size) + mem, 16))

        mn = NCa[:, 0].shape[0]
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i, :, 2])) + 1):
                if np.isclose(i, 0):
                    # print('\n## if 1\n')
                    for k in range(13):
                        NCa[j + q][k] = NC[j + q][k]

                else:
                    # print('\n## else 1\n')
                    if np.isclose(j, 0):
                        # print('\n## if 2\n')
                        for n in range(mn):
                            if np.isclose(NCa[n][1], NC[j + q][1]) and np.isclose(NCa[n][2],
                                                                                  NC[j + q][2]) and np.isclose(
                                NCa[n][3], NC[j + q][3]) and np.isclose(NCa[n][13], 0):
                                # print('\n## if 3\n')
                                # print('j = ', j, 'q = ', q)
                                for k in range(13):
                                    NCa[j + q][k] = 0
                                NCa[j + q][13] = n + 1
                                NCa[j + q][14] = i + 1
                                NCa[j + q][15] = j + 1
                                break
                            else:
                                # print('\n## else 3\n')
                                for k in range(13):
                                    NCa[j + q][k] = NC[j + q][k]
                    elif np.isclose(j, np.sum(SNodevalue[i, :, 2])):
                        # print('\n## elif 2\n')
                        # print('mn in elif 2 = ', mn)
                        for n in range(mn):
                            if np.isclose(NCa[n][1], NC[j + q][1]) and np.isclose(NCa[n][2],
                                                                                  NC[j + q][2]) and np.isclose(
                                NCa[n][3], NC[j + q][3]) and np.isclose(NCa[n][13], 0):
                                # print('\n## if 4\n')
                                NCa[j + q][13] = n + 1
                                NCa[j + q][14] = i + 1
                                NCa[j + q][15] = j + 1
                                break
                            else:
                                # print('\n## else 4\n')
                                for k in range(13):
                                    NCa[j + q][k] = NC[j + q][k]
                    else:
                        # print('\n## else 2\n')
                        for k in range(13):
                            NCa[j + q][k] = NC[j + q][k]

            mn = int(np.sum(SNodevalue[i, :, 2])) + 1
            q += int(np.sum(SNodevalue[i, :, 2])) + 1

        # print('NCa at the end of the loop = ', NCa)

        # NCb & NCc
        # Node data without duplication
        size_2 = 1
        for i in range(NCa.shape[0]):
            if not np.isclose(NCa[i][0], 0):
                size_2 += 1

        # print('size_2 = ', size_2 -1 )
        r = 0
        NCb = np.zeros((size_2 - 1, 13))
        # print('NCb = ' , NCb)
        for i in range(NCa.shape[0]):
            if not np.isclose(NCa[i][0], 0):
                NCb[r][0] = r + 1
                for k in range(1, 13):
                    NCb[r][k] = NCa[i][k]
                r = r + 1

        # print('r = ', r)
        NCc = NCb

        # print('NCc = ' , NCc)

        # DUP with Duplication
        DUP = np.zeros((nodenum.shape[0], 14))
        for i in range(nodenum.shape[0]):
            for j in range(NCc.shape[0]):
                if np.isclose(NC[i][1], NCc[j][1]) and np.isclose(NC[i][2], NCc[j][2]) and np.isclose(NC[i][3],
                                                                                                      NCc[j][3]):
                    DUP[i][0] = i + 1
                    for k in range(13):
                        DUP[i][k + 1] = NCc[j][k]

        # print('DUP = ', DUP)

        # DUP1 & DUP2
        q = 0
        r = 0
        DUP1 = np.zeros((int(size), 14))
        DUP2 = np.zeros((int(size), 14))
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i, :, 2]))):
                # i Node
                DUP1[j + r][0] = j + r + 1
                DUP1[j + r][1] = DUP[j + q][1]
                for k in range(1, 13):
                    DUP1[j + r][k + 1] = NC[j + q][k]

                # j Node
                DUP2[j + r][0] = j + r + 1
                DUP2[j + r][1] = DUP[j + q + 1][1]
                for k in range(1, 13):
                    DUP2[j + r][k + 1] = NC[j + q + 1][k]
            r += int(np.sum(SNodevalue[i, :, 2]))
            q += int(np.sum(SNodevalue[i, :, 2])) + 1
        #
        # print('DUP1 = ', DUP1)
        # print('DUP2 = ', DUP2)
        h5_file.h5_Class.update_array(self, DUP1, 'DUP1')
        h5_file.h5_Class.update_array(self, DUP2, 'DUP2')
        return DUP1, DUP2, mem, xn, JNodeValues_i, JNodeValues_j, SNodevalue, Rval, NC, NCa

    def InitialEleLengthRendering(self, xn, mem, xg1, yg1, zg1, xg2, yg2, zg2, SNodevalue):
        # print('element render ran')# Initial Each Element Length
        # Preallocationg
        # print('xg1 = ', xg1)
        # print('xg2 = ', xg2)
        # print('yg1 = ', yg1)
        # print('yg2 = ', yg2)
        # print('zg1 = ', zg1)
        # print('zg2 = ', zg2)

        xn = int(xn)
        dX0 = np.zeros((xn, 1))
        dY0 = np.zeros((xn, 1))
        dZ0 = np.zeros((xn, 1))
        L0 = np.zeros((xn, 1))

        try:
            xg1.shape[1] # test for the array size
        except IndexError:
            xg1_ = np.zeros((xn,1))
            xg2_ = np.zeros((xn,1))
            yg1_ = np.zeros((xn,1))
            yg2_ = np.zeros((xn,1))
            zg1_ = np.zeros((xn,1))
            zg2_ = np.zeros((xn,1))

            xg1_[:,0] = xg1
            xg2_[:,0] = xg2
            yg1_[:,0] = yg1
            yg2_[:,0] = yg2
            zg1_[:,0] = zg1
            zg2_[:,0] = zg2

            xg1 = xg1_
            xg2 = xg2_
            yg1 = yg1_
            yg2 = yg2_
            zg1 = zg1_
            zg2 = zg2_

        # print('dx0 = ', dX0)
        # print('dy0 = ', dY0)
        # print('dz0 = ', dZ0)
        # print('xn = ', xn)
        # print('L0 = ', L0)
        # print('xg1 = ', xg1)
        # print('xg2 = ', xg2)
        # print('yg1 = ', yg1)
        # print('yg2 = ', yg2)
        # print('zg1 = ', zg1)
        # print('zg2 = ', zg2)
        for i in range(int(xn)):
            dX0[i][0] = xg2[i][0] - xg1[i][0]
            dY0[i][0] = yg2[i][0] - yg1[i][0]
            dZ0[i][0] = zg2[i][0] - zg1[i][0]
            L0[i][0] = np.sqrt(np.square(dX0[i][0])) + np.sqrt(np.square(dY0[i][0])) + np.sqrt(np.square(dZ0[i][0]))

        # Initial Member x-dir Nodal Coordinates for Each Member
        # Preallocationg

        # print('L0 = ',  L0)

        MemLength = np.zeros((xn, 1))
        segnum = np.zeros((int(mem) + 1, 1))

        for i in range(int(mem)):
            for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                if np.isclose(k + segnum[i][0], segnum[i][0]):
                    # print('test1', int(k+segnum[i][0]))
                    MemLength[int(k + segnum[i][0])][0] = L0[int(k + segnum[i][0])][0]
                else:
                    # print('test2',int(k + segnum[i][0]))
                    MemLength[int(k + segnum[i][0])][0] = MemLength[int(k + segnum[i][0] - 1)][0] + \
                                                          L0[int(k + segnum[i][0])][0]

            segnum[i + 1][0] = int(segnum[i][0] + sum(SNodevalue[i, :, 2]))

        # print('segnum = ', segnum)
        # print('MemLength = ', MemLength)
        return MemLength

    def TapedEleLength(self, NTshex1, NTshey1, NTshez1, NTshex2, NTshey2, NTshez2, alpharef):
        tr1 = np.zeros((3, 1))
        tr2 = np.zeros((3, 1))
        Rz = np.zeros((3, 3))

        tr1[0][0] = NTshex1
        tr1[1][0] = NTshey1
        tr1[2][0] = NTshez1

        tr2[0][0] = NTshex2
        tr2[1][0] = NTshey2
        tr2[2][0] = NTshez2

        Rz[0][0] = np.cos(alpharef)
        Rz[0][1] = -np.sin(alpharef)
        Rz[1][0] = np.sin(alpharef)
        Rz[1][1] = np.cos(alpharef)
        Rz[2][2] = 1

        tap1 = Rz.dot(tr1)
        tap2 = Rz.dot(tr2)

        # print("taqps", tap1, tap2)

        return tap1, tap2

    def modelWithBC(self, flag):

        DUP1, DUP2, mem, xn, JNodeValues_i, JNodeValues_j, SNodevalue, Rval, NC, NCa = SABRE2LBCODE.LBCode(self)

        MI = np.zeros((DUP1[:, 0].shape[0], 3))
        MI[:, 0] = DUP1[:, 0]
        MI[:, 1] = DUP1[:, 1]
        MI[:, 2] = DUP2[:, 1]
        # print('MI = ', MI)

        xg1, xg2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros(
            (DUP1[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)
        yg1, yg2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros(
            (DUP1[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)
        zg1, zg2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros(
            (DUP1[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)

        xg1[:, 0] = DUP1[:, 2]
        yg1[:, 0] = DUP1[:, 3]
        zg1[:, 0] = DUP1[:, 4]

        xg2[:, 0] = DUP2[:, 2]
        yg2[:, 0] = DUP2[:, 3]
        zg2[:, 0] = DUP2[:, 4]

        # Section properties at each element under natural frame
        bfb1, bfb2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # Bottom flange width
        tfb1, tfb2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # Bottom flange thickness
        bft1, bft2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # Top flange width
        tft1, tft2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # Top flange thickness
        Dg1, Dg2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # dw:Web depth (y-dir)
        tw1, tw2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros((DUP1[:, 0].shape[0], 1))  # dw:Web depth (y-dir)
        hg1, hg2 = np.zeros((DUP1[:, 0].shape[0], 1)), np.zeros(
            (DUP1[:, 0].shape[0], 1))  # h : Distance between flange centroids

        bfb1[:, 0] = DUP1[:, 5]
        tfb1[:, 0] = DUP1[:, 6]
        bft1[:, 0] = DUP1[:, 7]
        tft1[:, 0] = DUP1[:, 8]
        Dg1[:, 0] = DUP1[:, 9]
        tw1[:, 0] = DUP1[:, 10]
        hg1[:, 0] = DUP1[:, 12]

        bfb2[:, 0] = DUP2[:, 5]
        tfb2[:, 0] = DUP2[:, 6]
        bft2[:, 0] = DUP2[:, 7]
        tft2[:, 0] = DUP2[:, 8]
        Dg2[:, 0] = DUP2[:, 9]
        tw2[:, 0] = DUP2[:, 10]
        hg2[:, 0] = DUP2[:, 12]

        #   Geometric dimension of Cross-section
        #   Mid-web depth

        Dt1 = Dg1 / 2  # top of Web depth to mid web depth
        Dt2 = Dg2 / 2  # top of Web depth to mid web depth
        Db1 = Dt1  # bottom of Web depth to mid web depth
        Db2 = Dt2  # bottom of Web depth to mid web depth
        ht1 = Dt1 + tft1 / 2  # top flange centroid to mid web depth
        ht2 = Dt2 + tft2 / 2  # top flange centroid to mid web depth
        hb1 = Db1 + tfb1 / 2  # bottom flange centroid to mid web depth
        hb2 = Db2 + tfb2 / 2  # bottom flange centroid to mid web depth

        # Shear center
        # Start node
        # bottom flange centroid to shear center

        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1, np.power(bft1, 3))))
        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
        hst1 = hg1 - hsb1  # top flange centroid to shear center
        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

        # End node
        # bottom flange centroid to shear center
        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2, np.power(bft2, 3))))
        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
        hst2 = hg2 - hsb2  # top flange centroid to shear center
        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center

        # Centroid Axis ; ytbar = top flange to centroid
        # Start Node
        Ag1 = np.multiply(tft1, bft1) + np.multiply(tw1, Dg1) + np.multiply(tfb1, bfb1)
        # print(np.divide(Dg1,2))
        # print(np.multiply(Dg1, tft1 + np.divide(Dg1,2)))
        # print(np.multiply(tw1, np.multiply((Dg1, tft1 + np.divide(Dg1,2)))))
        ytbar1 = (np.divide(np.multiply(bft1, np.multiply(tft1, tft1)), 2) + np.multiply(tw1, np.multiply(
            Dg1, tft1 + np.divide(Dg1, 2))) + np.divide(
            np.multiply(bfb1, np.multiply(tfb1, np.divide((tft1 + Dg1 + tfb1), 2))), Ag1))
        Dct1 = ytbar1 - tft1
        Dcb1 = Dg1 - Dct1
        hct1 = ytbar1 - tft1 / 2
        hcb1 = hg1 - hct1

        # End Node

        Ag2 = np.multiply(tft2, bft2) + np.multiply(tw2, Dg2) + np.multiply(tfb2, bfb2)
        ytbar2 = (np.divide(np.multiply(bft2, np.multiply(tft2, tft2)), 2) + np.multiply(tw2, np.multiply(
            Dg2, (tft2 + np.divide(Dg2, 2)))) + np.divide(
            np.multiply(bfb2, np.multiply(tfb2, np.divide((tft2 + Dg2 + tfb2), 2))), Ag2))
        Dct2 = ytbar2 - tft2
        Dcb2 = Dg2 - Dct2
        hct2 = ytbar2 - tft2 / 2
        hcb2 = hg2 - hct2

        CSD1 = hct1 - hst1
        CSD2 = hct2 - hst2

        # Geometric dimension of Cross-section : P299 E

        # Global frame angle for each element without considering shear center

        alpharef = np.zeros((int(xn), 2))
        q = 0

        # print('mem = ', mem)
        for i in range(int(mem)):
            # print('i = ', i)
            for j in range(int(np.sum(SNodevalue[i, :, 2]))):
                opp = JNodeValues_j[i, 3] - JNodeValues_i[i, 3]  # element depth in y-dir
                adj = JNodeValues_j[i, 2] - JNodeValues_i[i, 2]  # element length in x-dir
                alpharef[q + j][0] = MI[q + j][0]
                alpharef[q + j][1] = np.arctan2(opp, adj)  # Only global frame angle

            q += int(np.sum(SNodevalue[i, :, 2]))

        # print('alpharef = ', alpharef)

        MemLength = SABRE2LBCODE.InitialEleLengthRendering(self, xn, mem, xg1, yg1, zg1, xg2, yg2, zg2, SNodevalue)
        # print('MemLength = ', MemLength)
        q = 0
        xn = int(xn)
        val1 = np.zeros((xn, 1))
        for i in range(int(mem)):
            for j in range(int(np.sum(SNodevalue[i, :, 2]))):
                val1[q + j][0] = Rval[i][1]

            q += int(np.sum(SNodevalue[i, :, 2]))

        NTshe1, NTshe2 = np.zeros((xn, 4)), np.zeros((xn, 4))
        segnum = np.zeros((int(mem) + 1, 1))
        ys1 = np.zeros((xn, 1))
        ys2 = np.zeros((xn, 1))

        for i in range(mem):
            if Rval[i][1] == 1:
                for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                    ys1[int(k + segnum[i][0])][0] = (Dg1[int(k + segnum[i][0])][0]) / 2 - Dst1[int(k + segnum[i][0])][0]
                    ys2[int(k + segnum[i][0])][0] = (Dg2[int(k + segnum[i][0])][0]) / 2 - Dst2[int(k + segnum[i][0])][
                        0]  # Shear center
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[int(k + segnum[i][0])][0]][1] = 0
                        NTshe2[[int(k + segnum[i][0])][0]][1] = MemLength[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][2] = ys1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][2] = ys2[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][3] = zg1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][3] = zg2[int(k + segnum[i][0])][0]
                    else:
                        NTshe1[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[int(k + segnum[i][0])][0]][1] = MemLength[int(k + segnum[i][0] - 1)][0]
                        NTshe2[[int(k + segnum[i][0])][0]][1] = MemLength[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][2] = ys1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][2] = ys2[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][3] = zg1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][3] = zg2[int(k + segnum[i][0])][0]

            elif Rval[i][1] == 2:
                for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                    ys1[int(k + segnum[i][0])][0] = - Dst1[int(k + segnum[i][0])][0]
                    ys2[int(k + segnum[i][0])][0] = - Dst2[int(k + segnum[i][0])][0]  # Shear center
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[int(k + segnum[i][0])][0]][1] = 0
                        NTshe2[[int(k + segnum[i][0])][0]][1] = MemLength[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][2] = ys1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][2] = ys2[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][3] = zg1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][3] = zg2[int(k + segnum[i][0])][0]
                    else:
                        NTshe1[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[int(k + segnum[i][0])][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[int(k + segnum[i][0])][0]][1] = MemLength[(k + segnum[i][0] - 1)][0]
                        NTshe2[[int(k + segnum[i][0])][0]][1] = MemLength[(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][2] = ys1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][2] = ys2[int(k + segnum[i][0])][0]
                        NTshe1[[int(k + segnum[i][0])][0]][3] = zg1[int(k + segnum[i][0])][0]
                        NTshe2[[int(k + segnum[i][0])][0]][3] = zg2[int(k + segnum[i][0])][0]

            elif Rval[i][1] == 3:
                for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                    ys1[k + segnum[i][0]][0] = (Dsb1[k + segnum[i][0]][0])
                    ys2[k + segnum[i][0]][0] = (Dsb2[k + segnum[i][0]][0])
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = 0
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
                    else:
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0] - 1][0]
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
            segnum[i + 1][0] = int(segnum[i][0] + np.sum(SNodevalue[i, :, 2]))

        # print("NTshe1 = \n", NTshe1,"\nNTshe2 = \n", NTshe2)

        taper1 = np.zeros((xn, 3))
        taper2 = np.zeros((xn, 3))

        for n in range(xn):
            tap1, tap2 = SABRE2LBCODE.TapedEleLength(self, NTshe1[n][1], NTshe1[n][2], NTshe1[n][3], NTshe2[n][1],
                                                     NTshe2[n][2],
                                                     NTshe2[n][3], alpharef[n][1])
            # print("tap1 = ", tap1)
            # print("tap2 = ", tap2)

            taper1[n, :] = tap1[:, 0]  # Which is the same as xg.
            taper2[n, :] = tap2[:, 0]  # Which is the same as yg.

        # Starting Node for each member
        segnum[0, 0] = 0  # (Start node number - 1) for each member
        NG1 = np.zeros((xn, 3))
        NG2 = np.zeros((xn, 3))
        for i in range(mem):
            for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                NG1[int(k + segnum[i][0])][0] = DUP1[int(segnum[i][0])][2]
                NG2[int(k + segnum[i][0])][0] = DUP1[int(segnum[i][0])][2]
                NG1[int(k + segnum[i][0])][1] = DUP1[int(segnum[i][0])][3]
                NG2[int(k + segnum[i][0])][1] = DUP1[int(segnum[i][0])][3]
                NG1[int(k + segnum[i][0])][2] = DUP1[int(segnum[i][0])][4]
                NG2[int(k + segnum[i][0])][2] = DUP1[int(segnum[i][0])][4]

            segnum[i + 1][0] = segnum[i][0] + (int(np.sum(SNodevalue[i, :, 2])))

        # Global frame nodal coordinates w.r.t Shear center
        # Original Shear Center

        # print('\ntaper1 = ', taper1, '\nNG1 = ', NG1)
        # print('\ntaper2 = ', taper2, '\nNG2 = ', NG2)

        Nshe1 = np.zeros((taper1.shape[0], 3))
        Nshe2 = np.zeros((taper2.shape[0], 3))

        Nshe1[:, 0] = taper1[:, 0] + NG1[:, 0]
        Nshe2[:, 0] = taper2[:, 0] + NG2[:, 0]
        Nshe1[:, 1] = taper1[:, 1] + NG1[:, 1]
        Nshe2[:, 1] = taper2[:, 1] + NG2[:, 1]
        Nshe1[:, 2] = taper1[:, 2] + NG1[:, 2]
        Nshe2[:, 2] = taper2[:, 2] + NG2[:, 2]

        # print("Nshe1 = ", Nshe1, "Nshe2 = ", Nshe2)

        # Initial Global frame nodal coordinates w.r.t Shear center

        xg1 = Nshe1[:, 0]
        yg1 = Nshe1[:, 1]
        zg1 = Nshe1[:, 2]
        xg2 = Nshe2[:, 0]
        yg2 = Nshe2[:, 1]
        zg2 = Nshe2[:, 2]

        SNshe1 = Nshe1
        SNshe2 = Nshe2

        # ------------------------------------------------------------------------
        # -------     Update Intersection Nodes for shear cneter      ------------
        # ------------------------------------------------------------------------

        r = 0
        PP = np.zeros((mem, 7))
        # print('xg1 = ', xg1)
        # print('xg2 = ', xg2)
        # print('yg1 = ', yg1)
        # print('yg2 = ', yg2)

        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i, :, 2]))):
                PP[i][0] = i + 1
                if j == 0:
                    PP[i][1] = r + j + 1
                    PP[i][3] = MI[r + j][1]
                    PP[i][4] = MI[r + j][2]
                elif np.isclose((j + 1), np.sum(SNodevalue[i, :, 2])):
                    PP[i][2] = r + j + 1
                    PP[i][5] = MI[r + j][1]
                    PP[i][6] = MI[r + j][2]
            r += int(np.sum(SNodevalue[i, :, 2]))

        # print('PP = ' , PP)
        r = 0
        for i in range(mem):
            # print('for 1')
            q = 0
            if np.isclose(np.sum(SNodevalue[i, :, 2]), 1):
                print('if 1')
                for j in range(mem):
                    # print('for 2')
                    if np.isclose(np.sum(SNodevalue[j, :, 2]), 1):
                        print('if 2')
                        if i != j:
                            print('if 3')
                            if np.isclose(PP[i][3], PP[j][3]):
                                print('if 4')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 5')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 5')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    print('for 3')
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 6')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 6')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][4]):
                                print('elif 4')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 7')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 7')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    print('for 4')
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 8')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 8')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][4], PP[j][3]):
                                print('elif 4_2')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 9')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 9')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    # print('for 5')
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 10')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 10')
                                        xg2[k] = Px
                                        yg2[k] = Py
                            elif np.isclose(PP[i][4], PP[j][4]):
                                print('elif 4_3')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 11')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 11')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    # print('for 5')
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 12')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 12')
                                        xg2[k] = Px
                                        yg2[k] = Py
                    else:
                        print('else 2')
                        if i != j:
                            print('if 13')
                            if np.isclose(PP[i][3], PP[j][3]):
                                print('if 14')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 15')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 15')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 16')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 16')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][6]):
                                print('elif 14_1')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 17')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 17')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 18')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 18')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][4], PP[j][3]):
                                print('elif 14_2')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 19')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 19')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 20')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 20')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][4], PP[j][6]):
                                print('elif 14_3')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 21')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 21')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 22')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 22')
                                        xg2[k] = Px
                                        yg2[k] = Py
                    q += int(np.sum(SNodevalue[j, :, 2]))
            else:
                print('else 1')
                q = 0
                for j in range(mem):
                    if np.isclose(np.sum(SNodevalue[j, :, 2]), 1):
                        print('if 23')
                        if i != j:
                            print('if 24')
                            if np.isclose(PP[i][3], PP[j][3]):
                                print('if 25')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 26')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 26')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 27')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 27')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][4]):
                                print('elif 25_1')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 28')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 28')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 29')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 29')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][3]):
                                print('elif 25_2')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 30')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 30')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 31')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('elif 31')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][4]):
                                print('elif 25_3')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 32')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 32')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 33')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 33')
                                        xg2[k] = Px
                                        yg2[k] = Py

                    else:
                        print('else 23')
                        if i != j:
                            print('if 34')
                            if np.isclose(PP[i][3], PP[j][3]):
                                print('if 35')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 36')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 36')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 37')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k][0]) and np.isclose(y3, yg2[k]):
                                        print('else 37')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][6]):
                                print('elif 35_1')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 38')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 38')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 39')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 39')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][3]):
                                print('elif 35_2')
                                # print('index = ', r + np.sum(SNodevalue[i, :, 2]))
                                # print('xg1 = ', xg1)
                                # print('xg2 = ', xg2)
                                # print('yg1 = ', yg1)
                                # print('yg2 = ', yg2)
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]
                                # print('x1 = ', x1)
                                # print('y1 = ', y1)
                                # print('x1 = ', x2)
                                # print('y2 = ', y2)
                                # print('x3 = ', x3)
                                # print('y3 = ', y3)
                                # print('x4 = ', x4)
                                # print('y4 = ', y4)
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))
                                # print('Pxy1 = ' , Pxy1)
                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 40')
                                    Px = x3
                                    Py = y3
                                else:
                                    print('else 40')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 42')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3, xg2[k]) and np.isclose(y3, yg2[k]):
                                        print('else 42')
                                        xg2[k] = Px
                                        yg2[k] = Py


                            elif np.isclose(PP[i][6], PP[j][6]):
                                print('elif 35_2')
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2])) - 1]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2])) - 1]
                                # print('test=== ' , x1)
                                # print('test=== ' , y1)
                                # print('test=== ' , x2)
                                # print('test=== ' , y2)
                                # print('test=== ' , x3)
                                # print('test=== ' , y3)
                                # print('test=== ' , x4)
                                # print('test=== ' , y4)
                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    print('if 43')
                                    Px = x4
                                    Py = y4
                                else:
                                    print('else 43')
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 44')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4, xg2[k]) and np.isclose(y4, yg2[k]):
                                        print('else 44')
                                        xg2[k] = Px
                                        yg2[k] = Py

                    q += int(np.sum(SNodevalue[j, :, 2]))

            r += int(np.sum(SNodevalue[i, :, 2]))

        xg1 = np.vstack(xg1)
        xg2 = np.vstack(xg2)
        yg1 = np.vstack(yg1)
        yg2 = np.vstack(yg2)

        # print('xg1 = ', xg1)
        # print('xg2 = ', xg2)
        # print('yg1 = ', yg1)
        # print('yg2 = ', yg2)

        # Updated Shear center w.r.t intersections.
        Nshe1 = np.zeros((xn, 12))
        Nshe2 = np.zeros((xn, 12))

        Nshe1[:, 0] = xg1[:,0]
        Nshe2[:, 0] = xg2[:,0]
        Nshe1[:, 1] = yg1[:,0]
        Nshe2[:, 1] = yg2[:,0]
        Nshe1[:, 2] = zg1
        Nshe2[:, 2] = zg2

        # print('Nshe1 = ', Nshe1)
        # print('Nshe2 = ', Nshe2)
        # print('xn = ', xn)

        for i in range(xn):
            Nshe1[i][3] = DUP1[i][5]
            Nshe1[i][4] = DUP1[i][6]
            Nshe1[i][5] = DUP1[i][7]
            Nshe1[i][6] = DUP1[i][8]
            Nshe1[i][7] = DUP1[i][9]
            Nshe1[i][8] = DUP1[i][10]
            Nshe1[i][9] = DUP1[i][11]
            Nshe1[i][10] = DUP1[i][12]
            Nshe1[i][11] = DUP1[i][13]

            Nshe2[i][3] = DUP2[i][5]
            Nshe2[i][4] = DUP2[i][6]
            Nshe2[i][5] = DUP2[i][7]
            Nshe2[i][6] = DUP2[i][8]
            Nshe2[i][7] = DUP2[i][9]
            Nshe2[i][8] = DUP2[i][10]
            Nshe2[i][9] = DUP2[i][11]
            Nshe2[i][10] = DUP2[i][12]
            Nshe2[i][11] = DUP2[i][13]

        # print(SNshe1[:,0])
        SheMemLegth = SABRE2LBCODE.InitialEleLengthRendering(self, xn, mem, SNshe1[:, 0], SNshe1[:, 1], SNshe1[:, 2],
                                                             SNshe2[:, 0], SNshe2[:, 1], SNshe2[:, 2], SNodevalue)
        NsheMemLegth = SABRE2LBCODE.InitialEleLengthRendering(self, xn, mem, Nshe1[:, 0], Nshe1[:, 1], Nshe1[:, 2],
                                                              Nshe2[:, 0], Nshe2[:, 1], Nshe2[:, 2], SNodevalue)


        SheMemLegth = SheMemLegth[:,0]
        NsheMemLegth = NsheMemLegth[:,0]
        i_index = 0
        j_index = 0

        segLoc = np.zeros(2)
        segLocstep = np.zeros(3)

        for i in range(mem):
            j_index += int(np.sum(SNodevalue[i,:,2]))
            if SheMemLegth[i_index - 1]  >= NsheMemLegth[i_index - 1] :
                segLoc[1] = SheMemLegth[i_index - 1]
                segLocstep[1] = SheMemLegth[i_index - 1]  - NsheMemLegth[i_index - 1]
                segLocstep[2] = SheMemLegth[i_index - 1]

                bfbs = (DUP1[i_index - 1][5],  DUP2[i_index - 1][5])
                tfbs = (DUP1[i_index - 1][6],  DUP2[i_index - 1][6])
                bfts = (DUP1[i_index - 1][7],  DUP2[i_index - 1][7])
                tfts = (DUP1[i_index - 1][8],  DUP2[i_index - 1][8])
                Dgs  = (DUP1[i_index - 1][9],  DUP2[i_index - 1][9])
                tws  = (DUP1[i_index - 1][10], DUP2[i_index - 1][10])
                tdgs = (DUP1[i_index - 1][11], DUP2[i_index - 1][11])
                hgs  = (DUP1[i_index - 1][12], DUP2[i_index - 1][12])
                Afs  = (DUP1[i_index - 1][13], DUP2[i_index - 1][13])

                bfbsb = np.interp(segLocstep,segLoc,bfbs)
                tfbsb = np.interp(segLocstep,segLoc,tfbs)
                bftsb = np.interp(segLocstep,segLoc,bfts)
                tftsb = np.interp(segLocstep,segLoc,tfts)
                Dgsb = np.interp(segLocstep,segLoc,Dgs)
                twsb = np.interp(segLocstep,segLoc,tws)
                tdgsb = np.interp(segLocstep,segLoc,tdgs)
                hgsb = np.interp(segLocstep,segLoc,hgs)
                Afsb = np.interp(segLocstep,segLoc,Afs)

                Nshe1[i_index - 1][3]  =bfbsb[1]
                Nshe1[i_index - 1][4]  =tfbsb[1]
                Nshe1[i_index - 1][5]  =bftsb[1]
                Nshe1[i_index - 1][6]  =tftsb[1]
                Nshe1[i_index - 1][7]  =Dgsb[1]
                Nshe1[i_index - 1][8]  =twsb [1]
                Nshe1[i_index - 1][9]  =tdgsb[1]
                Nshe1[i_index - 1][10] =hgsb[1]
                Nshe1[i_index - 1][11] =Afsb[1]


            elif SheMemLegth[i_index - 1]  < NsheMemLegth[i_index - 1] :
                segLoc[1] = SheMemLegth[i_index - 1]
                segLocstep[0] = SheMemLegth[i_index - 1]  - NsheMemLegth[i_index - 1]
                segLocstep[2] = SheMemLegth[i_index - 1]

                bfbs = (DUP1[i_index - 1][5], DUP2[i_index - 1][5])
                tfbs = (DUP1[i_index - 1][6], DUP2[i_index - 1][6])
                bfts = (DUP1[i_index - 1][7], DUP2[i_index - 1][7])
                tfts = (DUP1[i_index - 1][8], DUP2[i_index - 1][8])
                Dgs = (DUP1[i_index - 1][9], DUP2[i_index - 1][9])
                tws = (DUP1[i_index - 1][10], DUP2[i_index - 1][10])
                tdgs = (DUP1[i_index - 1][11], DUP2[i_index - 1][11])
                hgs = (DUP1[i_index - 1][12], DUP2[i_index - 1][12])
                Afs = (DUP1[i_index - 1][13], DUP2[i_index - 1][13])

                f = interp1d(segLocstep, segLoc, fill_value='extrapolate')

                bfbsb = f(bfbs)
                tfbsb = f(tfbs)
                bftsb = f(bfts)
                tftsb = f(tfts)
                Dgsb = f(Dgs)
                twsb = f(tws)
                tdgsb = f(tdgs)
                hgsb = f(hgs)
                Afsb = f(Afs)

                Nshe1[i_index - 1][3] = bfbsb[0]
                Nshe1[i_index - 1][4] = tfbsb[0]
                Nshe1[i_index - 1][5] = bftsb[0]
                Nshe1[i_index - 1][6] = tftsb[0]
                Nshe1[i_index - 1][7] = Dgsb[0]
                Nshe1[i_index - 1][8] = twsb[0]
                Nshe1[i_index - 1][9] = tdgsb[0]
                Nshe1[i_index - 1][10] = hgsb[0]
                Nshe1[i_index - 1][11] = Afsb[0]

            if np.isclose(i_index - 1, j_index - 1):
                if SheMemLegth[i_index - 1]  >= NsheMemLegth[i_index - 1] :
                    segLoc[1] = SheMemLegth[i_index - 1]
                    segLocstep[1] = SheMemLegth[i_index - 1]  - NsheMemLegth[i_index - 1]
                    segLocstep[2] = SheMemLegth[i_index - 1]

                    bfbs = (DUP1[i_index - 1][5], DUP2[i_index - 1][5])
                    tfbs = (DUP1[i_index - 1][6], DUP2[i_index - 1][6])
                    bfts = (DUP1[i_index - 1][7], DUP2[i_index - 1][7])
                    tfts = (DUP1[i_index - 1][8], DUP2[i_index - 1][8])
                    Dgs = (DUP1[i_index - 1][9], DUP2[i_index - 1][9])
                    tws = (DUP1[i_index - 1][10], DUP2[i_index - 1][10])
                    tdgs = (DUP1[i_index - 1][11], DUP2[i_index - 1][11])
                    hgs = (DUP1[i_index - 1][12], DUP2[i_index - 1][12])
                    Afs = (DUP1[i_index - 1][13], DUP2[i_index - 1][13])

                    bfbsb = np.interp(segLocstep, segLoc, bfbs)
                    tfbsb = np.interp(segLocstep, segLoc, tfbs)
                    bftsb = np.interp(segLocstep, segLoc, bfts)
                    tftsb = np.interp(segLocstep, segLoc, tfts)
                    Dgsb = np.interp(segLocstep, segLoc, Dgs)
                    twsb = np.interp(segLocstep, segLoc, tws)
                    tdgsb = np.interp(segLocstep, segLoc, tdgs)
                    hgsb = np.interp(segLocstep, segLoc, hgs)
                    Afsb = np.interp(segLocstep, segLoc, Afs)

                    Nshe2[j_index - 1][3] = bfbsb[2]
                    Nshe2[j_index - 1][4] = tfbsb[2]
                    Nshe2[j_index - 1][5] = bftsb[2]
                    Nshe2[j_index - 1][6] = tftsb[2]
                    Nshe2[j_index - 1][7] = Dgsb[2]
                    Nshe2[j_index - 1][8] = twsb[2]
                    Nshe2[j_index - 1][9] = tdgsb[2]
                    Nshe2[j_index - 1][10] = hgsb[2]
                    Nshe2[j_index - 1][11] = Afsb[2]

                elif SheMemLegth[i_index - 1]  < NsheMemLegth[i_index - 1] :
                    segLoc[1] = SheMemLegth[i_index - 1]
                    segLocstep[0] = SheMemLegth[i_index - 1]  - NsheMemLegth[i_index - 1]
                    segLocstep[2] = SheMemLegth[i_index - 1]

                    bfbs = (DUP1[i_index - 1][5], DUP2[i_index - 1][5])
                    tfbs = (DUP1[i_index - 1][6], DUP2[i_index - 1][6])
                    bfts = (DUP1[i_index - 1][7], DUP2[i_index - 1][7])
                    tfts = (DUP1[i_index - 1][8], DUP2[i_index - 1][8])
                    Dgs = (DUP1[i_index - 1][9], DUP2[i_index - 1][9])
                    tws = (DUP1[i_index - 1][10], DUP2[i_index - 1][10])
                    tdgs = (DUP1[i_index - 1][11], DUP2[i_index - 1][11])
                    hgs = (DUP1[i_index - 1][12], DUP2[i_index - 1][12])
                    Afs = (DUP1[i_index - 1][13], DUP2[i_index - 1][13])

                    f = interp1d(segLocstep, segLoc, fill_value='extrapolate')

                    bfbsb = f(bfbs)
                    tfbsb = f(tfbs)
                    bftsb = f(bfts)
                    tftsb = f(tfts)
                    Dgsb = f(Dgs)
                    twsb = f(tws)
                    tdgsb = f(tdgs)
                    hgsb = f(hgs)
                    Afsb = f(Afs)

                    Nshe2[j_index - 1][3] = bfbsb[2]
                    Nshe2[j_index - 1][4] = tfbsb[2]
                    Nshe2[j_index - 1][5] = bftsb[2]
                    Nshe2[j_index - 1][6] = tftsb[2]
                    Nshe2[j_index - 1][7] = Dgsb[2]
                    Nshe2[j_index - 1][8] = twsb[2]
                    Nshe2[j_index - 1][9] = tdgsb[2]
                    Nshe2[j_index - 1][10] = hgsb[2]
                    Nshe2[j_index - 1][11] = Afsb[2]
            else:
                if (SheMemLegth[j_index - 1]  - SheMemLegth[j_index - 1-1] ) >= (SheMemLegth[j_index - 1]  - SheMemLegth[j_index - 1-1] ):
                    segLoc[1] = SheMemLegth[j_index - 1]  - SheMemLegth[j_index - 1 - 1]
                    segLocstep[1] = NsheMemLegth[j_index - 1]  - NsheMemLegth[j_index - 1 -1]
                    segLocstep[2] = SheMemLegth[j_index - 1]  - SheMemLegth[j_index - 1 - 1]

                    bfbs = (DUP1[j_index - 1][5], DUP2[j_index - 1][5])
                    tfbs = (DUP1[j_index - 1][6], DUP2[j_index - 1][6])
                    bfts = (DUP1[j_index - 1][7], DUP2[j_index - 1][7])
                    tfts = (DUP1[j_index - 1][8], DUP2[j_index - 1][8])
                    Dgs = (DUP1[j_index - 1][9], DUP2[j_index - 1][9])
                    tws = (DUP1[j_index - 1][10], DUP2[j_index - 1][10])
                    tdgs = (DUP1[j_index - 1][11], DUP2[j_index - 1][11])
                    hgs = (DUP1[j_index - 1][12], DUP2[j_index - 1][12])
                    Afs = (DUP1[j_index - 1][13], DUP2[j_index - 1][13])

                    bfbsb = np.interp(segLocstep, segLoc, bfbs)
                    tfbsb = np.interp(segLocstep, segLoc, tfbs)
                    bftsb = np.interp(segLocstep, segLoc, bfts)
                    tftsb = np.interp(segLocstep, segLoc, tfts)
                    Dgsb = np.interp(segLocstep, segLoc, Dgs)
                    twsb = np.interp(segLocstep, segLoc, tws)
                    tdgsb = np.interp(segLocstep, segLoc, tdgs)
                    hgsb = np.interp(segLocstep, segLoc, hgs)
                    Afsb = np.interp(segLocstep, segLoc, Afs)

                    Nshe2[j_index - 1][3] = bfbsb[1]
                    Nshe2[j_index - 1][4] = tfbsb[1]
                    Nshe2[j_index - 1][5] = bftsb[1]
                    Nshe2[j_index - 1][6] = tftsb[1]
                    Nshe2[j_index - 1][7] = Dgsb[1]
                    Nshe2[j_index - 1][8] = twsb[1]
                    Nshe2[j_index - 1][9] = tdgsb[1]
                    Nshe2[j_index - 1][10] = hgsb[1]
                    Nshe2[j_index - 1][11] = Afsb[1]

                elif SheMemLegth[j_index - 1]  < NsheMemLegth[j_index - 1] :
                    segLoc[0] = SheMemLegth[j_index - 1 - 1]
                    segLoc[1] = SheMemLegth[j_index - 1]

                    segLocstep[0] = SheMemLegth[j_index - 1 - 1]
                    segLocstep[1] = SheMemLegth[j_index - 1]
                    segLocstep[2] = NsheMemLegth[j_index - 1]
                    bfbs = (DUP1[j_index - 1 - 1][5], DUP2[j_index - 1][5])
                    tfbs = (DUP1[j_index - 1 - 1][6], DUP2[j_index - 1][6])
                    bfts = (DUP1[j_index - 1 - 1][7], DUP2[j_index - 1][7])
                    tfts = (DUP1[j_index - 1 - 1][8], DUP2[j_index - 1][8])
                    Dgs =  (DUP1[j_index - 1 - 1][9], DUP2[j_index - 1][9])
                    tws =  (DUP1[j_index - 1 - 1][10], DUP2[j_index - 1][10])
                    tdgs = (DUP1[j_index - 1 - 1][11], DUP2[j_index - 1][11])
                    hgs =  (DUP1[j_index - 1 - 1][12], DUP2[j_index - 1][12])
                    Afs =  (DUP1[j_index - 1 - 1][13], DUP2[j_index - 1][13])

                    f = interp1d(segLocstep, segLoc, fill_value='extrapolate')

                    bfbsb = f(bfbs)
                    tfbsb = f(tfbs)
                    bftsb = f(bfts)
                    tftsb = f(tfts)
                    Dgsb = f(Dgs)
                    twsb = f(tws)
                    tdgsb = f(tdgs)
                    hgsb = f(hgs)
                    Afsb = f(Afs)

                    Nshe2[j_index - 1][3] = bfbsb[2]
                    Nshe2[j_index - 1][4] = tfbsb[2]
                    Nshe2[j_index - 1][5] = bftsb[2]
                    Nshe2[j_index - 1][6] = tftsb[2]
                    Nshe2[j_index - 1][7] = Dgsb[2]
                    Nshe2[j_index - 1][8] = twsb[2]
                    Nshe2[j_index - 1][9] = tdgsb[2]
                    Nshe2[j_index - 1][10] = hgsb[2]
                    Nshe2[j_index - 1][11] = Afsb[2]
            i_index += int(np.sum(SNodevalue[i,:,2]))


        # print('Nshe1 = ', Nshe1)
        # print('Nshe2 = ', Nshe2)

        # ------------------------------------------------------------------------
        # ----------------      Updated Tapered Angle       ----------------------
        # ------------------------------------------------------------------------
        # Global frame angle for each element considering shear center

        alphatap = np.zeros((xn, 2))

        for i in range(xn):
            opp = yg2[i][0] - yg1[i][0]
            adj = xg2[i][0] - xg1[i][0]

            alphatap[i][0] = MI[i][0]
            alphatap[i][1] = np.arctan2(opp, adj)

        # ------------------------------------------------------------------------
        # ---------      Updated NCc w.r.t. shear center      --------------------
        # ------------------------------------------------------------------------
        #  RNC (Updated NC)
        q=0
        a=0
        b=0
        for i in range(mem - 1):
            q += np.sum(SNodevalue[i, :, 2]) + 1

        for i in range(mem):
            a = (int(np.sum(SNodevalue[i, :, 2])))
            if b > a:
                b = a

        size_rnc = int(q + a)

        RNC = np.zeros((NC.shape[0], 4))
        q = 0
        r = 0
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i,:,2]))):
                if np.isclose(j+1, int(np.sum(SNodevalue[i,:,2]))):
                    RNC[q + j][0] = r + j + 1
                    RNC[q + j][1] = Nshe1[r + j][0]
                    RNC[q + j][2] = Nshe1[r + j][1]
                    RNC[q + j][3] = Nshe1[r + j][2]
                    # print('q = ', q, 'j = ', j)

                    RNC[q + j + 1][0] = r + j + 2
                    RNC[q + j + 1][1] = Nshe2[r + j][0]
                    RNC[q + j + 1][2] = Nshe2[r + j][1]
                    RNC[q + j + 1][3] = Nshe2[r + j][2]
                else:
                    RNC[q + j][0] = r + j + 1
                    RNC[q + j][1] = Nshe1[r + j][0]
                    RNC[q + j][2] = Nshe1[r + j][1]
                    RNC[q + j][3] = Nshe1[r + j][2]

            q += int(np.sum(SNodevalue[i, :, 2]))+1
            r += int(np.sum(SNodevalue[i, :, 2]))


        # print('NC = ', NC)

        RNC_ = np.zeros((NC.shape[0],13))
        RNC_[:,0:4] = RNC
        RNC = RNC_

        for i in range(size_rnc):
            for j in range(4,NC[0,:].shape[0]):

                RNC[i][j] = NC[i][j]

        # print('RNC = ', RNC)

        # RNCa (Updated NCa)
        RNCa = np.zeros((NCa[:,0].shape[0], 16))

        for i in range(NCa[:,0].shape[0]):

            if np.isclose(NCa[i][0], 0):

                for k in range(16):
                    RNCa[i][k] = NCa[i][k]

            else:

                for k in range(13):
                    RNCa[i][k] = NCa[i][k]

        r = 0
        shape_RNCb = np.count_nonzero(RNCa[:,0])
        RNCb = np.zeros((shape_RNCb, 13))
        for i in range(RNCa[:,0].shape[0]):
            if not np.isclose(RNCa[i][0], 0):
                RNCb[r][0] = r + 1
                for k in range(1, 13):
                    RNCb[r][k] = NCa[i][k]
                r += 1

        # ------------------------------------------------------------------------
        # ------     Updated NCc w.r.t. intersection of shear center      --------
        # ------------------------------------------------------------------------
        #  RNCc (Updated NCc)

        RNCc = RNCb
        # print('RNCc = ', RNCc)
        h5_file.h5_Class.update_array(self, RNCc, 'RNCc')

        number_of_nodes = int(RNCc[:, 0].shape[0])
        # SPn = np.zeros((int(np.amax(SNodevalue[:,:,2] +1)), int(SNodevalue.shape[0])))
        # print('1 =\n', DUP1[:,1])
        # print('1 =\n', DUP2[:,1])


        # element_member = np.zeros((1, 1))
        print('shape = ', SNodevalue.shape[0])
        # print('0 = ', SNodevalue[0][0][0])

        p = 0
        for i in range(SNodevalue.shape[0]):
            q = 0
            SPn1 = np.zeros((int(np.sum(SNodevalue[i, :, 2])), 2))
            for k in range(int(np.sum(SNodevalue[i, :, 2]))):
                # print('k =' ,k)
                # print('q =', q)
                # print('p =', p)
                SPn1[k][0] = DUP1[k + p + q][1]
                SPn1[k][1] = DUP2[k + p + q][1]
            p += int(np.sum(SNodevalue[i, :, 2]))
            q += p
            SPn = np.unique(SPn1)
            print('SPn = ', SPn)
            if i == 0:
                element_member = np.vstack(SPn)
                # print('element member 0 = ', element_member)
            else:
                if element_member.shape[0] < SPn.shape[0]:
                    temp_array = np.zeros((SPn.shape[0], element_member.shape[1] + 1))
                else:
                    temp_array = np.zeros((element_member.shape[0],element_member.shape[1] + 1))

                for i in range(element_member.shape[1]):
                    temp_array[:element_member.shape[0], i] = element_member[:,i]
                temp_array[:SPn.shape[0],temp_array.shape[1] - 1] = SPn

                element_member = temp_array
                # print('element member after = ' , element_member)
            # if element_member.shape[1] < SNodevalue.shape[0]:
            #     # print('test')
            #     element_member.resize(int(SPn.shape[0]), int(element_member.shape[1])+1)
            # elif SPn.shape[0] > element_member.shape[0]:
            #     # print('test 1')
            #     element_member.resize((SPn.shape[0], element_member.shape[1]))
            #
            # if SPn.shape[0] < element_member.shape[0]:
            #     # print('test extra')
            #     SPn.resize((1,element_member.shape[0]))
            #
            #
            # # print('SPn 2 = ', (SPn.shape[0]), i)
            # element_member[:,i] = SPn
        print('element_member = ', element_member)
        h5_file.h5_Class.update_array(self, element_member, 'element_member')

        from SABRE2_main_subclass import Boundary_Conditions

        Boundary_Conditions.set_number_of_rows_fixities_table(self, number_of_nodes, RNCc)
        Boundary_Conditions.Assign_comboBox_fixities_table(self, number_of_nodes)
        Boundary_Conditions.add_shear_panel(self, element_member, 0, flag)
        Boundary_Conditions.set_number_of_rows_springs_table(self, number_of_nodes)
        Boundary_Conditions.Assign_comboBox_springs_table(self, number_of_nodes)




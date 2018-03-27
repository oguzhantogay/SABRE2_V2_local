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
        print('size =', size)
        NCa = np.zeros((int(size)+mem, 16))

        mn = NCa[:, 0].shape[0]
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i, :, 2])) + 1):
                if np.isclose(i, 0):
                    print('\n## if 1\n')
                    for k in range(13):
                        NCa[j + q][k] = NC[j + q][k]

                else:
                    print('\n## else 1\n')
                    if np.isclose(j, 0):
                        print('\n## if 2\n')
                        for n in range(mn):
                            if np.isclose(NCa[n][1], NC[j + q][1]) and np.isclose(NCa[n][2],
                                                                                  NC[j + q][2]) and np.isclose(
                                NCa[n][3], NC[j + q][3]) and np.isclose(NCa[n][13], 0):
                                print('\n## if 3\n')
                                print('j = ', j, 'q = ', q)
                                for k in range(13):
                                    NCa[j + q][k] = 0
                                NCa[j+q][13] = n+1
                                NCa[j+q][14] = i+1
                                NCa[j+q][15] = j+1
                                break
                            else:
                                print('\n## else 3\n')
                                for k in range(13):
                                    NCa[j + q][k] = NC[j + q][k]
                    elif np.isclose(j, np.sum(SNodevalue[i,:,2])):
                        print('\n## elif 2\n')
                        # print('mn in elif 2 = ', mn)
                        for n in range(mn):
                            if np.isclose(NCa[n][1], NC[j + q][1]) and np.isclose(NCa[n][2],
                                                                                  NC[j + q][2]) and np.isclose(
                                NCa[n][3], NC[j + q][3]) and np.isclose(NCa[n][13], 0):
                                print('\n## if 4\n')
                                NCa[j + q][13] = n + 1
                                NCa[j + q][14] = i+1
                                NCa[j + q][15] = j+1
                                break
                            else:
                                print('\n## else 4\n')
                                for k in range(13):
                                    NCa[j + q][k] = NC[j + q][k]
                    else:
                        print('\n## else 2\n')
                        for k in range(13):
                            NCa[j + q][k] = NC[j + q][k]

            mn = int(np.sum(SNodevalue[i, :, 2])) + 1
            q += int(np.sum(SNodevalue[i,:,2])) + 1

        # print('NCa at the end of the loop = ', NCa)

        # NCb & NCc
        # Node data without duplication
        r = 1
        for i in range(size):
            if not np.isclose(NCa[i][0], 0):
                r +=1
        r = 0
        NCb = np.zeros((r,13))
        for i in range(size):
            if not np.isclose(NCa[i][0], 0):
                NCb[r][0] = r+1
                for k in range(1,13):
                    NCb[r][k] = NCa[i][k]
                r = r + 1

        NCc = NCb

        # DUP with Duplication
        DUP = np.zeros((nodenum.shape[0], 14))
        for i in range(nodenum.shape[0]):
            for j in range(NCc.shape[0]):
                if np.isclose(NC[i][1],NCc[j][1]) and np.isclose(NC[i][2], NCc[j][2]) and np.isclose(NC[i][3], NCc[j][3]):
                    DUP[i][0] = i + 1
                    for k in range(13):
                        DUP[i][k+1] = NCc[j][k]

        # DUP1 & DUP2
        q = 0
        r = 0
        DUP1 =
        DUP2 =
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i,:,2]))):


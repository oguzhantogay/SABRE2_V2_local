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
        print('size =', size)
        NCa = np.zeros((int(size) + mem, 16))

        mn = NCa[:, 0].shape[0]
        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i, :, 2])) + 1):
                if np.isclose(i, 0):
                    print('\n## if 1\n')
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
        return DUP1, DUP2, mem, xn, JNodeValues_i, JNodeValues_j, SNodevalue, Rval

    def InitialEleLengthRendering(self,xn,mem,xg1,yg1,zg1,xg2,yg2,zg2,SNodevalue):
        #Initial Each Element Length
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
        L0 =  np.zeros((xn, 1))
        for i in range(int(xn)):
            dX0[i][0] = xg2[i][0] - xg1[i][0]
            dY0[i][0] = yg2[i][0] - yg1[i][0]
            dZ0[i][0] = zg2[i][0] - zg1[i][0]

            L0[i][0] = np.sqrt(np.square(dX0[i][0])) + np.sqrt(np.square(dY0[i][0])) + np.sqrt(np.square(dZ0[i][0]))

        # Initial Member x-dir Nodal Coordinates for Each Member
        # Preallocationg

        # print('L0 = ',  L0)

        MemLength = np.zeros((xn, 1))
        segnum = np.zeros((int(mem) + 1 , 1))

        for i in range(int(mem)):
            for k in range(int(np.sum(SNodevalue[i,:,2]))):
                if np.isclose(k+segnum[i][0], segnum[i][0]):
                    # print('test1', int(k+segnum[i][0]))
                    MemLength[int(k+segnum[i][0])][0] = L0[int(k+segnum[i][0])][0]
                else:
                    # print('test2',int(k + segnum[i][0]))
                    MemLength[int(k + segnum[i][0])][0] = MemLength[int(k + segnum[i][0] -1)][0] + L0[int(k+segnum[i][0])][0]

            segnum[i+1][0] = int(segnum[i][0] + sum(SNodevalue[i,:,2]))

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


    def modelWithBC(self):
        DUP1, DUP2, mem, xn, JNodeValues_i, JNodeValues_j, SNodevalue, Rval= SABRE2LBCODE.LBCode(self)

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
            Dg1, tft1 + np.divide(Dg1,2))) + np.divide(np.multiply(bfb1, np.multiply(tfb1, np.divide((tft1 + Dg1 + tfb1), 2))), Ag1))
        Dct1 = ytbar1 - tft1
        Dcb1 = Dg1 - Dct1
        hct1 = ytbar1 - tft1/2
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

        #Global frame angle for each element without considering shear center

        alpharef = np.zeros((int(xn), 2))
        q = 0

        # print('mem = ', mem)
        for i in range(int(mem)):
            # print('i = ', i)
            for j in range(int(np.sum(SNodevalue[i,:,2]))):
                opp = JNodeValues_j[i, 3] - JNodeValues_i[i, 3]  # element depth in y-dir
                adj = JNodeValues_j[i, 2] - JNodeValues_i[i, 2]  # element length in x-dir
                alpharef[q+j][0] = MI[q+j][0]
                alpharef[q+j][1] = np.arctan2(opp, adj)  # Only global frame angle

            q += int(np.sum(SNodevalue[i,:,2]))

        # print('alpharef = ', alpharef)

        MemLength = SABRE2LBCODE.InitialEleLengthRendering(self, xn, mem, xg1, yg1, zg1, xg2, yg2, zg2, SNodevalue)
        q = 0
        xn = int(xn)
        val1 = np.zeros((xn,1))
        for i in range(int(mem)):
            for j in range(int(np.sum(SNodevalue[i,:,2]))):
                val1[q+j][0] = Rval[i][1]

            q += int(np.sum(SNodevalue[i,:,2]))

        NTshe1 , NTshe2 = np.zeros((xn, 4)), np.zeros((xn, 4))
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

        Nshe1 = np.zeros((taper1.shape[0], 3))
        Nshe2 = np.zeros((taper2.shape[0], 3))

        Nshe1[:, 0] = taper1[:, 0] + NG1[:, 0]
        Nshe2[:, 0] = taper2[:, 0] + NG2[:, 0]
        Nshe1[:, 1] = taper1[:, 1] + NG1[:, 0]
        Nshe2[:, 1] = taper2[:, 1] + NG2[:, 0]
        Nshe1[:, 2] = taper1[:, 2] + NG1[:, 0]
        Nshe2[:, 2] = taper2[:, 2] + NG2[:, 0]

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

        for i in range(mem):
            for j in range(int(np.sum(SNodevalue[i,:,2]))):
                PP[i][0] = i + 1
                if j == 0:
                    PP[i][1] = r + j + 1
                    PP[i][3] = MI[r+j][1]
                    PP[i][4] = MI[r+j][2]
                elif np.isclose((j+1), np.sum(SNodevalue[i,:,2])):
                    PP[i][2] = r + j + 1
                    PP[i][3] = MI[r + j][1]
                    PP[i][4] = MI[r + j][2]
            r += int(np.sum(SNodevalue[i,:,2]))

        r = 0
        for i in range(mem):
            print('for 1')
            q = 0
            if np.isclose(np.sum(SNodevalue[i,:,2]),1):
                print('if 1')
                for j in range(mem):
                    print('for 2')
                    if np.isclose(np.sum(SNodevalue[i, :, 2]), 1):
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
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        print('else 6')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][4]):
                                print('elif 4')
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j,:, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j,:, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j,:, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j,:, 2]))]

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
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        print('else 8')
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][4], PP[j][3]):
                                print('elif 4_2')
                                x1 = xg1[int(r + np.sum(SNodevalue[i,:, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i,:, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i,:, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i,:, 2]))]
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
                                    print('for 5')
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        print('if 10')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        print('else 10')
                                        xg2[k] = Px
                                        yg2[k] = Py
                            elif np.isclose(PP[i][4], PP[j][4]):
                                print('if 4_3')
                                x1 = xg1[int(r + np.sum(SNodevalue[i,:, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i,:, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i,:, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i,:, 2]))]
                                x3 = xg1[int(q + np.sum(SNodevalue[j,:, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j,:, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j,:, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j,:, 2]))]

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
                                    print('for 5')
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        print('if 12')
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        print('else 12')
                                        xg2[k]= Px
                                        yg2[k]= Py
                    else:
                        if i != j:
                            if np.isclose(PP[i][3], PP[j][3]):
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
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][6]):
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k]= Px
                                        yg2[k]= Py

                            elif np.isclose(PP[i][4], PP[j][3]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][4], PP[j][6]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py
                    q += int(np.sum(SNodevalue[j, :, 2])) - 1
            else:
                q = 0
                for j in range(mem):
                    if np.isclose(np.sum(SNodevalue[j, :, 2]), 1):
                        if i != j:
                            if np.isclose(PP[i][3], PP[j][3]):
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
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][4]):
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][3]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][4]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                    else:
                        if i != j:
                            if np.isclose(PP[i][3], PP[j][3]):
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
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k][0]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][3], PP[j][6]):
                                x1 = xg1[r]
                                y1 = yg1[r]
                                x2 = xg2[r]
                                y2 = yg2[r]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                            elif np.isclose(PP[i][6], PP[j][3]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[q]
                                y3 = yg1[q]
                                x4 = xg2[q]
                                y4 = yg2[q]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x3
                                    Py = y3
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x3, xg1[k]) and np.isclose(y3, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x3,xg2[k]) and np.isclose(y3,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py


                            elif np.isclose(PP[i][6], PP[j][6]):
                                x1 = xg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y1 = yg1[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x2 = xg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                y2 = yg2[int(r + np.sum(SNodevalue[i, :, 2]))]
                                x3 = xg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y3 = yg1[int(q + np.sum(SNodevalue[j, :, 2]))]
                                x4 = xg2[int(q + np.sum(SNodevalue[j, :, 2]))]
                                y4 = yg2[int(q + np.sum(SNodevalue[j, :, 2]))]

                                Px1 = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
                                Py1 = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
                                Pxy1 = ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))

                                if np.isclose(round(abs((Pxy1))), 0):
                                    Px = x4
                                    Py = y4
                                else:
                                    Px = Px1 / Pxy1
                                    Py = Py1 / Pxy1

                                for k in range(xn):
                                    if np.isclose(x4, xg1[k]) and np.isclose(y4, yg1[k]):
                                        xg1[k] = Px
                                        yg1[k] = Py
                                    elif np.isclose(x4,xg2[k]) and np.isclose(y4,yg2[k]):
                                        xg2[k] = Px
                                        yg2[k] = Py

                    q += int(np.sum(SNodevalue[j, :, 2])) - 1

            r += int(np.sum(SNodevalue[i, :, 2])) - 1

        print('xg1 = ', xg1)
        print('xg2 = ', xg2)






















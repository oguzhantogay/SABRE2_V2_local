import numpy as np
from PyQt4.QtGui import *


class ClassA(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(ClassA, self).__init__(parent)
        self.ui = ui_layout

    def BNodevalueUpdater(self, BNodevalue, JNodevalue_i, JNodevalue_j, Massemble):
        is_step_checked  = self.ui.StepRB1.isChecked()
        # print('is_checked = ', is_step_checked)
        # print("Massemble in BNodevalueUpdater= ", Massemble)
        # print('updater beginning BNode = ', BNodevalue)
        if BNodevalue.shape[2] == 2:
            pass
        else:
            mem = Massemble.shape[0]
            L0 = BNodevalue
            for i in range(mem):
                if np.amax(BNodevalue[i, :, 1]) != 0:  # No Bracing
                    dX0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))
                    dY0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))
                    dZ0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))

                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        dX0[j][0] = JNodevalue_i[i][2] - BNodevalue[i][j][2]
                        dY0[j][0] = JNodevalue_i[i][3] - BNodevalue[i][j][3]
                        dZ0[j][0] = JNodevalue_i[i][4] - BNodevalue[i][j][4]
                        L0[i][j][15] = np.sqrt((dX0[j][0]) ** 2 + (dY0[j][0]) ** 2 + (dZ0[j][0]) ** 2)

            BNodevalueOrder = BNodevalue
            for i in range(mem):
                L1 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 16))
                if np.amax(BNodevalue[i, :, 1]) == 0:
                    # print("if # a ")
                    BNodevalueOrder[i][0][1] = L0[i][0][1]
                    BNodevalueOrder[i][0][1] = L0[i][0][1]
                else:
                    # print("if # b ")
                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        L1[j][:] = L0[i][j][:]

                    L1 = L1[L1[:, 0].argsort(),]
                    # print("L1 = ", L1)
                    # print("BNodevalueorder = ", BNodevalueOrder)

                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        for k in range(16):
                            # print('j = ', j, 'k = ', k)
                            BNodevalueOrder[i][j][k] = L1[j][k]

                    L1[:][:] = None
            BNodeval = BNodevalueOrder

            ##########################
            #### Stepped Members #####
            ##########################

            size1 = int(Massemble.shape[0])
            alpharef = np.zeros((size1, 2))

            coord_x = float(self.ui.AddNodeX.text())
            coord_y = float(self.ui.AddNodeY.text())
            coord_z = float(self.ui.AddNodeZ.text())

            for i in range(Massemble.shape[0]):
                opp = JNodevalue_j[i][3] - JNodevalue_i[i][3]  # element depth in y-dir
                adj = JNodevalue_j[i][2] - JNodevalue_i[i][2]  # element depth in x-dir
                # print("opp = ", opp, "\n", "adj = ", adj)
                alpharef[i][0] = i
                alpharef[i][1] = np.arctan2(opp, adj)  # only global frame angle

            ###############################
            #### Add Stepped Elements #####
            ###############################
            # print('bnode val before for 1 = ', BNodevalue)
            for i in range(mem):
                print("for 1")
                if not np.isclose(int(np.amax(BNodeval[i, :, 1])), 0):  # No Bracing
                    # print("if # 1")
                    p = 0
                    # print("max = ", int(np.amax(BNodeval[i, :, 1])))
                    for j in range(int(np.amax(BNodeval[i, :, 1]))):
                        print("for 2")
                        # print('BNodevalue in for 2 = ', BNodevalue)
                        # print('BNodeval in for 2= ', BNodeval)
                        # print('i for 2 = ', i, '\nj for 2 = ', j, '\np for 2 = ', p)
                        # print("x = ", coord_x, "\ny =", coord_y, "\nz =", coord_z)
                        # print("3 = ", BNodeval[i][j][2], "\n4 =", BNodeval[i][j][3], "\n5 =", BNodeval[i][j][4])
                        # BNodevalue = np.zeros((mem, p + 1, 16))

                        if np.isclose(coord_x, BNodeval[i][j][2]) and \
                                np.isclose(coord_y, BNodeval[i][j][3]) and \
                                np.isclose(coord_z, BNodeval[i][j][4]) :  # 1 - 1
                            print("# 1 - 1")
                            # print('j = ', j, np.greater(j, 0), 'isclose =', np.amax(BNodeval[i, :, 1]))
                            if np.isclose(j, 0):  # 2 - 1
                                print("# 2 - 1")
                                if np.isclose(int(np.amax(BNodeval[i, :, 1])), 1):  # be careful with indexing # 3 - 1
                                    print("# 3 - 1")
                                    if not np.isclose(JNodevalue_i[i][5], BNodeval[i][j][5]) or not np.isclose(
                                            JNodevalue_i[i][6], BNodeval[i][j][6]) or not np.isclose(JNodevalue_i[i][7],
                                                                                                     BNodeval[i][j][
                                                                                                         7]) or not np.isclose(
                                        JNodevalue_i[i][8], BNodeval[i][j][8]) or not np.isclose(JNodevalue_i[i][10],
                                                                                                 BNodeval[i][j][
                                                                                                     10]):  # 4 - 1
                                        print("# 4 - 1")
                                        bfb1 = JNodevalue_i[i][5]  # Bottom flange width
                                        tfb1 = JNodevalue_i[i][6]  # Bottom flange thickness
                                        bft1 = JNodevalue_i[i][7]  # Top flange width
                                        tft1 = JNodevalue_i[i][8]  # Top flange thickness
                                        Dg1 = JNodevalue_i[i][9]  # dw:Web depth (y-dir)
                                        tw1 = JNodevalue_i[i][10]  # dw:Web depth (y-dir)
                                        hg1 = JNodevalue_i[i][12]  # h : Distance between flange centroids

                                        bfb2 = BNodeval[i][j][5]  # Bottom flange width
                                        tfb2 = BNodeval[i][j][6]  # Bottom flange thickness
                                        bft2 = BNodeval[i][j][7]  # Top flange width
                                        tft2 = BNodeval[i][j][8]  # Top flange thickness
                                        Dg2 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                        tw2 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                        hg2 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                        # Shear center
                                        # Start node
                                        # bottom flange centroid to shear center
                                        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                             np.power(bft1,
                                                                                                                      3))))
                                        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                        hst1 = hg1 - hsb1  # top flange centroid to shear center
                                        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                        # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                        # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                        # End node
                                        # bottom flange centroid to shear center
                                        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                             np.power(bft2,
                                                                                                                      3))))
                                        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                        hst2 = hg2 - hsb2  # top flange centroid to shear center
                                        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                        # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                        # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                        ys1 = Dg1 / 2 - Dst1
                                        ys2 = Dg2 / 2 - Dst2  # shear center

                                        s = np.abs((ys1 - ys2))  # Difference in shear center
                                        s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                        Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                        Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                        L = np.sqrt(((JNodevalue_j[i][2] - JNodevalue_i[i][2]) ** 2 + (
                                                JNodevalue_j[i][3] - JNodevalue_i[i][3]) ** 2 + (
                                                             JNodevalue_j[i][4] - JNodevalue_i[i][4]) ** 2))

                                        # print('BNodevalue before # 5 - 1 = ', BNodevalue)

                                        if is_step_checked:  # 5 - 1
                                            print("# 5 - 1")
                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                        else:  # 5 - 2
                                            print("# 5 - 2")

                                            if np.greater(BNodeval[i][j][15] / 2, s) and np.greater_equal(Af1,
                                                                                                          Af2):  # 6 - 1
                                                print("# 6 - 1")

                                                segLoc = [0, BNodeval[i][j][15]]
                                                segLocstep = [0, BNodeval[i][j][15] - s, BNodeval[i][j][15]]
                                                Dgs = [JNodevalue_i[i][9], BNodeval[i][j][9]]
                                                dts = [JNodevalue_i[i][11], BNodeval[i][j][11]]
                                                hgs = [JNodevalue_i[i][12], BNodeval[i][j][12]]
                                                Afills = [JNodevalue_i[i][13], BNodeval[i][j][13]]
                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                # Dgsb    = Dgsb[1]
                                                # dtsb    = dtsb[1]
                                                # hgsb    = hgsb[1]
                                                # Afillsb = Afillsb[1]

                                                # original element
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] - s
                                                Lb2 = np.dot(Rz, Lb2) + Additive
                                                # print('LB2 # 6 - 1 =', Lb2)
                                                
                                                # print('Dgsb # 6 - 1 =', Dgsb)
                                                # print('dtsb # 6 - 1 =', dtsb)
                                                # print('hgsb # 6 - 1 =', hgsb)
                                                # print('Afillsb # 6 - 1 =', Afillsb)

                                                BNodevalue = np.insert(BNodevalue,p,0,axis = 1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = JNodevalue_i[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_i[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_i[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_i[i][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = JNodevalue_i[i][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] - s
                                                # print('BNodevalue in # 6 - 1 = ', BNodevalue)
                                                # print('BNodeval in # 6 - 1 = ', BNodeval)
                                                # print('i # 6 - 1 = ', i, '\nj # 6 - 1 = ', j, '\np # 6 - 1 = ', p)
                                                p = p + 1

                                            elif np.greater(BNodeval[i][j][15] / 2, s) and np.greater(Af2, Af1):  # 6 - 2
                                                print("# 6 - 2")
                                                segLoc = [BNodeval[i][j][15], L]
                                                segLocstep = [BNodeval[i][j][15], BNodeval[i][j][15] + s, L]
                                                Dgs = [BNodeval[i][j][9], JNodevalue_j[i][9]]
                                                dts = [BNodeval[i][j][11], JNodevalue_j[i][11]]
                                                hgs = [BNodeval[i][j][12], JNodevalue_j[i][12]]
                                                Afills = [BNodeval[i][j][13], JNodevalue_j[i][13]]

                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = JNodevalue_i[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_i[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_i[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_i[i][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = JNodevalue_i[i][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1
                                                # add step element # rotation
                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] + s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] + s

                                                p = p + 1

                                    elif not np.isclose(JNodevalue_j[i][5], BNodeval[i][j][5]) or not np.isclose(
                                            JNodevalue_j[i][6], BNodeval[i][j][6]) or not np.isclose(JNodevalue_j[i][7],
                                                                                                     BNodeval[i][j][
                                                                                                         7]) or not np.isclose(
                                        JNodevalue_j[i][8], BNodeval[i][j][8]) or not np.isclose(JNodevalue_j[i][10],
                                                                                                 BNodeval[i][j][
                                                                                                     10]):  # 4 - 2

                                        print("# 4 - 2")
                                        bfb2 = JNodevalue_j[i][5]  # Bottom flange width
                                        tfb2 = JNodevalue_j[i][6]  # Bottom flange thickness
                                        bft2 = JNodevalue_j[i][7]  # Top flange width
                                        tft2 = JNodevalue_j[i][8]  # Top flange thickness
                                        Dg2 = JNodevalue_j[i][9]  # dw:Web depth (y-dir)
                                        tw2 = JNodevalue_j[i][10]  # dw:Web depth (y-dir)
                                        hg2 = JNodevalue_j[i][12]  # h : Distance between flange centroids

                                        bfb1 = BNodeval[i][j][5]  # Bottom flange width
                                        tfb1 = BNodeval[i][j][6]  # Bottom flange thickness
                                        bft1 = BNodeval[i][j][7]  # Top flange width
                                        tft1 = BNodeval[i][j][8]  # Top flange thickness
                                        Dg1 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                        tw1 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                        hg1 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                        # Shear center
                                        # Start node
                                        # bottom flange centroid to shear center
                                        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                             np.power(
                                                                                                                 bft1,
                                                                                                                 3))))
                                        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                        hst1 = hg1 - hsb1  # top flange centroid to shear center
                                        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                        # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                        # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                        # End node
                                        # bottom flange centroid to shear center
                                        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                             np.power(
                                                                                                                 bft2,
                                                                                                                 3))))
                                        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                        hst2 = hg2 - hsb2  # top flange centroid to shear center
                                        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                        # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                        # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                        ys1 = Dg1 / 2 - Dst1
                                        ys2 = Dg2 / 2 - Dst2  # shear center

                                        s = np.abs((ys1 - ys2))  # Difference in shear center
                                        s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                        Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                        Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                        L = np.sqrt(((JNodevalue_j[i][2] - JNodevalue_i[i][2]) ** 2 + (
                                                JNodevalue_j[i][3] - JNodevalue_i[i][3]) ** 2 + (
                                                             JNodevalue_j[i][4] - JNodevalue_i[i][4]) ** 2))
                                        # print('checked =' , is_step_checked)
                                        if is_step_checked:  # 7 - 1
                                            print("# 7 - 1")
                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                        else:  # 7 - 2
                                            print("# 7 - 2")
                                            # print('BNodevalue before in # 7 - 2 = ', BNodevalue)
                                            # print('BNodeval before # 7 - 2 = ', BNodeval)
                                            # # print('i # 7 - 2 = ', i, '\nj # 7 - 2 = ', j, '\np # 7 - 2 = ', p)
                                            # print(np.greater(abs(L - BNodeval[i][j][15]) / 2,
                                            #               s), np.greater_equal(Af1, Af2))
                                            # print('\n\n\n', L, BNodeval[i][j][15], s, Af1, Af2)
                                            if np.greater(abs(L - BNodeval[i][j][15]) / 2,
                                                          s) and np.greater_equal(Af2, Af1):  # 8 - 1
                                                print("# 8 - 1")
                                                segLoc = [BNodeval[i][j][15], L]
                                                segLocstep = [BNodeval[i][j][15], (BNodeval[i][j][15] + s), L]
                                                Dgs = [BNodeval[i][j][9], JNodevalue_j[i][9]]
                                                dts = [BNodeval[i][j][11], JNodevalue_j[i][11]]
                                                hgs = [BNodeval[i][j][12], JNodevalue_j[i][12]]
                                                Afills = [BNodeval[i][j][13], JNodevalue_j[i][13]]
                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                # Dgsb    = Dgsb[1]
                                                # dtsb    = dtsb[1]
                                                # hgsb    = hgsb[1]
                                                # Afillsb = Afillsb[1]

                                                # original element
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] + s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = JNodevalue_j[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_j[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_j[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_j[i][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = JNodevalue_j[i][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] + s
                                                p = p + 1

                                            elif np.greater(abs(L - BNodeval[i][j][15]) / 2,
                                                            s) and np.greater_equal(Af1, Af2):  # 8 - 2
                                                print("# 8 - 2")
                                                segLoc = [0, BNodeval[i][j][15]]
                                                segLocstep = [0, BNodeval[i][j][15] - s, BNodeval[i][j][15]]
                                                Dgs = [JNodevalue_i[i][9], BNodeval[i][j][9]]
                                                dts = [JNodevalue_i[i][11], BNodeval[i][j][11]]
                                                hgs = [JNodevalue_i[i][12], BNodeval[i][j][12]]
                                                Afills = [JNodevalue_i[i][13], BNodeval[i][j][13]]

                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = JNodevalue_j[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_j[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_j[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_j[i][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = JNodevalue_j[i][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] - s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] - s

                                                p = p + 1

                                    else:  # 4 - 3
                                        print("# 4 - 3")
                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                                else:  # ------------------------ ~max(BNodeval)=1 # 3 - 2
                                    print("# 3 - 2")
                                    if not np.isclose(JNodevalue_i[i][5], BNodeval[i][j][5]) or not np.isclose(
                                            JNodevalue_i[i][6], BNodeval[i][j][6]) or not np.isclose(JNodevalue_i[i][7],
                                                                                                     BNodeval[i][j][
                                                                                                         7]) or not np.isclose(
                                        JNodevalue_i[i][8], BNodeval[i][j][8]) or not np.isclose(JNodevalue_i[i][10],
                                                                                                 BNodeval[i][j][
                                                                                                     10]):  # 9 - 1
                                        print("# 9 - 1")
                                        bfb1 = JNodevalue_i[i][5]  # Bottom flange width
                                        tfb1 = JNodevalue_i[i][6]  # Bottom flange thickness
                                        bft1 = JNodevalue_i[i][7]  # Top flange width
                                        tft1 = JNodevalue_i[i][8]  # Top flange thickness
                                        Dg1 = JNodevalue_i[i][9]  # dw:Web depth (y-dir)
                                        tw1 = JNodevalue_i[i][10]  # dw:Web depth (y-dir)
                                        hg1 = JNodevalue_i[i][12]  # h : Distance between flange centroids

                                        bfb2 = BNodeval[i][j][5]  # Bottom flange width
                                        tfb2 = BNodeval[i][j][6]  # Bottom flange thickness
                                        bft2 = BNodeval[i][j][7]  # Top flange width
                                        tft2 = BNodeval[i][j][8]  # Top flange thickness
                                        Dg2 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                        tw2 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                        hg2 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                        # Shear center
                                        # Start node
                                        # bottom flange centroid to shear center
                                        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                             np.power(
                                                                                                                 bft1,
                                                                                                                 3))))
                                        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                        hst1 = hg1 - hsb1  # top flange centroid to shear center
                                        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                        # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                        # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                        # End node
                                        # bottom flange centroid to shear center
                                        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                             np.power(
                                                                                                                 bft2,
                                                                                                                 3))))
                                        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                        hst2 = hg2 - hsb2  # top flange centroid to shear center
                                        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                        # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                        # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                        ys1 = Dg1 / 2 - Dst1
                                        ys2 = Dg2 / 2 - Dst2  # shear center

                                        s = np.abs((ys1 - ys2))  # Difference in shear center
                                        s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                        Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                        Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                        if is_step_checked:  # 10 - 1
                                            # original element
                                            print("# 10 - 1")

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                        else:  # 10 -2
                                            print("# 10 - 2")
                                            if np.greater(BNodeval[i][j][15] / 2,
                                                          s) and np.greater_equal(Af1, Af2):  # 11 - 1
                                                print("# 11 - 1")
                                                segLoc = [0, BNodeval[i][j][15]]
                                                segLocstep = [0, (BNodeval[i][j][15] - s),
                                                              BNodeval[i][j][15]]
                                                Dgs = [JNodevalue_i[i][9], BNodeval[i][j][9]]
                                                dts = [JNodevalue_i[i][11], BNodeval[i][j][11]]
                                                hgs = [JNodevalue_i[i][12], BNodeval[i][j][12]]
                                                Afills = [JNodevalue_i[i][13], BNodeval[i][j][13]]
                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                # Dgsb    = Dgsb[1]
                                                # dtsb    = dtsb[1]
                                                # hgsb    = hgsb[1]
                                                # Afillsb = Afillsb[1]

                                                # original element
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1
                                                # add step element
                                                # Rotation

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]

                                                Lb2[0] = BNodeval[i][j][15] - s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = JNodevalue_i[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_i[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_i[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_i[i][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = JNodevalue_i[i][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] - s
                                                p = p + 1

                                            elif np.greater(BNodeval[i][j][15] / 2, s) and np.greater(Af2,
                                                                                                      Af1):  # 11 - 2
                                                print("# 11 - 2")
                                                segLoc = [BNodeval[i][j][15], BNodeval[i][j + 1][15]]
                                                segLocstep = [BNodeval[i][j][15], BNodeval[i][j][15] + s,
                                                              BNodeval[i][j + 1][15]]
                                                Dgs = [BNodeval[i][j][9], BNodeval[i][j + 1][9]]
                                                dts = [BNodeval[i][j][11], BNodeval[i][j + 1][11]]
                                                hgs = [BNodeval[i][j][12], BNodeval[i][j + 1][12]]
                                                Afills = [BNodeval[i][j][13], BNodeval[i][j + 1][13]]

                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)
                                                # original element

                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = JNodevalue_i[i][5]
                                                BNodevalue[i][p][6] = JNodevalue_i[i][6]
                                                BNodevalue[i][p][7] = JNodevalue_i[i][7]
                                                BNodevalue[i][p][8] = JNodevalue_i[i][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = JNodevalue_i[i][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] + s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = BNodeval[i][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] + s

                                                p = p + 1

                                    elif not np.isclose(BNodeval[i][j][5], BNodeval[i][j + 1][5]) or not np.isclose(
                                            BNodeval[i][j][6], BNodeval[i][j + 1][6]) or not np.isclose(
                                        BNodeval[i][j][7],
                                        BNodeval[i][j + 1][
                                            7]) or not np.isclose(
                                        BNodeval[i][j][8], BNodeval[i][j + 1][8]) or not np.isclose(BNodeval[i][j][10],
                                                                                                    BNodeval[i][j + 1][
                                                                                                        10]):  # 9 -2

                                        print("# 9 - 2")

                                        bfb1 = BNodeval[i][j][5]  # Bottom flange width
                                        tfb1 = BNodeval[i][j][6]  # Bottom flange thickness
                                        bft1 = BNodeval[i][j][7]  # Top flange width
                                        tft1 = BNodeval[i][j][8]  # Top flange thickness
                                        Dg1 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                        tw1 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                        hg1 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                        bfb2 = BNodeval[i][j + 1][5]  # Bottom flange width
                                        tfb2 = BNodeval[i][j + 1][6]  # Bottom flange thickness
                                        bft2 = BNodeval[i][j + 1][7]  # Top flange width
                                        tft2 = BNodeval[i][j + 1][8]  # Top flange thickness
                                        Dg2 = BNodeval[i][j + 1][9]  # dw:Web depth (y-dir)
                                        tw2 = BNodeval[i][j + 1][10]  # dw:Web depth (y-dir)
                                        hg2 = BNodeval[i][j + 1][12]  # h : Distance between flange centroids

                                        # Shear center
                                        # Start node
                                        # bottom flange centroid to shear center
                                        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                             np.power(
                                                                                                                 bft1,
                                                                                                                 3))))
                                        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                        hst1 = hg1 - hsb1  # top flange centroid to shear center
                                        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                        # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                        # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                        # End node
                                        # bottom flange centroid to shear center
                                        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                             np.power(
                                                                                                                 bft2,
                                                                                                                 3))))
                                        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                        hst2 = hg2 - hsb2  # top flange centroid to shear center
                                        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                        # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                        # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                        ys1 = Dg1 / 2 - Dst1
                                        ys2 = Dg2 / 2 - Dst2  # shear center

                                        s = np.abs((ys1 - ys2))  # Difference in shear center
                                        s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                        Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                        Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                        if is_step_checked:  # 12 - 1
                                            # original element
                                            print("# 12 - 1")

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                        else:  # 12 - 2
                                            print("# 12 - 2")
                                            if np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j + 1][15]) / 2,
                                                          s) and np.greater(Af2, Af1):  # 13 - 1
                                                print("# 13 - 1")
                                                segLoc = [BNodeval[i][j][15], BNodeval[i][j + 1][15]]
                                                segLocstep = [BNodeval[i][j][15], (BNodeval[i][j][15] + s),
                                                              BNodeval[i][j + 1][15]]
                                                Dgs = [BNodeval[i][j][9], BNodeval[i][j + 1][9]]
                                                dts = [BNodeval[i][j][11], BNodeval[i][j + 1][11]]
                                                hgs = [BNodeval[i][j][12], BNodeval[i][j + 1][12]]
                                                Afills = [BNodeval[i][j][13], BNodeval[i][j + 1][13]]
                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)

                                                # Dgsb    = Dgsb[1]
                                                # dtsb    = dtsb[1]
                                                # hgsb    = hgsb[1]
                                                # Afillsb = Afillsb[1]

                                                # original element
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1
                                                # add step element
                                                # Rotation

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]

                                                Lb2[0] = BNodeval[i][j][15] + s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = BNodeval[i][j + 1][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j + 1][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j + 1][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j + 1][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = BNodeval[i][j + 1][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 2
                                                BNodevalue[i][p][15] = BNodeval[i][j + 1][15] + s
                                                p = p + 1

                                            elif np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j + 1][15]) / 2,
                                                            s) and np.greater_equal(Af1, Af2):  # 13 - 2
                                                print("# 13 - 2")
                                                segLoc = [0, BNodeval[i][j][15]]
                                                segLocstep = [0, BNodeval[i][j][15] - s,
                                                              BNodeval[i][j][15]]
                                                Dgs = [JNodevalue_i[i][9], BNodeval[i][j][9]]
                                                dts = [JNodevalue_i[i][11], BNodeval[i][j][11]]
                                                hgs = [JNodevalue_i[i][12], BNodeval[i][j][12]]
                                                Afills = [JNodevalue_i[i][13], BNodeval[i][j][13]]

                                                Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                                dtsb = np.interp(segLocstep, segLoc, dts)
                                                hgsb = np.interp(segLocstep, segLoc, hgs)
                                                Afillsb = np.interp(segLocstep, segLoc, Afills)
                                                # original element

                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = BNodeval[i][j][2]
                                                BNodevalue[i][p][3] = BNodeval[i][j][3]
                                                BNodevalue[i][p][4] = BNodeval[i][j][4]
                                                BNodevalue[i][p][5] = BNodeval[i][j + 1][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j + 1][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j + 1][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j + 1][8]
                                                BNodevalue[i][p][9] = BNodeval[i][j][9]
                                                BNodevalue[i][p][10] = BNodeval[i][j + 1][10]
                                                BNodevalue[i][p][11] = BNodeval[i][j][11]
                                                BNodevalue[i][p][12] = BNodeval[i][j][12]
                                                BNodevalue[i][p][13] = BNodeval[i][j][13]
                                                BNodevalue[i][p][14] = 1
                                                BNodevalue[i][p][15] = BNodeval[i][j][15]
                                                p = p + 1

                                                Rz = np.zeros((3, 3))
                                                Rz[0][0] = np.cos(alpharef[i, 1])
                                                Rz[0][1] = -np.sin(alpharef[i, 1])
                                                Rz[1][0] = np.sin(alpharef[i, 1])
                                                Rz[1][1] = np.cos(alpharef[i, 1])
                                                Rz[2][2] = 1

                                                Lb2 = np.zeros(3)
                                                Additive = np.zeros(3)
                                                Additive[0] = JNodevalue_i[i][2]
                                                Additive[1] = JNodevalue_i[i][3]
                                                Additive[2] = JNodevalue_i[i][4]
                                                Lb2[0] = BNodeval[i][j][15] - s
                                                Lb2 = np.dot(Rz, Lb2) + Additive

                                                BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                                BNodevalue[i][p][0] = BNodeval[i][j][0]
                                                BNodevalue[i][p][1] = p + 1
                                                BNodevalue[i][p][2] = Lb2[0]
                                                BNodevalue[i][p][3] = Lb2[1]
                                                BNodevalue[i][p][4] = Lb2[2]
                                                BNodevalue[i][p][5] = BNodeval[i][j][5]
                                                BNodevalue[i][p][6] = BNodeval[i][j][6]
                                                BNodevalue[i][p][7] = BNodeval[i][j][7]
                                                BNodevalue[i][p][8] = BNodeval[i][j][8]
                                                BNodevalue[i][p][9] = Dgsb[1]
                                                BNodevalue[i][p][10] = BNodeval[i][j][10]
                                                BNodevalue[i][p][11] = dtsb[1]
                                                BNodevalue[i][p][12] = hgsb[1]
                                                BNodevalue[i][p][13] = Afillsb[1]
                                                BNodevalue[i][p][14] = 3
                                                BNodevalue[i][p][15] = BNodeval[i][j][15] - s

                                                p = p + 1
                                    else:  # 9 - 3
                                        print("# 9 - 3")
                                        # original element
                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                            elif np.greater(j, 0) and np.isclose(j, np.amax(BNodeval[i, :, 1]) - 1):  # 2 - 2
                                print("# 2 - 2")
                                if not np.isclose(JNodevalue_j[i][5], BNodeval[i][j][5]) or not np.isclose(
                                        JNodevalue_j[i][6], BNodeval[i][j][6]) or not np.isclose(JNodevalue_j[i][7],
                                                                                                 BNodeval[i][j][
                                                                                                     7]) or not np.isclose(
                                    JNodevalue_j[i][8], BNodeval[i][j][8]) or not np.isclose(JNodevalue_j[i][10],
                                                                                             BNodeval[i][j + 1][
                                                                                                 10]):  # 14 -1
                                    print("# 14 - 1")

                                    bfb2 = JNodevalue_j[i][5]  # Bottom flange width
                                    tfb2 = JNodevalue_j[i][6]  # Bottom flange thickness
                                    bft2 = JNodevalue_j[i][7]  # Top flange width
                                    tft2 = JNodevalue_j[i][8]  # Top flange thickness
                                    Dg2 = JNodevalue_j[i][9]  # dw:Web depth (y-dir)
                                    tw2 = JNodevalue_j[i][10]  # dw:Web depth (y-dir)
                                    hg2 = JNodevalue_j[i][12]  # h : Distance between flange centroids

                                    bfb1 = BNodeval[i][j][5]  # Bottom flange width
                                    tfb1 = BNodeval[i][j][6]  # Bottom flange thickness
                                    bft1 = BNodeval[i][j][7]  # Top flange width
                                    tft1 = BNodeval[i][j][8]  # Top flange thickness
                                    Dg1 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                    tw1 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                    hg1 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                    # Shear center
                                    # Start node
                                    # bottom flange centroid to shear center
                                    hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                     (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                         np.power(
                                                                                                             bft1,
                                                                                                             3))))
                                    Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                    hst1 = hg1 - hsb1  # top flange centroid to shear center
                                    Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                    # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                    # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                    # End node
                                    # bottom flange centroid to shear center
                                    hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                     (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                         np.power(
                                                                                                             bft2,
                                                                                                             3))))
                                    Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                    hst2 = hg2 - hsb2  # top flange centroid to shear center
                                    Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                    # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                    # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                    ys1 = Dg1 / 2 - Dst1
                                    ys2 = Dg2 / 2 - Dst2  # shear center

                                    s = np.abs((ys1 - ys2))  # Difference in shear center
                                    s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                    Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                    Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                    L = np.sqrt(((JNodevalue_j[i][2] - JNodevalue_i[i][2]) ** 2 + (
                                            JNodevalue_j[i][3] - JNodevalue_i[i][3]) ** 2 + (
                                                         JNodevalue_j[i][4] - JNodevalue_i[i][4]) ** 2))

                                    if is_step_checked:  # 15 -1
                                        print("# 15 - 1")
                                        # original element
                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                                    else:  # 15- 2
                                        print("# 15 - 2")
                                        if np.greater(abs(L - BNodeval[i][j][15]) / 2,
                                                      s) and np.greater(Af2, Af1):  # 16 -1
                                            print("# 16 - 1")
                                            segLoc = [BNodeval[i][j][15], L]
                                            segLocstep = [BNodeval[i][j][15], (BNodeval[i][j][15] + s), L]
                                            Dgs = [BNodeval[i][j][9], JNodevalue_j[i][9]]
                                            dts = [BNodeval[i][j][11], JNodevalue_j[i][11]]
                                            hgs = [BNodeval[i][j][12], JNodevalue_j[i][12]]
                                            Afills = [BNodeval[i][j][13], JNodevalue_j[i][13]]
                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)

                                            # Dgsb    = Dgsb[1]
                                            # dtsb    = dtsb[1]
                                            # hgsb    = hgsb[1]
                                            # Afillsb = Afillsb[1]

                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]
                                            Lb2[0] = BNodeval[i][j][15] + s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = JNodevalue_j[i][5]
                                            BNodevalue[i][p][6] = JNodevalue_j[i][6]
                                            BNodevalue[i][p][7] = JNodevalue_j[i][7]
                                            BNodevalue[i][p][8] = JNodevalue_j[i][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = JNodevalue_j[i][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 3
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] + s
                                            p = p + 1

                                        elif np.greater(abs(L - BNodeval[i][j][15]) / 2, s) and np.greater_equal(Af1,
                                                                                                                 Af2):  # 16 - 2
                                            print("# 16 - 2")
                                            segLoc = [BNodeval[i][j - 1][15], BNodeval[i][j][15]]
                                            segLocstep = [BNodeval[i][j - 1][15], BNodeval[i][j][15] - s,
                                                          BNodeval[i][j][15]]
                                            Dgs = [BNodeval[i][j - 1][9], BNodeval[i][j][9]]
                                            dts = [BNodeval[i][j - 1][11], BNodeval[i][j][11]]
                                            hgs = [BNodeval[i][j - 1][12], BNodeval[i][j][12]]
                                            Afills = [BNodeval[i][j - 1][13], BNodeval[i][j][13]]

                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = JNodevalue_j[i][5]
                                            BNodevalue[i][p][6] = JNodevalue_j[i][6]
                                            BNodevalue[i][p][7] = JNodevalue_j[i][7]
                                            BNodevalue[i][p][8] = JNodevalue_j[i][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = JNodevalue_j[i][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]

                                            p = p + 1

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]
                                            Lb2[0] = BNodeval[i][j][15] - s
                                            Lb2 = np.dot(Rz, Lb2) + Additive
                                            # print('BNodevalue in # 16 - 2 = ', BNodevalue)
                                            # print('BNodeval in # 16 - 2 = ', BNodeval)
                                            # print('i # 16 - 2 = ', i, '\nj # 16 - 2 = ', j, '\np # 16 - 2 = ', p)
                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 3
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] - s

                                            p = p + 1
                                elif not np.isclose(BNodeval[i][j - 1][5], BNodeval[i][j][5]) or not np.isclose(
                                        BNodeval[i][j - 1][6], BNodeval[i][j][6]) or not np.isclose(
                                    BNodeval[i][j - 1][7],
                                    BNodeval[i][j][
                                        7]) or not np.isclose(
                                    BNodeval[i][j - 1][8], BNodeval[i][j][8]) or not np.isclose(
                                    BNodeval[i][j - 1][10],
                                    BNodeval[i][j][10]):  # 14 -2
                                    print("# 14 - 2")

                                    bfb1 = BNodeval[i][j - 1][5]  # Bottom flange width
                                    tfb1 = BNodeval[i][j - 1][6]  # Bottom flange thickness
                                    bft1 = BNodeval[i][j - 1][7]  # Top flange width
                                    tft1 = BNodeval[i][j - 1][8]  # Top flange thickness
                                    Dg1 = BNodeval[i][j - 1][9]  # dw:Web depth (y-dir)
                                    tw1 = BNodeval[i][j - 1][10]  # dw:Web depth (y-dir)
                                    hg1 = BNodeval[i][j - 1][12]  # h : Distance between flange centroids

                                    bfb2 = BNodeval[i][j][5]  # Bottom flange width
                                    tfb2 = BNodeval[i][j][6]  # Bottom flange thickness
                                    bft2 = BNodeval[i][j][7]  # Top flange width
                                    tft2 = BNodeval[i][j][8]  # Top flange thickness
                                    Dg2 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                    tw2 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                    hg2 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                    # Shear center
                                    # Start node
                                    # bottom flange centroid to shear center
                                    hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                     (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                         np.power(
                                                                                                             bft1,
                                                                                                             3))))
                                    Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                    hst1 = hg1 - hsb1  # top flange centroid to shear center
                                    Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                    # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                    # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                    # End node
                                    # bottom flange centroid to shear center
                                    hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                     (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                         np.power(
                                                                                                             bft2,
                                                                                                             3))))
                                    Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                    hst2 = hg2 - hsb2  # top flange centroid to shear center
                                    Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                    # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                    # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                    ys1 = Dg1 / 2 - Dst1
                                    ys2 = Dg2 / 2 - Dst2  # shear center

                                    s = np.abs((ys1 - ys2))  # Difference in shear center
                                    s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                    Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                    Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                    L = np.sqrt(((JNodevalue_j[i][2] - JNodevalue_i[i][2]) ** 2 + (
                                            JNodevalue_j[i][3] - JNodevalue_i[i][3]) ** 2 + (
                                                         JNodevalue_j[i][4] - JNodevalue_i[i][4]) ** 2))

                                    if is_step_checked:  # 17 - 1
                                        # original element
                                        print("# 17 - 1")

                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                                    else:  # 17 - 2
                                        print("# 17 - 2")
                                        if np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j - 1][15]) / 2,
                                                      s) or not np.greater_equal(Af1, Af2):  # 18 - 1
                                            print("# 18 - 1")
                                            segLoc = [BNodeval[i][j - 1][15], BNodeval[i][j][15]]
                                            segLocstep = [BNodeval[i][j - 1][15], (BNodeval[i][j][15] - s),
                                                          BNodeval[i][j][15]]
                                            Dgs = [BNodeval[i][j - 1][9], BNodeval[i][j][9]]
                                            dts = [BNodeval[i][j - 1][11], BNodeval[i][j][11]]
                                            hgs = [BNodeval[i][j - 1][12], BNodeval[i][j][12]]
                                            Afills = [BNodeval[i][j - 1][13], BNodeval[i][j][13]]
                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)

                                            # Dgsb    = Dgsb[1]
                                            # dtsb    = dtsb[1]
                                            # hgsb    = hgsb[1]
                                            # Afillsb = Afillsb[1]

                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1
                                            # add step element
                                            # Rotation

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]

                                            Lb2[0] = BNodeval[i][j][15] - s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j - 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j - 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j - 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j - 1][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j - 1][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 2
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] - s
                                            p = p + 1

                                        elif np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j - 1][15]) / 2,
                                                        s) and np.greater(Af2, Af1):  # 18 - 2
                                            print("# 18 - 2")
                                            segLoc = [BNodeval[i][j][15], L]
                                            segLocstep = [BNodeval[i][j][15], BNodeval[i][j][15] + s, L]
                                            Dgs = [BNodeval[i][j][9], JNodevalue_j[i][9]]
                                            dts = [BNodeval[i][j][11], JNodevalue_j[i][11]]
                                            hgs = [BNodeval[i][j][12], JNodevalue_j[i][12]]
                                            Afills = [BNodeval[i][j][13], JNodevalue_j[i][13]]

                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)
                                            # original element

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j - 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j - 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j - 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j - 1][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j - 1][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]
                                            Lb2[0] = BNodeval[i][j][15] + s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 2
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] + s

                                            p = p + 1

                                else:  # 14 - 3
                                    print("# 14 - 3")
                                    BNodevalue[i][p][0] = BNodeval[i][j][0]
                                    BNodevalue[i][p][1] = p + 1
                                    BNodevalue[i][p][2] = BNodeval[i][j][2]
                                    BNodevalue[i][p][3] = BNodeval[i][j][3]
                                    BNodevalue[i][p][4] = BNodeval[i][j][4]
                                    BNodevalue[i][p][5] = BNodeval[i][j][5]
                                    BNodevalue[i][p][6] = BNodeval[i][j][6]
                                    BNodevalue[i][p][7] = BNodeval[i][j][7]
                                    BNodevalue[i][p][8] = BNodeval[i][j][8]
                                    BNodevalue[i][p][9] = BNodeval[i][j][9]
                                    BNodevalue[i][p][10] = BNodeval[i][j][10]
                                    BNodevalue[i][p][11] = BNodeval[i][j][11]
                                    BNodevalue[i][p][12] = BNodeval[i][j][12]
                                    BNodevalue[i][p][13] = BNodeval[i][j][13]
                                    BNodevalue[i][p][14] = 1
                                    BNodevalue[i][p][15] = BNodeval[i][j][15]
                                    p = p + 1

                            else:  # 2 - 3
                                print("# 2 - 3")
                                if np.isclose(BNodeval[i][j - 1][5], BNodeval[i][j][5]) or not np.isclose(
                                        BNodeval[i][j - 1][6], BNodeval[i][j][6]) or not np.isclose(
                                    BNodeval[i][j - 1][7],
                                    BNodeval[i][j][
                                        7]) or not np.isclose(
                                    BNodeval[i][j - 1][8], BNodeval[i][j][8]) or not np.isclose(
                                    BNodeval[i][j - 1][10],
                                    BNodeval[i][j][10]):  # 19 - 1
                                    print("# 19 - 1")

                                    bfb1 = BNodeval[i][j - 1][5]  # Bottom flange width
                                    tfb1 = BNodeval[i][j - 1][6]  # Bottom flange thickness
                                    bft1 = BNodeval[i][j - 1][7]  # Top flange width
                                    tft1 = BNodeval[i][j - 1][8]  # Top flange thickness
                                    Dg1 = BNodeval[i][j - 1][9]  # dw:Web depth (y-dir)
                                    tw1 = BNodeval[i][j - 1][10]  # dw:Web depth (y-dir)
                                    hg1 = BNodeval[i][j - 1][12]  # h : Distance between flange centroids

                                    bfb2 = BNodeval[i][j][5]  # Bottom flange width
                                    tfb2 = BNodeval[i][j][6]  # Bottom flange thickness
                                    bft2 = BNodeval[i][j][7]  # Top flange width
                                    tft2 = BNodeval[i][j][8]  # Top flange thickness
                                    Dg2 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                    tw2 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                    hg2 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                    # Shear center
                                    # Start node
                                    # bottom flange centroid to shear center
                                    hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                     (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                         np.power(
                                                                                                             bft1,
                                                                                                             3))))
                                    Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                    hst1 = hg1 - hsb1  # top flange centroid to shear center
                                    Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                    # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                    # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                    # End node
                                    # bottom flange centroid to shear center
                                    hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                     (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                         np.power(
                                                                                                             bft2,
                                                                                                             3))))
                                    Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                    hst2 = hg2 - hsb2  # top flange centroid to shear center
                                    Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                    # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                    # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                    ys1 = Dg1 / 2 - Dst1
                                    ys2 = Dg2 / 2 - Dst2  # shear center

                                    s = np.abs((ys1 - ys2))  # Difference in shear center
                                    s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                    Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                    Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                    if is_step_checked:  # 20 - 1
                                        # original element

                                        print("# 20 - 1")

                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                                    else:  # 20 - 2

                                        print("# 20 - 1")
                                        if np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j - 1][15]) / 2,
                                                      s) or not np.greater_equal(Af1, Af2):  # 21 - 1
                                            print("# 21 - 1")

                                            segLoc = [BNodeval[i][j - 1][15], BNodeval[i][j][15]]
                                            segLocstep = [BNodeval[i][j - 1][15], (BNodeval[i][j][15] - s),
                                                          BNodeval[i][j][15]]
                                            Dgs = [BNodeval[i][j - 1][9], BNodeval[i][j][9]]
                                            dts = [BNodeval[i][j - 1][11], BNodeval[i][j][11]]
                                            hgs = [BNodeval[i][j - 1][12], BNodeval[i][j][12]]
                                            Afills = [BNodeval[i][j - 1][13], BNodeval[i][j][13]]
                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)

                                            # Dgsb    = Dgsb[1]
                                            # dtsb    = dtsb[1]
                                            # hgsb    = hgsb[1]
                                            # Afillsb = Afillsb[1]

                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1
                                            # add step element
                                            # Rotation

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]

                                            Lb2[0] = BNodeval[i][j][15] - s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j - 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j - 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j - 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j - 1][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j - 1][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 2
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] - s
                                            p = p + 1

                                        elif np.greater(abs(BNodeval[i][j][15] - BNodeval[i][j - 1][15]) / 2,
                                                        s) and np.greater(Af2, Af1):  # 21 - 2
                                            print("# 21 - 2")

                                            segLoc = [BNodeval[i][j][15], BNodeval[i][j + 1][15]]
                                            segLocstep = [BNodeval[i][j][15], BNodeval[i][j][15] + s,
                                                          BNodeval[i][j + 1][15]]
                                            Dgs = [BNodeval[i][j][9], BNodeval[i][j + 1][9]]
                                            dts = [BNodeval[i][j][11], BNodeval[i][j + 1][11]]
                                            hgs = [BNodeval[i][j][12], BNodeval[i][j + 1][12]]
                                            Afills = [BNodeval[i][j][13], BNodeval[i][j + 1][13]]

                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)
                                            # original element

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j - 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j - 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j - 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j - 1][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j - 1][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]
                                            Lb2[0] = BNodeval[i][j][15] + s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 2
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] + s

                                            p = p + 1

                                elif np.isclose(BNodeval[i][j + 1][5], BNodeval[i][j][5]) or not np.isclose(
                                        BNodeval[i][j + 1][6], BNodeval[i][j][6]) or not np.isclose(
                                    BNodeval[i][j + 1][7],
                                    BNodeval[i][j][
                                        7]) or not np.isclose(
                                    BNodeval[i][j + 1][8], BNodeval[i][j][8]) or not np.isclose(
                                    BNodeval[i][j + 1][10],
                                    BNodeval[i][j][10]):  # 19 - 2

                                    print("# 19 - 2")

                                    bfb1 = BNodeval[i][j][5]  # Bottom flange width
                                    tfb1 = BNodeval[i][j][6]  # Bottom flange thickness
                                    bft1 = BNodeval[i][j][7]  # Top flange width
                                    tft1 = BNodeval[i][j][8]  # Top flange thickness
                                    Dg1 = BNodeval[i][j][9]  # dw:Web depth (y-dir)
                                    tw1 = BNodeval[i][j][10]  # dw:Web depth (y-dir)
                                    hg1 = BNodeval[i][j][12]  # h : Distance between flange centroids

                                    bfb2 = BNodeval[i][j + 1][5]  # Bottom flange width
                                    tfb2 = BNodeval[i][j + 1][6]  # Bottom flange thickness
                                    bft2 = BNodeval[i][j + 1][7]  # Top flange width
                                    tft2 = BNodeval[i][j + 1][8]  # Top flange thickness
                                    Dg2 = BNodeval[i][j + 1][9]  # dw:Web depth (y-dir)
                                    tw2 = BNodeval[i][j + 1][10]  # dw:Web depth (y-dir)
                                    hg2 = BNodeval[i][j + 1][12]  # h : Distance between flange centroids

                                    # Shear center
                                    # Start node
                                    # bottom flange centroid to shear center
                                    hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                     (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                         np.power(
                                                                                                             bft1,
                                                                                                             3))))
                                    Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
                                    hst1 = hg1 - hsb1  # top flange centroid to shear center
                                    Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center

                                    # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
                                    # print("hsb1 = ", hsb1, "hst1 = ", hst1)

                                    # End node
                                    # bottom flange centroid to shear center
                                    hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                                                     (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2,
                                                                                                         np.power(
                                                                                                             bft2,
                                                                                                             3))))
                                    Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
                                    hst2 = hg2 - hsb2  # top flange centroid to shear center
                                    Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
                                    # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
                                    # print("hsb2 = ", hsb2, "hst2 = ", hst2)

                                    ys1 = Dg1 / 2 - Dst1
                                    ys2 = Dg2 / 2 - Dst2  # shear center

                                    s = np.abs((ys1 - ys2))  # Difference in shear center
                                    s = max(s, (max(max(bfb1, bft1), max(bfb2, bft2))) / 10)

                                    Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                    Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                    if is_step_checked:  # 22 - 1
                                        # original
                                        print("# 22 - 1")

                                        BNodevalue[i][p][0] = BNodeval[i][j][0]
                                        BNodevalue[i][p][1] = p + 1
                                        BNodevalue[i][p][2] = BNodeval[i][j][2]
                                        BNodevalue[i][p][3] = BNodeval[i][j][3]
                                        BNodevalue[i][p][4] = BNodeval[i][j][4]
                                        BNodevalue[i][p][5] = BNodeval[i][j][5]
                                        BNodevalue[i][p][6] = BNodeval[i][j][6]
                                        BNodevalue[i][p][7] = BNodeval[i][j][7]
                                        BNodevalue[i][p][8] = BNodeval[i][j][8]
                                        BNodevalue[i][p][9] = BNodeval[i][j][9]
                                        BNodevalue[i][p][10] = BNodeval[i][j][10]
                                        BNodevalue[i][p][11] = BNodeval[i][j][11]
                                        BNodevalue[i][p][12] = BNodeval[i][j][12]
                                        BNodevalue[i][p][13] = BNodeval[i][j][13]
                                        BNodevalue[i][p][14] = 1
                                        BNodevalue[i][p][15] = BNodeval[i][j][15]
                                        p = p + 1

                                    else:  # 22 - 2
                                        print("# 22 - 2")
                                        if np.greater(abs(BNodeval[i][j + 1][15] - BNodeval[i][j][15]) / 2,
                                                      s) or not np.greater(Af2, Af1):  # 23 - 1
                                            print("# 23 - 1")
                                            segLoc = [BNodeval[i][j][15], BNodeval[i][j + 1][15]]
                                            segLocstep = [BNodeval[i][j][15], (BNodeval[i][j][15] + s),
                                                          BNodeval[i][j + 1][15]]
                                            Dgs = [BNodeval[i][j][9], BNodeval[i][j + 1][9]]
                                            dts = [BNodeval[i][j][11], BNodeval[i][j + 1][11]]
                                            hgs = [BNodeval[i][j][12], BNodeval[i][j + 1][12]]
                                            Afills = [BNodeval[i][j][13], BNodeval[i][j + 1][13]]
                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)

                                            # Dgsb    = Dgsb[1]
                                            # dtsb    = dtsb[1]
                                            # hgsb    = hgsb[1]
                                            # Afillsb = Afillsb[1]

                                            # original element
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1
                                            # add step element
                                            # Rotation

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]

                                            Lb2[0] = BNodeval[i][j][15] + s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j + 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j + 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j + 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j + 1][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j + 1][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 3
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] + s
                                            p = p + 1

                                        elif np.greater(abs(BNodeval[i][j + 1][15] - BNodeval[i][j][15]) / 2,
                                                        s) and np.greater_equal(Af1, Af2):  # 23 - 2
                                            print("# 23 - 2")
                                            segLoc = [BNodeval[i][j - 1][15], BNodeval[i][j][15]]
                                            segLocstep = [BNodeval[i][j - 1][15], BNodeval[i][j][15] - s,
                                                          BNodeval[i][j][15]]
                                            Dgs = [BNodeval[i][j - 1][9], BNodeval[i][j][9]]
                                            dts = [BNodeval[i][j - 1][11], BNodeval[i][j][11]]
                                            hgs = [BNodeval[i][j - 1][12], BNodeval[i][j][12]]
                                            Afills = [BNodeval[i][j - 1][13], BNodeval[i][j][13]]

                                            Dgsb = np.interp(segLocstep, segLoc, Dgs)
                                            dtsb = np.interp(segLocstep, segLoc, dts)
                                            hgsb = np.interp(segLocstep, segLoc, hgs)
                                            Afillsb = np.interp(segLocstep, segLoc, Afills)
                                            # original element

                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                                            BNodevalue[i][p][5] = BNodeval[i][j + 1][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j + 1][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j + 1][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j + 1][8]
                                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                                            BNodevalue[i][p][10] = BNodeval[i][j + 1][10]
                                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                                            BNodevalue[i][p][14] = 1
                                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                                            p = p + 1

                                            Rz = np.zeros((3, 3))
                                            Rz[0][0] = np.cos(alpharef[i, 1])
                                            Rz[0][1] = -np.sin(alpharef[i, 1])
                                            Rz[1][0] = np.sin(alpharef[i, 1])
                                            Rz[1][1] = np.cos(alpharef[i, 1])
                                            Rz[2][2] = 1

                                            Lb2 = np.zeros(3)
                                            Additive = np.zeros(3)
                                            Additive[0] = JNodevalue_i[i][2]
                                            Additive[1] = JNodevalue_i[i][3]
                                            Additive[2] = JNodevalue_i[i][4]
                                            Lb2[0] = BNodeval[i][j][15] - s
                                            Lb2 = np.dot(Rz, Lb2) + Additive

                                            BNodevalue = np.insert(BNodevalue, p, 0, axis=1)
                                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                                            BNodevalue[i][p][1] = p + 1
                                            BNodevalue[i][p][2] = Lb2[0]
                                            BNodevalue[i][p][3] = Lb2[1]
                                            BNodevalue[i][p][4] = Lb2[2]
                                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                                            BNodevalue[i][p][9] = Dgsb[1]
                                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                                            BNodevalue[i][p][11] = dtsb[1]
                                            BNodevalue[i][p][12] = hgsb[1]
                                            BNodevalue[i][p][13] = Afillsb[1]
                                            BNodevalue[i][p][14] = 3
                                            BNodevalue[i][p][15] = BNodeval[i][j][15] - s

                                            p = p + 1
                                else:  # other than the internal nodes # 19 - 3
                                    print("# 19 - 3")
                                    BNodevalue[i][p][0] = BNodeval[i][j][0]
                                    BNodevalue[i][p][1] = p + 1
                                    BNodevalue[i][p][2] = BNodeval[i][j][2]
                                    BNodevalue[i][p][3] = BNodeval[i][j][3]
                                    BNodevalue[i][p][4] = BNodeval[i][j][4]
                                    BNodevalue[i][p][5] = BNodeval[i][j][5]
                                    BNodevalue[i][p][6] = BNodeval[i][j][6]
                                    BNodevalue[i][p][7] = BNodeval[i][j][7]
                                    BNodevalue[i][p][8] = BNodeval[i][j][8]
                                    BNodevalue[i][p][9] = BNodeval[i][j][9]
                                    BNodevalue[i][p][10] = BNodeval[i][j][10]
                                    BNodevalue[i][p][11] = BNodeval[i][j][11]
                                    BNodevalue[i][p][12] = BNodeval[i][j][12]
                                    BNodevalue[i][p][13] = BNodeval[i][j][13]
                                    BNodevalue[i][p][14] = 1
                                    BNodevalue[i][p][15] = BNodeval[i][j][15]
                                    p = p + 1

                        else:  # 1 - 2
                            print("# 1 - 2")
                            # print('BNodevalue in # 1 - 2 = ', BNodevalue)
                            # print('BNodeval in # 1 - 2 = ', BNodeval)
                            # print('i # 1 - 2 = ', i, '\nj # 1 - 2 = ', j, '\np # 1 - 2 = ', p)
                            BNodevalue[i][p][0] = BNodeval[i][j][0]
                            BNodevalue[i][p][1] = p + 1
                            BNodevalue[i][p][2] = BNodeval[i][j][2]
                            BNodevalue[i][p][3] = BNodeval[i][j][3]
                            BNodevalue[i][p][4] = BNodeval[i][j][4]
                            BNodevalue[i][p][5] = BNodeval[i][j][5]
                            BNodevalue[i][p][6] = BNodeval[i][j][6]
                            BNodevalue[i][p][7] = BNodeval[i][j][7]
                            BNodevalue[i][p][8] = BNodeval[i][j][8]
                            BNodevalue[i][p][9] = BNodeval[i][j][9]
                            BNodevalue[i][p][10] = BNodeval[i][j][10]
                            BNodevalue[i][p][11] = BNodeval[i][j][11]
                            BNodevalue[i][p][12] = BNodeval[i][j][12]
                            BNodevalue[i][p][13] = BNodeval[i][j][13]
                            BNodevalue[i][p][14] = 1
                            BNodevalue[i][p][15] = BNodeval[i][j][15]
                            p = p + 1

            # ADD Step E
            # Sorting S
            # print('BNodevalue after if conditions = ', BNodevalue)
            L0 = BNodevalue  # Initial Data Set
            # Distance from i node
            # print('mem = ', mem)
            for i in range(mem):
                if not np.isclose(np.amax(BNodevalue[i, :, 1]), 0):
                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        dX0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))
                        dY0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))
                        dZ0 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 1))

                        for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                            dX0[j][0] = JNodevalue_i[i][2] - BNodevalue[i][j][2]
                            dY0[j][0] = JNodevalue_i[i][3] - BNodevalue[i][j][3]
                            dZ0[j][0] = JNodevalue_i[i][4] - BNodevalue[i][j][4]
                            L0[i][j][15] = np.sqrt((dX0[j][0]) ** 2 + (dY0[j][0]) ** 2 + (dZ0[j][0]) ** 2)

            # Sort whole columns with respect to distance from i node
            # print('L0 = ', L0)
            BNodevalueOrder = BNodevalue

            # print("L1 = ", L1)
            # print("L0 = ", L0)
            for i in range(mem):
                L1 = np.zeros((int(np.amax(BNodevalue[i, :, 1])), 16))
                for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                    # print('test = ', L0[i][j][:])
                    L1[j][:] = L0[i][j][:]
                    # print('L1 = ', L1)

                L1 = L1[L1[:,15].argsort()]
                # print("L1 = ", L1)

                for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                    for k in range(16):
                        BNodevalueOrder[i][j][k] = L1[j][k]

            del(L1)

            # print('test bnode end =', BNodevalueOrder)
            BNodevalue = BNodevalueOrder

            # print("BNodevalue at the end in conditions = ", BNodevalue)

        return BNodevalue

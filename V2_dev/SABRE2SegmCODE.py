import numpy as np

import SABRE2_GUI


class ClassA(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(ClassA, self).__init__(parent)
        self.ui = ui_layout

    def MassembleUpdater(self):
        import SABRE2_main_subclass
        Massemble = SABRE2_main_subclass.SABRE2_main_subclass.m_assemble_updater(self, self.ui.Members_table,
                                                                                 flag="OpenGL")
        return Massemble

    def memberTableValues(self):

        import SABRE2_main_subclass
        member_values, JNodeValues_i, JNodeValues_j, _, BNodevalue, flag_mem_values, Rval = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self, self.ui.Members_table, 3)
        member_count = member_values.shape[0]
        return member_count, member_values, JNodeValues_i, JNodeValues_j, BNodevalue, Rval

    def BNodevalueUpdater(self):
        Massemble = self.MassembleUpdater()
        _, _, JNodevalue_i, JNodevalue_j, BNodevalue, _ = ClassA.memberTableValues(self)
        mem = Massemble[:][1].shape[0]
        L0 = BNodevalue
        for i in range(mem):
            if np.amax(BNodevalue[i][:][1]) != 0:  # No Bracing
                dX0 = np.zeros((np.amax(BNodevalue[i][:][1])), 1)
                dY0 = np.zeros((np.amax(BNodevalue[i][:][1])), 1)
                dZ0 = np.zeros((np.amax(BNodevalue[i][:][1])), 1)

                for j in range(np.amax(BNodevalue[i][:][1])):
                    dX0[j][0] = JNodevalue_i[i][2] - BNodevalue[i][j][2]
                    dY0[j][0] = JNodevalue_i[i][3] - BNodevalue[i][j][3]
                    dZ0[j][0] = JNodevalue_i[i][4] - BNodevalue[i][j][4]
                    L0[i][j][15] = np.sqrt((dX0[j][0]) ** 2 + (dY0[j][0]) ** 2 + (dZ0[j][0]) ** 2)

        BNodevalueOrder = np.zeros((mem, 1, 2))
        L1 = np.zeros((np.amax(BNodevalue[i][:][1]), 16))
        for i in range(mem):
            if np.amax(BNodevalue[i][:][1]) == 0:
                BNodevalueOrder[i][0][1] = L0[i][0][1]
                BNodevalueOrder[i][0][1] = L0[i][0][1]
            else:
                for j in range(np.amax(BNodevalue[i][:][1])):
                    L1[j][:] = L0[i][j][:]

                L1 = L0[L0[:, 0].argsort(),]

                for j in range(np.amax(BNodevalue[i][:][1])):
                    for k in range(16):
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
            alpharef[i][0] = i
            alpharef[i][1] = np.arctan2((opp, adj))  # only global frame angle

        ###############################
        #### Add Stepped Elements #####
        ###############################

        for i in range(mem):
            if np.amax(BNodeval[i][:][1]) != 0:  # No Bracing
                p = 1
                for j in range(np.amax(BNodeval[i][:][1])):
                    BNodevalue = np.zeros((mem,p))
                    if np.isclose(coord_x, BNodeval[i][j][2]) and np.isclose(coord_y, BNodeval[i][j][3]) and np.isclose(
                            coord_x, BNodeval[i][j][4]):
                        if np.isclose(j, 0):
                            if np.isclose(np.amax(BNodeval[i][:][1]), 1):  # be careful with indexing
                                if not np.isclose(JNodevalue_i[i][5], BNodeval[i][j][5]) or not np.isclose(
                                        JNodevalue_i[i][6], BNodeval[i][j][6]) or not np.isclose(JNodevalue_i[i][7],
                                                                                                 BNodeval[i][j][
                                                                                                     7]) or not np.isclose(
                                    JNodevalue_i[i][8], BNodeval[i][j][8]) or not np.isclose(JNodevalue_i[i][10],
                                                                                             BNodeval[i][j][10]):
                                    bfb1 = JNodevalue_i[i][5]  # Bottom flange width
                                    tfb1 = JNodevalue_i[i][6]  # Bottom flange thickness
                                    bft1 = JNodevalue_i[i][7]  # Top flange width
                                    tft1 = JNodevalue_i[i][8]  # Top flange thickness
                                    Dg1 = JNodevalue_i[i][9]  # dw:Web depth (y-dir)
                                    tw1 = JNodevalue_i[i][10]  # dw:Web depth (y-dir)
                                    hg1 = JNodevalue_i[i][12]  # h : Distance between flange centroids

                                    bfb2 = BNodeval[i][5]  # Bottom flange width
                                    tfb2 = BNodeval[i][6]  # Bottom flange thickness
                                    bft2 = BNodeval[i][7]  # Top flange width
                                    tft2 = BNodeval[i][8]  # Top flange thickness
                                    Dg2 = BNodeval[i][9]  # dw:Web depth (y-dir)
                                    tw2 = BNodeval[i][10]  # dw:Web depth (y-dir)
                                    hg2 = BNodeval[i][12]  # h : Distance between flange centroids

                                    # Shear center
                                    # Start node
                                    # bottom flange centroid to shear center
                                    hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                                                     (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1,
                                                                                                         np.power(bft1,
                                                                                                                  3))))
                                    Dsb1 = hsb1 - tfb1 / 2 # bottom of Web depth to shear center
                                    hst1 = hg1 - hsb1 # top flange centroid to shear center
                                    Dst1 = hst1 - tft1 / 2 # top of Web depth to shear center

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
                                    s = np.amax(s, (np.amax(np.amax(bfb1, bft1), np.amax(bfb2, bft2))) / 10)

                                    Af1 = bfb1 * tfb1 + bft1 * tft1 + tw1
                                    Af2 = bfb2 * tfb2 + bft2 * tft2 + tw2

                                    L = np.sqrt(((JNodevalue_j[i][2] - JNodevalue_i[i][2]) ** 2 + (
                                            JNodevalue_j[i][3] - JNodevalue_i[i][3]) ** 2 + (
                                                         JNodevalue_j[i][4] - JNodevalue_i[i][4]) ** 2))

                                    if self.ui.StepRB1.isChecked():
                                        #original element
                                        BNodevalue




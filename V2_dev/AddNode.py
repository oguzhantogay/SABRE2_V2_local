from PyQt4.QtGui import *
# from scipy.interpolate import interpld
from PyQt4 import QtCore
from PyQt4 import QtGui
import SABRE2_GUI
import sqlite3 as sq
import numpy as np


class AddNodeClass(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(AddNodeClass, self).__init__(parent)
        self.ui = ui_layout
        AddNodeClass.btnChecked = False
        AddNodeClass.setComboBoxValues = None
        AddNodeClass.additionalNodeNumber = 1

    def setAddNodeComboBox(self):
        row = self.ui.Members_table.rowCount()
        if row == 1:
            pass
        else:
            a = list(range(1, row + 1))
            for e in range(len(a)):
                a[e] = str(a[e])
            print("a = ", a)
            self.ui.AddNodeMember.clear()
            self.ui.AddNodeMember.addItems(a)

    def radioButtonState1(self):
        AddNodeClass.btnChecked = self.ui.StepRB1.isChecked()
        print("step =", AddNodeClass.btnChecked)

    def radioButtonState2(self):
        AddNodeClass.btnChecked = self.ui.StepRB1.isChecked()
        print("no step =", AddNodeClass.btnChecked)

    def memberTableValues(self):

        import SABRE2_main_subclass
        member_values, JNodeValues_i, JNodeValues_j, _, BNodevalue, flag_mem_values, Rval = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self, self.ui.Members_table, 3)
        member_count = member_values.shape[0]
        return member_count, member_values, JNodeValues_i, JNodeValues_j, BNodevalue, Rval

    def MassembleUpdater(self):
        import SABRE2_main_subclass
        Massemble = SABRE2_main_subclass.SABRE2_main_subclass.m_assemble_updater(self, self.ui.Members_table,
                                                                                 flag="OpenGL")
        return Massemble

    def fillTable(self):
        mnum = int(self.ui.AddNodeMember.currentIndex())
        seglength = self.ui.AddNodePositionFrom.text()

        member_count, member_values, JNodevalue_i, JNodevalue_j, BNodevalue, Rval = AddNodeClass.memberTableValues(self)
        if BNodevalue[mnum][0][1] == 0:
            seL = np.sqrt((JNodevalue_i[mnum][2] - JNodevalue_j[mnum][2]) ** 2 + (
                    JNodevalue_i[mnum][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                  JNodevalue_i[mnum][4] - JNodevalue_j[mnum][4]) ** 2)

            segLoc = np.zeros((1, 2))
            segLocstep = np.zeros((1, 3))
            segLoc[0][1] = seL
            segLocstep[0][1] = seglength
            segLocstep[0][2] = seL

            # print("seglength = ", seglength, "\n", "segLoc = ", segLoc, "\n", "segLocstep = ", segLocstep)
            # print("BNodeValue = ", BNodevalue)

            bfbs = (JNodevalue_i[mnum][5], JNodevalue_j[mnum][5])
            tfbs = (JNodevalue_i[mnum][6], JNodevalue_j[mnum][6])
            bfts = (JNodevalue_i[mnum][7], JNodevalue_j[mnum][7])
            tfts = (JNodevalue_i[mnum][8], JNodevalue_j[mnum][8])
            dws = (JNodevalue_i[mnum][9], JNodevalue_j[mnum][9])
            tws = (JNodevalue_i[mnum][10], JNodevalue_j[mnum][10])
            Afills = (JNodevalue_i[mnum][13], JNodevalue_j[mnum][13])
        else:
            ntap = 0
            for i in range(max(BNodevalue[mnum][:][1])):
                if seglength > BNodevalue[mnum][i][15]:
                    ntap = int(i)

            if max(BNodevalue[mnum][:][1]) == 1:
                if ntap == 0:
                    seL = np.sqrt((JNodevalue_i[mnum][2] - BNodevalue[mnum][ntap + 1][2]) ** 2 + (
                            JNodevalue_i[mnum][3] - BNodevalue[mnum][ntap + 1][3]) ** 2 + (JNodevalue_i[mnum][4] -
                                                                                           BNodevalue[mnum][ntap + 1][
                                                                                               4]) ** 2)

                    segLoc = np.zeros((1, 2))
                    segLocstep = np.zeros((1, 3))
                    segLoc[0][1] = seL
                    segLocstep[0][1] = seglength
                    segLocstep[0][2] = seL

                    bfbs = (JNodevalue_i[mnum][5], BNodevalue[mnum][ntap + 1][5])
                    tfbs = (JNodevalue_i[mnum][6], BNodevalue[mnum][ntap + 1][6])
                    bfts = (JNodevalue_i[mnum][7], BNodevalue[mnum][ntap + 1][7])
                    tfts = (JNodevalue_i[mnum][8], BNodevalue[mnum][ntap + 1][8])
                    dws = (JNodevalue_i[mnum][9], BNodevalue[mnum][ntap + 1][9])
                    tws = (JNodevalue_i[mnum][10], BNodevalue[mnum][ntap + 1][10])
                    Afills = (JNodevalue_i[mnum][13], BNodevalue[mnum][ntap + 1][13])
                else:
                    seL = np.sqrt((BNodevalue[mnum][ntap][2] - JNodevalue_j[mnum][2]) ** 2 + (
                            BNodevalue[mnum][ntap][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                          BNodevalue[mnum][ntap][4] - JNodevalue_j[mnum][4]) ** 2)

                    segLoc = np.zeros((1, 2))
                    segLocstep = np.zeros((1, 3))
                    segLoc[0][1] = seL
                    segLocstep[0][1] = seglength - BNodevalue[mnum][ntap][15]
                    segLocstep[0][2] = seL

                    bfbs = (BNodevalue[mnum][ntap][5], JNodevalue_j[mnum][5])
                    tfbs = (BNodevalue[mnum][ntap][6], JNodevalue_j[mnum][6])
                    bfts = (BNodevalue[mnum][ntap][7], JNodevalue_j[mnum][7])
                    tfts = (BNodevalue[mnum][ntap][8], JNodevalue_j[mnum][8])
                    dws = (BNodevalue[mnum][ntap][9], JNodevalue_j[mnum][9])
                    tws = (BNodevalue[mnum][ntap][10], JNodevalue_j[mnum][10])
                    Afills = (BNodevalue[mnum][ntap][13], JNodevalue_j[mnum][13])
            else:
                if ntap == 0:
                    seL = np.sqrt((JNodevalue_i[mnum][2] - BNodevalue[mnum][ntap + 1][2]) ** 2 + (
                            JNodevalue_i[mnum][3] - BNodevalue[mnum][ntap + 1][3]) ** 2 + (JNodevalue_i[mnum][4] -
                                                                                           BNodevalue[mnum][ntap + 1][
                                                                                               4]) ** 2)

                    segLoc = np.zeros((1, 2))
                    segLocstep = np.zeros((1, 3))
                    segLoc[0][1] = seL
                    segLocstep[0][1] = seglength
                    segLocstep[0][2] = seL

                    bfbs = (JNodevalue_i[mnum][5], BNodevalue[mnum][ntap + 1][5])
                    tfbs = (JNodevalue_i[mnum][6], BNodevalue[mnum][ntap + 1][6])
                    bfts = (JNodevalue_i[mnum][7], BNodevalue[mnum][ntap + 1][7])
                    tfts = (JNodevalue_i[mnum][8], BNodevalue[mnum][ntap + 1][8])
                    dws = (JNodevalue_i[mnum][9], BNodevalue[mnum][ntap + 1][9])
                    tws = (JNodevalue_i[mnum][10], BNodevalue[mnum][ntap + 1][10])
                    Afills = (JNodevalue_i[mnum][13], BNodevalue[mnum][ntap + 1][13])
                elif ntap == max(BNodevalue[mnum][:][1]):
                    seL = np.sqrt((BNodevalue[mnum][ntap][2] - JNodevalue_j[mnum][2]) ** 2 + (
                            BNodevalue[mnum][ntap][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                          BNodevalue[mnum][ntap][4] - JNodevalue_j[mnum][4]) ** 2)

                    segLoc = np.zeros((1, 2))
                    segLocstep = np.zeros((1, 3))
                    segLoc[0][1] = seL
                    segLocstep[0][1] = seglength - BNodevalue[mnum][ntap][15]
                    segLocstep[0][2] = seL

                    bfbs = (BNodevalue[mnum][ntap][5], JNodevalue_j[mnum][5])
                    tfbs = (BNodevalue[mnum][ntap][6], JNodevalue_j[mnum][6])
                    bfts = (BNodevalue[mnum][ntap][7], JNodevalue_j[mnum][7])
                    tfts = (BNodevalue[mnum][ntap][8], JNodevalue_j[mnum][8])
                    dws = (BNodevalue[mnum][ntap][9], JNodevalue_j[mnum][9])
                    tws = (BNodevalue[mnum][ntap][10], JNodevalue_j[mnum][10])
                    Afills = (BNodevalue[mnum][ntap][13], JNodevalue_j[mnum][13])
                else:
                    seL = np.sqrt((BNodevalue[mnum][ntap][2] - BNodevalue[mnum][ntap + 1][2]) ** 2 + (
                            BNodevalue[mnum][ntap][3] - BNodevalue[mnum][ntap + 1][3]) ** 2 + (
                                          BNodevalue[mnum][ntap][4] - BNodevalue[mnum][ntap + 1][4]) ** 2)
                    segLoc = np.zeros((1, 2))
                    segLocstep = np.zeros((1, 3))
                    segLoc[0][1] = seL
                    segLocstep[0][1] = seglength - BNodevalue[mnum][ntap][15]
                    segLocstep[0][2] = seL

                    bfbs = (BNodevalue[mnum][ntap][5], BNodevalue[mnum][ntap + 1][5])
                    tfbs = (BNodevalue[mnum][ntap][6], BNodevalue[mnum][ntap + 1][6])
                    bfts = (BNodevalue[mnum][ntap][7], BNodevalue[mnum][ntap + 1][7])
                    tfts = (BNodevalue[mnum][ntap][8], BNodevalue[mnum][ntap + 1][8])
                    dws = (BNodevalue[mnum][ntap][9], BNodevalue[mnum][ntap + 1][9])
                    tws = (BNodevalue[mnum][ntap][10], BNodevalue[mnum][ntap + 1][10])
                    Afills = (BNodevalue[mnum][ntap][13], BNodevalue[mnum][ntap + 1][13])

        # print("bfbsb = ", bfbs)
        # print("tfbsb = ", tfbs)
        # print("bftsb = ", bfts)
        # print("tftsb = ", tfts)
        # print("dwsb = ", dws)
        # print("twsb = ", tws)
        # print("Afillsb = ", Afills)
        segLoc = segLoc[0][:]
        segLocstep = segLocstep[0][:]

        # print("segLoc = ", segLoc, "\n", "segLocstep = ", segLocstep)

        bfbsb = np.interp(segLocstep, segLoc, bfbs)
        tfbsb = np.interp(segLocstep, segLoc, tfbs)
        bftsb = np.interp(segLocstep, segLoc, bfts)
        tftsb = np.interp(segLocstep, segLoc, tfts)
        dwsb = np.interp(segLocstep, segLoc, dws)
        twsb = np.interp(segLocstep, segLoc, tws)
        Afillsb = np.interp(segLocstep, segLoc, Afills)

        bfbsb = bfbsb[1]
        tfbsb = tfbsb[1]
        bftsb = bftsb[1]
        tftsb = tftsb[1]
        dwsb = dwsb[1]
        twsb = twsb[1]
        Afillsb = Afillsb[1]

        # print("bfbsb = ", bfbsb)
        # print("tfbsb = ", tfbsb)
        # print("bftsb = ", bftsb)
        # print("tftsb = ", tftsb)
        # print("dwsb = ", dwsb)
        # print("twsb = ", twsb)
        # print("Afillsb = ", Afillsb)
        tableName = self.ui.AddNodeTable
        item = QTableWidgetItem(str(bfbsb))
        tableName.setItem(0, 0, item)
        item = QTableWidgetItem(str(tfbsb))
        tableName.setItem(0, 1, item)
        item = QTableWidgetItem(str(bftsb))
        tableName.setItem(0, 2, item)
        item = QTableWidgetItem(str(tftsb))
        tableName.setItem(0, 3, item)
        item = QTableWidgetItem(str(dwsb))
        tableName.setItem(0, 4, item)
        item = QTableWidgetItem(str(twsb))
        tableName.setItem(0, 5, item)
        item = QTableWidgetItem(str(Afillsb))
        tableName.setItem(0, 6, item)

    def sql_print(self):
        tableName = self.ui.AddNodeTable
        conn = sq.connect('AISC_data.db')
        c = conn.cursor()
        row = 0
        import DropDownActions

        cross_section = str(self.ui.AISC_database_button_2.currentText())
        try:
            variable_names = ["bf", "tf", "d", "tw", "A", "W", "Ix", "Zx", "Sx", "rx", "Iy", "Zy", "Sy", "ry",
                              "J",
                              "Cw", "dw", "Afillet"]

            table_prop = np.zeros((1, 18))

            for i in range(len(variable_names)):
                c.execute('SELECT ' + variable_names[i] + ' FROM records WHERE "AISC_Manual_Label" = ?',
                          (cross_section,))
                var1 = c.fetchall()
                var1 = var1[0]
                table_prop[0, i] = var1[0]
            # print(cross_section, 'cs_properties = ', table_prop)
            # table values assignment
            for i in range(7):
                if i == 0 or i == 2:
                    tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 0])))
                elif i == 1 or i == 3:
                    tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 1])))
                elif i == 4:
                    tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 16])))
                elif i == 5:
                    tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 3])))
                else:
                    tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 17])))
        except IndexError:
            DropDownActions.ActionClass.statusMessage(self, message="Please select the cross-section name!")


    def ApplyButton(self):
        mnum = self.ui.AddNodeMember.currentIndex()
        nbnode = AddNodeClass.


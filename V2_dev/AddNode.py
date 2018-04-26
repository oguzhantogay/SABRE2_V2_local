from PyQt4.QtGui import *
from OpenGL.GL import *
from PyQt4 import QtGui
import DropDownActions
import sqlite3 as sq
import numpy as np
import h5_file
import Assign_Member_Properties

from PyQt4.QtOpenGL import *

class AddNodeClass(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(AddNodeClass, self).__init__(parent)
        self.ui = ui_layout
        AddNodeClass.btnChecked = False
        AddNodeClass.setComboBoxValues = None
        AddNodeClass.additionalNodeNumber = 1
        AddNodeClass.apply_button_pressed = False
        AddNodeClass.added_node_information = np.zeros((int(self.ui.AddNodeMember.count()), 2))

    def setAddNodeComboBox(self):
        row = self.ui.Members_table.rowCount()
        added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
        # print('added node info set add  = ', added_node_information)
        number_of_added_node = int(added_node_information[0][1])

        if row == 1:

            # print('set combo box if 1 ')

            if number_of_added_node == 0:
                pass
            else:
                b = list(range(1, number_of_added_node))
                for e in range(len(b)):
                    b[e] = str(b[e])
                self.ui.AdditionalNodeNumberComboBox.clear()
                self.ui.AdditionalNodeNumberComboBox.addItems(b)
        else:

            # print('set combo box else 1 ')

            a = list(range(1, row + 1))

            for e in range(len(a)):
                a[e] = str(a[e])

            # print("a = ", a)
            self.ui.AddNodeMember.clear()
            self.ui.AddNodeMember.addItems(a)
            if number_of_added_node == 0:
                pass
            else:
                b = list(range(1, number_of_added_node))
                for e in range(len(b)):
                    b[e] = str(b[e])
                self.ui.AdditionalNodeNumberComboBox.clear()
                self.ui.AdditionalNodeNumberComboBox.addItems(a)


    def addedNodeInformationArrayUpdate(self, BNodevalue):
        # print('added node information runs')
        current_added_node_number = 0
        # print('Bnode = ', BNodevalue)
        total_member_number = BNodevalue.shape[0]
        added_node_information = np.zeros((total_member_number, 2))

        for i in range(total_member_number):
            added_node_information[i][0] = i + 1
            added_node_information[i][1] = np.amax(BNodevalue[i, :, 1])
        current_member = int(self.ui.AddNodeMember.currentIndex())
        for j in range(BNodevalue.shape[1]):
            if BNodevalue[current_member][j][1] != 0:
                current_added_node_number += 1
        # print('0 = ', BNodevalue.shape[0], '1 = ',BNodevalue.shape[1])
        # print('current added number = ', current_added_node_number)
        # print('added node information = ', added_node_information)

        added_node_information[current_member][1] = current_added_node_number
        # print('added node info1 = ', added_node_information.shape[0], self.ui.Members_table.rowCount())
        if added_node_information.shape[0] < self.ui.Members_table.rowCount():
            # print('test213')
            added_node_information = np.append(added_node_information, [[self.ui.Members_table.rowCount(), 0]], axis=0)
        elif added_node_information.shape[0] == self.ui.Members_table.rowCount():
            pass
        else:
            added_node_information = np.delete(added_node_information, added_node_information.shape[0] - 1, 0)

        # print('added node info before for = ', added_node_information)
        for i in range(int(self.ui.AddNodeMember.count())):
            added_node_information[i][0] = i + 1
        # print(' member_count = ',added_node_information )
        h5_file.h5_Class.update_array(self, added_node_information, 'added_node_information')
        AddNodeClass.setAddedNodeComboBox(self)
        # print('added node information = ', added_node_information)


    def setAddedNodeComboBox(self):

        current_member = int(self.ui.AddNodeMember.currentIndex())
        added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
        added_node_count = added_node_information[current_member][1]
        # print('added node array =', added_node_information)
        # print('current_member = ', current_member, 'added node count = ', added_node_count)

        if current_member == -1:
            pass
        else:

            if added_node_count == 0:
                self.ui.AdditionalNodeNumberComboBox.clear()
            else:
                list_items = list(range(1, int(added_node_count+1)))

                for e in range(len(list_items)):
                    list_items[e] = str(list_items[e])
                # print('list items = ', list_items)
                self.ui.AdditionalNodeNumberComboBox.clear()
                self.ui.AdditionalNodeNumberComboBox.addItems(list_items)

    def memberTableValues(self):

        import SABRE2_main_subclass
        member_values, JNodeValues_i, JNodeValues_j, _, BNodevalue, flag_mem_values, Rval= SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self, self.ui.Members_table, 3)
        # mnum = int(self.ui.AddNodeMember.currentIndex())
        # if flag_mem_values[mnum][1] == 1 and self.ui.AddNodeTable.item(0,0) is None:
        #     bfbs = (JNodeValues_i[mnum][5])
        #     tfbs = (JNodeValues_i[mnum][6])
        #     bfts = (JNodeValues_i[mnum][7])
        #     tfts = (JNodeValues_i[mnum][8])
        #     dws = (JNodeValues_i[mnum][9])
        #     tws = (JNodeValues_i[mnum][10])
        #     Afills = (JNodeValues_i[mnum][13])
        #
        #     tableName = self.ui.AddNodeTable
        #     validatorDouble = QDoubleValidator()
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(bfbs))
        #     tableName.setCellWidget(0, 0, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(tfbs))
        #     tableName.setCellWidget(0, 1, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(bfts))
        #     tableName.setCellWidget(0, 2, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(tfts))
        #     tableName.setCellWidget(0, 3, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(dws))
        #     tableName.setCellWidget(0, 4, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(tws))
        #     tableName.setCellWidget(0, 5, item)
        #     item = QLineEdit()
        #     item.setFrame(False)
        #     item.setValidator(validatorDouble)
        #     item.setText(str(Afills))
        #     tableName.setCellWidget(0, 6, item)
        return member_values, JNodeValues_i, JNodeValues_j, BNodevalue,flag_mem_values, Rval

    def addNodeTableInitiation(self):
        _, JNodeValues_i, _, _, flag_mem_values,_ = AddNodeClass.memberTableValues(self)
        mnum = int(self.ui.AddNodeMember.currentIndex())
        if self.ui.AddNodeTable.cellWidget(0, 0).text() == '':
            bfbs = (JNodeValues_i[mnum][5])
            tfbs = (JNodeValues_i[mnum][6])
            bfts = (JNodeValues_i[mnum][7])
            tfts = (JNodeValues_i[mnum][8])
            dws = (JNodeValues_i[mnum][9])
            tws = (JNodeValues_i[mnum][10])
            Afills = (JNodeValues_i[mnum][13])

            tableName = self.ui.AddNodeTable
            validatorDouble = QDoubleValidator()
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(bfbs))
            tableName.setCellWidget(0, 0, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(tfbs))
            tableName.setCellWidget(0, 1, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(bfts))
            tableName.setCellWidget(0, 2, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(tfts))
            tableName.setCellWidget(0, 3, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(dws))
            tableName.setCellWidget(0, 4, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(tws))
            tableName.setCellWidget(0, 5, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(Afills))
            tableName.setCellWidget(0, 6, item)

    def comboBoxChanged(self):

        _, JNodeValues_i, _, _, _, _= AddNodeClass.memberTableValues(self)
        mnum = int(self.ui.AddNodeMember.currentIndex())

        bfbs = (JNodeValues_i[mnum][5])
        tfbs = (JNodeValues_i[mnum][6])
        bfts = (JNodeValues_i[mnum][7])
        tfts = (JNodeValues_i[mnum][8])
        dws = (JNodeValues_i[mnum][9])
        tws = (JNodeValues_i[mnum][10])
        Afills = (JNodeValues_i[mnum][13])

        tableName = self.ui.AddNodeTable
        validatorDouble = QDoubleValidator()
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(bfbs))
        tableName.setCellWidget(0, 0, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(tfbs))
        tableName.setCellWidget(0, 1, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(bfts))
        tableName.setCellWidget(0, 2, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(tfts))
        tableName.setCellWidget(0, 3, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(dws))
        tableName.setCellWidget(0, 4, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(tws))
        tableName.setCellWidget(0, 5, item)
        item = QLineEdit()
        item.setFrame(False)
        item.setValidator(validatorDouble)
        item.setText(str(Afills))
        tableName.setCellWidget(0, 6, item)

    def MassembleUpdater(self):
        import SABRE2_main_subclass
        members_table, _, _, _, _, _, _ = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(self,self.ui.Members_table,3)
        member_assembly = members_table[:,:3]
        return member_assembly

    def fillTable(self):
        mnum = int(self.ui.AddNodeMember.currentIndex())
        seglength = float(self.ui.AddNodePositionFrom.text())
        if seglength == '':
            pass
        else:
            BNodevalue_read = h5_file.h5_Class.read_array(self,'BNodevalue')
            member_values, JNodevalue_i, JNodevalue_j, BNodevalue, _, _ = AddNodeClass.memberTableValues(self)
            if BNodevalue_read.shape[2] > BNodevalue.shape[2]:
                BNodevalue = BNodevalue_read
            if BNodevalue[mnum][0][1] == 0:
                print('if_1')
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
                print('else_1')
                # print("seglength = ", seglength)
                ntap = 0
                for i in range(int(max(BNodevalue[mnum, :, 1]))):
                    if seglength > BNodevalue[mnum][i][15]:
                        print('if_2')
                        ntap = int(i) + 1

                # print('ntap = ', ntap)

                if int(max(BNodevalue[mnum, :, 1])) == 1:
                    print('if_3')
                    if ntap == 0:
                        print('if_4')
                        # print('i = ', i, 'mnum = ', mnum, )
                        seL = np.sqrt((JNodevalue_i[mnum][2] - BNodevalue[mnum][ntap][2]) ** 2 + (
                                JNodevalue_i[mnum][3] - BNodevalue[mnum][ntap][3]) ** 2 + (JNodevalue_i[mnum][4] -
                                                                                               BNodevalue[mnum][
                                                                                                   ntap][
                                                                                                   4]) ** 2)

                        segLoc = np.zeros((1, 2))
                        segLocstep = np.zeros((1, 3))
                        segLoc[0][1] = seL
                        segLocstep[0][1] = seglength
                        segLocstep[0][2] = seL

                        bfbs = (JNodevalue_i[mnum][5], BNodevalue[mnum][ntap][5])
                        tfbs = (JNodevalue_i[mnum][6], BNodevalue[mnum][ntap][6])
                        bfts = (JNodevalue_i[mnum][7], BNodevalue[mnum][ntap][7])
                        tfts = (JNodevalue_i[mnum][8], BNodevalue[mnum][ntap][8])
                        dws = (JNodevalue_i[mnum][9], BNodevalue[mnum][ntap][9])
                        tws = (JNodevalue_i[mnum][10], BNodevalue[mnum][ntap][10])
                        Afills = (JNodevalue_i[mnum][13], BNodevalue[mnum][ntap][13])
                    else:
                        print('else_4')
                        seL = np.sqrt((BNodevalue[mnum][ntap - 1][2] - JNodevalue_j[mnum][2]) ** 2 + (
                                BNodevalue[mnum][ntap - 1][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                              BNodevalue[mnum][ntap- 1][4] - JNodevalue_j[mnum][4]) ** 2)

                        segLoc = np.zeros((1, 2))
                        segLocstep = np.zeros((1, 3))
                        segLoc[0][1] = seL
                        segLocstep[0][1] = seglength - BNodevalue[mnum][ntap - 1][15]
                        segLocstep[0][2] = seL

                        bfbs =   (BNodevalue[mnum][ntap - 1][5], JNodevalue_j[mnum][5])
                        tfbs =   (BNodevalue[mnum][ntap - 1][6], JNodevalue_j[mnum][6])
                        bfts =   (BNodevalue[mnum][ntap - 1][7], JNodevalue_j[mnum][7])
                        tfts =   (BNodevalue[mnum][ntap - 1][8], JNodevalue_j[mnum][8])
                        dws =    (BNodevalue[mnum][ntap - 1][9], JNodevalue_j[mnum][9])
                        tws =    (BNodevalue[mnum][ntap - 1][10], JNodevalue_j[mnum][10])
                        Afills = (BNodevalue[mnum][ntap - 1][13], JNodevalue_j[mnum][13])
                else:
                    print('else_3')
                    print(ntap,'\n' ,BNodevalue[mnum, :, 1],'\n', BNodevalue)
                    if ntap == 0:
                        print('if_5')
                        seL = np.sqrt((JNodevalue_i[mnum][2] - BNodevalue[mnum][ntap + 1][2]) ** 2 + (
                                JNodevalue_i[mnum][3] - BNodevalue[mnum][ntap + 1][3]) ** 2 + (JNodevalue_i[mnum][4] -
                                                                                               BNodevalue[mnum][
                                                                                                   ntap + 1][
                                                                                                   4]) ** 2)

                        segLoc = np.zeros((1, 2))
                        segLocstep = np.zeros((1, 3))
                        segLoc[0][1] = seL
                        segLocstep[0][1] = seglength
                        segLocstep[0][2] = seL

                        bfbs = (JNodevalue_i[mnum][5], BNodevalue[mnum][ntap][5])
                        tfbs = (JNodevalue_i[mnum][6], BNodevalue[mnum][ntap][6])
                        bfts = (JNodevalue_i[mnum][7], BNodevalue[mnum][ntap][7])
                        tfts = (JNodevalue_i[mnum][8], BNodevalue[mnum][ntap][8])
                        dws = (JNodevalue_i[mnum][9], BNodevalue[mnum] [ntap][9])
                        tws = (JNodevalue_i[mnum][10], BNodevalue[mnum][ntap][10])
                        Afills = (JNodevalue_i[mnum][13], BNodevalue[mnum][ntap][13])
                    elif ntap  == int(max(BNodevalue[mnum, :, 1])):
                        print('if_5_1')
                        seL = np.sqrt((BNodevalue[mnum][ntap - 1][2] - JNodevalue_j[mnum][2]) ** 2 + (
                                BNodevalue[mnum][ntap - 1][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                              BNodevalue[mnum][ntap - 1][4] - JNodevalue_j[mnum][4]) ** 2)

                        segLoc = np.zeros((1, 2))
                        segLocstep = np.zeros((1, 3))
                        segLoc[0][1] = seL
                        segLocstep[0][1] = seglength - BNodevalue[mnum][ntap - 1][15]
                        segLocstep[0][2] = seL

                        bfbs = (BNodevalue[mnum][ntap - 1][5], JNodevalue_j[mnum][5])
                        tfbs = (BNodevalue[mnum][ntap - 1][6], JNodevalue_j[mnum][6])
                        bfts = (BNodevalue[mnum][ntap - 1][7], JNodevalue_j[mnum][7])
                        tfts = (BNodevalue[mnum][ntap - 1][8], JNodevalue_j[mnum][8])
                        dws = (BNodevalue[mnum][ntap - 1][9], JNodevalue_j[mnum][9])
                        tws = (BNodevalue[mnum][ntap - 1][10], JNodevalue_j[mnum][10])
                        Afills = (BNodevalue[mnum][ntap - 1][13], JNodevalue_j[mnum][13])
                    else:
                        print('else_5')
                        seL = np.sqrt((BNodevalue[mnum][ntap][2] - BNodevalue[mnum][ntap][2]) ** 2 + (
                                BNodevalue[mnum][ntap][3] - BNodevalue[mnum][ntap][3]) ** 2 + (
                                              BNodevalue[mnum][ntap][4] - BNodevalue[mnum][ntap][4]) ** 2)
                        segLoc = np.zeros((1, 2))
                        segLocstep = np.zeros((1, 3))
                        segLoc[0][1] = seL
                        segLocstep[0][1] = seglength - BNodevalue[mnum][ntap][15]
                        segLocstep[0][2] = seL

                        bfbs = (BNodevalue[mnum][ntap][5], BNodevalue[mnum][ntap][5])
                        tfbs = (BNodevalue[mnum][ntap][6], BNodevalue[mnum][ntap][6])
                        bfts = (BNodevalue[mnum][ntap][7], BNodevalue[mnum][ntap][7])
                        tfts = (BNodevalue[mnum][ntap][8], BNodevalue[mnum][ntap][8])
                        dws = (BNodevalue[mnum][ntap][9], BNodevalue[mnum][ntap ][9])
                        tws = (BNodevalue[mnum][ntap][10], BNodevalue[mnum][ntap][10])
                        Afills = (BNodevalue[mnum][ntap][13], BNodevalue[mnum][ntap][13])

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
            validatorDouble = QDoubleValidator()
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(bfbsb))
            tableName.setCellWidget(0, 0, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(tfbsb))
            tableName.setCellWidget(0, 1, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(bftsb))
            tableName.setCellWidget(0, 2, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(tftsb))
            tableName.setCellWidget(0, 3, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(dwsb))
            tableName.setCellWidget(0, 4, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(twsb))
            tableName.setCellWidget(0, 5, item)
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            item.setText(str(Afillsb))
            tableName.setCellWidget(0, 6, item)
            AddNodeClass.coordinateFill(self)

    def fill_table_with_known(self):
        BNodevalue = h5_file.h5_Class.read_array(self,'BNodevalue')
        member_number = self.ui.AddNodeMember.currentIndex()
        add_node_number = self.ui.AdditionalNodeNumberComboBox.currentIndex()
        try:
            # print('Bnode = ' , BNodevalue)
            if BNodevalue.shape[2] ==16 and BNodevalue[member_number][add_node_number][1] !=0:

            # print('member = ', member_number, 'add_node = ', add_node_number)
                table = np.zeros((1,7))

                table[0][0] = BNodevalue[member_number][add_node_number][5]
                table[0][1] = BNodevalue[member_number][add_node_number][6]
                table[0][2] = BNodevalue[member_number][add_node_number][7]
                table[0][3] = BNodevalue[member_number][add_node_number][8]
                table[0][4] = BNodevalue[member_number][add_node_number][9]
                table[0][5] = BNodevalue[member_number][add_node_number][10]
                table[0][6] = BNodevalue[member_number][add_node_number][13]
                if self.ui.AdditionalNodeNumberComboBox.currentText() == '':
                    self.ui.AddNodePositionFrom.setText('')
                else:
                    # print('test')
                    self.ui.AddNodePositionFrom.setText(str(np.around(BNodevalue[member_number][add_node_number][15], decimals = 3)))
                    tableName = self.ui.AddNodeTable
                    validatorDouble = QDoubleValidator()
                    for i in range(7):
                        item = QLineEdit()
                        item.setFrame(False)
                        item.setValidator(validatorDouble)
                        item.setText(str(table[0][i]))
                        tableName.setCellWidget(0, i, item)
                    DropDownActions.ActionClass.statusMessage(self, message="")
        except IndexError:
            DropDownActions.ActionClass.statusMessage(self, message="Please enter the Position from the i node!")

            self.ui.AddNodePositionFrom.setText('')

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
            validatorDouble = QDoubleValidator()
            for i in range(7):
                if i == 0 or i == 2:
                    item = QLineEdit()
                    item.setFrame(False)
                    item.setValidator(validatorDouble)
                    item.setText(str(table_prop[0, 0]))
                    tableName.setCellWidget(row, i, item)
                elif i == 1 or i == 3:
                    item = QLineEdit()
                    item.setFrame(False)
                    item.setValidator(validatorDouble)
                    item.setText(str(table_prop[0, 1]))
                    tableName.setCellWidget(row, i, item)
                elif i == 4:
                    item = QLineEdit()
                    item.setFrame(False)
                    item.setValidator(validatorDouble)
                    item.setText(str(table_prop[0, 16]))
                    tableName.setCellWidget(row, i, item)
                elif i == 5:
                    item = QLineEdit()
                    item.setFrame(False)
                    item.setValidator(validatorDouble)
                    item.setText(str(table_prop[0, 3]))
                    tableName.setCellWidget(row, i, item)
                else:
                    item = QLineEdit()
                    item.setFrame(False)
                    item.setValidator(validatorDouble)
                    item.setText(str(table_prop[0, 17]))
                    tableName.setCellWidget(row, i, item)
        except IndexError:
            DropDownActions.ActionClass.statusMessage(self, message="Please select the cross-section name!")

    def coordinateFill(self):
        # print('coordinate FIll works')
        mnum = int(self.ui.AddNodeMember.currentIndex())
        try:
            seglength = float(self.ui.AddNodePositionFrom.text())

            # print("mnum = ", mnum, "\n", "seglength = ", seglength)
            _, JNodevalue_i, JNodevalue_j, _, _, _ = AddNodeClass.memberTableValues(self)

            # print("JNodevalue_i = ", JNodevalue_i)
            # print("JNodevalue_j = ", JNodevalue_j)

            alpharef = np.zeros((mnum + 1, 2))
            opp = JNodevalue_j[mnum][3] - JNodevalue_i[mnum][3]  # element depth in y-dir
            adj = JNodevalue_j[mnum][2] - JNodevalue_i[mnum][2]  # element length in x-dir

            alpharef[mnum][0] = mnum  # Member number
            alpharef[mnum][1] = np.arctan2(opp, adj)  # Only global frame angle

            memlength = np.sqrt((JNodevalue_i[mnum][2] - JNodevalue_j[mnum][2]) ** 2 + (
                    JNodevalue_i[mnum][3] - JNodevalue_j[mnum][3]) ** 2 + (
                                        JNodevalue_i[mnum][4] - JNodevalue_j[mnum][4]) ** 2)
            # print("mem length = ", memlength, "\nseglength = ", seglength)
            if np.greater_equal(seglength, memlength):
                DropDownActions.ActionClass.statusMessage(self,
                                                          message="Position from i node must be smaller than member length")
            else:
                # Rotation
                Rz = np.zeros((3, 3))
                Rz[0][0] = np.cos(alpharef[mnum, 1])
                Rz[0][1] = -np.sin(alpharef[mnum, 1])
                Rz[1][0] = np.sin(alpharef[mnum, 1])
                Rz[1][1] = np.cos(alpharef[mnum, 1])
                Rz[2][2] = 1

                Lb = np.zeros(3)
                Additive = np.zeros(3)
                Additive[0] = JNodevalue_i[mnum][2]
                Additive[1] = JNodevalue_i[mnum][3]
                Additive[2] = JNodevalue_i[mnum][4]
                Lb[0] = seglength
                Lb = np.dot(Rz, Lb) + Additive

                Lb = np.around(Lb * (10 ** 11)) / (10 ** 11)
                # print('Lb in Function = ', Lb)

                self.ui.AddNodeX.setText(str(Lb[0]))
                self.ui.AddNodeY.setText(str(Lb[1]))
                self.ui.AddNodeZ.setText(str(Lb[2]))
                # print('Lb__= ', Lb)
                return Lb
        except ValueError:
            DropDownActions.ActionClass.statusMessage(self, message='Please Enter the Segment Length')

    def validatorForTable(self):
        validatorDouble = QDoubleValidator()
        for i in range(7):
            item = QLineEdit()
            item.setFrame(False)
            item.setValidator(validatorDouble)
            self.ui.AddNodeTable.setCellWidget(i, 0, item)

    def memberNumbering(self):
        mnum = int(self.ui.AddNodeMember.currentIndex())
        _, _, _, BNodevalue, _, _ = AddNodeClass.memberTableValues(self)
        # print("BNodevalue 1 = ", BNodevalue)
        nextBnum = np.amax(BNodevalue[mnum, :, 1]) + 1
        return nextBnum

    def readAddNodeTable(self):
        addNodeTableValues = np.zeros(7)
        for i in range(7):
            addNodeTableValues[i] = self.ui.AddNodeTable.cellWidget(0, i).text()

        return addNodeTableValues

    def addNodePushFun(self):

        added_node_number = int(self.ui.AdditionalNodeNumberComboBox.count())
        # print('added node number = ', added_node_number)
        self.ui.AdditionalNodeNumberComboBox.addItem(str(added_node_number + 1))
        self.ui.AdditionalNodeNumberComboBox.setCurrentIndex(added_node_number)
        self.ui.AddNodePositionFrom.setText('')
        self.ui.addNodePushButton.setEnabled(False)

    def removeNodeDialog(self):
        BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        current_selected_node = self.ui.AdditionalNodeNumberComboBox.currentIndex()
        current_member = self.ui.AddNodeMember.currentIndex()
        import DropDownActions
        # try:
            # remove_added_node_test =  BNodevalue[current_member][current_selected_node][1] # this is a test operator for try-except statement
        import SABRE2_GUI
        remove_added_node = QtGui.QMessageBox()
        remove_added_node.setWindowTitle('Remove Selected Node?')
        remove_added_node.setIcon(QtGui.QMessageBox.Critical)
        remove_added_node.setTextFormat(SABRE2_GUI.QtCore.Qt.RichText)
        # about_box.setIconPixmap(QtGui.QPixmap(ComicTaggerSettings.getGraphic('about.png'))) #include image
        remove_added_node.setText('Do you want to remove the Added Node Number ' + str(current_selected_node+1)+ ' of Member ' + str(current_member+1) + '?')
        remove_added_node.setStandardButtons(SABRE2_GUI.QtGui.QMessageBox.Yes | SABRE2_GUI.QtGui.QMessageBox.No)
        ret_val = remove_added_node.exec_()
        if ret_val == SABRE2_GUI.QtGui.QMessageBox.Yes:
            SegmRemove.removeNode(self)
        else:
            return

        # except IndexError as e:
        #     import sys
        #     print('Error on line {}'.format(sys.exc_info()[-1].tb_lineno), type(e).__name__, e)
        #     DropDownActions.ActionClass.statusMessage(self,
        #                                               message=('Added number ' + str(current_selected_node+1)+ ' of Member ' + str(current_member+1) + ' is removed!'))
        # print('message box result = ', ret_val)

    def ApplyButton(self):
        '''executes when the apply button pressed in the Add Nodes menu'''
        # print('apply pressed')
        self.ui.addNodePushButton.setEnabled(True)
        AddNodeClass.apply_button_pressed = True
        mnum = int(self.ui.AddNodeMember.currentIndex())
        nbnode = int(self.ui.AdditionalNodeNumberComboBox.currentIndex())
        # print('mnum = ', mnum, 'nbnode = ', nbnode)
        members_table, JNodevalue_i, JNodevalue_j, BNodevalue,_, Rval= AddNodeClass.memberTableValues(self)
        Massemble = members_table[:, :3]
        total_member_number = Massemble.shape[0]
        try:
            float(self.ui.AddNodePositionFrom.text())  # test for the node i is filled or not ?

            BNodevalue_read = h5_file.h5_Class.read_array(self,'BNodevalue')

            Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self, flag = 'apply 1')

            if BNodevalue_read.shape[2] > BNodevalue.shape[2]:
                BNodevalue = BNodevalue_read
                # print('BNodevalue read = ' , BNodevalue_read)
            # print("nbnode = ", nbnode, "\n", 'Max BNode 1 =' , BNodevalue)

            if np.greater(nbnode, np.amax(BNodevalue[mnum, :, 1])):
                # print('apply button if condition 1 ')
                SNodeValue = None
            else:
                # print('apply button else')
                import SABRE2_main_subclass
                Lb = AddNodeClass.coordinateFill(self)
                if BNodevalue.shape[2] != 16:
                    # print("Lb = ", Lb)
                    BNodevalue = np.zeros((total_member_number, nbnode + 1, 16))

                # print('Apply button before = ', BNodevalue)
                if (nbnode+1) > BNodevalue.shape[1]:
                    BNodevalue = np.insert(BNodevalue,(nbnode), 0, axis=1)
                addNodeTableValues = AddNodeClass.readAddNodeTable(self)
                BNodevalue[:, nbnode, 0] = Massemble[:,0]
                BNodevalue[mnum][nbnode][1] = nbnode + 1  # 0 No bracing
                BNodevalue[mnum][nbnode][2] = Lb[0]
                BNodevalue[mnum][nbnode][3] = Lb[1]
                BNodevalue[mnum][nbnode][4] = Lb[2]
                BNodevalue[mnum][nbnode][5] = addNodeTableValues[0]
                BNodevalue[mnum][nbnode][6] = addNodeTableValues[1]
                BNodevalue[mnum][nbnode][7] = addNodeTableValues[2]
                BNodevalue[mnum][nbnode][8] = addNodeTableValues[3]
                BNodevalue[mnum][nbnode][9] = addNodeTableValues[4]
                BNodevalue[mnum][nbnode][10] = addNodeTableValues[5]
                BNodevalue[mnum][nbnode][11] = BNodevalue[mnum][nbnode][9] + BNodevalue[mnum][nbnode][6] + \
                                               BNodevalue[mnum][nbnode][8]  # total depth
                BNodevalue[mnum][nbnode][12] = BNodevalue[mnum][nbnode][9] + (
                        BNodevalue[mnum][nbnode][6] + BNodevalue[mnum][nbnode][8]) / 2  # flange centroid
                BNodevalue[mnum][nbnode][13] = addNodeTableValues[6]

                # print("BNodevalue function before = ", BNodevalue)

                # if Path('process.h5').is_file():
                #
                #     BNodevalue = h5_file.h5_Class.read_array(self, 'Bracing Node')
                #     print('BNode from H5 = ', BNodevalue)
                #
                # else:
                #     print('first added node')
                import SABRE2SegmCODE

                BNodevalue = SABRE2SegmCODE.ClassA.BNodevalueUpdater(self, BNodevalue, JNodevalue_i, JNodevalue_j,
                                                                     Massemble)

                # print("BNodevalue function after = ", BNodevalue)

                # SABRE2SegmModel.AddNodeCoordCS.added_node_drawing_properties(self, BNodevalue)
                AddNodeClass.addedNodeInformationArrayUpdate(self, BNodevalue)
                # print("BNodevalue apply button = ", BNodevalue)
                h5_file.h5_Class.update_array(self, BNodevalue, 'BNodevalue')
                # added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
                # print('added node array =', added_node_information)


                #segment properties menu arrangements and SNodevalue array set up

                from SABRE2_main_subclass import MemberPropertiesTable
                MemberPropertiesTable.set_number_of_rows(self, self.ui.Members_table,
                                                         self.ui.Member_Properties_Table)


                Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self, flag = 'apply 2')

        except ValueError as e:
            DropDownActions.ActionClass.statusMessage(self, message="Position from i is not defined!")
            import sys, os
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            print(exc_type, fname, exc_tb.tb_lineno)

        return BNodevalue



class SegmRemove(QMainWindow):
    """ This class removes previously added nodes"""

    def __init__(self, ui_layout, parent=None):
        super(SegmRemove, self).__init__(parent)
        self.ui = ui_layout

    def removeNode(self):
        BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        members_table, JNodevalue_i, JNodevalue_j, _, _, _= AddNodeClass.memberTableValues(self)
        Massemble = members_table[:, :3]
        # remove selected node
        nbnode = int(self.ui.AdditionalNodeNumberComboBox.currentIndex())  # specifies the selected node current index
        memnum = int(self.ui.AddNodeMember.currentIndex())  # specifies the selected node current index
        total_memnum = int(self.ui.AddNodeMember.count())  # specifies the selected node current index
        #
        # # import SABRE2SegmCODE
        # added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
        # # total added node count of current member
        # total_number = added_node_information[memnum][1]
        # added_node_information[memnum][1] = added_node_information[memnum][1] - 1
        # h5_file.h5_Class.update_array(self, added_node_information, 'added_node_information')
        # # print('added node information = ', added_node_information)
        # print('memnum = ' , memnum, 'nbnode = ', nbnode)
        #
        # b = list(range(1, int(added_node_information[memnum][1] + 1)))
        # for e in range(len(b)):
        #     b[e] = str(b[e])
        # self.ui.AdditionalNodeNumberComboBox.clear()
        # self.ui.AdditionalNodeNumberComboBox.addItems(b)
        max_b = 0
        max_c = 0
        for i in range(int(total_memnum)):
            max_c = np.amax(BNodevalue[i, :, 1])
            if max_b < max_c:
                max_b = max_c
        # # print('max_b = ', max_b, 'max_c = ', max_c,'member = ', total_memnum)
        # # print('test remove = ', BNodevalue)
        # # total added node count of current member
        # if total_number < (nbnode + 1) or max_b <= (nbnode+1):
        #
        #     for i in range(1, 16):
        #         BNodevalue[memnum][nbnode][i] = 0
        #     # print('test if 1')
        # else:
        #     # print('test if 2')
        #     BNodevalue = np.delete(BNodevalue,nbnode, axis=1)
        #
        # print('test remove = ', BNodevalue)
        # print('test remove 2 = ', np.arange(added_node_information[memnum][1]))
        # BNodevalue[memnum,:,1] = np.arange(added_node_information[memnum][1]) + 1
        # h5_file.h5_Class.update_array(self, BNodevalue, 'BNodevalue')
        # print('test remove = ', int(np.amax(BNodevalue[memnum, :, 1])))
        # BNodevalue[memnum, nbnode, :] = 0
        # print('test 1 __')

        BNodedev = np.zeros((total_memnum, int(max_b), 16))

        # print('test 2_ = ,', BNodedev)
        BNodevalue[memnum, nbnode, :] = 0

        # print('test 2__ BNode = ')
        for i in range(int(BNodevalue[memnum, :, 1].shape[0])):
            for j in range(16):
                BNodedev[memnum, i, j] = 0

        # print('test 2__ ')
        p = 0
        # print('BV = ', BNodevalue)
        for i in range(BNodevalue[memnum,:,0].shape[0]):
            # print('test 31 ')
            if not np.isclose(BNodevalue[memnum,i,0], 0):
                # print('BNodevalue[memnum, i, :]', BNodevalue[memnum, i, :])
                BNodevalue[memnum,i,1] = p+1
                    # print('test 33')
                BNodedev[memnum, p, 0] = BNodevalue[memnum, i, 0]
                BNodedev[memnum, p, 1] = BNodevalue[memnum, i, 1]
                BNodedev[memnum, p, 2] = BNodevalue[memnum, i, 2]
                BNodedev[memnum, p, 3] = BNodevalue[memnum, i, 3]
                BNodedev[memnum, p, 4] = BNodevalue[memnum, i, 4]
                BNodedev[memnum, p, 5] = BNodevalue[memnum, i, 5]
                BNodedev[memnum, p, 6] = BNodevalue[memnum, i, 6]
                BNodedev[memnum, p, 7] = BNodevalue[memnum, i, 7]
                BNodedev[memnum, p, 8] = BNodevalue[memnum, i, 8]
                BNodedev[memnum, p, 9] = BNodevalue[memnum, i, 9]
                BNodedev[memnum, p, 10] = BNodevalue[memnum, i, 10]
                BNodedev[memnum, p, 11] = BNodevalue[memnum, i, 11]
                BNodedev[memnum, p, 12] = BNodevalue[memnum, i, 12]
                BNodedev[memnum, p, 13] = BNodevalue[memnum, i, 13]
                BNodedev[memnum, p, 14] = BNodevalue[memnum, i, 14]
                BNodedev[memnum, p, 15] = BNodevalue[memnum, i, 15]
                p += 1

        # print('BA = ', BNodevalue)


        # print('test 3____')
        # print('Bnodevalue = ', BNodevalue)
        # print('Bnodedev = ', BNodedev)
        BNodevalue[memnum, :, :] = BNodedev[memnum, :, :]
        # handle SNODE later
        added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
        added_node_information[memnum][1] = added_node_information[memnum][1] - 1

        h5_file.h5_Class.update_array(self,added_node_information,'added_node_information')
        print('added = ', added_node_information)
        import SABRE2SegmCODE
        BNodevalue = SABRE2SegmCODE.ClassA.BNodevalueUpdater(self, BNodevalue, JNodevalue_i, JNodevalue_j, Massemble)

        print('remove node BNodevalue = ', BNodevalue)
        if BNodevalue[memnum,0,0] == 0:
            BNodevalue[memnum,0,0] = memnum+1

        from SABRE2_main_subclass import MemberPropertiesTable
        print('remove node BNodevalue = ', BNodevalue)
        h5_file.h5_Class.update_array(self,BNodevalue,'BNodevalue')

        # set member properties table and assign values
        MemberPropertiesTable.set_number_of_rows(self, self.ui.Members_table,
                                                 self.ui.Member_Properties_Table)
        Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self, flag = 'remove')
        AddNodeClass.setAddedNodeComboBox(self)

class PlotSegments(QMainWindow):
    """ This class removes previously added nodes"""

    def __init__(self, ui_layout, parent=None):
        super(PlotSegments, self).__init__(parent)
        self.ui = ui_layout


    def drawSegmentNames(self, JNodevalue_i, JNodevalue_j, BNodevalue, Massemble, glWidget):
        total_member_number = BNodevalue.shape[0]
        # print('draw segments = ' , BNodevalue)
        Ta = max(np.amax(JNodevalue_i[:,5]),np.amax(JNodevalue_i[:,7]))

        BJvalue = np.zeros((2,3))
        for i in range(total_member_number):
            if np.isclose(BNodevalue[i,0,1],0): #No Bracing
                current_member = int(BNodevalue[i,0,0])-1
                BJvalue[0, 0] = JNodevalue_i[current_member, 2]
                BJvalue[1, 0] = JNodevalue_j[current_member, 2]
                BJvalue[0, 1] = JNodevalue_i[current_member, 3]
                BJvalue[1, 1] = JNodevalue_j[current_member, 3]
                BJvalue[0, 2] = JNodevalue_i[current_member, 4]
                BJvalue[1, 2] = JNodevalue_j[current_member, 4]
                text = 'M' + str(int(i+1)) + 'S1'
                font = QFont()
                font.setPointSize(8)
                # print(np.sum(BJvalue[:,0])/2, np.sum(BJvalue[:,1])/2+Ta)
                # glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

                glWidget.renderText(self,np.sum(BJvalue[:,0])/2, np.sum(BJvalue[:,1])/2, 0,text, font)

            elif np.isclose(np.amax(BNodevalue[i,:,1]),1): # One Bracing
                current_member = int(BNodevalue[i, 0, 0]) - 1
                nbnode = int(np.amax(BNodevalue[i, :, 1])) - 1

                BJvalue[0, 0] = JNodevalue_i[current_member, 2]
                BJvalue[1, 0] = BNodevalue[i, nbnode, 2]
                BJvalue[0, 1] = JNodevalue_i[current_member, 3]
                BJvalue[1, 1] = BNodevalue[i, nbnode, 3]
                BJvalue[0, 2] = JNodevalue_i[current_member, 4]
                BJvalue[1, 2] = BNodevalue[i, nbnode, 4]

                text = 'M' + str(int(i+1)) + 'S' + str(int(nbnode+1))
                font = QFont()
                font.setPointSize(8)

                glWidget.renderText(self, np.sum(BJvalue[:, 0]) / 2, np.sum(BJvalue[:, 1]) / 2, 0, text, font)

                BJvalue[0, 0] = BNodevalue[i, nbnode, 2]
                BJvalue[1, 0] = JNodevalue_j[current_member, 2]
                BJvalue[0, 1] = BNodevalue[i, nbnode, 3]
                BJvalue[1, 1] = JNodevalue_j[current_member, 3]
                BJvalue[0, 2] = BNodevalue[i, nbnode, 4]
                BJvalue[1, 2] = JNodevalue_j[current_member, 4]

                text = 'M' + str(int(i + 1)) + 'S' + str(int(nbnode + 2))
                glWidget.renderText(self, np.sum(BJvalue[:, 0]) / 2, np.sum(BJvalue[:, 1]) / 2, 0, text, font)

            else:
                current_member = int(BNodevalue[i, 0, 0]) - 1
                nbnode = int(np.amax(BNodevalue[i, :, 1])) - 1
                BJvalue[0, 0] = JNodevalue_i[current_member, 2]
                BJvalue[1, 0] = BNodevalue[i, 0, 2]
                BJvalue[0, 1] = JNodevalue_i[current_member, 3]
                BJvalue[1, 1] = BNodevalue[i, 0, 3]
                BJvalue[0, 2] = JNodevalue_i[current_member, 4]
                BJvalue[1, 2] = BNodevalue[i, 0, 4]

                text = 'M' + str(int(i + 1)) + 'S' + str(int(1))
                font = QFont()
                font.setPointSize(8)

                glWidget.renderText(self, np.sum(BJvalue[:, 0]) / 2, np.sum(BJvalue[:, 1]) / 2, 0, text, font)

                for j in range(nbnode):
                    BJvalue[0, 0] = BNodevalue[i, j, 2]
                    BJvalue[1, 0] = BNodevalue[i, j + 1, 2]
                    BJvalue[0, 1] = BNodevalue[i, j, 3]
                    BJvalue[1, 1] = BNodevalue[i, j + 1, 3]
                    BJvalue[0, 2] = BNodevalue[i, j , 4]
                    BJvalue[1, 2] = BNodevalue[i, j + 1, 4]

                    text = 'M' + str(int(i + 1)) + 'S' + str(int(j + 2))
                    font = QFont()
                    font.setPointSize(8)

                    glWidget.renderText(self, np.sum(BJvalue[:, 0]) / 2, np.sum(BJvalue[:, 1]) / 2, 0, text, font)

                BJvalue[0, 0] = BNodevalue[i, nbnode, 2]
                BJvalue[1, 0] = JNodevalue_j[current_member, 2]
                BJvalue[0, 1] = BNodevalue[i, nbnode, 3]
                BJvalue[1, 1] = JNodevalue_j[current_member, 3]
                BJvalue[0, 2] = BNodevalue[i, nbnode, 4]
                BJvalue[1, 2] = JNodevalue_j[current_member, 4]

                text = 'M' + str(int(i + 1)) + 'S' + str(int(nbnode + 2))
                glWidget.renderText(self, np.sum(BJvalue[:, 0]) / 2, np.sum(BJvalue[:, 1]) / 2, 0, text, font)


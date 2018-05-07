import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtCore
from PyQt4 import QtGui
import SABRE2_GUI
import numpy as np
import h5_file
import tempfile


class ActionClass(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(ActionClass, self).__init__(parent)
        self.ui = ui_layout

        self.Members_table_position = 3

        self.joint_values = None
        self.member_properties_values = None
        self.members_table_values = None
        self.Massemble = None
        self.table_prop = None
        self.BNodevalue = None
        self.shear_panel_values = None
        self.ground_spring_values = None
        self.torsional_spring_values = None
        self.My_release_values = None
        self.Mz_release_values = None
        self.Warping_release_values = None
        self.JNodeValue_i = None
        self.JNodeValue_j = None
        self.DUP1 = None
        self.DUP2 = None
        self.RNCc = None
        self.PNC = None
        self.PNC1 = None
        self.PNC2 = None
        self.fixities_vals = None
        self.release_values = None


    def AboutAct(self):
        # self.statusMessage(self, message="Learn about Sabre2")

        # Program information
        version = "3.0"
        website = "http://www.white.ce.gatech.edu/sabre"
        email = "fill in data"
        license_link = "fill in data"
        license_name = "fill in data"

        # Dialog box
        about_box = SABRE2_GUI.QtGui.QMessageBox()
        about_box.setWindowTitle("About Sabre2 Version 3.0")
        about_box.setTextFormat(SABRE2_GUI.QtCore.Qt.RichText)
        # about_box.setIconPixmap(QtGui.QPixmap(ComicTaggerSettings.getGraphic('about.png'))) #include image
        about_box.setText("""
        <HTML>
        <p><b>This demo shows use of <c>QTableWidget</c> with custom handling for
         individual cells.</b></p>
        <p>Using a customized table item we make it possible to have dynamic
         output in different cells. The content that is implemented for this
         particular demo is:
        <ul>
        <li>Adding two cells.</li>
        <li>Subtracting one cell from another.</li>
        <li>Multiplying two cells.</li>
        <li>Dividing one cell with another.</li>
             <li>Summing the contents of an arbitrary number of cells.</li>
             </HTML>
         """)
        about_box.setStandardButtons(SABRE2_GUI.QtGui.QMessageBox.Ok)
        about_box.exec_()

    def NewAct(self):
        # DropDownActions.statusMessage(self, message="Create a new file")

        fileName = []
        inpdata = []
        # clear all user inputs
        # reset OpenGL screen
        # reset messages

    def OpenAct(self):
        self.read_fun()
        pass
        # DropDownActions.statusMessage(self, message="Open an existing file")
        # fileName = PyQt4.QtGui.QFileDialog.getOpenFileName(None, "Open Sabre2 File", '',
        #                                                    "Sabre2 Files (*.mat);;All Files (*)")
        # if not fileName:
        #     return
        # try:
        #     in_file = open(str(fileName), 'rb')
        # except IOError:
        #     QtGui.QMessageBox.information(self, "Unable to open file", "There was an error opening \"%s\"" % fileName)
        #     return

        # if first line states "basic" script
        # then just fill in gui
        # elif first line states "complete" script
        # if autorun = "enabled"
        #   then immediately run and show results
        # elif autorun = "disabled"
        #   then fill in gui, pull up analysis tab and update opengl
        #
        # inpdata = []
        # inpdata = pickle.load(in_file)
        # in_file.close()
        #
        # if len(inpdata) == 0:
        #     QtGui.QMessageBox.information(self, "File is empty")
        # else:
        #     # needs to be updated once data structure is determined**************************
        #     for name, address in inpdata:
        #         self.nameLine.setText(name)
        #         self.addressText.setText(address)
        #
        # self.updateInterface(self.NavigationMode)
        #
        # # Fill in spread sheet cells
        # # update OpenGL screen
        # update messages
        # go directly to analysis screen

    def SaveAct(self):
        self.save_fun()
        # self.statusMessage(message="Save the model to disk")
        #
        # inpdata = "text test addon"
        # fileName = "test1.txt"
        #
        # if len(inpdata) == 0:
        #     QtGui.QMessageBox.information(self, "No data has been attributed to the model")
        # else:
        #     try:
        #         fileName
        #     except NameError:  # if data has not been saved to a file yet invoke popup save screen
        #         import pickle
        #         fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File", '',
        #                                                            "Sabre2 File (*.mat);;All Files (*)")
        #         if not fileName:
        #             return
        #         try:
        #             out_file = open(str(fileName), 'wb')
        #         except IOError:
        #             PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
        #                                                 "There was an error opening \"%s\"" % fileName)
        #             return
        #
        #         pickle.dump(inpdata, out_file)
        #         out_file.close()
        #     else:
        #         import pickle
        #         try:  # if file already exists skip popup and update save file
        #             out_file = open(str(fileName), 'wb')
        #         except IOError:
        #             PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
        #                                                 "There was an error opening \"%s\"" % fileName)
        #             return
        #
        #         pickle.dump(inpdata, out_file)
        #         out_file.close()

    def Save_AsAct(self):
        pass

        # DropDownActions.statusMessage(self, message="Name the file saved to disk")
        #
        # inpdata = "text test"
        #
        # # Invoke save popup screen
        # if len(inpdata) == 0:
        #     QtGui.QMessageBox.information(self, "No data has been attributed to the model")
        # else:
        #     import pickle
        #     fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File As", '',
        #                                                        "Sabre2 File (*.mat);;All Files (*)")
        #     if not fileName:
        #         return
        #     try:
        #         out_file = open(str(fileName), 'wb')
        #     except IOError:
        #         PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
        #                                             "There was an error opening \"%s\"" % fileName)
        #         return
        #
        #     pickle.dump(inpdata, out_file)
        #     out_file.close()

    def PrintAct(self):
        # DropDownActions.statusMessage(self, message="Print screen")

        # not sure what we are printing?
        # data, results, or just screenshot of OpenGL?
        pass

    def Print_PreviewAct(self):
        # DropDownActions.statusMessage(self, message="Preview screen print")
        pass

    def statusMessage(self, message):
        self.ui.statusBar.showMessage(message)

    # def maybeSave(self):
    #     if self.textEdit.document().isModified():
    #         ret = QtGui.QMessageBox.warning(self, "Application",
    #                                         "The model has been modified.\nDo you want to save "
    #                                         "your changes?",
    #                                         QtGui.QMessageBox.Save | QtGui.QMessageBox.Discard |
    #                                         QtGui.QMessageBox.Cancel)
    #         if ret == QtGui.QMessageBox.Save:
    #             return self.save()
    #         elif ret == QtGui.QMessageBox.Cancel:
    #             return False
    #     return True

    def save_fun(self):
        import SABRE2_main_subclass

        self.joint_values = SABRE2_main_subclass.SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)

        self.member_properties_values= SABRE2_main_subclass.SABRE2_main_subclass.update_member_properties_table(self,
                                                                                                                 self.ui.Member_Properties_Table)
        self.table_prop = h5_file.h5_Class.read_array(self, 'table_prop')
        self.Massemble = h5_file.h5_Class.read_array(self, 'Massemble')
        self.members_table_values, self.JNodeValue_i, self.JNodeValue_j, _, _, _, _ = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self,
            self.ui.Members_table,
            self.Members_table_position)
        self.element_member = h5_file.h5_Class.read_array(self, 'element_member')
        self.BNodevalue = h5_file.h5_Class.read_array(self, 'BNodevalue')
        self.SNodevalue = h5_file.h5_Class.read_array(self, 'SNodevalue')
        self.added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
        self.fixities_vals = h5_file.h5_Class.read_array(self, 'fixities_vals')
        self.spring_values = h5_file.h5_Class.read_array(self, 'spring_values')
        self.DUP1 = h5_file.h5_Class.read_array(self, 'DUP1')
        self.DUP2 = h5_file.h5_Class.read_array(self, 'DUP2')
        self.RNCc = h5_file.h5_Class.read_array(self, 'RNCc')
        self.PNC = h5_file.h5_Class.read_array(self, 'PNC')
        self.PNC1 = h5_file.h5_Class.read_array(self, 'PNC1')
        self.PNC2 = h5_file.h5_Class.read_array(self, 'PNC2')
        uniform_load_array = h5_file.h5_Class.read_array(self, 'uniform_load_array')
        LNC = h5_file.h5_Class.read_array(self, 'LNC')
        LNC1 = h5_file.h5_Class.read_array(self, 'LNC1')
        LNC2 = h5_file.h5_Class.read_array(self, 'LNC2')
        uniform_table_values = h5_file.h5_Class.read_array(self, 'uniform_table_values')
        point_load_table_values = h5_file.h5_Class.read_array(self, 'point_load_table_values')
        self.shear_panel_values = h5_file.h5_Class.read_array(self, 'shear_panel_values')
        self.release_values = h5_file.h5_Class.read_array(self, 'release_values')

        # print('self.members_table_values', self.members_table_values)
        # print('self.SNodevalue', self.SNodevalue)
        # print('table prop save = ' , self.table_prop)

        filename = 'test_after_shear_panel.npz'
        file = open(filename, 'wb')

        np.savez(file, joint_values=self.joint_values,
                 member_properties_values=self.member_properties_values,
                 members_table_values=self.members_table_values,
                 table_prop_for_AISC = self.table_prop,
                 Massemble = self.Massemble,
                 added_node_information = self.added_node_information,
                 element_member = self.element_member,
                 BNodevalue = self.BNodevalue,
                 SNodevalue = self.SNodevalue,
                 fixities_vals = self.fixities_vals,
                 spring_values = self.spring_values,
                 release_values = self.release_values,
                 DUP1 = self.DUP1,
                 DUP2 = self.DUP2,
                 RNCc = self.RNCc,
                 PNC = self.PNC,
                 PNC1 = self.PNC1,
                 PNC2 = self.PNC2,
                 LNC = LNC,
                 LNC1 = LNC1,
                 LNC2 = LNC2,
                 uniform_table_values = uniform_table_values,
                 point_load_table_values = point_load_table_values,
                 uniform_load_array = uniform_load_array,
                 shear_panel_values=self.shear_panel_values,
                 ground_spring_values=self.ground_spring_values,
                 torsional_spring_values=self.torsional_spring_values,
                 My_release_values=self.My_release_values,
                 Mz_release_values=self.Mz_release_values,
                 Warping_release_values=self.Warping_release_values
                 )
        file.close()

        print('file saved to ', filename)

    def read_fun(self):

        '''This function reads the variables from the compressed file'''
        import SABRE2_main_subclass

        import OpenGLcode

        self.OpenGLwidget = OpenGLcode.glWidget(self.ui)

        filename = 'test_after_shear_panel.npz'

        aa = np.load(filename)

        self.joint_values = aa['joint_values']
        self.member_properties_values = aa['member_properties_values']
        self.members_table_values = aa['members_table_values']
        self.table_prop = aa['table_prop_for_AISC']
        self.Massemble = aa['Massemble']
        self.element_member = aa['element_member']
        self.BNodevalue = aa['BNodevalue']
        self.SNodevalue = aa['SNodevalue']
        self.fixities_vals = aa['fixities_vals']
        self.spring_values = aa['spring_values']
        self.added_node_information = aa['added_node_information']
        self.DUP1 = aa['DUP1']
        self.DUP2 = aa['DUP2']
        self.RNCc = aa['RNCc']
        self.PNC = aa['PNC']
        self.PNC1 = aa['PNC1']
        self.PNC2 = aa['PNC2']
        LNC = aa['LNC']
        LNC1 = aa['LNC1']
        LNC2 = aa['LNC2']
        self.shear_panel_values = aa['shear_panel_values']
        self.ground_spring_values = aa['ground_spring_values']
        self.release_values = aa['release_values']
        uniform_load_array = aa['uniform_load_array']
        uniform_table_values = aa['uniform_table_values']
        point_load_table_values = aa['point_load_table_values']

        h5_file.h5_Class.update_array(self, self.element_member, 'element_member')
        h5_file.h5_Class.update_array(self, self.BNodevalue, 'BNodevalue')
        h5_file.h5_Class.update_array(self, self.SNodevalue, 'SNodevalue')
        h5_file.h5_Class.update_array(self, self.shear_panel_values, 'shear_panel_values')
        h5_file.h5_Class.update_array(self, self.added_node_information, 'added_node_information')
        h5_file.h5_Class.update_array(self, self.fixities_vals, 'fixities_vals')
        h5_file.h5_Class.update_array(self, self.spring_values, 'spring_values')
        h5_file.h5_Class.update_array(self, self.release_values, 'release_values')
        h5_file.h5_Class.update_array(self, self.DUP1, 'DUP1')
        h5_file.h5_Class.update_array(self, self.DUP2, 'DUP2')
        h5_file.h5_Class.update_array(self, self.RNCc, 'RNCc')
        h5_file.h5_Class.update_array(self, self.PNC, 'PNC')
        h5_file.h5_Class.update_array(self, self.PNC1, 'PNC1')
        h5_file.h5_Class.update_array(self, self.PNC2, 'PNC2')
        h5_file.h5_Class.update_array(self, LNC, 'LNC')
        h5_file.h5_Class.update_array(self, LNC1, 'LNC1')
        h5_file.h5_Class.update_array(self, LNC2, 'LNC2')
        h5_file.h5_Class.update_array(self, uniform_load_array, 'uniform_load_array')
        h5_file.h5_Class.update_array(self, uniform_table_values, 'uniform_table_values')
        h5_file.h5_Class.update_array(self, point_load_table_values, 'point_load_table_values')
        # print("\njoint values = ", self.joint_values)#, "\nmember prop values = ", self.member_properties_values,
        #       "\nmembers table values = ", self.members_table_values)
        # print('read DUP1 = ', self.DUP1)
        # print('read DUP2 = ', self.DUP2)
        # print('read RNCc = ', self.RNCc)
        # print('read PNC = ', self.PNC)
        # print('read PNC1 = ', self.PNC1)
        # print('read PNC2 = ', self.PNC2)
        # print('read self.SNodevalue', self.SNodevalue)
        shape_joint_table = int(self.joint_values.shape[0])
        shape_members_table_values = int(self.members_table_values.shape[0])\
        # print('shape member table = ', shape_members_table_values)
        # print('shape member table = ', self.members_table_values)
        # print('self.SNodevalue', self.SNodevalue)
        total_element_number = np.sum(self.SNodevalue[:,:,2])
        # print('total element number = ', total_element_number)
        # print('BNodevalue = ', self.BNodevalue)
        # print('element_member = ', self.element_member)
        # filling for joints table

        for i in range(shape_joint_table):
            if i == (shape_joint_table - 1):
                self.ui.Joints_Table.blockSignals(False)
            else:
                self.ui.Joints_Table.blockSignals(True)

            if shape_joint_table > 2:
                if shape_joint_table != self.ui.Joints_Table.rowCount():
                    for k in range(shape_joint_table - 2):
                        SABRE2_main_subclass.JointTable.add_new_row(self, self.ui.Joints_Table,
                                                                    self.ui.Insert_row_number_Joint, "last")

            for j in range(2):
                item = QTableWidgetItem(str(self.joint_values[i][j + 1]))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                self.ui.Joints_Table.setItem(i, j + 1, item)

        # filling for members table
        self.Members_table_options = ["Mid Depth", "Flange 2", "Flange 1"]
        self.Members_table_position = 3

        # print("member shape = ", )
        # print('self.fixities vals = ', self.fixities_vals)
        self.ui.Members_table.blockSignals(True)
        for i in range(shape_members_table_values):
            for j in range(1, 18):
                if j == 3:
                    # print('test = ', self.ui.Members_table, self.Members_table_options,
                    #                                                     self.Members_table_position, self.members_table_values[i][3])
                    SABRE2_main_subclass.DataCollection.Assign_comboBox(self, self.ui.Members_table, self.Members_table_options,
                                                                        self.Members_table_position, self.members_table_values[i][3])
                elif j == 1 or j == 2:
                    item = QTableWidgetItem(str(int(self.members_table_values[i][j])))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    self.ui.Members_table.setItem(i, j, item)

                elif i == (shape_members_table_values - 1) and j == 17:
                    self.ui.Members_table.blockSignals(False)
                    item = QTableWidgetItem(str(self.members_table_values[i][j]))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    self.ui.Members_table.setItem(i, j, item)

                else:
                    item = QTableWidgetItem(str(self.members_table_values[i][j]))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    self.ui.Members_table.setItem(i, j, item)



            if shape_members_table_values > 1:
                # print("test 1")
                for i in range(shape_joint_table - 1):
                    SABRE2_main_subclass.TableChanges.add_new_row(self, self.ui.Members_table,
                                                                  self.Members_table_options,
                                                                  self.Members_table_position,
                                                                  self.ui.Insert_row_number_mem_def, "last",
                                                                  combo_values=self.members_table_values[:, 3])

        import AddNode

        AddNode.AddNodeClass.setAddNodeComboBox(self)
        from SABRE2_main_subclass import Boundary_Conditions, uniform_load_def, point_load_def
        number_of_nodes = int(self.RNCc[:, 0].shape[0])
        if self.fixities_vals.shape[0] != 1 or self.fixities_vals.shape[1] != 1:
            Boundary_Conditions.set_number_of_rows_fixities_table(self, number_of_nodes, self.RNCc, self.fixities_vals)
            Boundary_Conditions.Assign_comboBox_fixities_table(self, number_of_nodes, self.fixities_vals[:,1])
        else:
            Boundary_Conditions.set_number_of_rows_fixities_table(self, number_of_nodes, self.RNCc)
            Boundary_Conditions.Assign_comboBox_fixities_table(self, number_of_nodes)
        if self.spring_values.shape[0] != 1 or self.spring_values.shape[1] != 1:
            Boundary_Conditions.set_number_of_rows_springs_table(self, number_of_nodes, self.spring_values)
            Boundary_Conditions.Assign_comboBox_springs_table(self, number_of_nodes, self.spring_values[:,1])
        else:
            Boundary_Conditions.set_number_of_rows_springs_table(self, number_of_nodes)
            Boundary_Conditions.Assign_comboBox_springs_table(self, number_of_nodes)
        if self.release_values.shape[0] != 1 or self.release_values.shape[1] != 1:
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Torsional_Release, total_element_number, self.release_values[:,1], self.release_values[:,2])
            Boundary_Conditions.set_release_tables_rows(self, self.ui.My_release, total_element_number, self.release_values[:,3], self.release_values[:,4])
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Mz_release, total_element_number, self.release_values[:,5], self.release_values[:,6])
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Warping_Release, total_element_number, self.release_values[:,7], self.release_values[:,8])
        else:
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Torsional_Release, total_element_number)
            Boundary_Conditions.set_release_tables_rows(self, self.ui.My_release, total_element_number)
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Mz_release, total_element_number)
            Boundary_Conditions.set_release_tables_rows(self, self.ui.Warping_Release, total_element_number)
        if self.shear_panel_values.shape[0] != 1 or self.shear_panel_values.shape[1] != 1:
            element_member = h5_file.h5_Class.read_array(self, 'element_member')
            # print('shear panel vals = ', self.shear_panel_values)
            Boundary_Conditions.add_shear_panel(self, element_member, 0, flag='drop down last')
            for i in range(self.shear_panel_values.shape[0]):
                if i > 0:
                    Boundary_Conditions.shear_panel_additional(self)
                for j in range(self.shear_panel_values.shape[1]):
                    # print('i = ', i, 'j = ', j)
                    if j == 5:
                        if self.shear_panel_values[i,j] == 0:
                            continue
                        else:
                            self.ui.BoundaryConditionsTabs.setEnabled(True)
                            item = QTableWidgetItem()
                            item.setText(str(self.shear_panel_values[i, j]))
                            self.ui.Shear_panel_table.setItem(i, j, item)
                    elif j == 1 or j == 2 or j == 3 or j == 4:
                        self.ui.Shear_panel_table.cellWidget(i, j).setCurrentIndex(int(self.shear_panel_values[i,j]))
                    elif j == 6:
                        if self.shear_panel_values[i,j] == 2:
                            self.ui.Shear_panel_table.item(i, j).setCheckState(QtCore.Qt.Checked)
                        else:
                            self.ui.Shear_panel_table.item(i, j).setCheckState(QtCore.Qt.Unchecked)

        else:
            Boundary_Conditions.add_shear_panel(self, total_element_number, 0)

        if uniform_load_array.shape[0] != 1 or uniform_load_array.shape[1] != 1:
            uniform_load_def.set_row_names(self, uniform_load_array, uniform_table_values)
        else:
            uniform_load_def.set_row_names(self)

        if LNC.shape[0] != 1 or LNC.shape[1] !=1:
            point_load_def.set_row_names(self, number_of_nodes, self.RNCc, point_load_table_values)
        else:
            point_load_def.set_row_names(self, number_of_nodes, self.RNCc)

        print('file read from ', filename)

        return self.table_prop, self.Massemble
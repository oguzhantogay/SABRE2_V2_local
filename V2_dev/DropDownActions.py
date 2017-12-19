import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtGui
import SABRE2_GUI
import numpy as np
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
        self.shear_panel_values = None
        self.ground_spring_values = None
        self.torsional_spring_values = None
        self.My_release_values = None
        self.Mz_release_values = None
        self.Warping_release_values = None
        self.uniform_data_values = None
        self.point_data_values = None
        self.JNodeValue_i = None
        self.JNodeValue_j = None

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

        self.member_properties_values = SABRE2_main_subclass.SABRE2_main_subclass.update_member_properties_table(self,
                                                                                                                 self.ui.Member_Properties_Table)
        self.members_table_values, self.JNodeValue_i, self.JNodeValue_j, _, _ = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(self,
                                                                                                   self.ui.Members_table,
                                                                                                   self.Members_table_position)
        self.shear_panel_values = SABRE2_main_subclass.SABRE2_main_subclass.update_shear_panel_table(self,
                                                                                                     self.ui.Shear_panel_table)
        self.ground_spring_values = SABRE2_main_subclass.SABRE2_main_subclass.update_ground_table(self,
                                                                                                  self.ui.Discrete_grounded_spring_table)
        self.torsional_spring_values = SABRE2_main_subclass.SABRE2_main_subclass.update_torsional_release(self,
                                                                                                          self.ui.Torsional_Release)
        self.My_release_values = SABRE2_main_subclass.SABRE2_main_subclass.update_My_release(self, self.ui.My_release)
        self.Mz_release_values = SABRE2_main_subclass.SABRE2_main_subclass.update_Mz_release(self, self.ui.Mz_release)
        self.Warping_release_values = SABRE2_main_subclass.SABRE2_main_subclass.update_warping_release(self,
                                                                                                       self.ui.Warping_Release)
        self.uniform_data_values = SABRE2_main_subclass.SABRE2_main_subclass.update_uniform_data(self,
                                                                                                 self.ui.Uniform_loading_table,
                                                                                                 combo_flag=0)
        self.point_data_values = SABRE2_main_subclass.SABRE2_main_subclass.update_point_data(self,
                                                                                             self.ui.Point_load_table,
                                                                                             combo_flag=0)

        filename = 'test_bin3.npz'
        file = open(filename, 'wb')

        np.savez(file, joint_values=self.joint_values,
                 member_properties_values=self.member_properties_values,
                 members_table_values=self.members_table_values,
                 shear_panel_values=self.shear_panel_values,
                 ground_spring_values=self.ground_spring_values,
                 torsional_spring_values=self.torsional_spring_values,
                 My_release_values=self.My_release_values,
                 Mz_release_values=self.Mz_release_values,
                 Warping_release_values=self.Warping_release_values,
                 uniform_data_values=self.uniform_data_values,
                 point_data_values=self.point_data_values
                 )
        file.close()

    def read_fun(self):
        '''This function reads the variables from the compressed file'''

        filename = 'test_bin3.npz'

        aa = np.load(filename)

        self.joint_values = aa['joint_values']
        self.member_properties_values = aa['member_properties_values']
        self.members_table_values = aa['members_table_values']
        self.shear_panel_values = aa['shear_panel_values']
        self.ground_spring_values = aa['ground_spring_values']
        self.torsional_spring_values = aa['torsional_spring_values']
        self.My_release_values = aa['My_release_values']
        self.Mz_release_values = aa['Mz_release_values']
        self.Warping_release_values = aa['Warping_release_values']
        self.uniform_data_values = aa['uniform_data_values']
        self.point_data_values = aa['point_data_values']

        print("joint values", aa['name1'], "member prop values", aa['name2'])

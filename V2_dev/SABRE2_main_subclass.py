import PyQt4
import sys
from PyQt4.QtGui import *
from PyQt4 import QtGui, QtCore
from PyQt4 import QtGui
import DropDownActions
import OpenGLcode
import AddNode
import h5_file
import numpy as np
import sqlite3 as sq
import Assign_Member_Properties
import BoundaryConditionApplication

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    from OpenGL import GL
except ImportError:
    app = QtGui.QApplication(sys.argv)
    QtGui.QMessageBox.critical(None, "OpenGL hellogl",
                               "PyOpenGL must be installed to run this example.")
    sys.exit(1)


class SABRE2_main_subclass(QMainWindow):
    def __init__(self, ui_layout):

        QMainWindow.__init__(self)
        self.ui = ui_layout
        ui_layout.setupUi(self)
        ui_layout.statusBar = self.statusBar()
        ui_layout.DefinitionTabs.close()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.close()  # to hide analysis tabs
        SABRE2_main_subclass.OpenGLwidget = OpenGLcode.glWidget(ui_layout)
        h5_file.h5_Class.generate_file(self)
        AddNode.AddNodeClass.validatorForTable(self)
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)
        SABRE2_main_subclass.Massemble = np.zeros((1, 16))
        self.table_prop = np.zeros((1, 14))
        self.members_table_values = np.zeros((1, 18))
        ui_layout.Member_Properties_Table.setEnabled(False)
        ui_layout.BoundaryConditionsTabs.setEnabled(False)
        ui_layout.LC_tabs.setEnabled(False)
        SABRE2_main_subclass.BNodevalue = None
        self.SNodevalue = None
        ###  Setting validators for the lineEdit positions
        validatorDouble = QDoubleValidator()
        validatorInt = QIntValidator ()
        ui_layout.AddNodePositionFrom.setValidator(validatorDouble)
        ui_layout.Insert_row_number_Joint.setValidator(validatorInt)
        ui_layout.Insert_row_number_Joint_2.setValidator(validatorInt)
        ui_layout.Insert_row_number_mem_def.setValidator(validatorInt)
        ui_layout.Delete_row_number_mem_def.setValidator(validatorInt)
        ui_layout.Copy_from_number_mem_def.setValidator(validatorInt)
        ui_layout.Insert_after_number_mem_def.setValidator(validatorInt)
        ui_layout.Member_prop_line_edit.setValidator(validatorInt)
        ui_layout.Copy_number_spring.setValidator(validatorInt)
        ui_layout.Paste_number_spring.setValidator(validatorInt)
        ui_layout.Inser_number_point_load.setValidator(validatorInt)
        ui_layout.Delete_number_point_load.setValidator(validatorInt)
        ui_layout.Inser_number_uni_load.setValidator(validatorInt)
        ui_layout.Delete_number_uni_load.setValidator(validatorInt)
        ###

        # ui_layout.AddNodePositionFrom.textChanged.connect(lambda : AddNode.AddNodeClass.setAddNodeComboBox(self))
        ui_layout.actionRender_Line_Element.setCheckable(True)
        ui_layout.actionRender_Selected_Member.setCheckable(True)
        ui_layout.actionRender_All_Members.setCheckable(True)
        ui_layout.Members_tab.setEnabled(False)
        ui_layout.verticalLayout_8.insertWidget(0, SABRE2_main_subclass.OpenGLwidget)
        # SABRE2_main_subclass.OpenGLwidget.resizeGL(SABRE2_main_subclass.OpenGLwidget.width(), SABRE2_main_subclass.OpenGLwidget.height())
        # SABRE2_main_subclass.OpenGLwidget.resized.connect(self.someFunction)
        ui_layout.actionRender_All_Members.triggered.connect(
            lambda: ui_layout.actionRender_Line_Element.setChecked(False))
        ui_layout.actionRender_All_Members.triggered.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        ui_layout.actionRender_All_Members.triggered.connect(
            lambda: ui_layout.actionRender_Selected_Member.setChecked(False))
        ui_layout.actionRender_Line_Element.triggered.connect(
            lambda: ui_layout.actionRender_Selected_Member.setChecked(False))
        ui_layout.actionRender_Line_Element.triggered.connect(
            lambda: ui_layout.actionRender_All_Members.setChecked(False))
        ui_layout.actionRender_Selected_Member.triggered.connect(
            lambda: ui_layout.actionRender_Line_Element.setChecked(False))
        ui_layout.actionRender_Selected_Member.triggered.connect(
            lambda: ui_layout.actionRender_All_Members.setChecked(False))
        ui_layout.actionIsometric_X_Y_Z_View.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.isometricView())
        ui_layout.actionTop_X_Z_View.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.topView())
        ui_layout.actionFront_X_Y_View.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.frontView())
        ui_layout.actionSide_Y_Z_View.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.sideView())
        ui_layout.actionFit_View.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.setFitView())
        ui_layout.actionZoom_In.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.setZoomIn())
        ui_layout.actionZoom_Out.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.setZoomOut())
        ui_layout.actionWhite_Background.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        # Release Tab, first columns of the tables size arrangements
        ui_layout.Torsional_Release.setColumnWidth(0, 62)
        ui_layout.My_release.setColumnWidth(0, 62)
        ui_layout.Mz_release.setColumnWidth(0, 62)
        ui_layout.Warping_Release.setColumnWidth(0, 62)

        # main buttons actions
        ui_layout.DefinitionButton.clicked.connect(lambda: ui_layout.AnalysisTabs.close())
        ui_layout.AnalysisButton.clicked.connect(lambda: ui_layout.DefinitionTabs.close())
        LineChanges.set_member_definition_AISC_combobox(self, ui_layout)  # set AISC database combobox values

        # File dropdown actions
        # ui_layout.actionNew.triggered.connect(lambda: ActionClass('uidesign').NewAct())
        ui_layout.actionOpen.triggered.connect(lambda: self.ActionMenus.OpenAct())
        ui_layout.actionSave.triggered.connect(lambda: self.ActionMenus.SaveAct())
        ui_layout.actionOpen.triggered.connect(lambda: self.table_prop_read())
        ui_layout.actionOpen.triggered.connect(lambda: AddNode.AddNodeClass.ApplyButton(self))
        ui_layout.actionJoint_Member_Labels.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        ui_layout.actionMember_Labels.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        # ui_layout.actionSave_As.triggered.connect(lambda: ActionClass('uidesign').Save_AsAct())
        # ui_layout.actionPrint.triggered.connect(lambda: ActionClass('uidesign').PrintAct())
        # ui_layout.actionPrint_Preview.triggered.connect(lambda: ActionClass('uidesign').Print_PreviewAct())
        ui_layout.actionQuit.triggered.connect(qApp.quit)

        # Help dropdown actions
        ui_layout.actionAbout.triggered.connect(lambda: DropDownActions.ActionClass('uidesign').AboutAct())
        ui_layout.actionJoint_Member_Labels.triggered.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        ui_layout.actionMember_Labels.triggered.connect(lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())
        ui_layout.actionFlange_Labels.triggered.connect(lambda : SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        # Joint Table Arrangements

        # ui_layout.Joints_Table.itemChanged.connect(
        #     lambda: self.update_joints_table(ui_layout.Joints_Table))

        ui_layout.Joints_Table.itemChanged.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        ui_layout.Joints_Table.itemChanged.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.resizeGL(SABRE2_main_subclass.OpenGLwidget.width(), SABRE2_main_subclass.OpenGLwidget.height()))

        ui_layout.Members_table.itemChanged.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.resizeGL(SABRE2_main_subclass.OpenGLwidget.width(), SABRE2_main_subclass.OpenGLwidget.height()))

        ui_layout.Add_new_row_joint.clicked.connect(
            lambda: JointTable.add_new_row(self, ui_layout.Joints_Table, ui_layout.Insert_row_number_Joint, "last"))

        ui_layout.Insert_row_button_Joint.clicked.connect(
            lambda: JointTable.add_new_row(self, ui_layout.Joints_Table, ui_layout.Insert_row_number_Joint,
                                           "arbitrary"))

        ui_layout.Delete_last_row_Joint.clicked.connect(
            lambda: JointTable.delete_row(self, ui_layout.Joints_Table, ui_layout.Delete_row_number_mem_def, "last"))

        ui_layout.Delete_last_row_Joint.clicked.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        ui_layout.Delete_row_button_Joint.clicked.connect(
            lambda: JointTable.delete_row(self, ui_layout.Joints_Table, ui_layout.Insert_row_number_Joint_2,
                                          "arbitrary"))

        # Members Table Arrangements
        self.Members_table_options = ["Mid Depth", "Flange 2", "Flange 1"]
        self.Members_table_position = 3
        # The data update for members tab
        DataCollection.Assign_comboBox(self, ui_layout.Members_table, self.Members_table_options,
                                       self.Members_table_position)

        # Boundary conditions tab - shear panel settings
        shear_panel_options = ["Flange 2", "Shear Center", "Flange 1"]
        shear_panel_position = 1

        # Boundary_Conditions.Assign_comboBox_shear(self, ui_layout.Shear_panel_table, shear_panel_options,
        #                                           shear_panel_position)

        Boundary_Conditions.Assign_comboBox_ground(self, ui_layout.Discrete_grounded_spring_table, shear_panel_options,
                                                   shear_panel_position)

        # Add new row button # self, tableName, options, position
        ui_layout.Members_table.itemChanged.connect(
            lambda: self.update_members_table(ui_layout.Members_table,
                                              self.Members_table_position))

        ui_layout.Members_table.itemChanged.connect(lambda: self.members_defined_check())


        ui_layout.RemoveAddedNodePB.clicked.connect(
            lambda: AddNode.AddNodeClass.removeNodeDialog(self))

        ui_layout.Members_table.itemChanged.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        ui_layout.Members_table.itemChanged.connect(
            lambda: self.m_assemble_updater(ui_layout.Members_table, flag="cell changed"))
        # change number of rows of Member Properties table
        ui_layout.Members_table.itemChanged.connect(
            lambda: MemberPropertiesTable.set_number_of_rows(self, ui_layout.Members_table,
                                                             ui_layout.Member_Properties_Table))

        ## BOUNDARY CONDITIONS APPLICATION
        # Fixities table:
        ui_layout.Fixities_table.itemChanged.connect(
            lambda: Boundary_Conditions.get_checkbox_values(self, ui_layout.Fixities_table))

        ui_layout.Fixities_table.itemChanged.connect(
            lambda: BoundaryConditionApplication.BoundaryConditionArrays.BC_arrays(self))

        # change number of rows of Shear Panel Table
        # ui_layout.Members_table.itemChanged.connect(
        #     lambda: Boundary_Conditions.shear_panel_application(self, ui_layout.Shear_panel_table,
        #                                                         ui_layout.Members_table,
        #                                                         shear_panel_options, shear_panel_position))

        ui_layout.Members_table.itemChanged.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        ui_layout.Mem_def_add.clicked.connect(
            lambda: TableChanges.add_new_row(self, ui_layout.Members_table, self.Members_table_options,
                                             self.Members_table_position, ui_layout.Insert_row_number_mem_def, "last", ))

        ui_layout.Mem_def_add.clicked.connect(lambda: self.m_assemble_updater(ui_layout.Members_table, flag="last"))

        # ui_layout.Mem_def_add.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))


        ui_layout.Insert_row_mem_def_button.clicked.connect(
            lambda: TableChanges.add_new_row(self, ui_layout.Members_table, self.Members_table_options,
                                             self.Members_table_position, ui_layout.Insert_row_number_mem_def,
                                             "arbitrary"))
        ui_layout.Insert_row_mem_def_button.clicked.connect(
            lambda: self.m_assemble_updater(ui_layout.Members_table, lineName=ui_layout.Insert_row_number_mem_def))

        ui_layout.Mem_def_delete.clicked.connect(
            lambda: TableChanges.delete_row(self, ui_layout.Members_table, ui_layout.Delete_row_number_mem_def, "last"))

        ui_layout.Mem_def_delete.clicked.connect(
            lambda:self.m_assemble_updater(ui_layout.Members_table, flag="Delete Last"))

        ## Member properties set up with Member cross-section table changes

        ui_layout.Members_table.itemChanged.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        ui_layout.Mem_def_delete.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        ui_layout.Mem_def_add.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        ui_layout.Insert_row_mem_def_button.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        ui_layout.Delete_row_mem_def_button.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        ui_layout.Copy_mem_def_button.clicked.connect(lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))


        ##
        ui_layout.Delete_row_mem_def_button.clicked.connect(
            lambda: TableChanges.delete_row(self, ui_layout.Members_table, ui_layout.Delete_row_number_mem_def,
                                            "arbitrary"))
        ui_layout.Delete_row_mem_def_button.clicked.connect(
            lambda:self.m_assemble_updater(ui_layout.Members_table, Delete_row= ui_layout.Delete_row_number_mem_def,flag="Delete Selected"))

        # Members line CopyInsert
        ui_layout.Copy_from_number_mem_def.textChanged.connect(
            lambda: self.update_members_copyfrom(ui_layout.Copy_from_number_mem_def,
                                                 self.Members_table_position, ui_layout.Members_table))

        ui_layout.Insert_after_number_mem_def.textChanged.connect(
            lambda: self.update_members_insertafter(ui_layout.Insert_after_number_mem_def,
                                                    self.Members_table_position, ui_layout.Members_table))

        ui_layout.Copy_mem_def_button.clicked.connect(
            lambda: LineChanges.copy_insert_row(self, ui_layout.Members_table, self.Members_table_options,
                                                self.Members_table_position, ui_layout.Copy_from_number_mem_def,
                                                ui_layout.Insert_after_number_mem_def))

        ui_layout.Copy_mem_def_button.clicked.connect(lambda: self.m_assemble_updater(ui_layout.Members_table,
                                                                                      Copy_from_number=ui_layout.Copy_from_number_mem_def,
                                                                                      Insert_after_number=ui_layout.Insert_after_number_mem_def,
                                                                                      flag="copy from"))
        ui_layout.AISC_assign_button.clicked.connect(
            lambda: self.AISC_update_fun(ui_layout.Members_table))


        ui_layout.AISC_assign_button.clicked.connect(
            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        # ui_layout.AISC_assign_button.clicked.connect(lambda : self.m_assemble_updater(ui_layout.Members_table, ))
        # Add Node Menu Actions and Arrangements
        ui_layout.Members_tabs.currentChanged.connect(lambda: AddNode.AddNodeClass.setAddNodeComboBox(self))
        ui_layout.Members_tabs.currentChanged.connect(lambda: AddNode.AddNodeClass.addNodeTableInitiation(self))

        ui_layout.AddNodeMember.currentIndexChanged.connect(lambda: AddNode.AddNodeClass.addNodeTableInitiation(self))
        ui_layout.AddNodeMember.currentIndexChanged.connect(lambda: AddNode.AddNodeClass.comboBoxChanged(self))
        ui_layout.AddNodeMember.currentIndexChanged.connect(lambda: AddNode.AddNodeClass.setAddedNodeComboBox(self))

        ui_layout.AdditionalNodeNumberComboBox.currentIndexChanged.connect(lambda: AddNode.AddNodeClass.fill_table_with_known(self))

        ui_layout.addNodePushButton.clicked.connect(lambda: AddNode.AddNodeClass.addNodePushFun(self))

        ui_layout.FollowTaper.clicked.connect(lambda : AddNode.AddNodeClass.fillTable(self))

        ui_layout.FollowTaper.clicked.connect(lambda:AddNode.AddNodeClass.coordinateFill(self))

        ui_layout.AISC_assign_button_2.clicked.connect(
            lambda: AddNode.AddNodeClass.sql_print(self))

        ui_layout.AddNodeApply.clicked.connect(lambda : AddNode.AddNodeClass.ApplyButton(self))

        ui_layout.AddNodeApply.clicked.connect(lambda : SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        # For boundary conditions definition

        # ui_layout.DefinitionTabs.itemSelectionChanged.connect(lambda : SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

        # Member Properties Table
        ui_layout.Apply_all_member_properties.clicked.connect(
            lambda: MemberPropertiesTable.set_values_with_row(self, ui_layout.Member_Properties_Table,
                                                              ui_layout.Member_prop_line_edit))

        # ui_layout.Member_Properties_Table.itemChanged.connect(
        #     lambda: MemberPropertiesTable.check_values(self, ui_layout.Member_Properties_Table))

        # ui_layout.Member_Properties_Table.itemChanged.connect(
        #     lambda: MemberPropertiesTable.check_values(self, ui_layout.Member_Properties_Table))

        ui_layout.Member_Properties_Table.itemChanged.connect(
            lambda: Assign_Member_Properties.Assign_All_Class.assign_SNodevalue(self))

        # ui_layout.Delete_new_row_button_shear_panel.clicked.connect(
        #     lambda: Boundary_Conditions.set_active(self, ui_layout.Shear_panel_table,
        #                                            ui_layout.Delete_number_shear_panel))

        # Boundary conditions tab - shear panel settings
        ui_layout.Shear_panel_table.itemChanged.connect(
            lambda: Boundary_Conditions.shear_panel_nodes(self, ui_layout.Shear_panel_table, [0, 1]))

        ui_layout.Shear_Panel_Add.clicked.connect(
            lambda: Boundary_Conditions.shear_panel_additional(self))

        ui_layout.Delete_last_panel.clicked.connect(
            lambda: Boundary_Conditions.shear_panel_delete(self))

        ui_layout.Shear_panel_table.itemChanged.connect(
            lambda: self.update_shear_panel_table(ui_layout.Shear_panel_table))

        ui_layout.Discrete_grounded_spring_table.itemChanged.connect(
            lambda: Boundary_Conditions.check_entered_data(self, ui_layout.Discrete_grounded_spring_table))

        ui_layout.Discrete_grounded_spring_table.itemChanged.connect(
            lambda: self.update_ground_table(ui_layout.Discrete_grounded_spring_table, flag="not combo"))

        # Release Tab
        ui_layout.Torsional_Release.itemChanged.connect(
            lambda: self.update_torsional_release(ui_layout.Torsional_Release))

        ui_layout.My_release.itemChanged.connect(
            lambda: self.update_My_release(ui_layout.My_release))

        ui_layout.Mz_release.itemChanged.connect(
            lambda: self.update_Mz_release(ui_layout.Mz_release))

        ui_layout.Warping_Release.itemChanged.connect(
            lambda: self.update_warping_release(ui_layout.Warping_Release))

        # Loading Tabs

        ui_layout.LoadTypeTable.itemChanged.connect(
            lambda: LoadingClass.changes_on_load_combination(self, ui_layout.LoadTypeTable,
                                                             ui_layout.LoadCombinationTable))

        ui_layout.LoadTypeAdd.clicked.connect(lambda: LoadingClass.add_load(self, ui_layout.LoadTypeTable))

        ui_layout.LoadTypeRemove.clicked.connect(lambda: LoadingClass.remove_load(self, ui_layout.LoadTypeTable))

        # Load Combinations Table

        ui_layout.LoadCombinationTable.itemChanged.connect(
            lambda: LoadingClass.get_combination_data(self, ui_layout.LoadCombinationTable))
        ui_layout.LoadCombinationAdd.clicked.connect(
            lambda: LoadingClass.add_load_comb(self, ui_layout.LoadCombinationTable))

        ui_layout.LoadCombinationRemove.clicked.connect(
            lambda: LoadingClass.remove_load(self, ui_layout.LoadCombinationTable))

        # Distributed Load table arrangements

        uniform_load_options = ["Flange 2", "Shear Center", "Flange 1", "Mid Web", "Centroid"]
        load_place_position = 2
        load_type_position = 1

        ui_layout.LoadTypeTable.itemChanged.connect(
            lambda: uniform_load_def.combo_box_types(self, ui_layout.Uniform_loading_table, ui_layout.LoadTypeTable,
                                                     load_type_position))

        uniform_load_def.set_combo_box(self, ui_layout.Uniform_loading_table, uniform_load_options,
                                       load_place_position)

        uniform_load_def.combo_box_types(self, ui_layout.Uniform_loading_table, ui_layout.LoadTypeTable,
                                         load_type_position)

        ui_layout.Uniform_loading_table.itemChanged.connect(
            lambda: self.update_uniform_data(ui_layout.Uniform_loading_table, combo_flag=0))

        # Point Load table arrangements

        uniform_load_options = ["Shear Center", "Flange 2 + alpha", "Flange 1 + alpha", "Centroid"]

        ui_layout.LoadTypeTable.itemChanged.connect(
            lambda: point_load_def.combo_box_types(self, ui_layout.Point_load_table, ui_layout.LoadTypeTable,
                                                   load_type_position))

        point_load_def.set_combo_box(self, ui_layout.Point_load_table, uniform_load_options,
                                     load_place_position)

        point_load_def.combo_box_types(self, ui_layout.Point_load_table, ui_layout.LoadTypeTable,
                                       load_type_position)

        ui_layout.Point_load_table.itemChanged.connect(
            lambda: self.update_point_data(ui_layout.Point_load_table, combo_flag=0))

        # Progress bar
        # put me in analysis section
        ui_layout.progressBar = PyQt4.QtGui.QProgressBar()
        ui_layout.statusbar.addPermanentWidget(ui_layout.progressBar)
        analysisprogress = 0  # Update this value later by integrating with analysis**********
        ui_layout.progressBar.setValue(analysisprogress)
        ui_layout.progressBar.setTextVisible(True)

    # Joints table functions
    def update_joints_table(self, tableName):
        Joint_values = JointTable.tableValues(self, tableName)
        # print("main screen Joint values", Joint_values)
        return Joint_values

    # Members tab, Member definition functions
    def update_members_table(self, tableName, position):
        JNodeValue = SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)
        Members_values, current_row, current_col, flag_mem_values = DataCollection.update_table_values(self, tableName, position)

        if current_col == 1 or current_col == 2:
            if Members_values[current_row, current_col] in JNodeValue[:, 0]:
                DropDownActions.ActionClass.statusMessage(self, message="")
            elif Members_values[current_row, current_col] == 0:
                self.ui.Members_table.setCurrentCell(current_row, current_col)
                DropDownActions.ActionClass.statusMessage(self,
                                                          message="The member has been defined before. Please change the highlighted cell!")
            else:
                DropDownActions.ActionClass.statusMessage(self,
                                                          message="Please enter a joint number that is in the Joints Tab")
                col = tableName.currentColumn()
                row = tableName.currentRow()
                tableName.item(row, col).setText("0")
                self.ui.Members_tabs.setCurrentIndex(0)

        row_count = tableName.rowCount()
        # print("row count = ", row_count)
        Rval = np.zeros((row_count, 2))
        SABRE2_main_subclass.BNodevalue = h5_file.h5_Class.read_array(self,'BNodevalue')
        for i in range(row_count):
            Rval[i][0] = Members_values[i][0]
            Rval[i][1] = Members_values[i][3] + 1
        # print("update = ", SABRE2_main_subclass.BNodevalue, "\nshape = ", SABRE2_main_subclass.BNodevalue.shape[1])
        if SABRE2_main_subclass.BNodevalue.shape[2] != 16:
            SABRE2_main_subclass.BNodevalue = np.zeros((row_count, 1, 2))
            # print("update = ", SABRE2_main_subclass.BNodevalue)
            if row_count == SABRE2_main_subclass.BNodevalue.shape[0]:
                for i in range(row_count):
                    SABRE2_main_subclass.BNodevalue[i][0][0] = i + 1
                    SABRE2_main_subclass.BNodevalue[i][0][1] = 0  # to indicate zero bracing
        elif SABRE2_main_subclass.BNodevalue.shape[2] == 2:
            SABRE2_main_subclass.BNodevalue = np.zeros((row_count, 1, 2))
            if row_count == SABRE2_main_subclass.BNodevalue.shape[0]:
                for i in range(row_count):
                    SABRE2_main_subclass.BNodevalue[i][0][0] = i + 1
                    SABRE2_main_subclass.BNodevalue[i][0][1] = 0  # to indicate zero bracing

        h5_file.h5_Class.update_array(self, SABRE2_main_subclass.BNodevalue, 'BNodevalue')
        JNodeValue_i = np.zeros((Members_values.shape[0], 14))
        JNodeValue_j = np.zeros((Members_values.shape[0], 14))

        for i in range(Members_values.shape[0]):
            # i node values
            if flag_mem_values[i][1] == 1:
                JNodeValue_i[i][0] = Members_values[i][0]
                JNodeValue_i[i][1] = Members_values[i][1]
                JNodeValue_i[i][2] = JNodeValue[int(Members_values[i][1] - 1)][1]
                JNodeValue_i[i][3] = JNodeValue[int(Members_values[i][1] - 1)][2]
                JNodeValue_i[i][4] = JNodeValue[int(Members_values[i][1] - 1)][3]
                JNodeValue_i[i][5] = Members_values[i][4]
                JNodeValue_i[i][6] = Members_values[i][5]
                JNodeValue_i[i][7] = Members_values[i][6]
                JNodeValue_i[i][8] = Members_values[i][7]
                JNodeValue_i[i][9] = Members_values[i][12]
                JNodeValue_i[i][10] = Members_values[i][13]
                JNodeValue_i[i][11] = JNodeValue_i[i][9] + JNodeValue_i[i][6] + JNodeValue_i[i][8]
                JNodeValue_i[i][12] = JNodeValue_i[i][9] + (JNodeValue_i[i][6] + JNodeValue_i[i][8]) / 2
                JNodeValue_i[i][13] = Members_values[i][16]
                # j node values
                JNodeValue_j[i][0] = Members_values[i][0]
                JNodeValue_j[i][1] = Members_values[i][2]
                JNodeValue_j[i][2] = JNodeValue[int(Members_values[i][2] - 1)][1]
                JNodeValue_j[i][3] = JNodeValue[int(Members_values[i][2] - 1)][2]
                JNodeValue_j[i][4] = JNodeValue[int(Members_values[i][2] - 1)][3]
                JNodeValue_j[i][5] = Members_values[i][8]
                JNodeValue_j[i][6] = Members_values[i][9]
                JNodeValue_j[i][7] = Members_values[i][10]
                JNodeValue_j[i][8] = Members_values[i][11]
                JNodeValue_j[i][9] = Members_values[i][14]
                JNodeValue_j[i][10] = Members_values[i][15]
                JNodeValue_j[i][11] = JNodeValue_j[i][9] + JNodeValue_j[i][6] + JNodeValue_j[i][8]
                JNodeValue_j[i][12] = JNodeValue_j[i][9] + (JNodeValue_j[i][6] + JNodeValue_j[i][8]) / 2
                JNodeValue_j[i][13] = Members_values[i][17]




        # print("Rval", Rval)
        self.members_table_values = Members_values
        # print('self.members_table_values', self.members_table_values)
        # print("main screen node i", JNodeValue_i)
        # print("main screen node j", JNodeValue_j)
        # self.members_defined_check()
        return Members_values, JNodeValue_i, JNodeValue_j, current_row, SABRE2_main_subclass.BNodevalue, flag_mem_values, Rval

    def members_defined_check(self):
        check_array = h5_file.h5_Class.read_array(self, 'check_array')
        row_count = self.ui.Members_table.rowCount()
        current_row = self.ui.Members_table.currentRow()
        # print('row_count = ' ,row_count)
        # print('row_count1 = ' ,check_array.shape[0])
        if check_array.shape[0] != row_count:
            check_array = np.zeros((row_count,1))
        elif check_array[current_row][0] != 1:
            for j in range(row_count):
                for i in range(18):
                    # print(i, '     ' , self.ui.Members_table.item(current_row, i))

                    if i == 3:
                        pass
                    elif self.ui.Members_table.item(j, i) is not None:
                        check_array[j][0] = 1
                    else:
                        check_array[j][0] = 0
        # print('check array = ', check_array)
        h5_file.h5_Class.update_array(self, check_array, 'check_array')

    def AISC_update_fun(self, tableName):
        # tableName.blockSignals(True)
        try:
            Massemble, current_row_number, row_count, table_prop = LineChanges.sql_print(self, tableName)
            # print('table prop = ', current_row_number)
            # print('self = ', self.table_prop)
            self.table_prop[current_row_number][0] = table_prop[0, 0]
            self.table_prop[current_row_number][2] = table_prop[0, 0]
            self.table_prop[current_row_number][4] = table_prop[0, 0]
            self.table_prop[current_row_number][6] = table_prop[0, 0]
            self.table_prop[current_row_number][1] = table_prop[0, 1]
            self.table_prop[current_row_number][3] = table_prop[0, 1]
            self.table_prop[current_row_number][5] = table_prop[0, 1]
            self.table_prop[current_row_number][7] = table_prop[0, 1]
            self.table_prop[current_row_number][8] = table_prop[0, 16]
            self.table_prop[current_row_number][10] = table_prop[0, 16]
            self.table_prop[current_row_number][9] = table_prop[0, 3]
            self.table_prop[current_row_number][11] = table_prop[0, 3]
            self.table_prop[current_row_number][12] = table_prop[0, 17]
            self.table_prop[current_row_number][13] = table_prop[0, 17]

            # print("Massemble = ", Massemble)
            # print("table prop 2= ", self.table_prop)
            h5_file.h5_Class.update_array(self,self.table_prop, 'table_prop')


            for i in range(16):
                SABRE2_main_subclass.Massemble[int(current_row_number)][i] = Massemble[0][i]

            self.m_assemble_updater(tableName, flag="cell changed")

            return Massemble, current_row_number, row_count
        except TypeError:
            pass

    def update_members_copyfrom(self, lineName, position, tableName):
        copyfrom_value = DataCollection.update_lineedit_values(self, lineName)
        copyfrom_value = copyfrom_value - 1
        r = tableName.rowCount()
        try:
            if copyfrom_value <= r - 1:
                tableName.selectRow(copyfrom_value)
                DropDownActions.ActionClass.statusMessage(self, message="")
        except TypeError:
            DropDownActions.ActionClass.statusMessage(self, message="Row not defined")
        return copyfrom_value

    def update_members_insertafter(self, lineName, position, tableName):
        r = tableName.rowCount()
        try:
            insertafter_values = DataCollection.update_lineedit_values(self, lineName)
            insertafter_values = insertafter_values - 1

            if insertafter_values <= r - 1:
                tableName.selectRow(insertafter_values)
                DropDownActions.ActionClass.statusMessage(self, message="")
            else:
                lineName.setText("")

        except TypeError:
            DropDownActions.ActionClass.statusMessage(self, message="Row not defined")
        return insertafter_values

    #table prop array for whether the section is from AISC database or not is read from the saved file
    def table_prop_read(self):
        self.table_prop, SABRE2_main_subclass.Massemble= DropDownActions.ActionClass.read_fun(self)





    # Table Values Update

    def update_member_properties_table(self, tableName):
        prop_values = JointTable.tableValues(self, tableName)
        # print("main screen Properties Table values",self.table_prop)
        return prop_values

    def update_shear_panel_table(self, tableName, flag="not combo"):
        shear_values = Boundary_Conditions.shear_panel_values(self, tableName, flag)
        print("main screen Shear Table Values", shear_values)
        return shear_values

    def update_ground_table(self, tableName, flag="not combo"):
        shear_values = Boundary_Conditions.ground_spring_values(self, tableName, flag)
        print("main screen Ground Table Values", shear_values)
        return shear_values

    def update_torsional_release(self, tableName):
        torsional_values = Boundary_Conditions.release_tables_values(self, tableName)
        print("main screen Torsional Table Values", torsional_values)
        return torsional_values

    def update_My_release(self, tableName):
        My_values = Boundary_Conditions.release_tables_values(self, tableName)
        print("main screen My Table Values", My_values)
        return My_values

    def update_Mz_release(self, tableName):
        Mz_values = Boundary_Conditions.release_tables_values(self, tableName)
        print("main screen Mz Table Values", Mz_values)
        return Mz_values

    def update_warping_release(self, tableName):
        warping_values = Boundary_Conditions.release_tables_values(self, tableName)
        print("main screen Warping Table Values", warping_values)
        return warping_values

    def update_loading_types_conditions(self, tableName):
        [table_data, ID_data] = LoadingClass.defined_load_names(self, tableName)
        print("main screen load type IDs", ID_data)
        return ID_data

    def update_uniform_data(self, tableName, combo_flag):
        [uniform_data_vals, SegmentNames] = uniform_load_def.uniform_data_table(self, tableName, combo_flag)
        print("main screen uniform load values", uniform_data_vals)
        return uniform_data_vals

    def update_point_data(self, tableName, combo_flag):
        point_data_vals = point_load_def.point_data_table(self, tableName, combo_flag)
        print("main screen uniform load values", point_data_vals)
        return point_load_def

    def m_assemble_updater(self, tableName, Copy_from_number=1, Insert_after_number=1, lineName=1, Delete_row = 1,
                           flag="insert after button"):
        # print('flag in massembly updater = ', flag)
        # print("members = ", self.members_table_values)
        # print("massemble updater = ", SABRE2_main_subclass.Massemble)
        row_count = tableName.rowCount()
        to_append = np.zeros((1, 16))
        to_append_prop = np.zeros((1, 14))
        current_row = tableName.currentRow()


        if flag == "last":
            print('test last')
            # print(self.table_prop)
            SABRE2_main_subclass.Massemble = np.append(SABRE2_main_subclass.Massemble, to_append, axis=0)
            self.table_prop = np.append(self.table_prop, to_append_prop, axis=0)
            for i in range(3):
                SABRE2_main_subclass.Massemble[current_row][i] = self.members_table_values[current_row][i]

            # print('after = ', self.table_prop)

        elif flag == "insert after button":
            row_number = DataCollection.update_lineedit_values(self, lineName)
            SABRE2_main_subclass.Massemble = np.insert(SABRE2_main_subclass.Massemble, row_number, 0, axis=0)
            self.table_prop = np.insert(self.table_prop, row_number, 0, axis=0)
            for i in range(3):
                SABRE2_main_subclass.Massemble[current_row][i] = self.members_table_values[current_row][i]
        elif flag == "copy from":
            copyfrom_values = DataCollection.update_lineedit_values(self, Copy_from_number)
            insertafter_values = DataCollection.update_lineedit_values(self, Insert_after_number)
            SABRE2_main_subclass.Massemble = np.insert(SABRE2_main_subclass.Massemble, insertafter_values,
                                       SABRE2_main_subclass.Massemble[(copyfrom_values - 1), :],
                                       axis=0)
            self.table_prop = np.insert(self.table_prop, insertafter_values,
                                        self.table_prop[(copyfrom_values - 1), :],
                                        axis=0)
            for i in range(3):
                SABRE2_main_subclass.Massemble[current_row][i] = self.members_table_values[current_row][i]

        elif flag == "Delete Last":
            SABRE2_main_subclass.Massemble = np.delete(SABRE2_main_subclass.Massemble,(row_count-1), axis = 0)

        elif flag == "Delete Selected":
            row_number = DataCollection.update_lineedit_values(self, Delete_row)
            delete = int(row_number) - 1
            SABRE2_main_subclass.Massemble = np.delete(SABRE2_main_subclass.Massemble, (delete), axis=0)

            for i in range(row_count):
                SABRE2_main_subclass.Massemble[i][0] = self.members_table_values[i][0]


        elif flag == "cell changed":

            row = tableName.currentRow()
            # print('row in cell changed = ',row)
            # print('SA_Massemble =', SABRE2_main_subclass.Massemble)
            try:
                for i in range(3):
                    SABRE2_main_subclass.Massemble[row][i] = self.members_table_values[row][i]

                for i in range(14):

                    if tableName.item(row, i+3) is None:
                        SABRE2_main_subclass.Massemble[row][3] = 1
                        break

                    elif np.isclose(self.table_prop[row][i], self.members_table_values[row][i + 4],
                                             rtol=1e-05, atol=1e-08, equal_nan=False):
                        # print("current row " + str(current_row) + " is rolled")
                        SABRE2_main_subclass.Massemble[row][3] = 1
                    else:

                        for i in range(1,14):
                            SABRE2_main_subclass.Massemble[row][i+2] = 0

                        # print("current row " + str(current_row) + " is welded")
                        break
            except ValueError and IndexError:
                pass
        elif flag == "OpenGL":

            pass
            # try:
            #     print("OpenGL = ", SABRE2_main_subclass.Massemble)
            #     return SABRE2_main_subclass.Massemble
            # except Exception as e:
            #     print("Oops an exception occurred")
            #     print(e)

        # print("table_" , self.table_prop, "\n members table = ", self.members_table_values)
        h5_file.h5_Class.update_array(self,SABRE2_main_subclass.Massemble,'Massemble')
        h5_file.h5_Class.update_array(self, self.table_prop, 'table_prop')
        return SABRE2_main_subclass.Massemble, self.table_prop
        # pass

    def resizeEvent(self, event):
        # SABRE2_main_subclass.OpenGLwidget.resized.emit()
        # return super(Window, self).resizeEvent(event)
        pass

    def someFunction(self):
        # SABRE2_main_subclass.OpenGLwidget
        pass
        #
        # width = SABRE2_main_subclass.OpenGLwidget.width()
        # height = SABRE2_main_subclass.OpenGLwidget.height()
        # print("Function", width, height)
        # print(x,y)
        # SABRE2_main_subclass.OpenGLwidget.setMinimumSize()


# class DropDownActions(QMainWindow):
#     """docstring for Actions"""
#
#     def __init__(self, ui_layout):
#         QMainWindow.__init__(self)
#         self.ui = ui_layout
#
#     def AboutAct(self):
#         # self.statusMessage(self, message="Learn about Sabre2")
#
#         # Program information
#         version = "3.0"
#         website = "http://www.white.ce.gatech.edu/sabre"
#         email = "fill in data"
#         license_link = "fill in data"
#         license_name = "fill in data"
#
#         # Dialog box
#         about_box = SABRE2_GUI.QtGui.QMessageBox()
#         about_box.setWindowTitle("About Sabre2 Version 3.0")
#         about_box.setTextFormat(SABRE2_GUI.QtCore.Qt.RichText)
#         # about_box.setIconPixmap(QtGui.QPixmap(ComicTaggerSettings.getGraphic('about.png'))) #include image
#         about_box.setText("""
#         <HTML>
#         <p><b>This demo shows use of <c>QTableWidget</c> with custom handling for
#          individual cells.</b></p>
#         <p>Using a customized table item we make it possible to have dynamic
#          output in different cells. The content that is implemented for this
#          particular demo is:
#         <ul>
#         <li>Adding two cells.</li>
#         <li>Subtracting one cell from another.</li>
#         <li>Multiplying two cells.</li>
#         <li>Dividing one cell with another.</li>
#              <li>Summing the contents of an arbitrary number of cells.</li>
#              </HTML>
#          """)
#         about_box.setStandardButtons(SABRE2_GUI.QtGui.QMessageBox.Ok)
#         about_box.exec_()
#
#     def NewAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Create a new file")
#
#         fileName = []
#         inpdata = []
#         # clear all user inputs
#         # reset OpenGL screen
#         # reset messages
#
#     def OpenAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Open an existing file")
#         fileName = PyQt4.QtGui.QFileDialog.getOpenFileName(None, "Open Sabre2 File", '',
#                                                            "Sabre2 Files (*.mat);;All Files (*)")
#         if not fileName:
#             return
#         try:
#             in_file = open(str(fileName), 'rb')
#         except IOError:
#             QtGui.QMessageBox.information(self, "Unable to open file", "There was an error opening \"%s\"" % fileName)
#             return
#
#         #if first line states "basic" script
#         # then just fill in gui
#         #elif first line states "complete" script
#         # if autorun = "enabled"
#         #   then immediately run and show results
#         # elif autorun = "disabled"
#         #   then fill in gui, pull up analysis tab and update opengl
#
#         inpdata = []
#         inpdata = pickle.load(in_file)
#         in_file.close()
#
#         if len(inpdata) == 0:
#             QtGui.QMessageBox.information(self, "File is empty")
#         else:
#             # needs to be updated once data structure is determined**************************
#             for name, address in inpdata:
#                 self.nameLine.setText(name)
#                 self.addressText.setText(address)
#
#         self.updateInterface(self.NavigationMode)
#
#         # Fill in spread sheet cells
#         # update OpenGL screen
#         # update messages
#         # go directly to analysis screen
#
#     def SaveAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Save the model to disk")
#
#         inpdata = "text test addon"
#         fileName = "test1.txt"
#
#         if len(inpdata) == 0:
#             QtGui.QMessageBox.information(self, "No data has been attributed to the model")
#         else:
#             try:
#                 fileName
#             except NameError:  # if data has not been saved to a file yet invoke popup save screen
#                 import pickle
#                 fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File", '',
#                                                                    "Sabre2 File (*.mat);;All Files (*)")
#                 if not fileName:
#                     return
#                 try:
#                     out_file = open(str(fileName), 'wb')
#                 except IOError:
#                     PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
#                                                         "There was an error opening \"%s\"" % fileName)
#                     return
#
#                 pickle.dump(inpdata, out_file)
#                 out_file.close()
#             else:
#                 import pickle
#                 try:  # if file already exists skip popup and update save file
#                     out_file = open(str(fileName), 'wb')
#                 except IOError:
#                     PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
#                                                         "There was an error opening \"%s\"" % fileName)
#                     return
#
#                 pickle.dump(inpdata, out_file)
#                 out_file.close()
#
#     def Save_AsAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Name the file saved to disk")
#
#         inpdata = "text test"
#
#         # Invoke save popup screen
#         if len(inpdata) == 0:
#             QtGui.QMessageBox.information(self, "No data has been attributed to the model")
#         else:
#             import pickle
#             fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File As", '',
#                                                                "Sabre2 File (*.mat);;All Files (*)")
#             if not fileName:
#                 return
#             try:
#                 out_file = open(str(fileName), 'wb')
#             except IOError:
#                 PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
#                                                     "There was an error opening \"%s\"" % fileName)
#                 return
#
#             pickle.dump(inpdata, out_file)
#             out_file.close()
#
#     def PrintAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Print screen")
#
#         # not sure what we are printing?
#         # data, results, or just screenshot of OpenGL?
#
#     def Print_PreviewAct(self):
#         DropDownActions.ActionClass.statusMessage(self, message="Preview screen print")
#
#     def statusMessage(self, message):
#         self.ui.statusBar.showMessage(message)
#
#     # def maybeSave(self):
#     #     if self.textEdit.document().isModified():
#     #         ret = QtGui.QMessageBox.warning(self, "Application",
#     #                                         "The model has been modified.\nDo you want to save "
#     #                                         "your changes?",
#     #                                         QtGui.QMessageBox.Save | QtGui.QMessageBox.Discard |
#     #                                         QtGui.QMessageBox.Cancel)
#     #         if ret == QtGui.QMessageBox.Save:
#     #             return self.save()
#     #         elif ret == QtGui.QMessageBox.Cancel:
#     #             return False
#     #     return True
#

class DataCollection(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def Assign_comboBox(self, tableName, options, position, current_index = None):
        r = tableName.rowCount()
        for i in range(r):
            # print('i = ', i)
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            if current_index is not None:
                combo_box.setCurrentIndex(current_index)
                combo_box.currentIndexChanged.connect(
                    lambda: SABRE2_main_subclass.update_members_table(self, tableName, position))

                combo_box.currentIndexChanged.connect(
                    lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

                combo_box.currentIndexChanged.connect(
                    lambda:SABRE2_main_subclass.OpenGLwidget.resizeGL(SABRE2_main_subclass.OpenGLwidget.width(),
                                                   SABRE2_main_subclass.OpenGLwidget.height()))

    def update_table_values(self, tableName, position):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        val2 = np.zeros((row_check, col_check))
        val2[:, 3] = 2
        flag_mem_value = np.zeros((row_check,2))

        if row == -1:
            pass

        else:

            try:
                for i in range(row_check):
                    for j in range(col_check):
                        if tableName.item(i, j) is None:
                            pass
                        elif j == position:
                            # print(i)
                            if tableName.cellWidget(i, position) is None:
                                val1[i, position] = 0
                                DropDownActions.ActionClass.statusMessage(self, message="New row added!")
                            else:
                                value_combo = tableName.cellWidget(i, position).currentIndex()
                                val1[i, position] = value_combo
                                DropDownActions.ActionClass.statusMessage(self, message="")
                        else:
                            if col == 1 or col == 2:
                                val1[i, j] = float(tableName.item(i, j).text())
                                val2[i, j] = 2
                                pass

                            elif tableName.item(row, 1) is None:
                                tableName.clearSelection()
                                tableName.item(row, col).setText("0")
                                DropDownActions.ActionClass.statusMessage(self, message="Please select joint i!")
                                self.ui.Members_tabs.setCurrentIndex(0)

                            elif tableName.item(row, 2) is None:
                                tableName.clearSelection()
                                tableName.item(row, col).setText("0")
                                DropDownActions.ActionClass.statusMessage(self, message="Please select joints j!")
                                self.ui.Members_tabs.setCurrentIndex(0)
                            else:
                                val1[i, j] = float(tableName.item(i, j).text())
                                val2[i, j] = 2
                                DropDownActions.ActionClass.statusMessage(self, message="")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("0")
                self.ui.Members_tabs.setCurrentIndex(1)
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")

        if 0 in val2:
            self.ui.Member_Properties_Table.setEnabled(False)
        else:
            self.ui.Member_Properties_Table.setEnabled(True)
            DropDownActions.ActionClass.statusMessage(self, message="Member Defined")

        val4 = np.delete(val2,(0,1,2,3), axis = 1)

        flag_mem_value[:,0] = val1[:,0]
        for i in range(int(row_check)):
            if 0 in val4[i, :]:
                flag_mem_value[i][1] = 0
            else:
                flag_mem_value[i][1] = 1


        def unique(a):
            b = [a[i] for i in sorted(np.unique(a, axis=0, return_index=True)[1])]
            return b

        if row_check == 1:
            pass
        else:
            if col == 1 or col == 2:
                val3 = val1[:, (1, 2)]
                val_uniq = unique(val3)
                if np.array_equal(val3, val_uniq):
                    pass
                else:
                    tableName.clearSelection()
                    tableName.item(row, col).setText("0")
                    DropDownActions.ActionClass.statusMessage(self, message="The Member has been defined before!")
                    self.ui.Members_tabs.setCurrentIndex(0)
        return val1, row, col,flag_mem_value

    def update_lineedit_values(self, lineName):
        try:
            val2 = [];
            val2 = int(lineName.text())
            # print("val2", val2)
        except ValueError:
            lineName.setText("")
            DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")
        return val2


class TableChanges(QMainWindow):
    """This Class is imposing the changes on the Definition Tables"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def add_new_row(self, tableName, options, position, lineName, flag, combo_values=None):
        # print('add_new_row')
        def add_new_row_application(self,tableName, options, position, lineName, flag, combo_values=None):
            """nested function for application of added node"""
            combo_box = QtGui.QComboBox()
            if flag == "last":
                tableName.insertRow(row_position)

                val = 0
                item = QTableWidgetItem(str(val))
                tableName.setItem(row_position, position, item)
                for t in options:
                    combo_box.addItem(t)
                # print('combo box value = ', combo_values)
                tableName.setCellWidget(row_position, position, combo_box)
                if combo_values is None:
                    pass
                else:
                    member_count = combo_values.shape[0]
                    if member_count > row_position:
                        combo_box.setCurrentIndex(combo_values[row_position-1])
                        combo_box.currentIndexChanged.connect(
                            lambda: SABRE2_main_subclass.update_members_table(self, tableName, position))

                        combo_box.currentIndexChanged.connect(
                            lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

                        combo_box.currentIndexChanged.connect(
                            lambda: SABRE2_main_subclass.OpenGLwidget.resizeGL(
                                SABRE2_main_subclass.OpenGLwidget.width(),
                                SABRE2_main_subclass.OpenGLwidget.height()))

                item1 = QTableWidgetItem(str(row_position + 1))
                item1.setTextAlignment(QtCore.Qt.AlignCenter)
                item1.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(row_position, 0, item1)
            else:
                row_number = DataCollection.update_lineedit_values(self, lineName)
                tableName.insertRow(row_number)
                val = 0

                item = QTableWidgetItem(str(val))
                tableName.setItem(row_number, position, item)

                for i in range(row_position + 2):
                    item = QTableWidgetItem(str(i + 1))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                    tableName.setItem(i, 0, item)

                for t in options:

                    combo_box.addItem(t)

                tableName.setCellWidget(row_number, position, combo_box)

            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_members_table(self, tableName, position))

            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.OpenGLwidget.updateTheWidget())

            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.OpenGLwidget.resizeGL(
                    SABRE2_main_subclass.OpenGLwidget.width(),
                    SABRE2_main_subclass.OpenGLwidget.height()))
        row_position = tableName.rowCount()

        if combo_values is not None:
            member_count = combo_values.shape[0]
            if member_count > row_position:
                add_new_row_application(self, tableName, options, position, lineName, flag, combo_values=None)
        else:
            add_new_row_application(self, tableName, options, position, lineName, flag, combo_values=None)

    def delete_row(self, tableName, lineName, flag):
        row_position = tableName.rowCount()
        if flag == "last":
            if row_position == 1:
                pass
            else:
                tableName.removeRow(row_position - 1)
        else:
            row_number = DataCollection.update_lineedit_values(self, lineName)
            tableName.removeRow(row_number - 1)

            for i in range(row_position + 2):
                item = QTableWidgetItem(str(i + 1))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(i, 0, item)

        DataCollection.update_table_values(self, tableName, 3)


class LineChanges(QMainWindow):
    """This Class is imposing the changes on the QLineEdit cells"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def copy_insert_row(self, tableName, options, position, Copy_from_number, Insert_after_number):
        tableName.blockSignals(True)
        Members_values, current_row, _ ,_= DataCollection.update_table_values(self, tableName, position)
        copyfrom_values = DataCollection.update_lineedit_values(self, Copy_from_number)
        insertafter_values = DataCollection.update_lineedit_values(self, Insert_after_number)
        row_position = tableName.rowCount()

        np.insert(Members_values, insertafter_values, Members_values[(copyfrom_values - 1), :], axis=0)

        column_count = tableName.columnCount()
        tableName.insertRow(insertafter_values)
        for j in range(column_count):
            if j == 0 or j == 1 or j == 2:
                pass
            elif j == position:
                combo_box = QtGui.QComboBox()
                for t in options:
                    combo_box.addItem(t)
                tableName.setCellWidget(insertafter_values, position, combo_box)
                combo_box.currentIndexChanged.connect(
                    lambda: SABRE2_main_subclass.update_members_table(self, tableName, position))
                copied_index = tableName.cellWidget(copyfrom_values, position).currentIndex()
                tableName.cellWidget(insertafter_values, position).setCurrentIndex(copied_index)
            else:
                val = Members_values[copyfrom_values - 1, j]
                item = QTableWidgetItem(str(val))
                tableName.setItem(insertafter_values, j, item)

        for i in range(row_position + 2):
            item = QTableWidgetItem(str(i + 1))
            item.setTextAlignment(QtCore.Qt.AlignCenter)
            item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
            tableName.setItem(i, 0, item)
        tableName.blockSignals(False)

    def set_member_definition_AISC_combobox(self, ui_layout):
        ''' This function sets the combobox for the AISC database'''

        cross_sections = ["W44X335", "W44X290", "W44X262", "W44X230", "W40X593", "W40X503", "W40X431", "W40X397",
                          "W40X372", "W40X362", "W40X324", "W40X297", "W40X277", "W40X249", "W40X215", "W40X199",
                          "W40X392", "W40X331", "W40X327", "W40X294", "W40X278", "W40X264", "W40X235", "W40X211",
                          "W40X183", "W40X167", "W40X149", "W36X652", "W36X529", "W36X487", "W36X441", "W36X395",
                          "W36X361", "W36X330", "W36X302", "W36X282", "W36X262", "W36X247", "W36X231", "W36X256",
                          "W36X232", "W36X210", "W36X194", "W36X182", "W36X170", "W36X160", "W36X150", "W36X135",
                          "W33X387", "W33X354", "W33X318", "W33X291", "W33X263", "W33X241", "W33X221", "W33X201",
                          "W33X169", "W33X152", "W33X141", "W33X130", "W33X118", "W30X391", "W30X357", "W30X326",
                          "W30X292", "W30X261", "W30X235", "W30X211", "W30X191", "W30X173", "W30X148", "W30X132",
                          "W30X124", "W30X116", "W30X108", "W30X99", "W30X90", "W27X539", "W27X368", "W27X336",
                          "W27X307", "W27X281", "W27X258", "W27X235", "W27X217", "W27X194", "W27X178", "W27X161",
                          "W27X146", "W27X129", "W27X114", "W27X102", "W27X94", "W27X84", "W24X370", "W24X335",
                          "W24X306", "W24X279", "W24X250", "W24X229", "W24X207", "W24X192", "W24X176", "W24X162",
                          "W24X146", "W24X131", "W24X117", "W24X104", "W24X103", "W24X94", "W24X84", "W24X76",
                          "W24X68", "W24X62", "W24X55", "W21X201", "W21X182", "W21X166", "W21X147", "W21X132",
                          "W21X122", "W21X111", "W21X101", "W21X93", "W21X83", "W21X73", "W21X68", "W21X62",
                          "W21X55", "W21X48", "W21X57", "W21X50", "W21X44", "W18X311", "W18X283", "W18X258",
                          "W18X234", "W18X211", "W18X192", "W18X175", "W18X158", "W18X143", "W18X130", "W18X119",
                          "W18X106", "W18X97", "W18X86", "W18X76", "W18X71", "W18X65", "W18X60", "W18X55",
                          "W18X50", "W18X46", "W18X40", "W18X35", "W16X100", "W16X89", "W16X77", "W16X67",
                          "W16X57", "W16X50", "W16X45", "W16X40", "W16X36", "W16X31", "W16X26", "W14X730",
                          "W14X665", "W14X605", "W14X550", "W14X500", "W14X455", "W14X426", "W14X398", "W14X370",
                          "W14X342", "W14X311", "W14X283", "W14X257", "W14X233", "W14X211", "W14X193", "W14X176",
                          "W14X159", "W14X145", "W14X132", "W14X120", "W14X109", "W14X99", "W14X90", "W14X82",
                          "W14X74", "W14X68", "W14X61", "W14X53", "W14X48", "W14X43", "W14X38", "W14X34",
                          "W14X30", "W14X26", "W14X22", "W12X336", "W12X305", "W12X279", "W12X252", "W12X230",
                          "W12X210", "W12X190", "W12X170", "W12X152", "W12X136", "W12X120", "W12X106", "W12X96",
                          "W12X87", "W12X79", "W12X72", "W12X65", "W12X58", "W12X53", "W12X50", "W12X45",
                          "W12X40", "W12X35", "W12X30", "W12X26", "W12X22", "W12X19", "W12X16", "W12X14",
                          "W10X112", "W10X100", "W10X88", "W10X77", "W10X68", "W10X60", "W10X54", "W10X49",
                          "W10X45", "W10X39", "W10X33", "W10X30", "W10X26", "W10X22", "W10X19", "W10X17",
                          "W10X15", "W10X12", "W8X67", "W8X58", "W8X48", "W8X40", "W8X35", "W8X31",
                          "W8X28", "W8X24", "W8X21", "W8X18", "W8X15", "W8X13", "W8X10", "W6X25",
                          "W6X20", "W6X15", "W6X16", "W6X12", "W6X9", "W6X8.5", "W5X19", "W5X16", "W4X13"]
        for t in cross_sections:
            ui_layout.AISC_database_button.addItem(t)
            ui_layout.AISC_database_button_2.addItem(t)

    def sql_print(self, tableName):
        tableName.blockSignals(True)
        conn = sq.connect('AISC_data.db')
        c = conn.cursor()

        row = tableName.currentRow()
        row_i = tableName.item(row, 1)
        row_j = tableName.item(row, 2)
        # print("row, i j = ", row_i, row_j)
        row_count = tableName.rowCount()
        cross_section = str(self.ui.AISC_database_button.currentText())
        try:
            if row == -1:
                DropDownActions.ActionClass.statusMessage(self, message="Select the row before assignment")
            elif row_i is None:
                DropDownActions.ActionClass.statusMessage(self,
                                                          message="Please select the joints before assigning the cross-section properties!")
            elif row_j is None:
                DropDownActions.ActionClass.statusMessage(self,
                                                          message="Please select the joints before assigning the cross-section properties!")
            else:
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
                    Massemble = np.zeros((1, 16))
                    Massemble[0][3] = 1
                    Massemble[0][4] = table_prop[0, 4]
                    Massemble[0][5] = table_prop[0, 5]
                    Massemble[0][6] = table_prop[0, 6]
                    Massemble[0][7] = table_prop[0, 7]
                    Massemble[0][8] = table_prop[0, 8]
                    Massemble[0][9] = table_prop[0, 9]
                    Massemble[0][10] = table_prop[0, 10]
                    Massemble[0][11] = table_prop[0, 11]
                    Massemble[0][12] = table_prop[0, 12]
                    Massemble[0][13] = table_prop[0, 13]
                    Massemble[0][14] = table_prop[0, 14]
                    Massemble[0][15] = table_prop[0, 15]

                    for i in range(4, 18):
                        if i == 4 or i == 6 or i == 8 or i == 10:
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 0])))
                        elif i == 5 or i == 7 or i == 9 or i == 11:
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 1])))
                        elif i == 12 or i == 14:
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 16])))
                        elif i == 13 or i == 15:
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 3])))
                        elif i == 16:
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 17])))
                        else:
                            tableName.blockSignals(False)
                            tableName.setItem(row, i, QTableWidgetItem(str(table_prop[0, 17])))

                    return Massemble, row, row_count, table_prop
                except IndexError:
                    DropDownActions.ActionClass.statusMessage(self, message="Please select the cross-section name!")
        except TypeError:
            tableName.item(row, 4).setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled)
            DropDownActions.ActionClass.statusMessage(self,
                                                      message="Please select the joints before assigning the cross-section properties!")


class JointTable(QMainWindow):
    """This Class is imposing the changes on the QLineEdit cells"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def tableValues(self, tableName):
        # print(tableName)
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        val2 = np.zeros((row_check, col_check))
        # print(row_check)
        try:
            for i in range(row_check):
                for j in range(col_check):
                    if tableName.item(i, j) is None:
                        pass
                    elif tableName == self.ui.Member_Properties_Table and j == 0:
                        pass
                    else:
                        val1[i, j] = float(tableName.item(i, j).text())
                        val2[i, j] = 2

                        # ActionClass.statusMessage(self, message="")


        except ValueError:
            tableName.clearSelection()
            tableName.item(row, col).setText('0')
        if tableName != self.ui.Member_Properties_Table:
            if 0 in val2:
                self.ui.Members_tab.setEnabled(False)
            else:
                self.ui.Members_tab.setEnabled(True)

                val_unique = np.delete(val1, [0], axis=1)
                val_unique, indices = np.unique(val_unique, axis=0, return_index=True)
                # print('val_unique = ', val_unique, 'indices = ', indices)
                try:
                    for i in range(val1.shape[0]):
                        if i in range(indices.shape[0]):
                            DropDownActions.ActionClass.statusMessage(self, message="")
                        else:
                            DropDownActions.ActionClass.statusMessage(self,
                                                                      message="Same location cannot be defined twice!")
                            tableName.clearSelection()
                            tableName.item(row, col).setText('0')
                except AttributeError:
                    DropDownActions.ActionClass.statusMessage(self, message="")

            # ActionClass.statusMessage(self, message="Please enter only numbers in the cell!")
        # print("val1", val1)
        return val1

    def add_new_row(self, tableName, lineName, flag):
        row_position = tableName.rowCount()

        if flag == "last":

            tableName.insertRow(row_position)
            item = QTableWidgetItem(str(row_position + 1))
            item.setTextAlignment(QtCore.Qt.AlignCenter)
            item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
            tableName.setItem(row_position, 0, item)

            item1 = QTableWidgetItem("0")
            item1.setTextAlignment(QtCore.Qt.AlignCenter)
            item1.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
            tableName.setItem(row_position, 3, item1)



        else:
            row_number = DataCollection.update_lineedit_values(self, lineName)
            tableName.insertRow(row_number)
            for i in range(row_position + 2):
                item = QTableWidgetItem(str(i + 1))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(i, 0, item)

                item1 = QTableWidgetItem("0")
                item1.setTextAlignment(QtCore.Qt.AlignCenter)
                item1.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(i, 3, item1)

    def delete_row(self, tableName, lineName, flag):
        row_position = tableName.rowCount()
        if row_position == 1:
            DropDownActions.ActionClass.statusMessage(self, message="First row cannot be deleted!")
        elif flag == "last":
            tableName.removeRow(row_position - 1)
        else:
            row_number = DataCollection.update_lineedit_values(self, lineName)
            tableName.removeRow(row_number - 1)
            for i in range(row_position + 2):
                item = QTableWidgetItem(str(i + 1))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(i, 0, item)


class MemberPropertiesTable(QMainWindow):
    ''' This class is for setting the properties of Member Properties Table '''

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def set_number_of_rows(self, memberDefinitionTable, memberPropertiesTable):
        ''' this function sets the initial configuration of the member properties table after added nodes'''

        memberPropertiesTable.blockSignals(True)
        current_column = self.ui.Members_table.currentColumn()
        if current_column == 1 or current_column == 2:
            SNodevalue = h5_file.h5_Class.read_array(self,'SNodevalue')
            # print('SNode in set rows = ', SNodevalue)
            initial_values = np.zeros((int(SNodevalue.shape[0]*SNodevalue.shape[1]),11))
            q = 0

            for i in range(int(SNodevalue.shape[0])):
                for j in range(int(SNodevalue.shape[1])):
                    initial_values[q,:] = SNodevalue[i,j,:]
                    q +=1

            # print('initial values 1 = ', initial_values)
            row_member = memberPropertiesTable.rowCount()
            row_def = memberDefinitionTable.rowCount()

            added_node_information = h5_file.h5_Class.read_array(self, 'added_node_information')
            # print('added = ', added_node_information)
            if row_def != row_member:
                memberPropertiesTable.setRowCount(row_def)

            if added_node_information.shape[0] < row_def:
                for j in range(row_def):
                    text = 'M' + str(j+1) + 'S1'
                    item = QTableWidgetItem(text)
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                    memberPropertiesTable.setItem(j, 0, item)
                        # initial_values = JointTable.tableValues(self, memberPropertiesTable)

                # print('initial_values in if = ', initial_values)
                for i in range(1, 8):
                    for j in range(row_def):
                        # print('j in if = ', j, 'i in if = ', i)
                        if i == 1 :
                            item = QTableWidgetItem(str(4))
                            item.setTextAlignment(QtCore.Qt.AlignCenter)
                            memberPropertiesTable.setItem(j, i, item)
                        elif i == 2 or i == 3 or i == 4:
                            item = QTableWidgetItem(str(int(initial_values[j, i + 1])))
                            item.setTextAlignment(QtCore.Qt.AlignCenter)
                            memberPropertiesTable.setItem(j, i, item)
                        elif i == 5 or i == 6 or i == 7:
                            item = QTableWidgetItem(str(int(initial_values[j, i + 2])))
                            item.setTextAlignment(QtCore.Qt.AlignCenter)
                            memberPropertiesTable.setItem(j, i, item)

            else:
                total_number_row = np.sum(added_node_information[:, 1])
                row_def = int(total_number_row) + int(row_def)
                memberPropertiesTable.setRowCount(row_def)
                k = 0
                for i in range(int(added_node_information[:,0].shape[0])):
                    if added_node_information[i][1] == 0:
                        text = 'M' + str(i + 1) + 'S1'
                        item = QTableWidgetItem(text)
                        item.setTextAlignment(QtCore.Qt.AlignCenter)
                        item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                        memberPropertiesTable.setItem(k, 0, item)
                        k += 1
                    else:
                        for j in range(int(added_node_information[i][1])+1):
                            text = 'M' + str(i+1) + 'S' + str(j+1)
                            item = QTableWidgetItem(text)
                            item.setTextAlignment(QtCore.Qt.AlignCenter)
                            item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                            memberPropertiesTable.setItem(k, 0, item)

                            k += 1
                    for i in range(1, 8):
                        for j in range(row_def):
                            # print('j in else = ', j, 'i in else = ', i)
                            if j ==(row_def - 1) and initial_values[j,i+1] == 0:
                                if i == 1:
                                    item = QTableWidgetItem(str(4))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i == 2:
                                    item = QTableWidgetItem(str(29000))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i == 3:
                                    item = QTableWidgetItem(str(11200))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i == 4:
                                    item = QTableWidgetItem(str(0.00034028))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i == 5 or i == 6 or i == 7:
                                    item = QTableWidgetItem(str(50))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                            else:
                                if i == 1:
                                    item = QTableWidgetItem(str(int(initial_values[j, i + 1])))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i == 2 or i == 3:
                                    item = QTableWidgetItem(str(int(initial_values[j, i + 1])))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)
                                elif i ==4 or i == 5 or i == 6 or i == 7:
                                    item = QTableWidgetItem(str((initial_values[j, i + 2])))
                                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                                    memberPropertiesTable.setItem(j, i, item)



        memberPropertiesTable.blockSignals(False)

    def set_values_with_row(self, memberPropertiesTable, member_prop_line_edit):
        row_count = memberPropertiesTable.rowCount()
        copyfrom_values = DataCollection.update_lineedit_values(self, member_prop_line_edit)
        initial_values = np.zeros((1, 8))
        for k in range(1,8):
            initial_values[0, k] = float(memberPropertiesTable.item(copyfrom_values - 1, k).text())
        for i in range(8):
            for j in range(row_count):
                if i == 0:
                    pass
                elif i == 4:
                    item = QTableWidgetItem(str(initial_values[0, i]))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    memberPropertiesTable.setItem(j, i, item)
                else:
                    item = QTableWidgetItem(str(int(initial_values[0, i])))
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    memberPropertiesTable.setItem(j, i, item)

    # def check_values(self, memberPropertiesTable):
    #     col = memberPropertiesTable.currentColumn()
    #     row = memberPropertiesTable.currentRow()
    #     try:
    #         float(memberPropertiesTable.item(row, col).text())
    #
    #     except ValueError:
    #         memberPropertiesTable.clearSelection()
    #         memberPropertiesTable.item(row, col).setText("")
    #         DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in the cell!")
    #
    #     except AttributeError:
    #         pass


class Boundary_Conditions(QMainWindow):
    """This Class is imposing the changes on the Boundary Conditions tab cells"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)


    def set_number_of_rows_fixities_table(self, number_of_nodes, RNCc):
        self.ui.Fixities_table.blockSignals(True)
        self.ui.Fixities_table.setRowCount(number_of_nodes)
        # print('RNCc = ', RNCc)
        for i in range(int(number_of_nodes)):
            for j in range(9):
                if j ==0: #first column row numbering
                    text = str(int(i+1))
                    item = QTableWidgetItem(text)
                    item.setTextAlignment(QtCore.Qt.AlignCenter)
                    item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                    self.ui.Fixities_table.setItem(i, j, item)
                elif j == 1: # combo box set up, done in the following function
                    pass
                else:  # check boxes are setting up
                    item = QtGui.QTableWidgetItem()
                    item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable | QtCore.Qt.ItemIsEnabled)
                    item.setCheckState(QtCore.Qt.Unchecked)
                    self.ui.Fixities_table.setItem(i, j, item)

            for j in range(9,12):
                text = str(RNCc[i][int(j - 8)])
                item = QTableWidgetItem(text)
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                self.ui.Fixities_table.setItem(i, j, item)

        self.ui.Fixities_table.blockSignals(False)

    def Assign_comboBox_fixities_table(self, number_of_nodes):
        r = int(number_of_nodes)
        options = ["Shear Center", "Flange 2","Centroid", "Flange 1"]
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            self.ui.Fixities_table.setCellWidget(i, 1, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: BoundaryConditionApplication.BoundaryConditionArrays.BC_arrays(self))


    def Assign_comboBox_shear(self, number_of_nodes, element_member):
        r = int(number_of_nodes)
        # print('r = ', r)
        # print('element member = ', element_member)
        options = ["Flange 2", "Shear Center", "Flange 1"]
        total_member_number = self.ui.Members_table.rowCount()
        first_element_nodes = element_member[:,0]
        # print('first element number = ', first_element_nodes)
        first_element_nodes = first_element_nodes[first_element_nodes != 0]
        # print('first element number = ', first_element_nodes)
        for i in range(total_member_number):
            # first column row numbering
            text = str(int(i + 1))
            item = QTableWidgetItem(text)
            item.setTextAlignment(QtCore.Qt.AlignCenter)
            item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
            self.ui.Shear_panel_table.setItem(i, 0, item)

            # Status
            text = "Constant"
            item = QTableWidgetItem(text)
            item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable | QtCore.Qt.ItemIsEnabled)
            item.setCheckState(QtCore.Qt.Checked)
            self.ui.Shear_panel_table.setItem(i, 6, item)

            combo_box = QtGui.QComboBox()
            for m in range(total_member_number):
                combo_box.addItem(str(m+1))
            self.ui.Shear_panel_table.setCellWidget(i, 1, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: Boundary_Conditions.set_shear_panel_combo_box_for_members(self, i))
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            self.ui.Shear_panel_table.setCellWidget(i, 2, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

            combo_box = QtGui.QComboBox()
            for t in first_element_nodes:
                combo_box.addItem(str(int(t)))
            self.ui.Shear_panel_table.setCellWidget(i, 3, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

            combo_box = QtGui.QComboBox()
            for t in first_element_nodes:
                combo_box.addItem(str(int(t)))
            self.ui.Shear_panel_table.setCellWidget(i, 4, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

    def set_shear_panel_combo_box_for_members(self, current_panel):
        element_member = h5_file.h5_Class.read_array(self, 'element_member')
        print('current panel = ', current_panel)
        value = self.ui.Shear_panel_table.cellWidget(current_panel-1, 1).currentIndex()
        element_nodes = element_member[:, value]
        # print('first element number = ', first_element_nodes)
        element_nodes = element_nodes[element_nodes != 0]
        # print('first element number = ', first_element_nodes)
        combo_box = QtGui.QComboBox()
        for t in element_nodes:
            combo_box.addItem(str(int(t)))
        self.ui.Shear_panel_table.setCellWidget(current_panel-1, 3, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

        combo_box = QtGui.QComboBox()
        for t in element_nodes:
            combo_box.addItem(str(int(t)))
        self.ui.Shear_panel_table.setCellWidget(current_panel-1, 4, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

    def add_shear_panel(self, element_member, row):

        total_member_number = self.ui.Members_table.rowCount()
        first_element_nodes = element_member[:, 0]
        # print('first element number = ', first_element_nodes)
        first_element_nodes = first_element_nodes[first_element_nodes != 0]
        options = ["Flange 2", "Shear Center", "Flange 1"]


        text = str(row+1)
        item = QTableWidgetItem(text)
        item.setTextAlignment(QtCore.Qt.AlignCenter)
        item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
        self.ui.Shear_panel_table.setItem(row, 0, item)

        # Status
        text = "Constant"
        item = QTableWidgetItem(text)
        item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable | QtCore.Qt.ItemIsEnabled)
        item.setCheckState(QtCore.Qt.Checked)
        self.ui.Shear_panel_table.setItem(row, 6, item)

        combo_box = QtGui.QComboBox()
        for m in range(total_member_number):
            combo_box.addItem(str(m + 1))
        self.ui.Shear_panel_table.setCellWidget(row, 1, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: Boundary_Conditions.set_shear_panel_combo_box_for_members(self, row+1))
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

        combo_box = QtGui.QComboBox()
        for t in options:
            combo_box.addItem(t)
        self.ui.Shear_panel_table.setCellWidget(row, 2, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

        combo_box = QtGui.QComboBox()
        for t in first_element_nodes:
            combo_box.addItem(str(int(t)))
        self.ui.Shear_panel_table.setCellWidget(row, 3, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))

        combo_box = QtGui.QComboBox()
        for t in first_element_nodes:
            combo_box.addItem(str(int(t)))
        self.ui.Shear_panel_table.setCellWidget(row, 4, combo_box)
        combo_box.currentIndexChanged.connect(
            lambda: SABRE2_main_subclass.update_shear_panel_table(self, self.ui.Shear_panel_table, flag="combo"))


    def get_checkbox_values(self, table_for_checkbox):
        column_count = table_for_checkbox.columnCount()
        row_count = table_for_checkbox.rowCount()
        fixities_vals = np.zeros((row_count, column_count))
        for j in range(row_count):
            for i in range(column_count):
                if i == 0:
                    fixities_vals[j, i] = (j + 1)
                elif i == 1:
                    value_combo = table_for_checkbox.cellWidget(j, i).currentIndex()
                    fixities_vals[j, i] = value_combo + 1
                elif i == 9 or i == 10 or i == 11:
                    fixities_vals[j,i] = float(table_for_checkbox.item(j,i).text())
                else:
                    fixities_vals[j, i] = table_for_checkbox.item(j, i).checkState()
                    if fixities_vals[j, i] == 2:
                        fixities_vals[j, i] = 1

        h5_file.h5_Class.update_array(self, fixities_vals, 'fixities_vals')
        return fixities_vals

    def set_active(self, table_name, line_edit):

        active_values = DataCollection.update_lineedit_values(self, line_edit) - 1

        selRange = PyQt4.QtGui.QTableWidgetSelectionRange(active_values, 0, active_values, 5)

        table_name.setRangeSelected(selRange, True)

        table_name.scrollToItem(table_name.item(active_values, 0))

    def shear_panel_application(self, table_for_shear_panel, members_table, options, position):
        table_for_shear_panel.blockSignals(True)

        row_def = members_table.rowCount()

        row_shear = table_for_shear_panel.rowCount()

        if row_def == row_shear:
            pass
        else:
            table_for_shear_panel.setRowCount(row_def)
            # First Column Member numbers
            for j in range(row_def):
                item = QTableWidgetItem(str(j + 1))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                table_for_shear_panel.setItem(j, 0, item)

            for i in range(1, row_def):
                combo_box = QtGui.QComboBox()
                for t in options:
                    combo_box.addItem(t)
                table_for_shear_panel.setCellWidget(i, position, combo_box)
                combo_box.currentIndexChanged.connect(
                    lambda: SABRE2_main_subclass.update_shear_panel_table(self, table_for_shear_panel, flag="combo"))

        table_for_shear_panel.blockSignals(False)

    def shear_panel_nodes(self, table_for_shear_panel, member_ranges):
        " This function checks the values of the shear panel table"

        current_row = table_for_shear_panel.currentRow()
        current_col = table_for_shear_panel.currentColumn()

        member_ranges = [8, 12]

        max_number = max(member_ranges)
        min_number = min(member_ranges)

        if current_col == 2 or current_col == 3:
            try:
                if float(table_for_shear_panel.item(current_row, current_col).text()) % 1 == 0:
                    DropDownActions.ActionClass.statusMessage(self, message="")
                    pass
                else:
                    table_for_shear_panel.item(current_row, current_col).setText("")
                    DropDownActions.ActionClass.statusMessage(self, message="Please enter only integers in the cell!")

                if table_for_shear_panel.item(current_row, current_col) is None:
                    pass
                elif table_for_shear_panel.item(current_row, current_col).text() == "":
                    pass
                elif min_number <= float(table_for_shear_panel.item(current_row, current_col).text()) <= max_number:
                    pass
                else:
                    table_for_shear_panel.item(current_row, current_col).setText("")
                    DropDownActions.ActionClass.statusMessage(self,
                                                              message=(
                                                                      "Please define the joint within the member " + table_for_shear_panel.item(
                                                                  current_row, 0).text()))

            except ValueError:
                table_for_shear_panel.item(current_row, current_col).setText("")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only integers in the cell!")
            except AttributeError:
                pass
        else:
            pass

    def shear_panel_additional(self):
        RNCc = h5_file.h5_Class.read_array(self, 'RNCc')
        number_of_nodes = int(RNCc[:, 0].shape[0])
        row = self.ui.Shear_panel_table.rowCount()
        self.ui.Shear_panel_table.setRowCount(row+1)
        element_member = h5_file.h5_Class.read_array(self,'element_member')
        Boundary_Conditions.add_shear_panel(self,element_member, row)

    def shear_panel_delete(self):
        row = self.ui.Shear_panel_table.rowCount() - 1
        self.ui.Shear_panel_table.setRowCount(row)

    def shear_panel_values(self, tableName, flag="not combo"):

        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        if flag == "not combo" or flag == "combo":
            try:
                for i in range(row_check):
                    for j in range(col_check):
                        if j == 1:
                            value_combo = tableName.cellWidget(i, j).currentIndex()
                            val1[i, j] = value_combo
                            DropDownActions.ActionClass.statusMessage(self, message="")
                            pass
                        elif tableName.item(i, j) is None:
                            pass
                        elif j == 6:
                            val1[i, j] = tableName.item(i, j).checkState()
                            DropDownActions.ActionClass.statusMessage(self, message="")
                        else:
                            val1[i, j] = float(tableName.item(i, j).text())
                            DropDownActions.ActionClass.statusMessage(self, message="")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")
            except AttributeError:
                pass
        return val1

    def check_entered_data(self, tableName):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        try:
            value = float(tableName.item(row, col).text())
        except:
            tableName.clearSelection()
            tableName.item(row, col).setText("")
            DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")

    def Assign_comboBox_ground(self, tableName, options, position):
        r = tableName.rowCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_ground_table(self, tableName, flag="combo"))

    def ground_spring_values(self, tableName, flag="not combo"):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        if flag == "not combo" or flag == "combo":
            try:
                for i in range(row_check):
                    for j in range(col_check):
                        if j == 1:
                            value_combo = tableName.cellWidget(i, j).currentIndex()
                            val1[i, j] = value_combo
                            DropDownActions.ActionClass.statusMessage(self, message="")
                            pass
                        elif tableName.item(i, j) is None:
                            pass
                        elif j == 3 or j == 5 or j == 7 or j == 9 or j == 11 or j == 13 or j == 15:
                            val1[i, j] = tableName.item(i, j).checkState()
                            DropDownActions.ActionClass.statusMessage(self, message="")
                        else:
                            val1[i, j] = float(tableName.item(i, j).text())
                            DropDownActions.ActionClass.statusMessage(self, "")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")
        return val1

    def release_tables_values(self, table_name):
        " this function is to get values of release tables"

        row = table_name.rowCount()
        col = table_name.columnCount()

        val_table = np.zeros((row, col))

        for i in range(row):
            for j in range(col):
                if j == 0:
                    val_table[i, j] = i + 1
                else:
                    val_table[i, j] = table_name.item(i, j).checkState()

        return val_table


class LoadingClass(QMainWindow):
    " This class is to for defining loading conditions"

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def defined_load_names(self, tableName):
        row_number = tableName.rowCount()

        names = [None] * row_number
        IDs = [None] * row_number
        try:
            for i in range(row_number):
                names[i] = tableName.item(i, 0).text()
                if ' ' in tableName.item(i, 1).text():
                    tableName.item(i, 1).setText("")
                    DropDownActions.ActionClass.statusMessage(self, message="Please don't use any space in IDs column!")
                else:
                    IDs[i] = tableName.item(i, 1).text()
        except AttributeError:
            pass
        return names, IDs

    def add_load(self, tableName):
        row_number = tableName.rowCount()
        if tableName.item(row_number - 1, 0) is None:
            pass
        elif tableName.item(row_number - 1, 1) is None:
            pass
        else:
            tableName.insertRow(row_number)

    def remove_load(self, tableName):
        current_row = tableName.currentRow()

        if current_row == -1:
            DropDownActions.ActionClass.statusMessage(self, message="Please select load type to delete!")
        else:
            tableName.removeRow(current_row)

    def changes_on_load_combination(self, tableNameLoadType, tableNameLoadComb):
        load_type_row = tableNameLoadType.rowCount()

        [names, IDs] = LoadingClass.defined_load_names(self, tableNameLoadType)

        combination_names = ["#", "ID"]
        IDs.insert(0, "ID")
        IDs.insert(0, "#")

        try:

            tableNameLoadComb.setColumnCount(load_type_row + 2)

            tableNameLoadComb.setHorizontalHeaderLabels(IDs)

        except AttributeError:
            DropDownActions.ActionClass.statusMessage(self, message="Please enter ID for load type!")

    def check_entered_data(self, tableName):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        try:
            value = float(tableName.item(row, col).text())
        except:
            tableName.clearSelection()
            tableName.item(row, col).setText("")
            DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")

    def get_combination_data(self, tableName):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        LoadCombinationID = {}
        val1 = np.zeros((row_check, col_check))
        flag = 0
        if row == -1:
            pass
        else:
            try:
                for i in range(row_check):
                    for j in range(col_check):
                        if tableName.item(i, j) is None:
                            print(i)
                            item = QTableWidgetItem("0")
                            tableName.setItem(i, j, item)
                        elif j == 1:
                            LoadCombinationID[i] = tableName.item(i, 1).text()
                            if ' ' in LoadCombinationID[i]:
                                LoadCombinationID[i] = ""
                                tableName.item(i, 1).setText("")

                                flag = 1
                            else:
                                LoadCombinationID[i] = [tableName.item(i, 1).text()]
                        else:
                            val1[i, j] = float(tableName.item(i, j).text())
                            if flag == 1:
                                DropDownActions.ActionClass.statusMessage(self,
                                                                          message="Please don't use any space in IDs column!")
                            else:
                                DropDownActions.ActionClass.statusMessage(self, message="")

            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("0")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")
        return val1, LoadCombinationID

    def add_load_comb(self, tableName):
        row_number = tableName.rowCount()
        if tableName.item(row_number - 1, 0) is None:
            pass
        elif tableName.item(row_number - 1, 1) is None:
            pass
        else:
            tableName.insertRow(row_number)
            for j in range(row_number + 1):
                item = QTableWidgetItem(str(j + 1))
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                item.setFlags(QtCore.Qt.ItemIsDragEnabled | QtCore.Qt.ItemIsUserCheckable)
                tableName.setItem(j, 0, item)


class uniform_load_def(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def combo_box_types(self, tableName, table_load_type, position):
        [var1, IDs] = LoadingClass.defined_load_names(self, table_load_type)
        uniform_load_def.set_combo_box(self, tableName, IDs, position)

    def set_combo_box(self, tableName, options, position):

        r = tableName.rowCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_uniform_data(self, tableName, combo_flag=1))

    def uniform_data_table(self, tableName, combo_flag=0):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        SegmentNames = {}
        val1 = np.zeros((row_check, col_check))
        try:
            for i in range(row_check):
                for j in range(col_check):
                    if tableName.item(i, j) is None:
                        item = QTableWidgetItem("0")
                        tableName.setItem(i, j, item)
                    elif j == 0:
                        SegmentNames[i] = tableName.item(i, j).text()
                    elif j == 1 or j == 2:
                        value_combo = tableName.cellWidget(i, j).currentIndex()
                        val1[i, j] = value_combo
                        DropDownActions.ActionClass.statusMessage(self, message="")
                    else:
                        val1[i, j] = float(tableName.item(i, j).text())
                        DropDownActions.ActionClass.statusMessage(self, message="")

        except ValueError:
            tableName.clearSelection()
            if combo_flag == 1:
                pass
            else:
                tableName.item(row, col).setText("0")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")

        print(SegmentNames)
        return val1, SegmentNames


class point_load_def(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        self.ActionMenus = DropDownActions.ActionClass(ui_layout)

    def combo_box_types(self, tableName, table_load_type, position):
        [var1, IDs] = LoadingClass.defined_load_names(self, table_load_type)
        point_load_def.set_combo_box(self, tableName, IDs, position)

    def set_combo_box(self, tableName, options, position):

        r = tableName.rowCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            combo_box.currentIndexChanged.connect(
                lambda: SABRE2_main_subclass.update_point_data(self, tableName, combo_flag=1))

    def point_data_table(self, tableName, combo_flag=0):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        try:
            for i in range(row_check):
                for j in range(col_check):
                    if tableName.item(i, j) is None:
                        item = QTableWidgetItem("0")
                        tableName.setItem(i, j, item)
                    elif j == 1 or j == 2:
                        value_combo = tableName.cellWidget(i, j).currentIndex()
                        val1[i, j] = value_combo
                        DropDownActions.ActionClass.statusMessage(self, message="")
                    else:
                        val1[i, j] = float(tableName.item(i, j).text())
                        DropDownActions.ActionClass.statusMessage(self, message="")

        except ValueError:
            tableName.clearSelection()
            if combo_flag == 1:
                pass
            else:
                tableName.item(row, col).setText("0")
                DropDownActions.ActionClass.statusMessage(self, message="Please enter only numbers in this cell!")

        return val1
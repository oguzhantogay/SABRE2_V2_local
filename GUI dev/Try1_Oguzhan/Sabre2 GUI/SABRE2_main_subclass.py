import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtGui, QtCore
import pickle
import SABRE2_GUI
import numpy as np
import sqlite3 as sq

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s


class SABRE2_main_subclass(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        ui_layout.setupUi(self)
        ui_layout.statusBar = self.statusBar()
        ui_layout.DefinitionTabs.hide()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.hide()  # to hide analysis tabs
        LineChanges.set_member_definition_AISC_combobox(self, ui_layout)  # set AISC database combobox values

        # File dropdown actions
        ui_layout.actionNew.triggered.connect(lambda: DropDownActions('uidesign').NewAct())
        ui_layout.actionOpen.triggered.connect(lambda: DropDownActions('uidesign').OpenAct())
        ui_layout.actionSave.triggered.connect(lambda: DropDownActions('uidesign').SaveAct())
        ui_layout.actionSave_As.triggered.connect(lambda: DropDownActions('uidesign').Save_AsAct())
        ui_layout.actionPrint.triggered.connect(lambda: DropDownActions('uidesign').PrintAct())
        ui_layout.actionPrint_Preview.triggered.connect(lambda: DropDownActions('uidesign').Print_PreviewAct())
        ui_layout.actionQuit.triggered.connect(qApp.quit)

        # Help dropdown actions
        ui_layout.actionAbout.triggered.connect(lambda: DropDownActions('uidesign').AboutAct())

        # Members Table Arrangements
        self.Members_table_options = ["Mid Depth", "Flange 1", "Flange 2"]
        self.Members_table_position = 3
        # The data update for members tab
        DataCollection.Assign_comboBox(self, ui_layout.Members_table, self.Members_table_options,
                                       self.Members_table_position)
        # Add new row button # self, tableName, options, position
        ui_layout.Members_table.itemChanged.connect(
            lambda: self.update_members_table(ui_layout.Members_table,
                                              self.Members_table_position))

        ui_layout.Mem_def_add.clicked.connect(
            lambda: TableChanges.add_new_row(self, ui_layout.Members_table, self.Members_table_options,
                                             self.Members_table_position, ui_layout.Insert_row_number_mem_def, "last"))

        ui_layout.Insert_row_mem_def_button.clicked.connect(
            lambda: TableChanges.add_new_row(self, ui_layout.Members_table, self.Members_table_options,
                                             self.Members_table_position, ui_layout.Insert_row_number_mem_def,
                                             "arbitrary"))

        ui_layout.Mem_def_delete.clicked.connect(
            lambda: TableChanges.delete_row(self, ui_layout.Members_table, ui_layout.Delete_row_number_mem_def, "last"))

        ui_layout.Delete_row_mem_def_button.clicked.connect(
            lambda: TableChanges.delete_row(self, ui_layout.Members_table, ui_layout.Delete_row_number_mem_def,
                                            "arbitrary"))

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

        ui_layout.AISC_assign_button.clicked.connect(
            lambda: LineChanges.sql_print(self, ui_layout))

        # Progress bar
        # put me in analysis section
        ui_layout.progressBar = PyQt4.QtGui.QProgressBar()
        ui_layout.statusbar.addPermanentWidget(ui_layout.progressBar)
        analysisprogress = 0  # Update this value later by integrating with analysis**********
        ui_layout.progressBar.setValue(analysisprogress)
        ui_layout.progressBar.setTextVisible(True)

    def update_members_table(self, tableName, position):
        Members_values = DataCollection.update_table_values(self, tableName, position)
        print("main screen", Members_values)
        return Members_values

    def update_members_copyfrom(self, lineName, position, tableName):
        copyfrom_value = DataCollection.update_lineedit_values(self, lineName)
        copyfrom_value = copyfrom_value - 1
        r = tableName.rowCount()
        try:
            if copyfrom_value <= r - 1:
                Members_values = DataCollection.update_table_values(self, tableName, position)
                tableName.selectRow(copyfrom_value)
                DropDownActions.statusMessage(self, message="")
        except TypeError:
            DropDownActions.statusMessage(self, message="Row not defined")
        return copyfrom_value

    def update_members_insertafter(self, lineName, position, tableName):
        insertafter_values = DataCollection.update_lineedit_values(self, lineName)
        insertafter_values = insertafter_values - 1
        Members_values = DataCollection.update_table_values(self, tableName, position)

        # if insert row > num of rows then add to end
        # print("insertafter", insertafter_values)
        # print("main screen", Members_values)
        return insertafter_values


class DropDownActions(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout

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
        DropDownActions.statusMessage(self, message="Create a new file")

        fileName = []
        inpdata = []
        # clear all user inputs
        # reset OpenGL screen
        # reset messages

    def OpenAct(self):
        DropDownActions.statusMessage(self, message="Open an existing file")

        fileName = PyQt4.QtGui.QFileDialog.getOpenFileName(None, "Open Sabre2 File", '',
                                                           "Sabre2 Files (*.mat);;All Files (*)")
        if not fileName:
            return
        try:
            in_file = open(str(fileName), 'rb')
        except IOError:
            QtGui.QMessageBox.information(self, "Unable to open file", "There was an error opening \"%s\"" % fileName)
            return

        inpdata = []
        inpdata = pickle.load(in_file)
        in_file.close()

        if len(inpdata) == 0:
            QtGui.QMessageBox.information(self, "File is empty")
        else:
            # needs to be updated once data structure is determined**************************
            for name, address in inpdata:
                self.nameLine.setText(name)
                self.addressText.setText(address)

        self.updateInterface(self.NavigationMode)

        # Fill in spread sheet cells
        # update OpenGL screen
        # update messages
        # go directly to analysis screen

    def SaveAct(self):
        DropDownActions.statusMessage(self, message="Save the model to disk")

        inpdata = "text test addon"
        fileName = "test1.txt"

        if len(inpdata) == 0:
            QtGui.QMessageBox.information(self, "No data has been attributed to the model")
        else:
            try:
                fileName
            except NameError:  # if data has not been saved to a file yet invoke popup save screen
                import pickle
                fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File", '',
                                                                   "Sabre2 File (*.mat);;All Files (*)")
                if not fileName:
                    return
                try:
                    out_file = open(str(fileName), 'wb')
                except IOError:
                    PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
                                                        "There was an error opening \"%s\"" % fileName)
                    return

                pickle.dump(inpdata, out_file)
                out_file.close()
            else:
                import pickle
                try:  # if file already exists skip popup and update save file
                    out_file = open(str(fileName), 'wb')
                except IOError:
                    PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
                                                        "There was an error opening \"%s\"" % fileName)
                    return

                pickle.dump(inpdata, out_file)
                out_file.close()

    def Save_AsAct(self):
        DropDownActions.statusMessage(self, message="Name the file saved to disk")

        inpdata = "text test"

        # Invoke save popup screen
        if len(inpdata) == 0:
            QtGui.QMessageBox.information(self, "No data has been attributed to the model")
        else:
            import pickle
            fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File As", '',
                                                               "Sabre2 File (*.mat);;All Files (*)")
            if not fileName:
                return
            try:
                out_file = open(str(fileName), 'wb')
            except IOError:
                PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
                                                    "There was an error opening \"%s\"" % fileName)
                return

            pickle.dump(inpdata, out_file)
            out_file.close()

    def PrintAct(self):
        DropDownActions.statusMessage(self, message="Print screen")

        # not sure what we are printing?
        # data, results, or just screenshot of OpenGL?

    def Print_PreviewAct(self):
        DropDownActions.statusMessage(self, message="Preview screen print")

    def statusMessage(self, message):
        self.ui.statusBar.showMessage(message)


class DataCollection(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout

    def Assign_comboBox(self, tableName, options, position):
        r = tableName.rowCount()
        c = tableName.columnCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            # combo_box.activated.connect(
            #     lambda: DataCollection.update_table_values(self, tableName, r, c, values, position))

    def Assign_checkBox(self, tableName, options, position, values):
        check_box = QtGui.QCheckBox()
        flag_check = 1;
        flag_uncheck = 0
        r = tableName.rowCount()
        c = tableName.columnCount()
        for i in range(r):
            check_box = QtGui.QCheckBox()
            tableName.setCellWidget(i, position, check_box)
            check_box.clicked.connect(
                lambda: DataCollection.update_table_values(self, tableName, values, position))
        text_trigger = tableName.item(0, 1)
        if text_trigger.text() == "1":
            tableName.item(0, 1).setText("0")
        else:
            tableName.item(0, 1).setText("1")

    def update_table_values(self, tableName, position):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        col_check = tableName.columnCount()
        val1 = np.zeros((row_check, col_check))
        # print(row_check)
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
                                DropDownActions.statusMessage(self, message="New row added!")
                            else:
                                value_combo = tableName.cellWidget(i, position).currentIndex()
                                val1[i, position] = value_combo
                                DropDownActions.statusMessage(self, message="")
                        else:
                            # print("test1")
                            val1[i, j] = float(tableName.item(i, j).text())
                            DropDownActions.statusMessage(self, message="")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("")
                DropDownActions.statusMessage(self, message="Please enter only numbers in this cell!")
        # print("val1", val1)
        return val1

    def update_lineedit_values(self, lineName):
        try:
            val2 = [];
            val2 = int(lineName.text())
            # print("val2", val2)
        except ValueError:
            lineName.setText("")
            DropDownActions.statusMessage(self, message="Please enter only numbers in this cell!")
        return val2


class TableChanges(QMainWindow):
    """This Class is imposing the changes on the Definition Tables"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout

    def add_new_row(self, tableName, options, position, lineName, flag):
        row_position = tableName.rowCount()
        combo_box = QtGui.QComboBox()
        if flag == "last":
            tableName.insertRow(row_position)
            val = 0
            item = QTableWidgetItem(str(val))
            tableName.setItem(row_position, position, item)
            for t in options:
                combo_box.addItem(t)

            tableName.setCellWidget(row_position, position, combo_box)
        else:
            row_number = DataCollection.update_lineedit_values(self, lineName)
            tableName.insertRow(row_number)
            val = 0
            item = QTableWidgetItem(str(val))
            tableName.setItem(row_number, position, item)
            for t in options:
                combo_box.addItem(t)

            tableName.setCellWidget(row_number, position, combo_box)

    def delete_row(self, tableName, lineName, flag):
        if flag == "last":
            row_position = tableName.rowCount()
            tableName.removeRow(row_position - 1)
        else:
            row_number = DataCollection.update_lineedit_values(self, lineName)
            tableName.removeRow(row_number - 1)


class LineChanges(QMainWindow):
    """This Class is imposing the changes on the QLineEdit cells"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout

    def copy_insert_row(self, tableName, options, position, Copy_from_number, Insert_after_number):
        Members_values = DataCollection.update_table_values(self, tableName, position)
        copyfrom_values = DataCollection.update_lineedit_values(self, Copy_from_number)
        insertafter_values = DataCollection.update_lineedit_values(self, Insert_after_number)

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
                copied_index = tableName.cellWidget(copyfrom_values, position).currentIndex()
                print(copied_index)
                tableName.cellWidget(insertafter_values, position).setCurrentIndex(copied_index)
            else:
                val = Members_values[copyfrom_values - 1, j]
                item = QTableWidgetItem(str(val))
                tableName.setItem(insertafter_values, j, item)

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

    def sql_print(self, ui_layout):
        conn = sq.connect('AISC_data.db')
        c = conn.cursor()

        cross_section = str(ui_layout.AISC_database_button.currentText())
        try:
            print(cross_section)

            variable_names = ["bf", "tf", "d", "tw", "A", "W", "Ix", "Zx", "Sx", "rx", "Iy", "Zy", "Sy", "ry", "J", "Cw"]

            table_prop = np.zeros((1, 16))

            for i in range(len(variable_names)):
                print (i)
                c.execute('SELECT ' + variable_names[i] + ' FROM records WHERE "AISC_Manual_Label" = ?', (cross_section,))
                var1 = c.fetchall()
                var1 = var1[0]
                table_prop[0,i] = var1[0]
            print(cross_section, 'cs_properties = ', table_prop)


        except IndexError:
            DropDownActions.statusMessage(self, message="Please select the cross-section name!")


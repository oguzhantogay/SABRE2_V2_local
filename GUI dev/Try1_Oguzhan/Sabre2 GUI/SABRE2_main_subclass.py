import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtGui, QtCore
from ComboBoxGen import CoBoxGen
import pickle
import numpy as np
import SABRE2_GUI

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s


# Preallocate Data
JNodevalue = np.zeros((2, 4))        # Joint Nodes Information
Massemble = np.zeros((1, 16))       # Member assemble Information
JNodevalue_i = np.zeros((1, 14))    # Joint Nodes i Information
JNodevalue_j = np.zeros((1, 14))    # Joint Nodes j Information
Rval = np.zeros((1, 2))                   # Reference axis
BNodevalue = np.zeros((1, 1, 2))    # Additional Nodes Information
SNodevalue = np.zeros((1, 1, 11))  # Material Properties & # of ele.
RNCc = np.zeros((11, 13))             # Total Nodes Information without duplication
NCc = np.zeros((11, 13))               # Total Nodes Information without duplication
Nshe1 = np.zeros((10, 12))            # Total Nodes SC Information for start nodes
Nshe2 = np.zeros((10, 12))            # Total Nodes SC Information for end nodes
DUP1 = np.zeros((10, 14))             # Total Nodes RA Information for start nodes
DUP2 = np.zeros((10, 14))             # Total Nodes RA Information for end nodes
LNC = np.zeros((11, 14))               # Point Loading Nodal Information
LNC1 = np.zeros((10, 14))             # Point Loading Information for start nodes
LNC2 = np.zeros((10, 14))             # Point Loading Information for end nodes
LUEC = []                                     # Distributed Loading Information
PNC = np.zeros((11, 14))              # Fixed Boundary Condition Information
PNC1 = np.zeros((10, 14))            # Fixed Boundary Condition Information for start nodes
PNC2 = np.zeros((10, 14))            # Fixed Boundary Condition Information for end nodes
BNC = []                                      # Ground Spring Information
BNC1 = []                                    # Shear Panel Information for start nodes
BNC2 = []                                    # Shear Panel Information for end nodes
FEL = []                                       # Flexure Information


class SABRE2_main_subclass(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout
        ui_layout.setupUi(self)
        ui_layout.statusBar = self.statusBar()
        ui_layout.DefinitionTabs.hide()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.hide()  # to hide analysis tabs
        # Members Table Arrangements

        self.Members_table_options = ["Mid Depth", "Flange 1", "Flange 2"]
        self.Members_table_position = 3
        Members_table_row, Members_table_column, Members_table_values = DataCollection.table_properties(
            self, ui_layout.Members_table)
        # updated_values = [[0 for x in range(Members_table_row)] for y in range(Members_table_column)]
        DataCollection.Assign_comboBox(self, ui_layout.Members_table, self.Members_table_options,
                                       self.Members_table_position, Members_table_values)
        DataCollection.update_values(self, ui_layout.Members_table, Members_table_row,
                                     Members_table_column, Members_table_values,
                                     self.Members_table_position)
        ui_layout.Members_table.itemChanged.connect(
            lambda: DataCollection.update_values(self, ui_layout.Members_table, Members_table_row,
                                                 Members_table_column, Members_table_values,
                                                 self.Members_table_position))

        Members_table_values = DataCollection.update_values(self, ui_layout.Members_table, Members_table_row,
                                                            Members_table_column, Members_table_values,
                                                            self.Members_table_position)

        ui_layout.Members_table.itemChanged.connect(lambda: print(Members_table_values))
        # ui_layout.Members_table.clicked.connect(lambda: print(updated_values))

        # ui_layout.Members_table.itemChanged.connect(lambda: print(updated_values))
        # variable = ui_layout.Members_table.itemChanged.connect(lambda: DataCollection.update_values(self, ui_layout.Members_table, Members_table_row,
        #                                               Members_table_column, Members_table_values,
        #                                               self.Members_table_position))
        #
        # ui_layout.Joints_Table.clicked.connect(lambda: print(variable))

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

        # Status/message bar and progress bar
        # ui_layout.statusbar = PyQt4.QtGui.QStatusBar()
        # ui_layout.statusbar.setObjectName(_fromUtf8("statusbar"))
        # message = "Start creating the model by defining the joints"  # Update message with modeling progress and interupts ***************
        # ui_layout.statusbar.showMessage(message)
        # QMainWindow.setStatusBar(QMainWindow, ui_layout.statusbar)

        ui_layout.progressBar = PyQt4.QtGui.QProgressBar()
        ui_layout.statusbar.addPermanentWidget(ui_layout.progressBar)
        analysisprogress = 80  # Update this value later by integrating with analysis**********
        ui_layout.progressBar.setValue(analysisprogress)
        ui_layout.progressBar.setTextVisible(True)


class DropDownActions(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        self.ui = ui_layout

    def AboutAct(ui_layout):
        # message = "Learn about Sabre2"
        # self.statusbar.showMessage(message)

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
        # message = "Create a new file"
        # self.statusbar.showMessage(message)

        fileName = []
        inpdata = []
        # clear all user inputs
        # reset OpenGL screen
        # reset messages

    def OpenAct(self):
        # message = "Open an existing file"
        # self.statusbar.showMessage(message)

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
        # message = "Save the model to disk"
        # self.statusbar.showMessage(message)

        inpdata = "text test addon"
        # fileName = "test1.txt"

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
        # message = "Name the file saved to disk"
        # self.statusbar.showMessage(message)

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
        message = "Print screen"
        self.statusbar.showMessage(message)

        # not sure what we are printing?
        # data, results, or just screenshot of OpenGL?

    def Print_PreviewAct(self):
        message = "Preview screen print"
        self.statusbar.showMessage(message)

    def statusMessage(self, message):
        self.ui.statusBar.showMessage(message)


class DataCollection(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        QtGui.QItemDelegate.__init__(self)
        self.ui = ui_layout

    def Assign_comboBox(self, tableName, options, position, values):
        combo_box = QtGui.QComboBox()
        flag_combo = 1
        for t in options:
            combo_box.addItem(t)
        r = tableName.rowCount()
        c = tableName.columnCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            combo_box.activated.connect(
                lambda: DataCollection.update_values(self, tableName, r, c, values, position, i, flag_combo))
        text_trigger = tableName.item(0, 3)
        if text_trigger.text() == "1":
            tableName.item(0, 3).setText("0")
        else:
            tableName.item(0, 3).setText("1")
        return tableName

    def table_properties(self, edit):
        """Initializing the table properties"""

        row = edit.rowCount()
        column = edit.columnCount()
        r, c = row, column
        table_initiation = [[0 for x in range(r)] for y in range(c)]  # initialize table values
        return r, c, table_initiation

    def update_values(self, tableName, numberRow, numberCol, val1, position, row_count=0, flag_combo=0):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        if row == -1:
            pass
        elif flag_combo == 0:
            try:
                if row_check == 1:
                    val1[col] = [float(tableName.item(row, col).text())]
                    DropDownActions.statusMessage(self, message="")
                else:
                    val1[row][col] = [float(tableName.item(row, col).text())]
                    DropDownActions.statusMessage(self, message="")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("")
                DropDownActions.statusMessage(self, message="Please enter only numbers!")
        else:
            row_check = tableName.rowCount()
            value_combo = tableName.cellWidget(0, position).currentIndex()
            if row_check == 1:
                val1[position] = [value_combo]
                DropDownActions.statusMessage(self, message="")
            else:
                val1[row][position] = [value_combo]
                DropDownActions.statusMessage(self, message="")
        return val1

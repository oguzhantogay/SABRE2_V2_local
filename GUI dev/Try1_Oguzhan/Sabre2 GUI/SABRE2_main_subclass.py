import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtGui, QtCore
from ComboBoxGen import CoBoxGen
import pickle
import SABRE2_GUI

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
        # Members Table Arrangements
        self.Members_table_options = ["Mid Depth", "Flange 1", "Flange 2"]
        self.Members_table_position = 3
        Members_table_row, Members_table_column, Members_table_values = DataCollection.table_properties(
            self, ui_layout.Members_table)
        DataCollection.Assign_comboBox(self, ui_layout.Members_table, self.Members_table_options,
                                       self.Members_table_position, Members_table_values)
        # print(Members_table_row, Members_table_column, Members_table_values)
        ui_layout.Members_table.itemChanged.connect(lambda: DataCollection.update_values(self,
            ui_layout.Members_table, Members_table_row, Members_table_column,self.Members_table_position,
            Members_table_values))



        # ui_layout.Members_table.itemChanged.connect(lambda: print(Members_table_values))



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

    def statusMessage(self,message):
        self.ui.statusBar.showMessage(message)


class DataCollection(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout):
        QMainWindow.__init__(self)
        QtGui.QItemDelegate.__init__(self)
        self.ui = ui_layout

    def Assign_comboBox(self, tableName, options, position, values):
        combo_box = QtGui.QComboBox()
        for t in options:
            combo_box.addItem(t)
        r = tableName.rowCount()
        c = tableName.columnCount()
        for i in range(r):
            combo_box = QtGui.QComboBox()
            for t in options:
                combo_box.addItem(t)
            tableName.setCellWidget(i, position, combo_box)
            combo_box.activated.connect(lambda: DataCollection.update_values(self,tableName, r, c, position, values, i))
        return tableName

    def data_reader(self, edit, values):
        try:
            row = edit.rowCount()
            column = edit.columnCount()
            for i in range(row):
                for j in range(column):
                    values[i][j] = edit.item(i, j).text()
                    print(i)
            return values
        except AttributeError:
            message = 'Please fill the properties in Definition tab.'
            ui_layout.statusbar.showMessage(message)

    def table_properties(self, edit):
        "Initializing the table properties"

        row = edit.rowCount()
        column = edit.columnCount()
        r, c = row, column
        table_initiation = [[0 for x in range(r)] for y in range(c)]  # initialize table values
        return r, c, table_initiation

    def update_values(self, tableName, numberRow, numberCol, position, values, row_count=0):
        col = tableName.currentColumn()
        row = tableName.currentRow()
        row_check = tableName.rowCount()
        value_combo = tableName.cellWidget(0, position).currentIndex()
        try:
            if row_check == 1:
                if col and row is -1:
                    values[position] = [value_combo]
                    DropDownActions.statusMessage(self, message="")
                else:
                    values[col] = [float(tableName.item(row, col).text())]
                    DropDownActions.statusMessage(self, message="")
            else:
                if col and row is -1:
                    values[position] = [value_combo]
                    DropDownActions.statusMessage(self, message="")
                else:
                    values[col] = [float(tableName.item(row,col).text())]
                    DropDownActions.statusMessage(self, message="")
        except ValueError:
            tableName.clearSelection()
            tableName.item(row,col).setText("")
            DropDownActions.statusMessage(self,message="Please enter only numbers!")


        print(values)
        # if row_count ==
        # y = tableName.cellWidget(0, position).currentIndex()
        # for i in range(numberRow):
        #     for j in range(numberCol):
        #         values = DataCollection.data_reader(self,tableName, values)
        #         if j == position:
        #             values[row_count, position] = [y]



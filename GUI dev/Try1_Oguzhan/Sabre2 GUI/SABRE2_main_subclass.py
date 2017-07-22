import PyQt4
from PyQt4.QtGui import *
from PyQt4 import QtCore
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
        ui_layout.DefinitionTabs.hide()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.hide()  # to hide analysis tabs

        # File dropdown actions
        ui_layout.actionNew.triggered.connect(lambda: Actions('uidesign').NewAct())
        ui_layout.actionOpen.triggered.connect(lambda: Actions('uidesign').OpenAct())
        ui_layout.actionSave.triggered.connect(lambda: Actions('uidesign').SaveAct())
        ui_layout.actionSave_As.triggered.connect(lambda: Actions('uidesign').Save_AsAct())
        ui_layout.actionPrint.triggered.connect(lambda: Actions('uidesign').PrintAct())
        ui_layout.actionPrint_Preview.triggered.connect(lambda: Actions('uidesign').Print_PreviewAct())
        ui_layout.actionQuit.triggered.connect(lambda: Actions('uidesign').QuitAct())

        # Help dropdown actions
        ui_layout.actionAbout.triggered.connect(lambda: Actions('uidesign').AboutAct())

        # Status/message bar and progress bar
        # SABRE2_V3.setStatusBar(ui_layout.statusbar)
        # ui_layout.statusbar = PyQt4.QtGui.QStatusBar(SABRE2_V3)
        # ui_layout.statusbar.setObjectName(_fromUtf8("statusbar"))

        message = "Start creating the model by defining the joints"  # Update message with modeling progress and interupts ***************
        # ui_layout.statusbar.showMessage(message)
        # ui_layout.progressBar = PyQt4.QtGui.QProgressBar()
        # ui_layout.statusbar.addPermanentWidget(ui_layout.progressBar)
        # analysisprogress = 80  # Update this value later by integrating with analysis**********
        # ui_layout.progressBar.setValue(analysisprogress)
        # ui_layout.progressBar.setTextVisible(True)  # to make text not visible

        # ui_layout.statusbar = PyQt4.QtGui.QStatusBar(None)
        # ui_layout.statusbar.setObjectName(_fromUtf8("statusbar"))
        # QMainWindow.setStatusBar(QMainWindow, ui_layout.statusbar)
        # # status bar application
        # ui_layout.statusbar.showMessage(message)
        # ui_layout.progressBar = PyQt4.QtGui.QProgressBar()
        # ui_layout.statusbar.addPermanentWidget(ui_layout.progressBar)
        # analysisprogress = 80  # Update this value later by integrating with analysis**********
        # ui_layout.progressBar.setValue(analysisprogress)
        # ui_layout.progressBar.setTextVisible(True)


class Actions(QMainWindow):
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
        print("NewAct")

        # clear all user inputs
        # reset OpenGL screen
        # reset messages

    def OpenAct(self):
        # message = "Open an existing file"
        # self.statusbar.showMessage(message)

        fileName = PyQt4.QtGui.QFileDialog.getOpenFileName(None, "Open Sabre2 File", '', "Sabre2 Files (*.mat);;All Files (*)")

        if not fileName:
            return

        try:
            in_file = open(str(fileName), 'rb')
        except IOError:
            QtGui.QMessageBox.information(self, "Unable to open file",
                                          "There was an error opening \"%s\"" % fileName)
            return

        self.data = pickle.load(in_file)
        in_file.close()

        if len(self.data) == 0:
            QtGui.QMessageBox.information(self, "File is empty")
        else:
            for name, address in self.data:
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

        data = "text test"

        # If file already exists skip popup and update save file
        # try:
        #     fileName
        # except NameError:

        # Invoke save popup screen
        import pickle
        fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(None, "Save Sabre2 File", '', "Sabre2 File (*.mat);;All Files (*)")

        if not fileName:
            return

        try:
            out_file = open(str(fileName), 'wb')
        except IOError:
            PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
                                                "There was an error opening \"%s\"" % fileName)
            return

        pickle.dump(self.data, out_file)
        out_file.close()

    def Save_AsAct(self):
        message = "Name the file saved to disk"
        self.statusbar.showMessage(message)

    def PrintAct(self):
        message = "Print screen"
        self.statusbar.showMessage(message)

    def Print_PreviewAct(self):
        message = "Preview screen print"
        self.statusbar.showMessage(message)

    def QuitAct(self):
        print("quit")
        # message = "Quit program"
        # self.statusbar.showMessage(message)

        # unsaved_files = sum(a.get_num_unsaved_files() for a in self.tagger.albums.itervalues())
        # QMessageBox = QtGui.QMessageBox

        # if unsaved_files > 0:
        #     msg = QMessageBox(self)
        #     msg.setIcon(QMessageBox.Question)
        #     msg.setWindowModality(QtCore.Qt.WindowModal)
        #     msg.setWindowTitle(_(u"Unsaved Changes"))
        #     msg.setText(_(u"Are you sure you want to quit Picard?"))
        #     txt = ungettext(
        #         "There is %d unsaved file. Closing Picard will lose all unsaved changes.",
        #         "There are %d unsaved files. Closing Picard will lose all unsaved changes.",
        #         unsaved_files) % unsaved_files
        #     msg.setInformativeText(txt)
        #     cancel = msg.addButton(QMessageBox.Cancel)
        #     msg.setDefaultButton(cancel)
        #     msg.addButton(_(u"&Quit Picard"), QMessageBox.YesRole)
        #     ret = msg.exec_()

        #     if ret == QMessageBox.Cancel:
        #         return False

        # return True

import PyQt4
from PyQt4.QtGui import *
import pickle
from functools import partial


class SABRE2_main_subclass(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)

        self.ui = ui_layout
        ui_layout.setupUi(self)
        ui_layout.DefinitionTabs.hide()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.hide()  # to hide analysis tabs

        #message = "Testing"
        #self.createActions()  # invoke mouse click actions
        # ui_layout.createMenus()  # create drop down menu signals
        ui_layout.retranslateUi(self)
        #self.statusBar().showMessage(message)  # help message bar

        # MainWindow.setMenuBar(self.menubar)
        # self.statusbar = PyQt4.QtGui.QStatusBar(QMainWindow)
        # self.statusbar.setObjectName(_fromUtf8("statusbar"))
        # MainWindow.setStatusBar(self.statusbar)
        # # status bar application
        # self.statusbar.showMessage("Inelastic Nonlinear Buckling Analysis(INBA) is in progress")
        # self.progressBar = PyQt4.QtGui.QProgressBar()
        # self.statusbar.addPermanentWidget(self.progressBar)
        # # This is simply to show the bar
        # self.progressBar.setValue(40)
        # self.progressBar.setTextVisible(True)  # to make text not visible




    def retranslateUi(self, ui_layout):
        # self.actionAbout.addAction(self.newAct)
        #self.actionAbout = ui_layout.actionAbout.addAction(self.newAct)
        #self.fileMenu = self.menuBar().addMenu("&File")
        ui_layout.actionAbout.addAction(self.AboutAct)
        ui_layout.connect(ui_layout.actionNew, SIGNAL("clicked()"), partial(self.NewAct, 1))
        # self.fileMenu.addAction(self.openAct)
        # self.fileMenu.addAction(self.saveAct)
        # self.fileMenu.addAction(self.printAct)
        # self.fileMenu.addSeparator()
        # self.fileMenu.addAction(self.exitAct)

        # self.editMenu = self.menuBar().addMenu("&Edit")
        # self.editMenu.addAction(self.undoAct)
        # self.editMenu.addAction(self.redoAct)
        # self.editMenu.addSeparator()
        # self.editMenu.addAction(self.cutAct)
        # self.editMenu.addAction(self.copyAct)
        # self.editMenu.addAction(self.pasteAct)
        # self.editMenu.addSeparator()

        # self.helpMenu = self.menuBar().addMenu("&Help")
        # self.helpMenu.addAction(self.aboutAct)
        # self.helpMenu.addAction(self.aboutQtAct)

        # self.formatMenu = self.editMenu.addMenu("&Format")
        # self.formatMenu.addAction(self.boldAct)
        # self.formatMenu.addAction(self.italicAct)
        # self.formatMenu.addSeparator().setText("Alignment")
        # self.formatMenu.addAction(self.leftAlignAct)
        # self.formatMenu.addAction(self.rightAlignAct)
        # self.formatMenu.addAction(self.justifyAct)
        # self.formatMenu.addAction(self.centerAct)
        # self.formatMenu.addSeparator()
        # self.formatMenu.addAction(self.setLineSpacingAct)
        # self.formatMenu.addAction(self.setParagraphSpacingAct)

    def saveToFile(self):
        fileName = PyQt4.QtGui.QFileDialog.getSaveFileName(self,
                                                           "Save Sabre2 File", '',
                                                           "Sabre2 File (*.mat);;All Files (*)")

        if not fileName:
            return

        try:
            out_file = open(str(fileName), 'wb')
        except IOError:
            PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
                                                "There was an error opening \"%s\"" % fileName)
            return

        pickle.dump(self.contacts, out_file)
        out_file.close()

    # def loadFromFile(self):
    #     fileName = PyQt4.QtGui.QFileDialog.getOpenFileName(self,
    #                                                  "Open Address Book", '',
    #                                                  "Address Book (*.abk);;All Files (*)")

    #     if not fileName:
    #         return

    #     try:
    #         in_file = open(str(fileName), 'rb')
    #     except IOError:
    #         PyQt4.QtGui.QMessageBox.information(self, "Unable to open file",
    #                                       "There was an error opening \"%s\"" % fileName)
    #         return

    #     self.contacts = pickle.load(in_file)
    #     in_file.close()

    #     if len(self.contacts) == 0:
    #         PyQt4.QtGui.QMessageBox.information(self, "No contacts in file",
    #                                       "The file you are attempting to open contains no "
    #                                       "contacts.")
    #     else:
    #         for name, address in self.contacts:
    #             self.nameLine.setText(name)
    #             self.addressText.setText(address)

    #     self.updateInterface(self.NavigationMode)

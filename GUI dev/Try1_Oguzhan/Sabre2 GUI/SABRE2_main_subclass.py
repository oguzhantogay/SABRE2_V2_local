from PyQt4.QtGui import *


class SABRE2_main_subclass(QMainWindow):
    def __init__(self, ui_layout):
        QMainWindow.__init__(self)

        self.ui = ui_layout
        ui_layout.setupUi(self)
        ui_layout.DefinitionTabs.hide()  # to hide problem definition tabs
        ui_layout.AnalysisTabs.hide()  # to hide analysis tabs

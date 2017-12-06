
from PyQt4.QtGui import *


class MemberVariables(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(MemberVariables, self).__init__(parent)
        self.ui = ui_layout
        self.JNodeValue = None
        self.members_table_values = None
        self.JNodeValue_i = None
        self.JNodeValue_j = None
        self.MAssemble = None


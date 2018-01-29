import numpy as np
from PyQt4.QtGui import *


class ClassB(QMainWindow):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(ClassB, self).__init__(parent)
        self.ui = ui_layout

    def renderAddNode(self, BNodevalue):
        ''' This function is used to render the Added node position'''

        # mem as mnum in the AddNode.AddNodeClass.ApplyButton

        from OpenGLcode import glWidget

        member_count, member_values, JNodeValues_i, JNodeValues_j, _, Rval = glWidget.memberTableValues(self)

        _, _, tf, bf, web, _, _, _, _, _, _, _, _, _ = glWidget.renderProperties(
            self, member_count, JNodeValues_i, JNodeValues_j, BNodevalue, Rval)

        # Additional Node Plotting

        for j in range(member_count):
            if not np.isclose(BNodevalue[j][0][1] , 0):
                for i in range(int(np.amax(BNodevalue[j,:,1]))+1):
                    if np.isclose(BNodevalue[j][i][14], 1):





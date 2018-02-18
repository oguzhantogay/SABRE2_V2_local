import numpy as np
from PyQt4.QtGui import *
from OpenGL.GLU import *
from PyQt4.QtOpenGL import *


class AddNodeCoordCS(QMainWindow, QGLWidget):
    """docstring for Actions"""

    def __init__(self, ui_layout, parent=None):
        super(AddNodeCoordCS, self).__init__(parent)
        self.ui = ui_layout

    def addNodePoint(self, BNodevalue):
        ''' This function is used to render the Added node position'''

        # mem as mnum in the AddNode.AddNodeClass.ApplyButton

        from OpenGLcode import glWidget

        member_count, member_values, JNodevalue_i, JNodevalue_j, _, Rval = glWidget.memberTableValues(self)

        # Additional Node Plotting
        flag = 'No Added Node'
        dx = 0
        dy = 0
        dz = 0
        for j in range(member_count):
            # print('for add node')
            if not np.isclose(BNodevalue[j][0][1], 0):
                # print('if not add node')
                for i in range(int(np.amax(BNodevalue[j, :, 1]))):
                    # print('i = ', i, 'j = ', j)
                    # print('for 2 add node')
                    dx = BNodevalue[j][i][2]
                    dy = -BNodevalue[j][i][4]
                    dz = BNodevalue[j][i][3]
                    print('dx =', dx, 'dy =', dy,'dz =', dz)
                    if np.isclose(BNodevalue[j][i][14], 1):
                        flag = 'Add Node x'
                        glWidget.drawAsterisk(self,dx,dy,dz, flag)
                    else:
                        flag = 'Asterisk'
                        glWidget.drawAsterisk(self,dx,dy,dz, flag)

    def added_node_drawing_properties(self,BNodevalue):
        ''' This function is used to obtain the added point cross-section properties'''
        from OpenGLcode import glWidget
        _, JNodevalue = glWidget.JointTableValues(self)
        member_count, member_values, JNodevalue_i, JNodevalue_j, _, Rval = glWidget.memberTableValues(self)


        xabs = abs(np.amin(JNodevalue[:, 1]) - np.amax(JNodevalue[:, 1]))
        yabs = abs(np.amin(JNodevalue[:, 2]) - np.amax(JNodevalue[:, 2]))
        zabs = abs(np.amin(-JNodevalue[:, 3]) - np.amax(-JNodevalue[:, 3]))

        xmin = min(np.amin(JNodevalue[:, 1]), 0) - 1 - 0.1 * xabs
        xmax = max(np.amax(JNodevalue[:, 1]), 0) + 1 + 0.1 * xabs

        ymin = min(np.amin(JNodevalue[:, 2]), 0) - 1 - 0.1 * yabs
        ymax = max(np.amax(JNodevalue[:, 2]), 0) + 1 + 0.1 * yabs

        zmin = min(np.amin(-JNodevalue[:, 3]), 0) - 1 - 0.1 * zabs
        zmax = max(np.amax(-JNodevalue[:, 3]), 0) + 1 + 0.1 * zabs

        mbfb = max(np.amax(JNodevalue_i[:, 5]), np.amax(JNodevalue_j[:, 5]))
        mtfb = max(np.amax(JNodevalue_i[:, 6]), np.amax(JNodevalue_j[:, 6]))
        mbft = max(np.amax(JNodevalue_i[:, 7]), np.amax(JNodevalue_j[:, 7]))
        mtft = max(np.amax(JNodevalue_i[:, 8]), np.amax(JNodevalue_j[:, 8]))
        mDg = max(np.amax(JNodevalue_i[:, 9]), np.amax(JNodevalue_j[:, 9]))

        if not np.isclose(np.amax(np.amax(BNodevalue[:, :, 1])), 0):
            mbfb = max(max(np.amax(JNodevalue_i[:, 5]), np.amax(JNodevalue_j[:, 5])),
                       np.amax(np.amax(BNodevalue[:, :, 5])))
            mtfb = max(max(np.amax(JNodevalue_i[:, 6]), np.amax(JNodevalue_j[:, 6])),
                       np.amax(np.amax(BNodevalue[:, :, 6])))
            mbft = max(max(np.amax(JNodevalue_i[:, 7]), np.amax(JNodevalue_j[:, 7])),
                       np.amax(np.amax(BNodevalue[:, :, 7])))
            mtft = max(max(np.amax(JNodevalue_i[:, 8]), np.amax(JNodevalue_j[:, 8])),
                       np.amax(np.amax(BNodevalue[:, :, 8])))
            mtft = max(max(np.amax(JNodevalue_i[:, 9]), np.amax(JNodevalue_j[:, 9])),
                       np.amax(np.amax(BNodevalue[:, :, 9])))

        bf = max(mbfb, mbft)

        Massemble = glWidget.MassembleUpdater(self)
        # print('xabs = ', Massemble)
        for i in range(member_count):
            if Rval[i][1] == 1:
                ydt = (mDg / 2) + (2 * mtft)
                ydb = (mDg / 2) + (2 * mtfb)
            elif Rval[i][1] == 2:
                ydt = 2 * mtft
                ydb = (mDg / 2) + (2 * mtfb)
            elif Rval[i][1] == 2:
                ydt = (mDg / 2) + (2 * mtft)
                ydb = 2 * mtfb

        if xabs < (ydt * 3):
            if xmax < (ydt * 2):
                xmax = max(xmax, ydt * 2) + 1 + 0.1 * xabs

            if xmin > (-ydb * 2):
                xmin = min(xmin, -ydb * 2) - 1 - 0.1 * xabs

        if yabs < (ydt * 3):
            if ymax < ydt * 2:
                ymax = max(ymax, ydt * 2) + 1 + 0.1 * yabs

            if ymin > (-ydb * 2):
                ymin = min(ymin, (-ydb * 2)) - 1 - 0.1 * yabs

        if zabs < (bf * 2):
            if zmax < bf:
                zmax = max(zmax, bf) + 1 + 0.1 * zabs

            if zmin > (-bf):
                zmin = min(zmin, -bf) - 1 - 0.1 * zabs

        xa = max(max(max(abs(xmax - xmin), abs(ymax - ymin)), abs(zmax - zmin)) / 18, mDg)

        xmax = max((xmax + 0.5 * xa), xa)
        ymax = max((ymax + 0.5 * xa), xa)
        zmax = max((zmax + 0.5 * xa), xa)

        xmin = min((xmin - (xa * 0.4)), (-xa * 0.8))
        ymin = min((ymin - (xa * 0.4)), (-xa * 0.8))
        zmin = min((zmin - (xa * 0.4)), (-xa * 0.8))

        # print('xa = ', xa)
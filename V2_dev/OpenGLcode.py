from OpenGL.GLU import *
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
from PyQt4.QtGui import *
from OpenGL.GL import *
from DropDownActions import ActionClass
import numpy as np
import AddNode


class glWidget(QGLWidget, QMainWindow):
    resized = QtCore.pyqtSignal()

    xRotationChanged = QtCore.pyqtSignal(int)
    yRotationChanged = QtCore.pyqtSignal(int)
    zRotationChanged = QtCore.pyqtSignal(int)

    def __init__(self, ui_layout, parent=None):
        super(glWidget, self).__init__(parent)
        self.ui = ui_layout
        self.setMinimumSize(200, 200)
        self.setMouseTracking(False)
        self.object = 0
        self.diam = 0
        glWidget.white_checked = True

        self.xRot = 0
        self.yRot = 0
        self.zRot = 0

        self.xPos = 0
        self.yPos = 0
        self.zPos = 0
        self.aspect_ratio = 0
        self.aspect = 0

        self.left = 0
        self.right = 0
        self.bottom = 0
        self.top = 0
        glWidget.add_node_flag = 0

        glWidget.joint_size = 0.015
        self.initial_zoom = 2
        self.font = QFont()
        self.font.setPointSize(11)
        glWidget.font2 = QFont()
        glWidget.font2.setPointSize(7)
        self.lastPos = QtCore.QPoint()
        self.parameters = []
        self.joint_nodes_length, self.joint_nodes = self.JointTableValues()
        glWidget.member_count, glWidget.member_values, glWidget.JNodeValues_i, glWidget.JNodeValues_j, glWidget.BNodevalue, glWidget.Rval = None, None, None, None, None, None

        self.Massemble = None
        self.joint_i = 1
        self.joint_j = 2

        self.line_checked = False
        self.selected_checked = False
        glWidget.render_checked = False
        # print("values = ", glWidget.member_count, glWidget.member_values)

    def SurfaceContour(self, vertices, edges):
        glDisable(GL_CULL_FACE)
        glBegin(GL_LINES)
        for edge in edges:
            for vertex in edge:
                if glWidget.white_checked:
                    glColor3fv((0, 0, 0))
                else:
                    glColor3fv((0.66274, 0.66274, 0.66274))
                glVertex3fv(vertices[vertex])
        glEnd()

    def Surfaces(self, vertices):
        # print("vertex = ", vertices)
        glDisable(GL_CULL_FACE)
        glBegin(GL_QUADS)
        for i in range(4):
            # print("i = ", i)
            # print("vertices = ", vertices[i,:])
            if glWidget.white_checked:
                glColor4f(0, 0, 0, 0.26)
            else:
                glColor4f(1, 1, 1, 0.26)

            glVertex3fv(vertices[i, :])
        glEnd()

    def drawAsterisk(self, dx, dy, dz, flag = 'Asterisk'):
        # print('draw asterisk test')
        asterisk_size = glWidget.joint_size * 1.7
        glCullFace(GL_BACK)
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
        glBegin(GL_LINES)

        if glWidget.white_checked:
            glColor3fv((0, 0, 0))
        else:
            glColor3fv((1, 0, 0))

        if flag == 'Asterisk':
            glVertex3d(dx + asterisk_size / 2, dy + 0, dz + 0)
            glVertex3d(dx + -asterisk_size / 2, dy + 0, dz + 0)
            glVertex3d(dx + 0, dy + asterisk_size / 2, dz + 0)
            glVertex3d(dx + 0, dy + -asterisk_size / 2, dz + 0)
            glVertex3d(dx + 0, dy + 0, dz + asterisk_size / 2)
            glVertex3d(dx + 0, dy + 0, dz + -asterisk_size / 2)

        glVertex3d(dx + asterisk_size / 2, dy + asterisk_size / 2, dz + asterisk_size / 2)
        glVertex3d(dx + -asterisk_size / 2, dy + -asterisk_size / 2, dz + -asterisk_size / 2)
        glVertex3d(dx + -asterisk_size / 2, dy + asterisk_size / 2, dz + asterisk_size / 2)
        glVertex3d(dx + asterisk_size / 2, dy + -asterisk_size / 2, dz + -asterisk_size / 2)
        glVertex3d(dx + asterisk_size / 2, dy + -asterisk_size / 2, dz + asterisk_size / 2)
        glVertex3d(dx + -asterisk_size / 2, dy + asterisk_size / 2, dz + -asterisk_size / 2)
        glVertex3d(dx + asterisk_size / 2, dy + asterisk_size / 2, dz + -asterisk_size / 2)
        glVertex3d(dx + -asterisk_size / 2, dy + -asterisk_size / 2, dz + asterisk_size / 2)
        glEnd()

    def referenceLine(self, MJvalue):
        glPushAttrib(GL_ENABLE_BIT)
        glBegin(GL_LINES)
        glColor3ub(100, 149, 237)
        for i in range(2):
            glVertex3f(MJvalue[i, 1], MJvalue[i, 2], MJvalue[i, 3])
        glEnd()
        glPopAttrib()

    def Joints(self, x):

        if self.ui.Joints_Table.item(x, 1) is None:
            pass
        elif self.ui.Joints_Table.item(x, 2) is None:
            pass
        else:
            glPushMatrix()
            Q = gluNewQuadric()
            gluQuadricNormals(Q, GL_SMOOTH)
            gluQuadricTexture(Q, GL_TRUE)
            glTranslatef(self.joint_nodes[x][1], self.joint_nodes[x][2], 0)
            if glWidget.white_checked:
                glColor3fv((0, 0, 0))
            else:
                glColor3f(1.0, 1.0, 1.0)
            gluSphere(Q, glWidget.joint_size, 32, 32)

            glPopMatrix()

    def minimumSizeHint(self):
        return QtCore.QSize(50, 50)

    def sizeHint(self):
        return QtCore.QSize(400, 400)

    def setXRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.xRot:
            self.xRot = angle
            self.xRotationChanged.emit(angle)
            self.updateGL()

    def setYRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.yRot:
            self.yRot = angle
            self.yRotationChanged.emit(angle)
            self.updateGL()

    def setZRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.zRot:
            self.zRot = angle
            self.zRotationChanged.emit(angle)
            self.updateGL()

    def initializeGL(self):

        glClearColor(0, 0, 0, 1)
        # self.object = self.makeObject()
        glShadeModel(GL_FLAT)
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_CULL_FACE)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
        glEnable(GL_BLEND)

    def resizeGL(self, width, height):

        # glViewport is needed for proper resizing of QGLWidget
        # print("resize GL")
        glViewport(0, 0, width, height)
        aspect_ratio = width / height

        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        max_x = max(self.joint_nodes[:, 1]) - min(self.joint_nodes[:, 1])
        max_y = max(self.joint_nodes[:, 2]) - min(self.joint_nodes[:, 2])

        if self.joint_nodes_length == 1 or self.ui.Joints_Table.item(1, 1) is None \
                or self.ui.Joints_Table.item(1, 2) is None:

            self.parameters = [-self.initial_zoom + self.joint_nodes[0, 1], self.initial_zoom + self.joint_nodes[0, 1],
                               -self.initial_zoom / aspect_ratio + self.joint_nodes[0, 2],
                               self.initial_zoom / aspect_ratio + self.joint_nodes[0, 2]]

            glOrtho(-self.initial_zoom + self.joint_nodes[0, 1], self.initial_zoom + self.joint_nodes[0, 1],
                    -self.initial_zoom / aspect_ratio + self.joint_nodes[0, 2],
                    self.initial_zoom / aspect_ratio + self.joint_nodes[0, 2],
                    -1000, 1000.0)
            # print("ortho one = ", -self.initial_zoom + self.joint_nodes[0, 0],
            #       self.initial_zoom + self.joint_nodes[0, 0],
            #       -self.initial_zoom / aspect_ratio + self.joint_nodes[0, 1],
            #       self.initial_zoom / aspect_ratio + self.joint_nodes[0, 1])

        else:

            if max_y < self.initial_zoom / aspect_ratio:

                self.parameters = [-self.initial_zoom, self.initial_zoom,
                                   -self.initial_zoom / aspect_ratio, self.initial_zoom / aspect_ratio]

                glOrtho(-self.initial_zoom, self.initial_zoom,
                        -self.initial_zoom / aspect_ratio, self.initial_zoom / aspect_ratio,
                        -1000, 1000.0)

                # print("ortho 1,", -self.initial_zoom, self.initial_zoom,
                #       -self.initial_zoom / aspect_ratio, self.initial_zoom / aspect_ratio)

            elif max_y > self.initial_zoom / aspect_ratio:

                self.parameters = [-self.initial_zoom * aspect_ratio,
                                   self.initial_zoom * aspect_ratio,
                                   -self.initial_zoom, self.initial_zoom]

                glOrtho(-self.initial_zoom * aspect_ratio,
                        self.initial_zoom * aspect_ratio,
                        -self.initial_zoom, self.initial_zoom, -1000,
                        1000.0)

                # print("ortho 2,", -self.initial_zoom * aspect_ratio,
                #       self.initial_zoom * aspect_ratio,
                #       -self.initial_zoom, self.initial_zoom)
            else:
                pass

        # gluPerspective(45, width / height, 0.1, 10000.0)
        # gluPerspective(self.zPos,width/height, 1.0, 1000.0)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

    def mousePressEvent(self, event):
        if self.ui.actionRotate.isChecked() or self.ui.actionPan.isChecked():
            self.lastPos = event.pos()
        else:
            x, y = event.x(), event.y()
            # required to call this to force PyQt to read from the correct, updated buffer
            glReadBuffer(GL_FRONT)
            data = self.grabFrameBuffer()  # builtin function that calls glReadPixels internally
            rgba = QColor(data.pixel(x, y)).getRgb()  # gets the appropriate pixel data as an RGBA tuple
            message = "You selected pixel ({0}, {1}) with an RGBA value of {2}.".format(x, y, rgba)
            ActionClass.statusMessage(self, message)

    def mouseMoveEvent(self, event):
        if self.ui.actionRotate.isChecked():
            dx = event.x() - self.lastPos.x()
            dy = event.y() - self.lastPos.y()

            if event.buttons() & QtCore.Qt.LeftButton:
                self.setXRotation(self.xRot + 8 * dy)
                self.setYRotation(self.yRot + 8 * dx)
                # print("1", self.xRot + 8 * dy, self.yRot + 8 * dx)
            elif event.buttons() & QtCore.Qt.RightButton:
                self.setXRotation(self.xRot + 8 * dy)
                self.setZRotation(self.zRot + 8 * dx)
                # print("2", self.xRot + 8 * dy, self.zRot + 8 * dx)

            self.lastPos = event.pos()

        elif self.ui.actionPan.isChecked():

            dx = event.x() - self.lastPos.x()
            dy = event.y() - self.lastPos.y()

            if event.buttons() & QtCore.Qt.LeftButton:
                self.xPos += +dx / 2000
                self.yPos += -dy / 2000
                # print("xpos = ", self.xPos, "ypos = ", self.yPos)
                self.updateGL()
            elif event.buttons() & QtCore.Qt.RightButton:
                pass

        else:
            pass

    def mouseReleaseEvent(self, event):
        pass

    def paintGL(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
        glTranslated(self.xPos, self.yPos, self.zPos)
        glRotated(self.xRot / 16.0, 1.0, 0.0, 0.0)
        glRotated(self.yRot / 16.0, 0.0, 1.0, 0.0)
        glRotated(self.zRot / 16.0, 0.0, 0.0, 1.0)
        # glCallList(self.object)
        # self.Cube()
        for i in range(self.joint_nodes_length):
            self.Joints(i)
            if self.ui.actionJoint_Member_Labels.isChecked():
                if self.ui.Joints_Table.item(i, 1) is not None and self.ui.Joints_Table.item(i, 2) is not None:
                    if glWidget.white_checked:
                        glColor3f(0, 0, 0)
                    else:
                        glColor3f(1, 1, 1)

                    joint_text = "J" + str(int(self.joint_nodes[i][0]))
                    self.renderText(self.joint_nodes[i][1] - glWidget.joint_size,
                                    self.joint_nodes[i][2] + glWidget.joint_size, 0, joint_text, font=self.font)

        if glWidget.member_count is None:
            pass
        else:
            for i in range(glWidget.member_count):
                self.memberOnly(i)
                if self.ui.actionJoint_Member_Labels.isChecked():
                    if self.ui.Members_table.item(i, 1) is not None and self.ui.Members_table.item(i,
                                                                                                   2) is not None:
                        if glWidget.white_checked:
                            glColor3f(0, 0, 0)
                        else:
                            glColor3f(1, 1, 1)
                        text_x = self.joint_nodes[self.joint_i][1] + (self.joint_nodes[self.joint_j][1] -
                                                                      self.joint_nodes[self.joint_i][1]) / 2
                        text_y = self.joint_nodes[self.joint_i][2] + (self.joint_nodes[self.joint_j][2] -
                                                                      self.joint_nodes[self.joint_i][2]) / 2
                        joint_text = "M" + str(int(glWidget.member_values[i][0]))
                        self.renderText(text_x, text_y, 0, joint_text, font=self.font)

        glWidget.render_checked = self.ui.actionRender_All_Members.isChecked()
        # glWidget.BNodevalue = self.BNodeValueUpdater()
        # print('paint GL BNodevalue = ', glWidget.BNodevalue)
        if glWidget.member_count is not None:
            glWidget.member_count = int(glWidget.member_count)
        if glWidget.render_checked:
            Massemble = self.MassembleUpdater()
            self.renderAllProp(glWidget.member_count, glWidget.JNodeValues_i, glWidget.JNodeValues_j, glWidget.BNodevalue, glWidget.Rval,
                               Massemble)

    def normalizeAngle(self, angle):
        while angle < 0:
            angle += 360 * 16
        while angle > 360 * 16:
            angle -= 360 * 16
        return angle

    def isometricView(self):
        self.setXRotation(330 * 16)
        self.setYRotation(60 * 16)
        pass

    def topView(self):
        self.setXRotation(90 * 16)
        self.setYRotation(0.0 * 16)
        pass

    def frontView(self):
        self.setXRotation(0.0 * 16)
        self.setYRotation(0.0 * 16)
        pass

    def sideView(self):
        self.setXRotation(0.0 * 16)
        self.setYRotation(90 * 16)
        pass

    def setFitView(self):
        self.xPos = 0
        self.yPos = 0
        size_joint = self.joint_nodes.shape[0]

        if size_joint == 1:
            pass
        else:
            if self.ui.DefinitionTabs.isEnabled():
                self.zPos += (
                        max(self.joint_nodes[0][1], self.joint_nodes[0][2]) - max(
                    self.joint_nodes[int(size_joint - 1)][1],
                    self.joint_nodes[int(size_joint - 1)][
                        2]) - 100)
                glWidget.joint_size = 3 * 0.35
            else:

                glWidget.joint_size = 2 * 0.35
                self.zPos += (
                        max(self.joint_nodes[0][1], self.joint_nodes[0][2]) - max(
                    self.joint_nodes[int(size_joint - 1)][1],
                    self.joint_nodes[int(size_joint - 1)][
                        2]) - 30)

        self.updateGL()
        pass

    def setZoomIn(self):
        self.initial_zoom -= 1
        if self.initial_zoom == 0:
            self.initial_zoom = 0.1
        elif self.initial_zoom < 0.1:
            self.initial_zoom *= -0.5
            pass
        self.resizeGL(self.width(), self.height())
        self.updateGL()
        print(self.initial_zoom)
        if self.initial_zoom == 0.1:
            self.initial_zoom = 0
        else:
            pass
        pass

    def setZoomOut(self):
        self.initial_zoom += 1
        if self.initial_zoom == 0:
            self.initial_zoom = 0.1
        else:
            pass
        self.resizeGL(self.width(), self.height())
        self.updateGL()
        print(self.initial_zoom)
        if self.initial_zoom == 0.1:
            self.initial_zoom = 0
        else:
            pass
        pass

    def updateTheWidget(self):
        # print('update the widget')
        self.ui.Members_table.blockSignals(False)
        row = self.ui.Members_table.currentRow()
        if row == -1:
            self.ui.Members_table.setCurrentCell(0,1)
            row = self.ui.Members_table.currentRow()
        none_checker = self.noneDetector(self.ui.Joints_Table)
        glWidget.render_checked = self.ui.actionRender_All_Members.isChecked()
        self.joint_nodes_length, self.joint_nodes = self.JointTableValues()
        try:
            if self.ui.Members_table.item(row, 1) is None:
                pass
            else:
                glWidget.member_count, glWidget.member_values, glWidget.JNodeValues_i, glWidget.JNodeValues_j, glWidget.BNodevalue, glWidget.Rval = self.memberTableValues()
                # glWidget.BNodevalue = self.BNodeValueUpdater()
                # print('update the widget = ', glWidget.BNodevalue )
                if glWidget.render_checked:
                    Massemble = self.MassembleUpdater()
                    glWidget.member_count = int(glWidget.member_count)
                    # if glWidget.add_node_flag == 1:
                    #     self.drawAsterisk(dx, dy, dz, flag = 'x')
                    # elif glWidget.add_node_flag == 2:
                    #     self.drawAsterisk(dx, dy, dz)
                    # else:
                    #     pass

                    self.renderAllProp(glWidget.member_count, glWidget.JNodeValues_i, glWidget.JNodeValues_j, glWidget.BNodevalue,
                                       glWidget.Rval, Massemble)

        except AttributeError:
            pass
        glWidget.white_checked = self.ui.actionWhite_Background.isChecked()
        self.diam = max(max(self.joint_nodes[:, 1]) - min(self.joint_nodes[:, 1]),
                        (max(self.joint_nodes[:, 2]) - min(self.joint_nodes[:, 2])))
        self.diam_x = max(self.joint_nodes[:, 1]) - min(self.joint_nodes[:, 1])
        self.diam_y = max(self.joint_nodes[:, 2]) - min(self.joint_nodes[:, 2])

        if self.joint_nodes_length == 1 or self.diam == 0:
            glWidget.joint_size = 0.015
            self.xPos = 0
            self.yPos = 0
        elif none_checker:
            pass
        elif max(abs(self.joint_nodes[:, 2])) != 0:
            glWidget.joint_size = self.diam / 150 * 1.8
            self.xPos = -min((self.joint_nodes[:, 1])) - self.diam_x / 2
            self.yPos = -min(self.joint_nodes[:, 2]) - self.diam_y / 2
        else:
            glWidget.joint_size = self.diam / 150
            self.xPos = -min(abs(self.joint_nodes[:, 1])) - self.diam_x / 2
            self.yPos = -min(self.joint_nodes[:, 2]) - self.diam_y / 2

        # print("joint size = ", glWidget.joint_size, "xpos = ", self.xPos, "ypos = ", self.yPos)

        if self.joint_nodes.shape[0] == 1:
            self.initial_zoom = 2
            self.resizeGL(self.width(), self.height())
            self.updateGL()
        elif self.ui.Joints_Table.item(1, 1) is None or self.ui.Joints_Table.item(1, 2) is None:
            self.initial_zoom = 2
            self.resizeGL(self.width(), self.height())
            self.updateGL()
        elif self.ui.Joints_Table.item(self.joint_nodes.shape[0] - 1, 1) is None:
            pass
        elif self.ui.Joints_Table.item(self.joint_nodes.shape[0] - 1, 2) is None:
            pass
        else:
            self.initial_zoom = self.diam
            self.resizeGL(self.width(), self.height())
            self.updateGL()

        if glWidget.white_checked:
            glClearColor(1, 1, 1, 1)
            self.updateGL()
        else:
            glClearColor(0, 0, 0, 1)
            self.updateGL()

    def JointTableValues(self):

        import SABRE2_main_subclass

        joint_nodes = SABRE2_main_subclass.SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)

        joint_nodes_length = \
            (SABRE2_main_subclass.SABRE2_main_subclass.update_joints_table(self, self.ui.Joints_Table)).shape[0]

        return joint_nodes_length, joint_nodes

    def memberTableValues(self):

        import SABRE2_main_subclass
        member_values, JNodeValues_i, JNodeValues_j, _, BNodevalue, flag_mem_values, Rval = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self, self.ui.Members_table, 3)
        member_count = member_values.shape[0]
        return member_count, member_values, JNodeValues_i, JNodeValues_j, BNodevalue, Rval

    def MassembleUpdater(self):
        import SABRE2_main_subclass
        Massemble = SABRE2_main_subclass.SABRE2_main_subclass.m_assemble_updater(self, self.ui.Members_table,
                                                                                 flag="OpenGL")
        return Massemble

    # def BNodeValueUpdater(self):
    #     from AddNode import AddNodeClass
    #     _, _, JNodeValues_i, JNodeValues_j, BNodevalue, _ = glWidget.memberTableValues(self)
    #
    #     Massemble = glWidget.MassembleUpdater(self)
    #
    #     # print("BNodevalue function in OpenGLCode before = ", BNodevalue)
    #
    #     BNodevalue = AddNodeClass.ApplyButton(self)
    #
    #     # print("BNodevalue function in OpenGLCode = ", BNodevalue)
    #
    #     return BNodevalue

    def noneDetector(self, tableName):
        row_count = tableName.rowCount()
        return_value = False
        for row in reversed(range(row_count)):
            if tableName.item(row, 1) is None or tableName.item(row, 2) is None:
                return_value = True
                break
            else:
                pass

        return return_value

    def memberOnly(self, x):
        render_checked = self.ui.actionRender_All_Members.isChecked()
        if self.ui.Members_table.item(x, 1) is None:
            pass
        elif self.ui.Members_table.item(x, 2) is None:
            pass
        elif render_checked:
            Massemble = self.MassembleUpdater()
            MJvalue = np.zeros((2, 4))
            # print("JnodeValue =", self.joint_nodes)
            if Massemble is not None:
                self.joint_i = int(glWidget.member_values[x][1] - 1)
                self.joint_j = int(glWidget.member_values[x][2] - 1)
                mem = Massemble.shape[0]
                # print("mem = ", mem)
                glPushAttrib(GL_ENABLE_BIT)
                glBegin(GL_LINES)
                glColor3ub(100, 149, 237)
                for i in range(mem):
                    MJvalue[0][1] = self.joint_nodes[int(Massemble[i][1] - 1)][1]
                    MJvalue[1][1] = self.joint_nodes[int(Massemble[i][2] - 1)][1]
                    MJvalue[0][2] = self.joint_nodes[int(Massemble[i][1] - 1)][2]
                    MJvalue[1][2] = self.joint_nodes[int(Massemble[i][2] - 1)][2]
                    MJvalue[0][3] = self.joint_nodes[int(Massemble[i][1] - 1)][3]
                    MJvalue[1][3] = self.joint_nodes[int(Massemble[i][2] - 1)][3]
                    for i in range(2):
                        glVertex3f(MJvalue[i, 1], MJvalue[i, 2], MJvalue[i, 3])
                glEnd()
                glPopAttrib()
        else:
            glPushAttrib(GL_ENABLE_BIT)
            # glPushAttrib is done to return everything to normal after drawing

            glLineStipple(1, 0x00FF)  # [1]
            glEnable(GL_LINE_STIPPLE)
            glBegin(GL_LINES)

            self.joint_i = int(glWidget.member_values[x][1] - 1)
            self.joint_j = int(glWidget.member_values[x][2] - 1)

            # print("test = ", glWidget.member_values[x][1],glWidget.member_values[x][2], 0)
            glColor3ub(100, 149, 237)

            glVertex3f(self.joint_nodes[self.joint_i][1], self.joint_nodes[self.joint_i][2], 0)
            glVertex3f(self.joint_nodes[self.joint_j][1], self.joint_nodes[self.joint_j][2], 0)
            glEnd()

            glPopAttrib()

    def TapedEleLength(self, NTshex1, NTshey1, NTshez1, NTshex2, NTshey2, NTshez2, alpharef):
        tr1 = np.zeros((3, 1))
        tr2 = np.zeros((3, 1))
        Rz = np.zeros((3, 3))

        tr1[0][0] = NTshex1
        tr1[1][0] = NTshey1
        tr1[2][0] = NTshez1

        tr2[0][0] = NTshex2
        tr2[1][0] = NTshey2
        tr2[2][0] = NTshez2

        Rz[0][0] = np.cos(alpharef)
        Rz[0][1] = -np.sin(alpharef)
        Rz[1][0] = np.sin(alpharef)
        Rz[1][1] = np.cos(alpharef)
        Rz[2][2] = 1

        tap1 = Rz.dot(tr1)
        tap2 = Rz.dot(tr2)

        # print("taqps", tap1, tap2)

        return tap1, tap2

    def renderAllProp(self, member_count, JNodevalue_i, JNodevalue_j, BNodevalue, Rval, Massemble):
        ''' This function works on the rendering all properties of the model'''
        # glWidget.member_count, glWidget.member_values, glWidget.JNodeValues_i, glWidget.JNodeValues_j
        # print("node values", glWidget.JNodeValues_i, glWidget.JNodeValues_j)
        # print("test", JNodevalue_i)
        max_b = 0

        for i in range(int(member_count)):
            max_c = np.amax(BNodevalue[i, :, 1])
            if max_b < max_c:
                max_b = max_c

        # print('max_b = ', max_b, 'max_c = ', max_c,'member = ', member_count)
        max_for_NJ_i = int(max_b + member_count)
        SASSEM = np.zeros((member_count, max_for_NJ_i + 1, 13))
        NJ_i = np.zeros((max_for_NJ_i, 13))
        NJ_j = np.zeros((max_for_NJ_i, 13))

        from SABRE2SegmCODE import ClassA
        Massemble = glWidget.MassembleUpdater(self)
        BNodevalue = ClassA.BNodevalueUpdater(self, BNodevalue, JNodevalue_i, JNodevalue_j, Massemble)
        # print('Bnode in render all fun = ', BNodevalue)

        for k in range(13):
            for i in range(int(member_count)):
                # print(int(member_count))
                # print("test1.2",JNodevalue_i[i,k])
                SASSEM[i][0][k] = JNodevalue_i[i][k]
                if np.isclose(np.amax(BNodevalue[i, :, 1]), 0):
                    pass
                else:
                    for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                        SASSEM[i][j + 1][k] = BNodevalue[i, j, k]

                SASSEM[i][int(np.amax(BNodevalue[i, :, 1]))+1][k] = JNodevalue_j[i][k]

        # print("sassem values = ", SASSEM)
        # print("sassem 1 values = ", SASSEM[:,:,0])
        # print("sassem 2 values = ", SASSEM[:,:,1])
        # print("sassem 3 values = ", SASSEM[:,:,2])
        # print("sassem 4 values = ", SASSEM[:,:,3])
        # print("sassem 5 values = ", SASSEM[:,:,4])
        # print("sassem 6 values = ", SASSEM[:,:,5])
        # print("sassem 7 values = ", SASSEM[:,:,6])
        # print("sassem 8 values = ", SASSEM[:,:,7])
        # print("sassem 9 values = ", SASSEM[:,:,8])
        # print("sassem 10 values = ", SASSEM[:,:,9])
        # print("sassem 11 values = ", SASSEM[:,:,10])
        # print("sassem 12 values = ", SASSEM[:,:,11])
        # print("sassem 13 values = ", SASSEM[:,:,12])
        # print("test2")

        q = 1

        for i in range(member_count):
            NJ_i[q - 1][0] = q
            NJ_i[q - 1][1] = q
            NJ_i[q - 1][2] = SASSEM[i, 0, 2]
            NJ_i[q - 1][3] = SASSEM[i, 0, 3]
            NJ_i[q - 1][4] = SASSEM[i, 0, 4]
            NJ_i[q - 1][5] = SASSEM[i, 0, 5]
            NJ_i[q - 1][6] = SASSEM[i, 0, 6]
            NJ_i[q - 1][7] = SASSEM[i, 0, 7]
            NJ_i[q - 1][8] = SASSEM[i, 0, 8]
            NJ_i[q - 1][9] = SASSEM[i, 0, 9]
            NJ_i[q - 1][10] = SASSEM[i, 0, 10]
            NJ_i[q - 1][11] = SASSEM[i, 0, 11]
            NJ_i[q - 1][12] = SASSEM[i, 0, 12]
            # print("NJ_i_1 = ", NJ_i)
            for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                NJ_i[q + j][0] = q + j + 1
                NJ_i[q + j][1] = q + j + 1
                NJ_i[q + j][2] = SASSEM[i, j+1, 2]
                NJ_i[q + j][3] = SASSEM[i, j+1, 3]
                NJ_i[q + j][4] = SASSEM[i, j+1, 4]
                NJ_i[q + j][5] = SASSEM[i, j+1, 5]
                NJ_i[q + j][6] = SASSEM[i, j+1, 6]
                NJ_i[q + j][7] = SASSEM[i, j+1, 7]
                NJ_i[q + j][8] = SASSEM[i, j+1, 8]
                NJ_i[q + j][9] = SASSEM[i, j+1, 9]
                NJ_i[q + j][10] = SASSEM[i, j +1, 10]
                NJ_i[q + j][11] = SASSEM[i, j +1, 11]
                NJ_i[q + j][12] = SASSEM[i, j +1, 12]
            q = int(np.amax(BNodevalue[i, :, 1]) + q + 1)
        # print("NJ_i_2 = ", NJ_i)
        q = 1

        for i in range(member_count):

            for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                NJ_j[q + j - 1][0] = q + j
                NJ_j[q + j - 1][1] = q + j + 1
                NJ_j[q + j - 1][2] = SASSEM[i, j + 1, 2]
                NJ_j[q + j - 1][3] = SASSEM[i, j + 1, 3]
                NJ_j[q + j - 1][4] = SASSEM[i, j + 1, 4]
                NJ_j[q + j - 1][5] = SASSEM[i, j + 1, 5]
                NJ_j[q + j - 1][6] = SASSEM[i, j + 1, 6]
                NJ_j[q + j - 1][7] = SASSEM[i, j + 1, 7]
                NJ_j[q + j - 1][8] = SASSEM[i, j + 1, 8]
                NJ_j[q + j - 1][9] = SASSEM[i, j + 1, 9]
                NJ_j[q + j - 1][10] = SASSEM[i, j + 1, 10]
                NJ_j[q + j - 1][11] = SASSEM[i, j + 1, 11]
                NJ_j[q + j - 1][12] = SASSEM[i, j + 1, 12]

            # print("q before = ", q)
            q = int(np.amax(BNodevalue[i, :, 1])) + q + 1
            b_node_number = int(np.amax(BNodevalue[i, :, 1]))
            NJ_j[q - 2][0] = q - 1
            NJ_j[q - 2][1] = q
            NJ_j[q - 2][2] =  SASSEM[i, b_node_number + 1 , 2]
            NJ_j[q - 2][3] =  SASSEM[i, b_node_number + 1 , 3]
            NJ_j[q - 2][4] =  SASSEM[i, b_node_number + 1 , 4]
            NJ_j[q - 2][5] =  SASSEM[i, b_node_number + 1 , 5]
            NJ_j[q - 2][6] =  SASSEM[i, b_node_number + 1 , 6]
            NJ_j[q - 2][7] =  SASSEM[i, b_node_number + 1 , 7]
            NJ_j[q - 2][8] =  SASSEM[i, b_node_number + 1 , 8]
            NJ_j[q - 2][9] =  SASSEM[i, b_node_number + 1 , 9]
            NJ_j[q - 2][10] = SASSEM[i, b_node_number + 1 , 10]
            NJ_j[q - 2][11] = SASSEM[i, b_node_number + 1 , 11]
            NJ_j[q - 2][12] = SASSEM[i, b_node_number + 1 , 12]
        #     print("q after = ", q)
        #
        #

        # print("NJ_i = ", NJ_i, "\nNJ_j", NJ_j)
        # print("NJ_i = ", NJ_i[:,0], "\nNJ_j", NJ_j[:,0])

        sn = int(np.amax(NJ_i[:, 0]))  # Total Segment Number
        # print('segment number = ',sn)

        # Model Generation
        # Nodes for each element (# ele, #node start, #node end)
        MI = np.zeros((NJ_i[:, 0].shape[0], 3))
        # print('MI = ', MI)
        MI[:, 0] = NJ_i[:, 0]
        MI[:, 1] = NJ_i[:, 1]
        MI[:, 2] = NJ_j[:, 1]

        # print(" MI = ", MI)
        # Global frame coordinates at each element.
        # Start node : node(1) and end node : node(2) for each element
        xg1, xg2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros(
            (NJ_i[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)
        yg1, yg2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros(
            (NJ_i[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)
        zg1, zg2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros(
            (NJ_i[:, 0].shape[0], 1))  # element length: xg1(start) xg2(end)

        xg1[:, 0] = NJ_i[:, 2]
        yg1[:, 0] = NJ_i[:, 3]
        zg1[:, 0] = NJ_i[:, 4]

        xg2[:, 0] = NJ_j[:, 2]
        yg2[:, 0] = NJ_j[:, 3]
        zg2[:, 0] = NJ_j[:, 4]
        # Section properties at each element under natural frame
        bfb1, bfb2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # Bottom flange width
        tfb1, tfb2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # Bottom flange thickness
        bft1, bft2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # Top flange width
        tft1, tft2 = np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # Top flange thickness
        Dg1, Dg2 =   np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # dw:Web depth (y-dir)
        hg1, hg2 =   np.zeros((NJ_i[:, 0].shape[0], 1)), np.zeros((NJ_i[:, 0].shape[0], 1))  # h : Distance between flange centroids

        bfb1[:, 0] = NJ_i[:, 5]
        tfb1[:, 0] = NJ_i[:, 6]
        bft1[:, 0] = NJ_i[:, 7]
        tft1[:, 0] = NJ_i[:, 8]
        Dg1[:, 0] = NJ_i[:, 9]
        hg1[:, 0] = NJ_i[:, 12]

        bfb2[:, 0] = NJ_j[:, 5]
        tfb2[:, 0] = NJ_j[:, 6]
        bft2[:, 0] = NJ_j[:, 7]
        tft2[:, 0] = NJ_j[:, 8]
        Dg2[:, 0] = NJ_j[:, 9]
        hg2[:, 0] = NJ_j[:, 12]

        #   Geometric dimension of Cross-section
        #   Mid-web depth

        Dt1 = Dg1 / 2  # top of Web depth to mid web depth
        Dt2 = Dg2 / 2  # top of Web depth to mid web depth
        Db1 = Dt1  # bottom of Web depth to mid web depth
        Db2 = Dt2  # bottom of Web depth to mid web depth
        ht1 = Dt1 + tft1 / 2  # top flange centroid to mid web depth
        ht2 = Dt2 + tft2 / 2  # top flange centroid to mid web depth
        hb1 = Db1 + tfb1 / 2  # bottom flange centroid to mid web depth
        hb2 = Db2 + tfb2 / 2  # bottom flange centroid to mid web depth

        # Shear center
        # Start node
        # bottom flange centroid to shear center

        hsb1 = np.divide((np.multiply(np.multiply(tft1, np.power(bft1, 3)), hg1)),
                         (np.multiply(tfb1, np.power(bfb1, 3)) + np.multiply(tft1, np.power(bft1, 3))))
        Dsb1 = hsb1 - tfb1 / 2  # bottom of Web depth to shear center
        hst1 = hg1 - hsb1  # top flange centroid to shear center
        Dst1 = hst1 - tft1 / 2  # top of Web depth to shear center
        # print("tft1 =",  tft1, "bft1 = ", bft1, "hg1 = ", hg1, "tfb1 = ", tfb1, "bfb2 = ", bfb1)
        # print("hsb1 = ", hsb1, "hst1 = ", hst1)

        # End node
        # bottom flange centroid to shear center
        hsb2 = np.divide((np.multiply(np.multiply(tft2, np.power(bft2, 3)), hg2)),
                         (np.multiply(tfb2, np.power(bfb2, 3)) + np.multiply(tft2, np.power(bft2, 3))))
        Dsb2 = hsb2 - tfb2 / 2  # bottom of Web depth to shear center
        hst2 = hg2 - hsb2  # top flange centroid to shear center
        Dst2 = hst2 - tft2 / 2  # top of Web depth to shear center
        # print("tft2 =", tft2, "bft2 = ", bft2, "hg2 = ", hg2, "tfb2 = ", tfb2, "bfb2 = ", bfb2)
        # print("hsb2 = ", hsb2, "hst2 = ", hst2)
        # Geometric dimension of Cross-section .

        # Global frame angle for each element without considering shear center

        alpharef = np.zeros((sn, 2))
        for i in range(sn):
            opp = yg2[i, 0] - yg1[i, 0]  # element depth in y-dir
            adj = xg2[i, 0] - xg1[i, 0]  # element length in x-dir
            alpharef[i][1] = MI[i][0]
            alpharef[i][1] = np.arctan2(opp, adj)  # Only global frame angle

        # Calculate Initial Member x-dir Nodal Coordinates for Each Member S
        # Preallocationg

        dX0 = np.zeros((sn, 1))
        dY0 = np.zeros((sn, 1))
        dZ0 = np.zeros((sn, 1))
        L0 = np.zeros((sn, 1))

        for i in range(sn):
            dX0[i][0] = xg2[i][0] - xg1[i][0]
            dY0[i][0] = yg2[i][0] - yg1[i][0]
            dZ0[i][0] = zg2[i][0] - zg1[i][0]
            L0[i][0] = ((dX0[i][0]) ** 2 + (dY0[i][0]) ** 2 + (dZ0[i][0]) ** 2) ** 0.5

        # Initial Member x-dir Nodal Coordinates for Each Member
        # Preallocationg
        # print('Bnode in render fun = ', BNodevalue)

        MemLength = np.zeros((sn, 1))
        segnum = np.zeros((member_count + 1, 1))
        segnum[0][0] = 0  # (Start node number - 1) for each member

        for i in range(member_count):
            for k in range(int(np.amax(BNodevalue[i, :, 1] + 1))):
                # print("test a = ", segnum[i][0], "test b =", segnum[i][0] )
                if (k + segnum[i][0]) == (segnum[i][0]):
                    MemLength[int(k + segnum[i][0])][0] = L0[int(k + segnum[i][0])][0]
                else:
                    MemLength[int(k + segnum[i][0])][0] = MemLength[int(k + segnum[i][0]) - 1][0] + \
                                                          L0[int(k + segnum[i][0])][0]

            segnum[i + 1][0] = segnum[i][0] + int(np.amax(BNodevalue[i, :, 1] + 1))

        # Calculate Initial Member x-dir Nodal Coordinates for Each Member E

        # Set up reference axis for each segments

        q = 0
        val1 = np.zeros((sn, 1))

        for i in range(member_count):
            for j in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                val1[q + j][0] = Rval[i][1]

            q = (int(np.amax(BNodevalue[i, :, 1]) + 1)) + q

        NTshe1 = np.zeros((sn, 4))
        NTshe2 = np.zeros((sn, 4))
        segnum[0][0] = 0  # (Start node number - 1) for each member

        ys1 = np.zeros((sn, 1))
        ys2 = np.zeros((sn, 1))
        segnum = segnum.astype(int)
        # print("Memlength = ", MemLength)
        # print("Dg1 = ", Dg1, "Dg2 = ", Dg2, "Dst1 = ", Dst1 , "Dst2 = ", Dst2)
        # print('Rval in memcount = ', Rval)
        for i in range(member_count):
            if Rval[i][1] == 1:
                for k in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                    ys1[k + segnum[i][0]][0] = (Dg1[k + segnum[i][0]][0]) / 2 - Dst1[k + segnum[i][0]][0]
                    ys2[k + segnum[i][0]][0] = (Dg2[k + segnum[i][0]][0]) / 2 - Dst2[k + segnum[i][0]][
                        0]  # Shear center
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = 0
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
                    else:
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0] - 1][0]
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]

            elif Rval[i][1] == 2:
                for k in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                    ys1[k + segnum[i][0]][0] = - Dst1[k + segnum[i][0]][0]
                    ys2[k + segnum[i][0]][0] = - Dst2[k + segnum[i][0]][0]  # Shear center
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = 0
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
                    else:
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0] - 1][0]
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]

            elif Rval[i][1] == 3:
                for k in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                    ys1[k + segnum[i][0]][0] = (Dsb1[k + segnum[i][0]][0])
                    ys2[k + segnum[i][0]][0] = (Dsb2[k + segnum[i][0]][0])
                    if [k + segnum[i][0]][0] == (segnum[i][0]):
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = 0
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
                    else:
                        NTshe1[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe2[[k + segnum[i][0]][0]][0] = k + segnum[i][0] + 1
                        NTshe1[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0] - 1][0]
                        NTshe2[[k + segnum[i][0]][0]][1] = MemLength[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][2] = ys1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][2] = ys2[k + segnum[i][0]][0]
                        NTshe1[[k + segnum[i][0]][0]][3] = zg1[k + segnum[i][0]][0]
                        NTshe2[[k + segnum[i][0]][0]][3] = zg2[k + segnum[i][0]][0]
            segnum[i + 1][0] = segnum[i][0] + (int(np.amax(BNodevalue[i, :, 1]) + 1))
        # print("ys1 = ", ys1, "ys2 = ", ys2, "zg1 = ", zg1, "zg2 = ", zg2)
        # print("2", "NTshe1 = ", NTshe1,"NTshe2 = ", NTshe2)
        # Preallocationg
        taper1 = np.zeros((sn, 3))
        taper2 = np.zeros((sn, 3))

        tap1 = np.zeros((3, 1))
        tap2 = np.zeros((3, 1))

        for n in range(sn):
            tap1, tap2 = glWidget.TapedEleLength(self, NTshe1[n][1], NTshe1[n][2], NTshe1[n][3], NTshe2[n][1],
                                                 NTshe2[n][2],
                                                 NTshe2[n][3], alpharef[n][1])
            # print("tap1 = ", tap1)
            # print("tap2 = ", tap2)

            taper1[n, :] = tap1[:, 0]  # Which is the same as xg.
            taper2[n, :] = tap2[:, 0]  # Which is the same as yg.

        # Starting Node for each member
        segnum[0, 0] = 0  # (Start node number - 1) for each member
        NG1 = np.zeros((max_for_NJ_i, 3))
        NG2 = np.zeros((max_for_NJ_i, 3))
        for i in range(member_count):
            for k in range(int(np.amax(BNodevalue[i, :, 1]) + 1)):
                NG1[k + segnum[i][0]][0] = NJ_i[segnum[i][0]][2]
                NG2[k + segnum[i][0]][0] = NJ_i[segnum[i][0]][2]
                NG1[k + segnum[i][0]][1] = NJ_i[segnum[i][0]][3]
                NG2[k + segnum[i][0]][1] = NJ_i[segnum[i][0]][3]
                NG1[k + segnum[i][0]][2] = NJ_i[segnum[i][0]][4]
                NG2[k + segnum[i][0]][2] = NJ_i[segnum[i][0]][4]

            segnum[i + 1][0] = segnum[i][0] + (int(np.amax(BNodevalue[i, :, 1]) + 1))

        # print("taper 1 = ", taper1, "taper 2 = ", taper2 )
        # print("NG1 = ", NG1, "NG2 =" , NG2)

        MemLength1 = np.zeros((NTshe1.shape[0], 1))
        MemLength2 = np.zeros((NTshe2.shape[0], 1))

        MemLength1[:, 0] = NTshe1[:, 1]
        MemLength2[:, 0] = NTshe2[:, 1]

        Nshe1 = np.zeros((taper1.shape[0], 3))
        Nshe2 = np.zeros((taper2.shape[0], 3))

        # Global frame nodal coordinates w.r.t Shear center
        Nshe1[:, 0] = taper1[:, 0] + NG1[:, 0]
        Nshe2[:, 0] = taper2[:, 0] + NG2[:, 0]
        Nshe1[:, 1] = taper1[:, 1] + NG1[:, 0]
        Nshe2[:, 1] = taper2[:, 1] + NG2[:, 0]
        Nshe1[:, 2] = taper1[:, 2] + NG1[:, 0]
        Nshe2[:, 2] = taper2[:, 2] + NG2[:, 0]

        # print("Nshe1 = ", Nshe1, "Nshe2 = ", Nshe2)

        # ---------------------------------------------------------------------
        # ----------------    Undeformed 3D rendering       -------------------
        # ---------------------------------------------------------------------

        Rz = np.zeros((3, 3))

        SN1, SN5, SN8, SN12 = np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3))
        SN2, SN6, SN9, SN13 = np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3))
        SN3, SN7, SN10, SN14 = np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3)), np.zeros((1, 3))
        # print("memlength 1 = ", MemLength1)
        # print("memlength 2 = ", MemLength2)
        # print('val1 = ', val1)
        # print('sn = ', sn)
        for i in range(sn):
            # print('i = ', i)
            Rz[0][0] = np.cos(alpharef[i, 1])
            Rz[0][1] = -np.sin(alpharef[i, 1])
            Rz[1][0] = np.sin(alpharef[i, 1])
            Rz[1][1] = np.cos(alpharef[i, 1])
            Rz[2][2] = 1
            # print("Rz = ", Rz)
            # print("Rval  = ", Rval)
            if val1[i][0] == 1:
                # *************************** Rotation
                # print("before1")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)
                # bottom flange start node
                SN1[0, :] = [MemLength1[i, 0], (-Db1[i, 0]), (zg1[i, 0] + bfb1[i, 0] / 2)]
                SN2[0, :] = [MemLength1[i, 0], (-Db1[i, 0]), (zg1[i, 0] + 0)]
                SN3[0, :] = [MemLength1[i, 0], (-Db1[i, 0]), (zg1[i, 0] - bfb1[i, 0] / 2)]
                # top flange start node
                SN5[0, :] = [MemLength1[i, 0], Dt1[i, 0], (zg1[i, 0] + bft1[i, 0] / 2)]
                SN6[0, :] = [MemLength1[i, 0], Dt1[i, 0], (zg1[i, 0] + 0)]
                SN7[0, :] = [MemLength1[i, 0], Dt1[i, 0], (zg1[i, 0] - bft1[i, 0] / 2)]
                # bottom flange end node
                SN8[0, :] = [MemLength2[i, 0], (-Db2[i, 0]), (zg2[i, 0] + bfb2[i, 0] / 2)]
                SN9[0, :] = [MemLength2[i, 0], (-Db2[i, 0]), (zg2[i, 0] + 0)]
                SN10[0, :] = [MemLength2[i, 0], (-Db2[i, 0]), (zg2[i, 0] - bfb2[i, 0] / 2)]
                # top flange end node
                SN12[0, :] = [MemLength2[i, 0], Dt2[i, 0], (zg2[i, 0] + bft2[i, 0] / 2)]
                SN13[0, :] = [MemLength2[i, 0], Dt2[i, 0], (zg2[i, 0] + 0)]
                SN14[0, :] = [MemLength2[i, 0], Dt2[i, 0], (zg2[i, 0] - bft2[i, 0] / 2)]
                # print("before2")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)
                #   ********* Global Rotation
                SN1 = np.dot(Rz, np.transpose(SN1))
                SN2 = np.dot(Rz, np.transpose(SN2))
                SN3 = np.dot(Rz, np.transpose(SN3))
                SN5 = np.dot(Rz, np.transpose(SN5))
                SN6 = np.dot(Rz, np.transpose(SN6))
                SN7 = np.dot(Rz, np.transpose(SN7))
                SN8 = np.dot(Rz, np.transpose(SN8))
                SN9 = np.dot(Rz, np.transpose(SN9))
                SN10 = np.dot(Rz, np.transpose(SN10))
                SN12 = np.dot(Rz, np.transpose(SN12))
                SN13 = np.dot(Rz, np.transpose(SN13))
                SN14 = np.dot(Rz, np.transpose(SN14))
                # print("middle1")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)

                SN1 = np.transpose(SN1)
                SN2 = np.transpose(SN2)
                SN3 = np.transpose(SN3)
                SN5 = np.transpose(SN5)
                SN6 = np.transpose(SN6)
                SN7 = np.transpose(SN7)
                SN8 = np.transpose(SN8)
                SN9 = np.transpose(SN9)
                SN10 = np.transpose(SN10)
                SN12 = np.transpose(SN12)
                SN13 = np.transpose(SN13)
                SN14 = np.transpose(SN14)
                # print("middle Rval1")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)
                # *************************** Global Translation to reference axis
                # bottom flange start node
                SN1 = SN1 + NG1[i, :]
                SN2 = SN2 + NG1[i, :]
                SN3 = SN3 + NG1[i, :]
                # top flange start node
                SN5 = SN5 + NG1[i, :]
                SN6 = SN6 + NG1[i, :]
                SN7 = SN7 + NG1[i, :]
                # bottom flange end node
                SN8 = SN8 + NG2[i, :]
                SN9 = SN9 + NG2[i, :]
                SN10 = SN10 + NG2[i, :]
                # top flange end node
                SN12 = SN12 + NG2[i, :]
                SN13 = SN13 + NG2[i, :]
                SN14 = SN14 + NG2[i, :]

            elif val1[i][1] == 2:
                # *************************** Rotation
                # bottom flange start node
                SN1[0, :] = [MemLength1[i, 0], (-Dg1[i, 0]), (zg1[i, 0] + bfb1[i, 0] / 2)]
                SN2[0, :] = [MemLength1[i, 0], (-Dg1[i, 0]), (zg1[i, 0] + 0)]
                SN3[0, :] = [MemLength1[i, 0], (-Dg1[i, 0]), (zg1[i, 0] - bfb1[i, 0] / 2)]
                # top flange start node
                SN5[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] + bft1[i, 0] / 2)]
                SN6[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] + 0)]
                SN7[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] - bft1[i, 0] / 2)]
                # bottom flange end node
                SN8[0, :] = [MemLength2[i, 0], (-Dg2[i, 0]), (zg2[i, 0] + bfb2[i, 0] / 2)]
                SN9[0, :] = [MemLength2[i, 0], (-Dg2[i, 0]), (zg2[i, 0] + 0)]
                SN10[0, :] = [MemLength2[i, 0], (-Dg2[i, 0]), (zg2[i, 0] - bfb2[i, 0] / 2)]
                # top flange end node
                SN12[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] + bft2[i, 0] / 2)]
                SN13[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] + 0)]
                SN14[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] - bft2[i, 0] / 2)]
                #   ********* Global Rotation
                SN1 = np.dot(Rz, np.transpose(SN1))
                SN2 = np.dot(Rz, np.transpose(SN2))
                SN3 = np.dot(Rz, np.transpose(SN3))
                SN5 = np.dot(Rz, np.transpose(SN5))
                SN6 = np.dot(Rz, np.transpose(SN6))
                SN7 = np.dot(Rz, np.transpose(SN7))
                SN8 = np.dot(Rz, np.transpose(SN8))
                SN9 = np.dot(Rz, np.transpose(SN9))
                SN10 = np.dot(Rz, np.transpose(SN10))
                SN12 = np.dot(Rz, np.transpose(SN12))
                SN13 = np.dot(Rz, np.transpose(SN13))
                SN14 = np.dot(Rz, np.transpose(SN14))
                # print("middle rval 2")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)
                SN1 = np.transpose(SN1)
                SN2 = np.transpose(SN2)
                SN3 = np.transpose(SN3)
                SN5 = np.transpose(SN5)
                SN6 = np.transpose(SN6)
                SN7 = np.transpose(SN7)
                SN8 = np.transpose(SN8)
                SN9 = np.transpose(SN9)
                SN10 = np.transpose(SN10)
                SN12 = np.transpose(SN12)
                SN13 = np.transpose(SN13)
                SN14 = np.transpose(SN14)
                # *************************** Global Translation to reference axis
                # bottom flange start node
                SN1 = SN1 + NG1[i, :]
                SN2 = SN2 + NG1[i, :]
                SN3 = SN3 + NG1[i, :]
                # top flange start node
                SN5 = SN5 + NG1[i, :]
                SN6 = SN6 + NG1[i, :]
                SN7 = SN7 + NG1[i, :]
                # bottom flange end node
                SN8 = SN8 + NG2[i, :]
                SN9 = SN9 + NG2[i, :]
                SN10 = SN10 + NG2[i, :]
                # top flange end node
                SN12 = SN12 + NG2[i, :]
                SN13 = SN13 + NG2[i, :]
                SN14 = SN14 + NG2[i, :]

            elif val1[i][1] == 3:
                # *************************** Rotation
                # bottom flange start node

                SN1[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] + bfb1[i, 0] / 2)]
                SN2[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] + 0)]
                SN3[0, :] = [MemLength1[i, 0], 0, (zg1[i, 0] - bfb1[i, 0] / 2)]
                # top flange start node
                SN5[0, :] = [MemLength1[i, 0], (Dg1[i, 0]), (zg1[i, 0] + bft1[i, 0] / 2)]
                SN6[0, :] = [MemLength1[i, 0], (Dg1[i, 0]), (zg1[i, 0] + 0)]
                SN7[0, :] = [MemLength1[i, 0], (Dg1[i, 0]), (zg1[i, 0] - bft1[i, 0] / 2)]
                # bottom flange end node
                SN8[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] + bfb2[i, 0] / 2)]
                SN9[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] + 0)]
                SN10[0, :] = [MemLength2[i, 0], 0, (zg2[i, 0] - bfb2[i, 0] / 2)]
                # top flange end node
                SN12[0, :] = [MemLength2[i, 0], (Dg2[i, 0]), (zg2[i, 0] + bft2[i, 0] / 2)]
                SN13[0, :] = [MemLength2[i, 0], (Dg2[i, 0]), (zg2[i, 0] + 0)]
                SN14[0, :] = [MemLength2[i, 0], (Dg2[i, 0]), (zg2[i, 0] - bft2[i, 0] / 2)]
                # print("start rval 3")
                # print("SN1", SN1)
                # print("SN2", SN2)
                # print("SN3", SN3)
                # print("SN5", SN5)
                # print("SN6", SN6)
                # print("SN7", SN7)
                # print("SN8", SN8)
                # print("SN9", SN9)
                # print("SN10", SN10)
                # print("SN12", SN12)
                # print("SN13", SN13)
                #   ********* Global Rotation
                SN1 = np.dot(Rz, np.transpose(SN1))
                SN2 = np.dot(Rz, np.transpose(SN2))
                SN3 = np.dot(Rz, np.transpose(SN3))
                SN5 = np.dot(Rz, np.transpose(SN5))
                SN6 = np.dot(Rz, np.transpose(SN6))
                SN7 = np.dot(Rz, np.transpose(SN7))
                SN8 = np.dot(Rz, np.transpose(SN8))
                SN9 = np.dot(Rz, np.transpose(SN9))
                SN10 = np.dot(Rz, np.transpose(SN10))
                SN12 = np.dot(Rz, np.transpose(SN12))
                SN13 = np.dot(Rz, np.transpose(SN13))
                SN14 = np.dot(Rz, np.transpose(SN14))

                SN1 = np.transpose(SN1)
                SN2 = np.transpose(SN2)
                SN3 = np.transpose(SN3)
                SN5 = np.transpose(SN5)
                SN6 = np.transpose(SN6)
                SN7 = np.transpose(SN7)
                SN8 = np.transpose(SN8)
                SN9 = np.transpose(SN9)
                SN10 = np.transpose(SN10)
                SN12 = np.transpose(SN12)
                SN13 = np.transpose(SN13)
                SN14 = np.transpose(SN14)
                # *************************** Global Translation to reference axis
                # bottom flange start node
                SN1 = SN1 + NG1[i, :]
                SN2 = SN2 + NG1[i, :]
                SN3 = SN3 + NG1[i, :]
                # top flange start node
                SN5 = SN5 + NG1[i, :]
                SN6 = SN6 + NG1[i, :]
                SN7 = SN7 + NG1[i, :]
                # bottom flange end node
                SN8 = SN8 + NG2[i, :]
                SN9 = SN9 + NG2[i, :]
                SN10 = SN10 + NG2[i, :]
                # top flange end node
                SN12 = SN12 + NG2[i, :]
                SN13 = SN13 + NG2[i, :]
                SN14 = SN14 + NG2[i, :]

            eLtf = np.zeros((4, 3))
            eLweb = np.zeros((4, 3))
            eLbf = np.zeros((4, 3))
            # print("last")
            # print("SN1", SN1)
            # print("SN2", SN2)
            # print("SN3", SN3)
            # print("SN5", SN5)
            # print("SN6", SN6)
            # print("SN7", SN7)
            # print("SN8", SN8)
            # print("SN9", SN9)
            # print("SN10", SN10)
            # print("SN12", SN12)
            # print("SN13", SN13)
            eLtf[0, :] = SN5  # top flange surface.
            eLtf[1, :] = SN7
            eLtf[2, :] = SN12
            eLtf[3, :] = SN14
            eLweb[0, :] = SN2  # web surface.
            eLweb[1, :] = SN6
            eLweb[2, :] = SN9
            eLweb[3, :] = SN13
            eLbf[0, :] = SN1  # bottom flange surface.
            eLbf[1, :] = SN3
            eLbf[2, :] = SN8
            eLbf[3, :] = SN10

            # print("eltf = " , eLtf, "eLweb = ", eLbf, "eLbf = ", eLbf)

            Xwtf = np.zeros((2, 2))
            Ywtf = np.zeros((2, 2))
            Zwtf = np.zeros((2, 2))
            Xwweb = np.zeros((2, 2))
            Ywweb = np.zeros((2, 2))
            Zwweb = np.zeros((2, 2))
            Xwbf = np.zeros((2, 2))
            Ywbf = np.zeros((2, 2))
            Zwbf = np.zeros((2, 2))

            for k in range(2):
                for j in range(2):
                    # top flange
                    Xwtf[k, j] = eLtf[k * 2 + j, 0]
                    Ywtf[k, j] = eLtf[k * 2 + j, 1]
                    Zwtf[k, j] = eLtf[k * 2 + j, 2]
                    # web
                    Xwweb[k, j] = eLweb[k * 2 + j, 0]
                    Ywweb[k, j] = eLweb[k * 2 + j, 1]
                    Zwweb[k, j] = eLweb[k * 2 + j, 2]
                    # bottom flange
                    Xwbf[k, j] = eLbf[k * 2 + j, 0]
                    Ywbf[k, j] = eLbf[k * 2 + j, 1]
                    Zwbf[k, j] = eLbf[k * 2 + j, 2]
            # print("Xwtf =", Xwtf, "\nYwtf =", Ywtf, "\nZwtf =", Zwtf)

            tf = np.zeros((4, 3))
            tf[0][0] = Xwtf[0][1]
            tf[0][1] = Ywtf[0][1]
            tf[0][2] = Zwtf[0][1]

            tf[1][0] = Xwtf[0][0]
            tf[1][1] = Ywtf[0][0]
            tf[1][2] = Zwtf[0][0]

            tf[2][0] = Xwtf[1][0]
            tf[2][1] = Ywtf[1][0]
            tf[2][2] = Zwtf[1][0]

            tf[3][0] = Xwtf[1][1]
            tf[3][1] = Ywtf[1][1]
            tf[3][2] = Zwtf[1][1]

            web = np.zeros((4, 3))
            web[0][0] = Xwweb[0][1]
            web[0][1] = Ywweb[0][1]
            web[0][2] = Zwweb[0][1]

            web[1][0] = Xwweb[0][0]
            web[1][1] = Ywweb[0][0]
            web[1][2] = Zwweb[0][0]

            web[2][0] = Xwweb[1][0]
            web[2][1] = Ywweb[1][0]
            web[2][2] = Zwweb[1][0]

            web[3][0] = Xwweb[1][1]
            web[3][1] = Ywweb[1][1]
            web[3][2] = Zwweb[1][1]

            bf = np.zeros((4, 3))
            bf[0][0] = Xwbf[0][1]
            bf[0][1] = Ywbf[0][1]
            bf[0][2] = Zwbf[0][1]

            bf[1][0] = Xwbf[0][0]
            bf[1][1] = Ywbf[0][0]
            bf[1][2] = Zwbf[0][0]

            bf[2][0] = Xwbf[1][0]
            bf[2][1] = Ywbf[1][0]
            bf[2][2] = Zwbf[1][0]

            bf[3][0] = Xwbf[1][1]
            bf[3][1] = Ywbf[1][1]
            bf[3][2] = Zwbf[1][1]
            # print("tf = ", tf, "\nweb = ", web, "\nbf = ", bf)
            # print('test 2 ')
            #
            # edges = ((0, 1),
            #          (1, 2),
            #          (2, 3),
            #          (3, 0))

            # text identifier :
            forTop = [np.mean((np.amax(tf[:, 0]), np.amin(tf[:, 0]))), np.mean((np.amax(tf[:, 1]), np.amin(tf[:, 1]))),
                      np.mean((np.amax(tf[:, 2]), np.amin(tf[:, 2])))]

            forBottom = [np.mean((np.amax(bf[:, 0]), np.amin(bf[:, 0]))),
                         np.mean((np.amax(bf[:, 1]), np.amin(bf[:, 1]))),
                         np.mean((np.amax(bf[:, 2]), np.amin(bf[:, 2])))]
            if glWidget.render_checked:
                edges = ((0, 1),
                         (1, 2),
                         (2, 3),
                         (3, 0))

                # print("tf = ", tf, "\nweb = ", web, "\nbf = ", bf)
                glColor4f(0, 1, 0, 1)
                glWidget.renderText(self, forBottom[0], forBottom[1], forBottom[2], "Flange 1", font=glWidget.font2)
                glWidget.renderText(self, forTop[0], forTop[1], forTop[2], "Flange 2", font=glWidget.font2)
                glWidget.SurfaceContour(self, tf, edges)
                glWidget.SurfaceContour(self, web, edges)
                glWidget.SurfaceContour(self, bf, edges)
                # self.drawAsterisk()
                glWidget.Surfaces(self, tf)
                glWidget.Surfaces(self, web)
                glWidget.Surfaces(self, bf)

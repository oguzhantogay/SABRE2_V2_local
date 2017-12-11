from OpenGL.GLU import *
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
from PyQt4.QtGui import *
from OpenGL.GL import *
from DropDownActions import ActionClass
import numpy as np


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
        self.white_checked = True

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

        self.joint_size = 0.015
        self.initial_zoom = 2
        self.font = QFont()
        self.font.setPointSize(11)
        self.lastPos = QtCore.QPoint()
        self.parameters = []
        self.joint_nodes_length, self.joint_nodes = self.JointTableValues()
        self.member_count, self.member_values, self.JNodeValues_i, self.JNodeValues_j, self.BNodevalue = None, None, None, None, None
        self.joint_i = 1
        self.joint_j = 2

        self.line_checked = False
        self.selected_checked = False
        self.render_checked = False
        # print("values = ", self.member_count, self.member_values)

    # def Cube(self):
    #
    #     glBegin(GL_LINES)
    #     for edge in self.edges:
    #         for vertex in edge:
    #             glColor3fv((1.0, 0.0, 0.0))
    #             glVertex3fv(self.vertices[vertex])
    #     glEnd()

    # def Surfaces(self):
    #     glBegin(GL_QUADS)
    #     for surface in self.surfaces:
    #         x = 0
    #         for vertex in surface:
    #             x += 1
    #             glColor4f(0, 0, 0, 0.3)
    #             glVertex3fv(self.vertices[vertex])
    #     glEnd()

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
            glColor3f(1.0, 1.0, 1.0)
            gluSphere(Q, self.joint_size, 32, 32)

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
                    -100, 100.0)
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
                        -100, 100.0)

                # print("ortho 1,", -self.initial_zoom, self.initial_zoom,
                #       -self.initial_zoom / aspect_ratio, self.initial_zoom / aspect_ratio)

            elif max_y > self.initial_zoom / aspect_ratio:

                self.parameters = [-self.initial_zoom * aspect_ratio,
                                   self.initial_zoom * aspect_ratio,
                                   -self.initial_zoom, self.initial_zoom]

                glOrtho(-self.initial_zoom * aspect_ratio,
                        self.initial_zoom * aspect_ratio,
                        -self.initial_zoom, self.initial_zoom, -100,
                        100.0)

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
                print("xpos = ", self.xPos, "ypos = ", self.yPos)
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
                    if self.white_checked:
                        glColor3f(0, 0, 0)
                    else:
                        glColor3f(1, 1, 1)

                    joint_text = "J" + str(int(self.joint_nodes[i][0]))
                    self.renderText(self.joint_nodes[i][1] - self.joint_size,
                                    self.joint_nodes[i][2] + self.joint_size, 0, joint_text, font=self.font)

        if self.member_count is None:
            pass
        else:
            for i in range(self.member_count):
                self.memberOnly(i)
                if self.ui.actionJoint_Member_Labels.isChecked():
                    if self.ui.Members_table.item(i, 1) is not None and self.ui.Members_table.item(i,
                                                                                                   2) is not None:
                        if self.white_checked:
                            glColor3f(0, 0, 0)
                        else:
                            glColor3f(1, 1, 1)

                        text_x = self.joint_nodes[self.joint_i][1] + (self.joint_nodes[self.joint_j][1] -
                                                                      self.joint_nodes[self.joint_i][1]) / 2
                        text_y = self.joint_nodes[self.joint_i][2] + (self.joint_nodes[self.joint_j][2] -
                                                                      self.joint_nodes[self.joint_i][2]) / 2
                        joint_text = "M" + str(int(self.member_values[i][0]))
                        self.renderText(text_x, text_y, 0, joint_text, font=self.font)

                        # glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
                        # self.Surfaces()

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
                self.joint_size = 3 * 0.35
            else:

                self.joint_size = 2 * 0.35
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
        row = self.ui.Members_table.currentRow()
        none_checker = self.noneDetector(self.ui.Joints_Table)
        self.render_checked = self.ui.actionRender_All_Members.isChecked()
        self.joint_nodes_length, self.joint_nodes = self.JointTableValues()

        try:
            if self.ui.Members_table.item(row, 1) is None:
                pass
            else:
                self.member_count, self.member_values, self.JNodeValues_i, self.JNodeValues_j, self.BNodevalue = self.memberTableValues()
                if self.render_checked:
                    self.renderAllProp(self.JNodeValues_i, self.JNodeValues_j, self.BNodevalue)
        except AttributeError:
            pass

        self.white_checked = self.ui.actionWhite_Background.isChecked()
        self.diam = max(max(self.joint_nodes[:, 1]) - min(self.joint_nodes[:, 1]),
                        (max(self.joint_nodes[:, 2]) - min(self.joint_nodes[:, 2])))
        self.diam_x = max(self.joint_nodes[:, 1]) - min(self.joint_nodes[:, 1])
        self.diam_y = max(self.joint_nodes[:, 2]) - min(self.joint_nodes[:, 2])

        if self.joint_nodes_length == 1 or self.diam == 0:
            self.joint_size = 0.015
            self.xPos = 0
            self.yPos = 0
        elif none_checker:
            pass
        elif max(abs(self.joint_nodes[:, 2])) != 0:
            self.joint_size = self.diam / 150 * 1.8
            self.xPos = -min((self.joint_nodes[:, 1])) - self.diam_x / 2
            self.yPos = -min(self.joint_nodes[:, 2]) - self.diam_y / 2
        else:
            self.joint_size = self.diam / 150
            self.xPos = -min(abs(self.joint_nodes[:, 1])) - self.diam_x / 2
            self.yPos = -min(self.joint_nodes[:, 2]) - self.diam_y / 2

        # print("joint size = ", self.joint_size, "xpos = ", self.xPos, "ypos = ", self.yPos)

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

        if self.white_checked:
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

        member_values, JNodeValues_i, JNodeValues_j, _, BNodevalue, flag_mem_values = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(
            self, self.ui.Members_table, 3)
        member_count = member_values.shape[0]

        return member_count, member_values, JNodeValues_i, JNodeValues_j, BNodevalue

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
        if self.ui.Members_table.item(x, 1) is None:
            pass
        elif self.ui.Members_table.item(x, 2) is None:
            pass
        else:
            glPushAttrib(GL_ENABLE_BIT)
            # glPushAttrib is done to return everything to normal after drawing

            glLineStipple(1, 0x00FF)  # [1]
            glEnable(GL_LINE_STIPPLE)
            glBegin(GL_LINES)

            self.joint_i = int(self.member_values[x][1] - 1)
            self.joint_j = int(self.member_values[x][2] - 1)

            # print("test = ", self.member_values[x][1],self.member_values[x][2], 0)
            glColor3ub(100, 149, 237)

            glVertex3f(self.joint_nodes[self.joint_i][1], self.joint_nodes[self.joint_i][2], 0)
            glVertex3f(self.joint_nodes[self.joint_j][1], self.joint_nodes[self.joint_j][2], 0)
            glEnd()

            glPopAttrib()

    def renderAllProp(self, JNodevalue_i, JNodevalue_j, BNodevalue):
        ''' This function works on the rendering all properties of the model'''
        # self.member_count, self.member_values, self.JNodeValues_i, self.JNodeValues_j
        # print("node values", self.JNodeValues_i, self.JNodeValues_j)
        # print("test", JNodevalue_i)
        SASSEM = np.zeros((self.member_count, 2, 13))
        max_b = 0

        for i in range(int(self.member_count)):
            max_c = np.amax(BNodevalue[i,:,1])
            if max_b < max_c:
                max_b = max_c

        max_for_NJ_i = max_b + self.member_count
        max_for_NJ_j = max_b + self.member_count + 1
        NJ_i = np.zeros((max_for_NJ_i, 13))
        NJ_j = np.zeros((max_for_NJ_i, 13))

        # print("Sassem 1 = ", SASSEM)
        for k in range(13):
            for i in range(int(self.member_count)):
                # print(int(self.member_count))
                # print("test1.2",JNodevalue_i[i,k])
                if np.amax(BNodevalue[i,:,1]):
                    pass
                else:
                    SASSEM[i][0][k] = JNodevalue_i[i][k]

                    if np.amax(BNodevalue[i, :, 1]) == 0:
                        pass
                    else:
                        for j in range(np.amax(BNodevalue[i, :, 1])):
                            SASSEM[i][j + 1][k] = BNodevalue[i, j, k]

                SASSEM[i][int(np.amax(BNodevalue[i, :, 1]))+1][k] = JNodevalue_j[i][k]

        print("sassem values = ", SASSEM)
        # print("sassem values = ", SASSEM[:,:,0])
        # print("sassem values = ", SASSEM[:,:,1])
        # print("sassem values = ", SASSEM[:,:,2])
        # print("sassem values = ", SASSEM[:,:,3])
        # print("sassem values = ", SASSEM[:,:,4])
        # print("sassem values = ", SASSEM[:,:,5])
        # print("sassem values = ", SASSEM[:,:,6])
        # print("sassem values = ", SASSEM[:,:,7])
        # print("sassem values = ", SASSEM[:,:,8])
        # print("sassem values = ", SASSEM[:,:,9])
        # print("sassem values = ", SASSEM[:,:,10])
        # print("sassem values = ", SASSEM[:,:,11])
        # print("sassem values = ", SASSEM[:,:,12])
        # print("test2")

        q = 1


        for i in range(self.member_count):
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
            for j in range(int(np.amax(BNodevalue[i, :, 1]))):
                NJ_i[q - 1 + j][0] = q + j +1
                NJ_i[q - 1 + j][1] = q + j +1
                NJ_i[q - 1 + j][2] = SASSEM[i, j + 0, 2]
                NJ_i[q - 1 + j][3] = SASSEM[i, j + 0, 3]
                NJ_i[q - 1 + j][4] = SASSEM[i, j + 0, 4]
                NJ_i[q - 1 + j][5] = SASSEM[i, j + 0, 5]
                NJ_i[q - 1 + j][6] = SASSEM[i, j + 0, 6]
                NJ_i[q - 1 + j][7] = SASSEM[i, j + 0, 7]
                NJ_i[q - 1 + j][8] = SASSEM[i, j + 0, 8]
                NJ_i[q - 1 + j][9] = SASSEM[i, j + 0, 9]
                NJ_i[q - 1 + j][10] = SASSEM[i, j + 0, 10]
                NJ_i[q - 1 + j][11] = SASSEM[i, j + 0, 11]
                NJ_i[q - 1 + j][12] = SASSEM[i, j + 0, 12]
            q = int(np.amax(BNodevalue[i, :, 1]) + q + 1)

        q = 1

        for i in range(self.member_count):

            for j in range(int(np.amax(BNodevalue[i,:,1]))):
                NJ_j[q + j-2][0] = q + j-1
                NJ_j[q + j-2][1] = q + j
                NJ_j[q + j-2][2] = SASSEM[i, j+0, 2]
                NJ_j[q + j-2][3] = SASSEM[i, j+0, 3]
                NJ_j[q + j-2][4] = SASSEM[i, j+0, 4]
                NJ_j[q + j-2][5] = SASSEM[i, j+0, 5]
                NJ_j[q + j-2][6] = SASSEM[i, j+0, 6]
                NJ_j[q + j-2][7] = SASSEM[i, j+0, 7]
                NJ_j[q + j-2][8] = SASSEM[i, j+0, 8]
                NJ_j[q + j-2][9] = SASSEM[i, j+0, 9]
                NJ_j[q + j-2][10] = SASSEM[i, j+0, 10]
                NJ_j[q + j-2][11] = SASSEM[i, j+0, 11]
                NJ_j[q + j-2][12] = SASSEM[i, j+0, 12]

            # print("q before = ", q)
            q = int(np.amax(BNodevalue[i, :, 1])) + q+1
            sec_dim = int(np.amax(BNodevalue[i,:,1]))
            NJ_j[q-2][0] = q-1
            NJ_j[q-2][1] = q
            NJ_j[q-2][2] = SASSEM[i,sec_dim,2]
            NJ_j[q-2][3] = SASSEM[i,sec_dim,3]
            NJ_j[q-2][4] = SASSEM[i,sec_dim,4]
            NJ_j[q-2][5] = SASSEM[i,sec_dim,5]
            NJ_j[q-2][6] = SASSEM[i,sec_dim,6]
            NJ_j[q-2][7] = SASSEM[i,sec_dim,7]
            NJ_j[q-2][8] = SASSEM[i,sec_dim,8]
            NJ_j[q-2][9] = SASSEM[i,sec_dim,9]
            NJ_j[q-2][10] = SASSEM[i,sec_dim,10]
            NJ_j[q-2][11] = SASSEM[i,sec_dim,11]
            NJ_j[q-2][12] = SASSEM[i,sec_dim,12]
        #     print("q after = ", q)
        #
        #
        # print("NJ_i = ", NJ_i, "NJ_j", NJ_j)

        sn = np.amax(NJ_i[:, 0]) # Total Segment Number

        #Model Generation

        MI = np.zeros((self.member_count, 3))

        MI[:,0] = NJ_i[:,0]
        MI[:,1] = NJ_i[:,1]
        MI[:,2] = NJ_j[:,1]

        # print(" MI = ", MI)

        xg1, xg2 = np.zeros((self.member_count, 0)) , np.zeros((self.member_count, 0)) #element length: xg1(start) xg2(end)
        yg1, yg2 = np.zeros((self.member_count, 0)) , np.zeros((self.member_count, 0)) #element length: xg1(start) xg2(end)
        zg1, zg2 = np.zeros((self.member_count, 0)) , np.zeros((self.member_count, 0)) #element length: xg1(start) xg2(end)

        xg1[:, 0] = NJ_i[:, 2]
        yg1[:, 0] = NJ_i[:, 3]
        zg1[:, 0] = NJ_i[:, 4]

        xg2[:, 0] = NJ_j[:, 2]
        yg2[:, 0] = NJ_j[:, 3]
        zg2[:, 0] = NJ_j[:, 4]

        bfb1,bfb2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # Bottom flange width
        tfb1,tfb2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # Bottom flange thickness
        bft1,bft2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # Top flange width
        tft1,tft2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # Top flange thickness
        Dg1 , Dg2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # dw:Web depth (y-dir)
        hg1 , hg2= np.zeros((self.member_count, 0)) ,np.zeros((self.member_count, 0))  # h : Distance between flange centroids

        bfb1[:, 0] = NJ_i[:, 5]
        tfb1[:, 0] = NJ_i[:, 6]
        bft1[:, 0] = NJ_i[:, 7]
        tft1[:, 0] = NJ_i[:, 8]
        Dg1 [:, 0] = NJ_i[:, 9]
        hg1 [:, 0] = NJ_i[:, 12]

        bfb2[:, 0] = NJ_j[:, 5]
        tfb2[:, 0] = NJ_j[:, 6]
        bft2[:, 0] = NJ_j[:, 7]
        tft2[:, 0] = NJ_j[:, 8]
        Dg2[:, 0] = NJ_j[:, 9]
        hg2[:, 0] = NJ_j[:, 12]
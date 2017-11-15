from OpenGL.GLU import *
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
from PyQt4.QtGui import *
from OpenGL.GL import *
from DropDownActions import ActionClass


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
        self.member_count, self.member_values = self.memberTableValues()
        self.joint_i = 1
        self.joint_j = 2
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
                    max(self.joint_nodes[0][1], self.joint_nodes[0][2]) - max(self.joint_nodes[int(size_joint - 1)][1],
                                                                              self.joint_nodes[int(size_joint - 1)][
                                                                                  2]) - 100)
                self.joint_size = 3 * 0.35
            else:

                self.joint_size = 2 * 0.35
                self.zPos += (
                    max(self.joint_nodes[0][1], self.joint_nodes[0][2]) - max(self.joint_nodes[int(size_joint - 1)][1],
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
        row = self.ui.Joints_Table.currentRow()
        none_checker = self.noneDetector(self.ui.Joints_Table)
        self.joint_nodes_length, self.joint_nodes = self.JointTableValues()
        self.member_count, self.member_values = self.memberTableValues()
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

        member_values = SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(self, self.ui.Members_table, 3)

        member_count = \
            (SABRE2_main_subclass.SABRE2_main_subclass.update_members_table(self, self.ui.Members_table, 3)).shape[0]

        return member_count, member_values

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

            self.joint_i = int(self.member_values[x][1] - 1.0)
            self.joint_j = int(self.member_values[x][2] - 1.0)

            # print("test = ", self.member_values[x][1],self.member_values[x][2], 0)
            glColor3ub(100, 149, 237)

            glVertex3f(self.joint_nodes[self.joint_i][1], self.joint_nodes[self.joint_i][2], 0)
            glVertex3f(self.joint_nodes[self.joint_j][1], self.joint_nodes[self.joint_j][2], 0)
            glEnd()

            glPopAttrib()

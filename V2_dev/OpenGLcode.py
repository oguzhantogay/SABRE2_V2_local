from OpenGL.GL import *
from OpenGL.GLU import *
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
import numpy as np
from PyQt4 import QtGui
import SABRE2_GUI
from DropDownActions import *
import math


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

        self.xRot = 0
        self.yRot = 0
        self.zRot = 0

        self.xPos = 0
        self.yPos = 0
        self.zPos = -40

        self.lastPos = QtCore.QPoint()

        self.trollTechGreen = QColor.fromCmykF(0.40, 0.0, 1.0, 0.0)
        self.trollTechPurple = QColor.fromCmykF(0.39, 0.39, 0.0, 0.0)

        self.joint_nodes = np.array((0,0,-1))

        self.vertices = (
            (10, -10, -10),
            (10, 10, -10),
            (-10, 10, -10),
            (-10, -10, -10),
            (10, -10, 10),
            (10, 10, 10),
            (-10, -10, 10),
            (-10, 10, 10)
        )

        self.edges = (
            (0, 1),
            (0, 3),
            (0, 4),
            (2, 1),
            (2, 3),
            (2, 7),
            (6, 3),
            (6, 4),
            (6, 7),
            (5, 1),
            (5, 4),
            (5, 7))

        self.colors = (
            (1,0,0),
            (0,1,0),
            (0,0,1),
            (0,1,0),
            (1,1,1),
            (0,1,1),
            (1,0,0),
            (0,1,0),
            (0,0,1),
            (1,0,0),
            (1,1,1),
            (0,1,1))

        self.surfaces = (
            (0,1,2,3),
            (3,2,7,6),
            (6,7,5,4),
            (4,5,1,0),
            (1,5,7,2),
            (4,0,3,6))

    def Cube(self):
        glBegin(GL_LINES)
        for edge in self.edges:
            for vertex in edge:
                glColor3fv((1.0, 0.0, 0.0))
                glVertex3fv(self.vertices[vertex])
        glEnd()



    def Surfaces(self):
        glBegin(GL_QUADS)
        for surface in self.surfaces:
            x = 0
            for vertex in surface:
                x += 1
                glColor4f(0,0,0,0.3)
                glVertex3fv(self.vertices[vertex])
        glEnd()



    def Joints(self, x):
        glPushMatrix()
        Q = gluNewQuadric()
        gluQuadricNormals(Q, GL_SMOOTH)
        gluQuadricTexture(Q, GL_TRUE)
        glTranslatef(self.vertices[x][0], self.vertices[x][1], self.vertices[x][2])
        glColor3f(0,0,1.0)
        gluSphere(Q, 0.35, 8, 8)
        glColor3f(1,1,1)
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
        self.qglClearColor(self.trollTechPurple.dark())


        # self.object = self.makeObject()
        glShadeModel(GL_FLAT)
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_CULL_FACE)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
        glEnable(GL_BLEND)


    def resizeGL(self, width, height):
        # glViewport is needed for proper resizing of QGLWidget
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        # glOrtho(-0.5, +0.5, +0.5, -0.5, 4.0, 15.0)
        gluPerspective(45, width/height , 0.1, 10000.0)
        # gluPerspective(self.zPos,width/height, 1.0, 1000.0)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

    def mousePressEvent(self, event):
        if self.ui.actionRotate.isChecked() or self.ui.actionPan.isChecked():
            self.lastPos = event.pos()
        else:
            x, y = event.x(), event.y()
            w, h = self.width(), self.height()
            # required to call this to force PyQt to read from the correct, updated buffer
            glReadBuffer(GL_FRONT)
            data = self.grabFrameBuffer()  # builtin function that calls glReadPixels internally
            rgba = QColor(data.pixel(x, y)).getRgb()  # gets the appropriate pixel data as an RGBA tuple
            message = "You selected pixel ({0}, {1}) with an RGBA value of {2}.".format(x, y, rgba)
            DropDownActions.statusMessage(self, message)

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
        self.Cube()
        for i in range(len(self.vertices)):
            self.Joints(i)

        # glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        self.qglColor(self.trollTechGreen)
        self.Surfaces()


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
        self.zPos = -40
        self.updateGL()
        pass

    def setZoomIn(self):
        self.zPos += 1
        self.updateGL()
        print(self.zPos)
        pass

    def setZoomOut(self):
        self.zPos += -1
        print(self.zPos)
        self.updateGL()
        pass
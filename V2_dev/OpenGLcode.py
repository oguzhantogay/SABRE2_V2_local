from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
from PyQt4.QtGui import QColor, QStatusBar, QSizePolicy
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
from DropDownActions import *


class glWidget(QGLWidget, QMainWindow):
    resized = QtCore.pyqtSignal()

    xRotationChanged = QtCore.pyqtSignal(int)
    yRotationChanged = QtCore.pyqtSignal(int)
    zRotationChanged = QtCore.pyqtSignal(int)

    def __init__(self, ui_layout):
        super(glWidget,self).__init__()
        self.ui = ui_layout
        self.setMinimumSize(640, 480)
        self.setMouseTracking(False)
        # glWidget.resizeGL(self, self.width(), self.height())
        self.object = 0
        self.xRot = 0
        self.yRot = 0
        self.zRot = 0

        self.lastPos = QtCore.QPoint()

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
        glClearDepth(1.0)
        self.object = self.makeObject()
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_CULL_FACE)

    def resizeGL(self, width, height):
        # glViewport is needed for proper resizing of QGLWidget
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glOrtho(0, 100, 0, 100, -1, 1)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

    def mousePressEvent(self, event):
        x, y = event.x(), event.y()
        w, h = self.width(), self.height()
        self.lastPos = event.pos()
        # required to call this to force PyQt to read from the correct, updated buffer
        # see issue noted by @BjkOcean in comments!!!
        glReadBuffer(GL_FRONT)
        data = self.grabFrameBuffer()  # builtin function that calls glReadPixels internally
        data.save("test.png")
        rgba = QColor(data.pixel(x, y)).getRgb()  # gets the appropriate pixel data as an RGBA tuple
        message = "You selected pixel ({0}, {1}) with an RGBA value of {2}.".format(x, y, rgba)
        DropDownActions.statusMessage(self.ui, message)

    def mouseMoveEvent(self, event):
        dx = event.x() - self.lastPos.x()
        dy = event.y() - self.lastPos.y()

        if event.buttons() & QtCore.Qt.LeftButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setYRotation(self.yRot + 8 * dx)
        elif event.buttons() & QtCore.Qt.RightButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setZRotation(self.zRot + 8 * dx)

        self.lastPos = event.pos()

        pass

    def mouseReleaseEvent(self, event):
        pass

    def paintGL(self):
        # Renders a triangle... obvious (and deprecated!) stuff
        w, h = self.width(), self.height()
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glBegin(GL_TRIANGLES)
        glColor3f(1, 0, 0)
        glVertex3f(0, 0, 0)
        glColor3f(0, 1, 0)
        glVertex3f(50, 100, 0)
        glColor3f(0, 0, 1)
        glVertex3f(100, 0, 0)
        glEnd()
        glRotated(self.xRot / 16.0, 1.0, 0.0, 0.0)
        glRotated(self.yRot / 16.0, 0.0, 1.0, 0.0)
        glRotated(self.zRot / 16.0, 0.0, 0.0, 1.)

    def normalizeAngle(self, angle):
        while angle < 0:
            angle += 360 * 16
        while angle > 360 * 16:
            angle -= 360 * 16
        return angle

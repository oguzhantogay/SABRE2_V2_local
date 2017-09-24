from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
from PyQt4.QtGui import QColor, QStatusBar, QSizePolicy
from PyQt4.QtOpenGL import *
from PyQt4 import QtCore
from DropDownActions import *


class glWidget(QGLWidget, QMainWindow):
    resized = QtCore.pyqtSignal()

    def __init__(self, ui_layout):
        super(glWidget,self).__init__()
        self.ui = ui_layout
        self.setMinimumSize(640, 480)
        self.setMouseTracking(False)
        # glWidget.resizeGL(self, self.width(), self.height())

    def initializeGL(self):
        self.width, self.height = width, height
        glViewport(0, 0, width, height)
        glClearColor(0, 0, 0, 1)
        glClearDepth(1.0)
        glEnable(GL_DEPTH_TEST)

    def resizeGL(self, width, height):
        # glViewport is needed for proper resizing of QGLWidget
        self.width, self.height = width, height
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glOrtho(0, width, 0, height, -1, 1)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

    def mousePressEvent(self, event):
        x, y = event.x(), event.y()
        w, h = self.width, self.height
        data = self.grabFrameBuffer()  # builtin function that calls glReadPixels internally
        rgba = QColor(data.pixel(x, y)).getRgb()  # gets the appropriate pixel data as an RGBA tuple
        message = "You selected pixel ({0}, {1}) with an RGBA value of {2}.".format(x, y, rgba)
        DropDownActions.statusMessage(self.ui, message)

    def mouseMoveEvent(self, event):
        pass

    def mouseReleaseEvent(self, event):
        pass

    def paintGL(self):
        # Renders a triangle... obvious (and deprecated!) stuff
        w, h = self.width, self.height
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glBegin(GL_TRIANGLES)
        glColor3f(1, 0, 0)
        glVertex3f(0, 0, 0)
        glColor3f(0, 1, 0)
        glVertex3f(w / 2.0, h, 0)
        glColor3f(0, 0, 1)
        glVertex3f(w, 0, 0)
        glEnd()

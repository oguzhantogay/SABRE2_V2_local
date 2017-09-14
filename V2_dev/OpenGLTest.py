import glfw
from glfw import *
from OpenGL.GL import *
from OpenGL.GLU import *
from PyQt4 import QtGui
from PyQt4.QtOpenGL import *


class glWidget(QGLWidget):

    def __init__(self, parent):
        QGLWidget.__init__(self, parent)
        self.setMinimumSize(640, 480)

        if not glfw.init():
            pass

        window = glfw.create_window(640, 480, "Hello World", None, None)

        if not window:
            glfw.terminate()
            pass

        glfw.make_context_current(window)

        glfw.set_input_mode(window, glfw.STICKY_KEYS, GL_TRUE)

        while glfw.get_key(window,glfw.KEY_ESCAPE) is not glfw.PRESS and glfw.window_should_close(window) is 0:
            glfw.swap_buffers(window)
            glfw.poll_events()


    # vertices = (
    #     (1, -1, -1),
    #     (1, 1, -1),
    #     (-1, 1, -1),
    #     (-1, -1, -1),
    #     (1, -1, 1),
    #     (1, 1, 1),
    #     (-1, -1, 1),
    #     (-1, 1, 1),
    # )
    #
    # edges = (
    #     (0, 1),
    #     (0, 3),
    #     (0, 4),
    #     (2, 1),
    #     (2, 3),
    #     (2, 7),
    #     (6, 3),
    #     (6, 4),
    #     (6, 7),
    #     (5, 1),
    #     (5, 4),
    #     (5, 7),
    # )

    # def Cube(self):
    #     glBegin(GL_LINES)
    #
    #     for edge in edges:
    #
    #         for vertex in edge:
    #             glVertex3fv(vertices[vertex])
    #
    #     glEnd()
    #
    # def main(self):
    #     pygame.init()
    #     display = (800, 600)
    #
    #     pygame.display.set_mode(display, DOUBLEBUF | OPENGL)
    #
    #     gluPerspective(45, (display[0] / display[1]), 0.1, 50.0)
    #
    #     glTranslatef(0, 0, -5)
    #
    #     glRotatef(20, 0, 0, 0)
    #
    #     while True:
    #
    #         for event in pygame.event.get():
    #             if event.type == pygame.QUIT:
    #                 pygame.quit()
    #
    #         glRotatef(1, 3, 1, 1)
    #         glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    #
    #         self.Cube()
    #
    #         pygame.display.flip()
    #
    #         pygame.time.wait(10)
    #
    # main(self)
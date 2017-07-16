# encoding: utf-8
# module PyQt4.QtTest
# from /usr/lib/python2.7/dist-packages/PyQt4/QtTest.so by generator 1.96
# no doc
# no imports

# no functions
# classes


class QTest():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def KeyAction(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def keyClick(self, QWidget, *__args):
        """
        QTest.keyClick(QWidget, Qt.Key, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        QTest.keyClick(QWidget, str, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        """
        pass

    # real signature unknown; restored from __doc__
    def keyClicks(self, QWidget, QString, Qt_KeyboardModifiers_modifier=None, int_delay=-1):
        """ QTest.keyClicks(QWidget, QString, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def keyEvent(self, QTest_KeyAction, QWidget, *__args):
        """
        QTest.keyEvent(QTest.KeyAction, QWidget, Qt.Key, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        QTest.keyEvent(QTest.KeyAction, QWidget, str, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def keyPress(self, QWidget, *__args):
        """
        QTest.keyPress(QWidget, Qt.Key, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        QTest.keyPress(QWidget, str, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def keyRelease(self, QWidget, *__args):
        """
        QTest.keyRelease(QWidget, Qt.Key, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        QTest.keyRelease(QWidget, str, Qt.KeyboardModifiers modifier=Qt.NoModifier, int delay=-1)
        """
        pass

    def MouseAction(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def mouseClick(self, QWidget, Qt_MouseButton, Qt_KeyboardModifiers_modifier=0, QPoint_pos=None, *args, **kwargs):
        """ QTest.mouseClick(QWidget, Qt.MouseButton, Qt.KeyboardModifiers modifier=0, QPoint pos=QPoint(), int delay=-1) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def mouseDClick(self, QWidget, Qt_MouseButton, Qt_KeyboardModifiers_modifier=0, QPoint_pos=None, *args, **kwargs):
        """ QTest.mouseDClick(QWidget, Qt.MouseButton, Qt.KeyboardModifiers modifier=0, QPoint pos=QPoint(), int delay=-1) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def mouseMove(self, QWidget, QPoint_pos=None, *args, **kwargs):
        """ QTest.mouseMove(QWidget, QPoint pos=QPoint(), int delay=-1) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def mousePress(self, QWidget, Qt_MouseButton, Qt_KeyboardModifiers_modifier=0, QPoint_pos=None, *args, **kwargs):
        """ QTest.mousePress(QWidget, Qt.MouseButton, Qt.KeyboardModifiers modifier=0, QPoint pos=QPoint(), int delay=-1) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def mouseRelease(self, QWidget, Qt_MouseButton, Qt_KeyboardModifiers_modifier=0, QPoint_pos=None, *args, **kwargs):
        """ QTest.mouseRelease(QWidget, Qt.MouseButton, Qt.KeyboardModifiers modifier=0, QPoint pos=QPoint(), int delay=-1) """
        pass

    def qSleep(self, p_int):  # real signature unknown; restored from __doc__
        """ QTest.qSleep(int) """
        pass

    def qWait(self, p_int):  # real signature unknown; restored from __doc__
        """ QTest.qWait(int) """
        pass

    # real signature unknown; restored from __doc__
    def qWaitForWindowShown(self, QWidget):
        """ QTest.qWaitForWindowShown(QWidget) -> bool """
        return False

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Click = 2
    MouseClick = 2
    MouseDClick = 3
    MouseMove = 4
    MousePress = 0
    MouseRelease = 1
    Press = 0
    Release = 1

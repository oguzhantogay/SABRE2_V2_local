# encoding: utf-8
# module PyQt4.QtSvg
# from /usr/lib/python2.7/dist-packages/PyQt4/QtSvg.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# no functions
# classes

class QGraphicsSvgItem(__PyQt4_QtGui.QGraphicsObject):

    """
    QGraphicsSvgItem(QGraphicsItem parent=None)
    QGraphicsSvgItem(QString, QGraphicsItem parent=None)
    """

    def boundingRect(self):  # real signature unknown; restored from __doc__
        """ QGraphicsSvgItem.boundingRect() -> QRectF """
        pass

    def elementId(self):  # real signature unknown; restored from __doc__
        """ QGraphicsSvgItem.elementId() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def isCachingEnabled(self):
        """ QGraphicsSvgItem.isCachingEnabled() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def maximumCacheSize(self):
        """ QGraphicsSvgItem.maximumCacheSize() -> QSize """
        pass

    # real signature unknown; restored from __doc__
    def paint(self, QPainter, QStyleOptionGraphicsItem, QWidget_widget=None):
        """ QGraphicsSvgItem.paint(QPainter, QStyleOptionGraphicsItem, QWidget widget=None) """
        pass

    def renderer(self):  # real signature unknown; restored from __doc__
        """ QGraphicsSvgItem.renderer() -> QSvgRenderer """
        return QSvgRenderer

    # real signature unknown; restored from __doc__
    def setCachingEnabled(self, bool):
        """ QGraphicsSvgItem.setCachingEnabled(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setElementId(self, QString):
        """ QGraphicsSvgItem.setElementId(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setMaximumCacheSize(self, QSize):
        """ QGraphicsSvgItem.setMaximumCacheSize(QSize) """
        pass

    # real signature unknown; restored from __doc__
    def setSharedRenderer(self, QSvgRenderer):
        """ QGraphicsSvgItem.setSharedRenderer(QSvgRenderer) """
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QGraphicsSvgItem.type() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QSvgGenerator(__PyQt4_QtGui.QPaintDevice):

    """ QSvgGenerator() """

    def description(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.description() -> QString """
        pass

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.fileName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def metric(self, QPaintDevice_PaintDeviceMetric):
        """ QSvgGenerator.metric(QPaintDevice.PaintDeviceMetric) -> int """
        return 0

    def outputDevice(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.outputDevice() -> QIODevice """
        pass

    def paintEngine(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.paintEngine() -> QPaintEngine """
        pass

    def resolution(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.resolution() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setDescription(self, QString):
        """ QSvgGenerator.setDescription(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QSvgGenerator.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOutputDevice(self, QIODevice):
        """ QSvgGenerator.setOutputDevice(QIODevice) """
        pass

    # real signature unknown; restored from __doc__
    def setResolution(self, p_int):
        """ QSvgGenerator.setResolution(int) """
        pass

    def setSize(self, QSize):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.setSize(QSize) """
        pass

    # real signature unknown; restored from __doc__
    def setTitle(self, QString):
        """ QSvgGenerator.setTitle(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setViewBox(self, *__args):
        """
        QSvgGenerator.setViewBox(QRect)
        QSvgGenerator.setViewBox(QRectF)
        """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.size() -> QSize """
        pass

    def title(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.title() -> QString """
        pass

    def viewBox(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.viewBox() -> QRect """
        pass

    def viewBoxF(self):  # real signature unknown; restored from __doc__
        """ QSvgGenerator.viewBoxF() -> QRectF """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass


class QSvgRenderer(__PyQt4_QtCore.QObject):

    """
    QSvgRenderer(QObject parent=None)
    QSvgRenderer(QString, QObject parent=None)
    QSvgRenderer(QByteArray, QObject parent=None)
    QSvgRenderer(QXmlStreamReader, QObject parent=None)
    """

    def animated(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.animated() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def animationDuration(self):
        """ QSvgRenderer.animationDuration() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def boundsOnElement(self, QString):
        """ QSvgRenderer.boundsOnElement(QString) -> QRectF """
        pass

    def currentFrame(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.currentFrame() -> int """
        return 0

    def defaultSize(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.defaultSize() -> QSize """
        pass

    # real signature unknown; restored from __doc__
    def elementExists(self, QString):
        """ QSvgRenderer.elementExists(QString) -> bool """
        return False

    def framesPerSecond(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.framesPerSecond() -> int """
        return 0

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def load(self, *__args):
        """
        QSvgRenderer.load(QString) -> bool
        QSvgRenderer.load(QByteArray) -> bool
        QSvgRenderer.load(QXmlStreamReader) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def matrixForElement(self, QString):
        """ QSvgRenderer.matrixForElement(QString) -> QMatrix """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def render(self, QPainter, *__args):
        """
        QSvgRenderer.render(QPainter)
        QSvgRenderer.render(QPainter, QRectF)
        QSvgRenderer.render(QPainter, QString, QRectF bounds=QRectF())
        """
        pass

    def repaintNeeded(self, *args, **kwargs):  # real signature unknown
        """ QSvgRenderer.repaintNeeded[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setCurrentFrame(self, p_int):
        """ QSvgRenderer.setCurrentFrame(int) """
        pass

    # real signature unknown; restored from __doc__
    def setFramesPerSecond(self, p_int):
        """ QSvgRenderer.setFramesPerSecond(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setViewBox(self, *__args):
        """
        QSvgRenderer.setViewBox(QRect)
        QSvgRenderer.setViewBox(QRectF)
        """
        pass

    def viewBox(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.viewBox() -> QRect """
        pass

    def viewBoxF(self):  # real signature unknown; restored from __doc__
        """ QSvgRenderer.viewBoxF() -> QRectF """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QSvgWidget(__PyQt4_QtGui.QWidget):

    """
    QSvgWidget(QWidget parent=None)
    QSvgWidget(QString, QWidget parent=None)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def load(self, *__args):
        """
        QSvgWidget.load(QString)
        QSvgWidget.load(QByteArray)
        """
        pass

    # real signature unknown; restored from __doc__
    def paintEvent(self, QPaintEvent):
        """ QSvgWidget.paintEvent(QPaintEvent) """
        pass

    def renderer(self):  # real signature unknown; restored from __doc__
        """ QSvgWidget.renderer() -> QSvgRenderer """
        return QSvgRenderer

    def sizeHint(self):  # real signature unknown; restored from __doc__
        """ QSvgWidget.sizeHint() -> QSize """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

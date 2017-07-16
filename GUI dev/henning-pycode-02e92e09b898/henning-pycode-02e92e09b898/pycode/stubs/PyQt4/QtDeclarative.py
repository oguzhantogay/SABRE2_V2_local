# encoding: utf-8
# module PyQt4.QtDeclarative
# from /usr/lib/python2.7/dist-packages/PyQt4/QtDeclarative.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# functions

# real signature unknown; restored from __doc__
def QPyDeclarativeListProperty(QObject, list_of_QObject):
    """ QPyDeclarativeListProperty(QObject, list-of-QObject) """
    pass


# classes

class QDeclarativeComponent(__PyQt4_QtCore.QObject):

    """
    QDeclarativeComponent(QDeclarativeEngine, QObject parent=None)
    QDeclarativeComponent(QDeclarativeEngine, QString, QObject parent=None)
    QDeclarativeComponent(QDeclarativeEngine, QUrl, QObject parent=None)
    """
    # real signature unknown; restored from __doc__

    def beginCreate(self, QDeclarativeContext):
        """ QDeclarativeComponent.beginCreate(QDeclarativeContext) -> QObject """
        pass

    def completeCreate(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.completeCreate() """
        pass

    # real signature unknown; restored from __doc__
    def create(self, QDeclarativeContext_context=None):
        """ QDeclarativeComponent.create(QDeclarativeContext context=None) -> QObject """
        pass

    def creationContext(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.creationContext() -> QDeclarativeContext """
        return QDeclarativeContext

    def errors(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.errors() -> list-of-QDeclarativeError """
        pass

    def isError(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.isError() -> bool """
        return False

    def isLoading(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.isLoading() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.isNull() -> bool """
        return False

    def isReady(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.isReady() -> bool """
        return False

    def loadUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.loadUrl(QUrl) """
        pass

    def progress(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.progress() -> float """
        return 0.0

    def progressChanged(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeComponent.progressChanged[float] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setData(self, QByteArray, QUrl):
        """ QDeclarativeComponent.setData(QByteArray, QUrl) """
        pass

    def Status(self, *args, **kwargs):  # real signature unknown
        pass

    def status(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.status() -> QDeclarativeComponent.Status """
        pass

    def statusChanged(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeComponent.statusChanged[QDeclarativeComponent.Status] [signal] """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeComponent.url() -> QUrl """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeEngine, *__args):
        pass

    Error = 3
    Loading = 2
    Null = 0
    Ready = 1


class QDeclarativeContext(__PyQt4_QtCore.QObject):

    """
    QDeclarativeContext(QDeclarativeEngine, QObject parent=None)
    QDeclarativeContext(QDeclarativeContext, QObject parent=None)
    """

    def baseUrl(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeContext.baseUrl() -> QUrl """
        pass

    def contextObject(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeContext.contextObject() -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def contextProperty(self, QString):
        """ QDeclarativeContext.contextProperty(QString) -> QVariant """
        pass

    def engine(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeContext.engine() -> QDeclarativeEngine """
        return QDeclarativeEngine

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeContext.isValid() -> bool """
        return False

    def parentContext(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeContext.parentContext() -> QDeclarativeContext """
        return QDeclarativeContext

    # real signature unknown; restored from __doc__
    def resolvedUrl(self, QUrl):
        """ QDeclarativeContext.resolvedUrl(QUrl) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def setBaseUrl(self, QUrl):
        """ QDeclarativeContext.setBaseUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setContextObject(self, QObject):
        """ QDeclarativeContext.setContextObject(QObject) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setContextProperty(self, QString, *__args):
        """
        QDeclarativeContext.setContextProperty(QString, QObject)
        QDeclarativeContext.setContextProperty(QString, QVariant)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QDeclarativeEngine(__PyQt4_QtCore.QObject):

    """ QDeclarativeEngine(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addImageProvider(self, QString, QDeclarativeImageProvider):
        """ QDeclarativeEngine.addImageProvider(QString, QDeclarativeImageProvider) """
        pass

    # real signature unknown; restored from __doc__
    def addImportPath(self, QString):
        """ QDeclarativeEngine.addImportPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def addPluginPath(self, QString):
        """ QDeclarativeEngine.addPluginPath(QString) """
        pass

    def baseUrl(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeEngine.baseUrl() -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def clearComponentCache(self):
        """ QDeclarativeEngine.clearComponentCache() """
        pass

    # real signature unknown; restored from __doc__
    def contextForObject(self, QObject):
        """ QDeclarativeEngine.contextForObject(QObject) -> QDeclarativeContext """
        return QDeclarativeContext

    # real signature unknown; restored from __doc__
    def imageProvider(self, QString):
        """ QDeclarativeEngine.imageProvider(QString) -> QDeclarativeImageProvider """
        return QDeclarativeImageProvider

    def importPathList(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeEngine.importPathList() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def importPlugin(self, QString, QString_1):
        """ QDeclarativeEngine.importPlugin(QString, QString) -> (bool, QString) """
        pass

    # real signature unknown; restored from __doc__
    def networkAccessManager(self):
        """ QDeclarativeEngine.networkAccessManager() -> QNetworkAccessManager """
        pass

    # real signature unknown; restored from __doc__
    def networkAccessManagerFactory(self):
        """ QDeclarativeEngine.networkAccessManagerFactory() -> QDeclarativeNetworkAccessManagerFactory """
        return QDeclarativeNetworkAccessManagerFactory

    # real signature unknown; restored from __doc__
    def objectOwnership(self, QObject):
        """ QDeclarativeEngine.objectOwnership(QObject) -> QDeclarativeEngine.ObjectOwnership """
        pass

    def ObjectOwnership(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def offlineStoragePath(self):
        """ QDeclarativeEngine.offlineStoragePath() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def outputWarningsToStandardError(self):
        """ QDeclarativeEngine.outputWarningsToStandardError() -> bool """
        return False

    def pluginPathList(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeEngine.pluginPathList() -> QStringList """
        pass

    def quit(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeEngine.quit[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def removeImageProvider(self, QString):
        """ QDeclarativeEngine.removeImageProvider(QString) """
        pass

    def rootContext(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeEngine.rootContext() -> QDeclarativeContext """
        return QDeclarativeContext

    # real signature unknown; restored from __doc__
    def setBaseUrl(self, QUrl):
        """ QDeclarativeEngine.setBaseUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setContextForObject(self, QObject, QDeclarativeContext):
        """ QDeclarativeEngine.setContextForObject(QObject, QDeclarativeContext) """
        pass

    # real signature unknown; restored from __doc__
    def setImportPathList(self, QStringList):
        """ QDeclarativeEngine.setImportPathList(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessManagerFactory(self, QDeclarativeNetworkAccessManagerFactory):
        """ QDeclarativeEngine.setNetworkAccessManagerFactory(QDeclarativeNetworkAccessManagerFactory) """
        pass

    # real signature unknown; restored from __doc__
    def setObjectOwnership(self, QObject, QDeclarativeEngine_ObjectOwnership):
        """ QDeclarativeEngine.setObjectOwnership(QObject, QDeclarativeEngine.ObjectOwnership) """
        pass

    # real signature unknown; restored from __doc__
    def setOfflineStoragePath(self, QString):
        """ QDeclarativeEngine.setOfflineStoragePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOutputWarningsToStandardError(self, bool):
        """ QDeclarativeEngine.setOutputWarningsToStandardError(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setPluginPathList(self, QStringList):
        """ QDeclarativeEngine.setPluginPathList(QStringList) """
        pass

    def warnings(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeEngine.warnings[list-of-QDeclarativeError] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    CppOwnership = 0
    JavaScriptOwnership = 1


class QDeclarativeError():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeError()
    QDeclarativeError(QDeclarativeError)
    """

    def column(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.column() -> int """
        return 0

    def description(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.description() -> QString """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.isValid() -> bool """
        return False

    def line(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.line() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setColumn(self, p_int):
        """ QDeclarativeError.setColumn(int) """
        pass

    # real signature unknown; restored from __doc__
    def setDescription(self, QString):
        """ QDeclarativeError.setDescription(QString) """
        pass

    def setLine(self, p_int):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.setLine(int) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.setUrl(QUrl) """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.toString() -> QString """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeError.url() -> QUrl """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeError=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDeclarativeExpression(__PyQt4_QtCore.QObject):

    """
    QDeclarativeExpression()
    QDeclarativeExpression(QDeclarativeContext, QObject, QString, QObject parent=None)
    """

    def clearError(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.clearError() """
        pass

    def context(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.context() -> QDeclarativeContext """
        return QDeclarativeContext

    def engine(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.engine() -> QDeclarativeEngine """
        return QDeclarativeEngine

    def error(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.error() -> QDeclarativeError """
        return QDeclarativeError

    def evaluate(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.evaluate() -> (QVariant, bool) """
        pass

    def expression(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.expression() -> QString """
        pass

    def hasError(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.hasError() -> bool """
        return False

    def lineNumber(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.lineNumber() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def notifyOnValueChanged(self):
        """ QDeclarativeExpression.notifyOnValueChanged() -> bool """
        return False

    def scopeObject(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.scopeObject() -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def setExpression(self, QString):
        """ QDeclarativeExpression.setExpression(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setNotifyOnValueChanged(self, bool):
        """ QDeclarativeExpression.setNotifyOnValueChanged(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setSourceLocation(self, QString, p_int):
        """ QDeclarativeExpression.setSourceLocation(QString, int) """
        pass

    def sourceFile(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeExpression.sourceFile() -> QString """
        pass

    def valueChanged(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeExpression.valueChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeContext=None, QObject=None, QString=None, QObject_parent=None):
        pass


class QDeclarativeExtensionPlugin(__PyQt4_QtCore.QObject):

    """ QDeclarativeExtensionPlugin(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def initializeEngine(self, QDeclarativeEngine, p_str):
        """ QDeclarativeExtensionPlugin.initializeEngine(QDeclarativeEngine, str) """
        pass

    # real signature unknown; restored from __doc__
    def registerTypes(self, p_str):
        """ QDeclarativeExtensionPlugin.registerTypes(str) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QDeclarativeImageProvider():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeImageProvider(QDeclarativeImageProvider.ImageType)
    QDeclarativeImageProvider(QDeclarativeImageProvider)
    """

    def ImageType(self, *args, **kwargs):  # real signature unknown
        pass

    def imageType(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeImageProvider.imageType() -> QDeclarativeImageProvider.ImageType """
        pass

    # real signature unknown; restored from __doc__
    def requestImage(self, QString, QSize, QSize_1):
        """ QDeclarativeImageProvider.requestImage(QString, QSize, QSize) -> QImage """
        pass

    # real signature unknown; restored from __doc__
    def requestPixmap(self, QString, QSize, QSize_1):
        """ QDeclarativeImageProvider.requestPixmap(QString, QSize, QSize) -> QPixmap """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    Image = 0
    Pixmap = 1


class QDeclarativeParserStatus():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeParserStatus()
    QDeclarativeParserStatus(QDeclarativeParserStatus)
    """

    def classBegin(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeParserStatus.classBegin() """
        pass

    # real signature unknown; restored from __doc__
    def componentComplete(self):
        """ QDeclarativeParserStatus.componentComplete() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeParserStatus=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDeclarativeItem(__PyQt4_QtGui.QGraphicsObject, QDeclarativeParserStatus):

    """ QDeclarativeItem(QDeclarativeItem parent=None) """

    def baselineOffset(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.baselineOffset() -> float """
        return 0.0

    def boundingRect(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.boundingRect() -> QRectF """
        pass

    def childrenRect(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.childrenRect() -> QRectF """
        pass

    def classBegin(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.classBegin() """
        pass

    def clip(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.clip() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def componentComplete(self):
        """ QDeclarativeItem.componentComplete() """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def geometryChanged(self, QRectF, QRectF_1):
        """ QDeclarativeItem.geometryChanged(QRectF, QRectF) """
        pass

    def hasFocus(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.hasFocus() -> bool """
        return False

    def heightValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.heightValid() -> bool """
        return False

    def implicitHeight(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.implicitHeight() -> float """
        return 0.0

    def implicitWidth(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.implicitWidth() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def inputMethodEvent(self, QInputMethodEvent):
        """ QDeclarativeItem.inputMethodEvent(QInputMethodEvent) """
        pass

    # real signature unknown; restored from __doc__
    def inputMethodQuery(self, Qt_InputMethodQuery):
        """ QDeclarativeItem.inputMethodQuery(Qt.InputMethodQuery) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def isComponentComplete(self):
        """ QDeclarativeItem.isComponentComplete() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def itemChange(self, QGraphicsItem_GraphicsItemChange, QVariant):
        """ QDeclarativeItem.itemChange(QGraphicsItem.GraphicsItemChange, QVariant) -> QVariant """
        pass

    def keepMouseGrab(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.keepMouseGrab() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def keyPressEvent(self, QKeyEvent):
        """ QDeclarativeItem.keyPressEvent(QKeyEvent) """
        pass

    # real signature unknown; restored from __doc__
    def keyReleaseEvent(self, QKeyEvent):
        """ QDeclarativeItem.keyReleaseEvent(QKeyEvent) """
        pass

    # real signature unknown; restored from __doc__
    def paint(self, QPainter, QStyleOptionGraphicsItem, QWidget):
        """ QDeclarativeItem.paint(QPainter, QStyleOptionGraphicsItem, QWidget) """
        pass

    def parentItem(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.parentItem() -> QDeclarativeItem """
        return QDeclarativeItem

    # real signature unknown; restored from __doc__
    def sceneEvent(self, QEvent):
        """ QDeclarativeItem.sceneEvent(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setBaselineOffset(self, p_float):
        """ QDeclarativeItem.setBaselineOffset(float) """
        pass

    def setClip(self, bool):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.setClip(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setHeight(self, p_float):
        """ QDeclarativeItem.setHeight(float) """
        pass

    # real signature unknown; restored from __doc__
    def setImplicitHeight(self, p_float):
        """ QDeclarativeItem.setImplicitHeight(float) """
        pass

    # real signature unknown; restored from __doc__
    def setImplicitWidth(self, p_float):
        """ QDeclarativeItem.setImplicitWidth(float) """
        pass

    # real signature unknown; restored from __doc__
    def setKeepMouseGrab(self, bool):
        """ QDeclarativeItem.setKeepMouseGrab(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setParentItem(self, QDeclarativeItem):
        """ QDeclarativeItem.setParentItem(QDeclarativeItem) """
        pass

    def setSmooth(self, bool):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.setSmooth(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setTransformOrigin(self, QDeclarativeItem_TransformOrigin):
        """ QDeclarativeItem.setTransformOrigin(QDeclarativeItem.TransformOrigin) """
        pass

    # real signature unknown; restored from __doc__
    def setWidth(self, p_float):
        """ QDeclarativeItem.setWidth(float) """
        pass

    def smooth(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.smooth() -> bool """
        return False

    def transformOrigin(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.transformOrigin() -> QDeclarativeItem.TransformOrigin """
        pass

    def TransformOrigin(self, *args, **kwargs):  # real signature unknown
        pass

    def widthValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeItem.widthValid() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QDeclarativeItem_parent=None):
        pass

    Bottom = 7
    BottomLeft = 6
    BottomRight = 8
    Center = 4
    Left = 3
    Right = 5
    Top = 1
    TopLeft = 0
    TopRight = 2


class QDeclarativeListReference():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeListReference()
    QDeclarativeListReference(QObject, str, QDeclarativeEngine engine=None)
    QDeclarativeListReference(QDeclarativeListReference)
    """

    def append(self, QObject):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.append(QObject) -> bool """
        return False

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.at(int) -> QObject """
        pass

    def canAppend(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.canAppend() -> bool """
        return False

    def canAt(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.canAt() -> bool """
        return False

    def canClear(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.canClear() -> bool """
        return False

    def canCount(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.canCount() -> bool """
        return False

    def clear(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.clear() -> bool """
        return False

    def count(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.count() -> int """
        return 0

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.isValid() -> bool """
        return False

    def listElementType(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.listElementType() -> QMetaObject """
        pass

    def object(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeListReference.object() -> QObject """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QDeclarativeNetworkAccessManagerFactory():

    """
    QDeclarativeNetworkAccessManagerFactory()
    QDeclarativeNetworkAccessManagerFactory(QDeclarativeNetworkAccessManagerFactory)
    """

    def create(self, QObject):  # real signature unknown; restored from __doc__
        """ QDeclarativeNetworkAccessManagerFactory.create(QObject) -> QNetworkAccessManager """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeNetworkAccessManagerFactory=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDeclarativeProperty():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeProperty()
    QDeclarativeProperty(QObject)
    QDeclarativeProperty(QObject, QDeclarativeContext)
    QDeclarativeProperty(QObject, QDeclarativeEngine)
    QDeclarativeProperty(QObject, QString)
    QDeclarativeProperty(QObject, QString, QDeclarativeContext)
    QDeclarativeProperty(QObject, QString, QDeclarativeEngine)
    QDeclarativeProperty(QDeclarativeProperty)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def connectNotifySignal(self, *__args):
        """
        QDeclarativeProperty.connectNotifySignal(QObject, SLOT()) -> bool
        QDeclarativeProperty.connectNotifySignal(callable) -> bool
        QDeclarativeProperty.connectNotifySignal(QObject, int) -> bool
        """
        return False

    def hasNotifySignal(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.hasNotifySignal() -> bool """
        return False

    def index(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.index() -> int """
        return 0

    def isDesignable(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.isDesignable() -> bool """
        return False

    def isProperty(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.isProperty() -> bool """
        return False

    def isResettable(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.isResettable() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isSignalProperty(self):
        """ QDeclarativeProperty.isSignalProperty() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.isValid() -> bool """
        return False

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.isWritable() -> bool """
        return False

    def method(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.method() -> QMetaMethod """
        pass

    def name(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.name() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def needsNotifySignal(self):
        """ QDeclarativeProperty.needsNotifySignal() -> bool """
        return False

    def object(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.object() -> QObject """
        pass

    def property(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.property() -> QMetaProperty """
        pass

    def propertyType(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.propertyType() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def propertyTypeCategory(self):
        """ QDeclarativeProperty.propertyTypeCategory() -> QDeclarativeProperty.PropertyTypeCategory """
        pass

    def PropertyTypeCategory(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def propertyTypeName(self):
        """ QDeclarativeProperty.propertyTypeName() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def read(self, QObject=None, QString=None, *__args):
        """
        QDeclarativeProperty.read() -> QVariant
        QDeclarativeProperty.read(QObject, QString) -> QVariant
        QDeclarativeProperty.read(QObject, QString, QDeclarativeContext) -> QVariant
        QDeclarativeProperty.read(QObject, QString, QDeclarativeEngine) -> QVariant
        """
        pass

    def reset(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.reset() -> bool """
        return False

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeProperty.type() -> QDeclarativeProperty.Type """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def write(self, *__args):
        """
        QDeclarativeProperty.write(QVariant) -> bool
        QDeclarativeProperty.write(QObject, QString, QVariant) -> bool
        QDeclarativeProperty.write(QObject, QString, QVariant, QDeclarativeContext) -> bool
        QDeclarativeProperty.write(QObject, QString, QVariant, QDeclarativeEngine) -> bool
        """
        return False

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __hash__(self):  # real signature unknown; restored from __doc__
        """ x.__hash__() <==> hash(x) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    __weakref__ = property(lambda self: object())  # default

    Invalid = 0
    InvalidCategory = 0
    List = 1
    Normal = 3
    Object = 2
    Property = 1
    SignalProperty = 2


class QDeclarativePropertyMap(__PyQt4_QtCore.QObject):

    """ QDeclarativePropertyMap(QObject parent=None) """

    def clear(self, QString):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.clear(QString) """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QString):
        """ QDeclarativePropertyMap.contains(QString) -> bool """
        return False

    def count(self):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.count() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def insert(self, QString, QVariant):
        """ QDeclarativePropertyMap.insert(QString, QVariant) """
        pass

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.isEmpty() -> bool """
        return False

    def keys(self):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.keys() -> QStringList """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.size() -> int """
        return 0

    def value(self, QString):  # real signature unknown; restored from __doc__
        """ QDeclarativePropertyMap.value(QString) -> QVariant """
        pass

    def valueChanged(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativePropertyMap.valueChanged[QString, QVariant] [signal] """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass


# skipped bases: <type 'sip.simplewrapper'>
class QDeclarativePropertyValueSource():

    """
    QDeclarativePropertyValueSource()
    QDeclarativePropertyValueSource(QDeclarativePropertyValueSource)
    """
    # real signature unknown; restored from __doc__

    def setTarget(self, QDeclarativeProperty):
        """ QDeclarativePropertyValueSource.setTarget(QDeclarativeProperty) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativePropertyValueSource=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDeclarativeScriptString():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDeclarativeScriptString()
    QDeclarativeScriptString(QDeclarativeScriptString)
    """

    def context(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeScriptString.context() -> QDeclarativeContext """
        return QDeclarativeContext

    def scopeObject(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeScriptString.scopeObject() -> QObject """
        pass

    def script(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeScriptString.script() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setContext(self, QDeclarativeContext):
        """ QDeclarativeScriptString.setContext(QDeclarativeContext) """
        pass

    # real signature unknown; restored from __doc__
    def setScopeObject(self, QObject):
        """ QDeclarativeScriptString.setScopeObject(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setScript(self, QString):
        """ QDeclarativeScriptString.setScript(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDeclarativeScriptString=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDeclarativeView(__PyQt4_QtGui.QGraphicsView):

    """
    QDeclarativeView(QWidget parent=None)
    QDeclarativeView(QUrl, QWidget parent=None)
    """

    def engine(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.engine() -> QDeclarativeEngine """
        return QDeclarativeEngine

    def errors(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.errors() -> list-of-QDeclarativeError """
        pass

    # real signature unknown; restored from __doc__
    def eventFilter(self, QObject, QEvent):
        """ QDeclarativeView.eventFilter(QObject, QEvent) -> bool """
        return False

    def initialSize(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.initialSize() -> QSize """
        pass

    # real signature unknown; restored from __doc__
    def paintEvent(self, QPaintEvent):
        """ QDeclarativeView.paintEvent(QPaintEvent) """
        pass

    # real signature unknown; restored from __doc__
    def resizeEvent(self, QResizeEvent):
        """ QDeclarativeView.resizeEvent(QResizeEvent) """
        pass

    def ResizeMode(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeMode(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.resizeMode() -> QDeclarativeView.ResizeMode """
        pass

    def rootContext(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.rootContext() -> QDeclarativeContext """
        return QDeclarativeContext

    def rootObject(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.rootObject() -> QGraphicsObject """
        pass

    def sceneResized(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeView.sceneResized[QSize] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setResizeMode(self, QDeclarativeView_ResizeMode):
        """ QDeclarativeView.setResizeMode(QDeclarativeView.ResizeMode) """
        pass

    def setSource(self, QUrl):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.setSource(QUrl) """
        pass

    def sizeHint(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.sizeHint() -> QSize """
        pass

    def source(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.source() -> QUrl """
        pass

    def status(self):  # real signature unknown; restored from __doc__
        """ QDeclarativeView.status() -> QDeclarativeView.Status """
        pass

    def Status(self, *args, **kwargs):  # real signature unknown
        pass

    def statusChanged(self, *args, **kwargs):  # real signature unknown
        """ QDeclarativeView.statusChanged[QDeclarativeView.Status] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def timerEvent(self, QTimerEvent):
        """ QDeclarativeView.timerEvent(QTimerEvent) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    Error = 3
    Loading = 2
    Null = 0
    Ready = 1
    SizeRootObjectToView = 1
    SizeViewToRootObject = 0


class QPyDeclarativePropertyValueSource(__PyQt4_QtCore.QObject, QDeclarativePropertyValueSource):

    """ QPyDeclarativePropertyValueSource(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject_parent=None):
        pass

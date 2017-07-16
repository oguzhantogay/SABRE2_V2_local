# encoding: utf-8
# module PyQt4.QtWebKit
# from /usr/lib/python2.7/dist-packages/PyQt4/QtWebKit.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# functions

def qWebKitMajorVersion():  # real signature unknown; restored from __doc__
    """ qWebKitMajorVersion() -> int """
    return 0


def qWebKitMinorVersion():  # real signature unknown; restored from __doc__
    """ qWebKitMinorVersion() -> int """
    return 0


def qWebKitVersion():  # real signature unknown; restored from __doc__
    """ qWebKitVersion() -> QString """
    pass


# classes

class QGraphicsWebView(__PyQt4_QtGui.QGraphicsWidget):

    """ QGraphicsWebView(QGraphicsItem parent=None) """

    def back(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.back() """
        pass

    # real signature unknown; restored from __doc__
    def contextMenuEvent(self, QGraphicsSceneContextMenuEvent):
        """ QGraphicsWebView.contextMenuEvent(QGraphicsSceneContextMenuEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragEnterEvent(self, QGraphicsSceneDragDropEvent):
        """ QGraphicsWebView.dragEnterEvent(QGraphicsSceneDragDropEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragLeaveEvent(self, QGraphicsSceneDragDropEvent):
        """ QGraphicsWebView.dragLeaveEvent(QGraphicsSceneDragDropEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragMoveEvent(self, QGraphicsSceneDragDropEvent):
        """ QGraphicsWebView.dragMoveEvent(QGraphicsSceneDragDropEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dropEvent(self, QGraphicsSceneDragDropEvent):
        """ QGraphicsWebView.dropEvent(QGraphicsSceneDragDropEvent) """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def findText(self, QString, QWebPage_FindFlags_options=0):
        """ QGraphicsWebView.findText(QString, QWebPage.FindFlags options=0) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusInEvent(self, QFocusEvent):
        """ QGraphicsWebView.focusInEvent(QFocusEvent) """
        pass

    # real signature unknown; restored from __doc__
    def focusNextPrevChild(self, bool):
        """ QGraphicsWebView.focusNextPrevChild(bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusOutEvent(self, QFocusEvent):
        """ QGraphicsWebView.focusOutEvent(QFocusEvent) """
        pass

    def forward(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.forward() """
        pass

    def history(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.history() -> QWebHistory """
        return QWebHistory

    # real signature unknown; restored from __doc__
    def hoverLeaveEvent(self, QGraphicsSceneHoverEvent):
        """ QGraphicsWebView.hoverLeaveEvent(QGraphicsSceneHoverEvent) """
        pass

    # real signature unknown; restored from __doc__
    def hoverMoveEvent(self, QGraphicsSceneHoverEvent):
        """ QGraphicsWebView.hoverMoveEvent(QGraphicsSceneHoverEvent) """
        pass

    def icon(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.icon() -> QIcon """
        pass

    def iconChanged(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.iconChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def inputMethodEvent(self, QInputMethodEvent):
        """ QGraphicsWebView.inputMethodEvent(QInputMethodEvent) """
        pass

    # real signature unknown; restored from __doc__
    def inputMethodQuery(self, Qt_InputMethodQuery):
        """ QGraphicsWebView.inputMethodQuery(Qt.InputMethodQuery) -> QVariant """
        pass

    def isModified(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.isModified() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isTiledBackingStoreFrozen(self):
        """ QGraphicsWebView.isTiledBackingStoreFrozen() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def itemChange(self, QGraphicsItem_GraphicsItemChange, QVariant):
        """ QGraphicsWebView.itemChange(QGraphicsItem.GraphicsItemChange, QVariant) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def keyPressEvent(self, QKeyEvent):
        """ QGraphicsWebView.keyPressEvent(QKeyEvent) """
        pass

    # real signature unknown; restored from __doc__
    def keyReleaseEvent(self, QKeyEvent):
        """ QGraphicsWebView.keyReleaseEvent(QKeyEvent) """
        pass

    def linkClicked(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.linkClicked[QUrl] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def load(self, *__args):
        """
        QGraphicsWebView.load(QUrl)
        QGraphicsWebView.load(QNetworkRequest, QNetworkAccessManager.Operation operation=QNetworkAccessManager.GetOperation, QByteArray body=QByteArray())
        """
        pass

    def loadFinished(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.loadFinished[bool] [signal] """
        pass

    def loadProgress(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.loadProgress[int] [signal] """
        pass

    def loadStarted(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.loadStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def mouseDoubleClickEvent(self, QGraphicsSceneMouseEvent):
        """ QGraphicsWebView.mouseDoubleClickEvent(QGraphicsSceneMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseMoveEvent(self, QGraphicsSceneMouseEvent):
        """ QGraphicsWebView.mouseMoveEvent(QGraphicsSceneMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mousePressEvent(self, QGraphicsSceneMouseEvent):
        """ QGraphicsWebView.mousePressEvent(QGraphicsSceneMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseReleaseEvent(self, QGraphicsSceneMouseEvent):
        """ QGraphicsWebView.mouseReleaseEvent(QGraphicsSceneMouseEvent) """
        pass

    def page(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.page() -> QWebPage """
        return QWebPage

    # real signature unknown; restored from __doc__
    def pageAction(self, QWebPage_WebAction):
        """ QGraphicsWebView.pageAction(QWebPage.WebAction) -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def paint(self, QPainter, QStyleOptionGraphicsItem, QWidget_widget=None):
        """ QGraphicsWebView.paint(QPainter, QStyleOptionGraphicsItem, QWidget widget=None) """
        pass

    def reload(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.reload() """
        pass

    # real signature unknown; restored from __doc__
    def resizesToContents(self):
        """ QGraphicsWebView.resizesToContents() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def sceneEvent(self, QEvent):
        """ QGraphicsWebView.sceneEvent(QEvent) -> bool """
        return False

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setContent(self, QByteArray, QString_mimeType=None, *args, **kwargs):
        """ QGraphicsWebView.setContent(QByteArray, QString mimeType=QString(), QUrl baseUrl=QUrl()) """
        pass

    # real signature unknown; restored from __doc__
    def setGeometry(self, QRectF):
        """ QGraphicsWebView.setGeometry(QRectF) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setHtml(self, QString, QUrl_baseUrl=None, *args, **kwargs):
        """ QGraphicsWebView.setHtml(QString, QUrl baseUrl=QUrl()) """
        pass

    # real signature unknown; restored from __doc__
    def setPage(self, QWebPage):
        """ QGraphicsWebView.setPage(QWebPage) """
        pass

    # real signature unknown; restored from __doc__
    def setResizesToContents(self, bool):
        """ QGraphicsWebView.setResizesToContents(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setTiledBackingStoreFrozen(self, bool):
        """ QGraphicsWebView.setTiledBackingStoreFrozen(bool) """
        pass

    def settings(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.settings() -> QWebSettings """
        return QWebSettings

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.setUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setZoomFactor(self, p_float):
        """ QGraphicsWebView.setZoomFactor(float) """
        pass

    # real signature unknown; restored from __doc__
    def sizeHint(self, Qt_SizeHint, QSizeF):
        """ QGraphicsWebView.sizeHint(Qt.SizeHint, QSizeF) -> QSizeF """
        pass

    def statusBarMessage(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.statusBarMessage[QString] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.stop() """
        pass

    def title(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.title() -> QString """
        pass

    def titleChanged(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.titleChanged[QString] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def triggerPageAction(self, QWebPage_WebAction, bool_checked=False):
        """ QGraphicsWebView.triggerPageAction(QWebPage.WebAction, bool checked=False) """
        pass

    def updateGeometry(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.updateGeometry() """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.url() -> QUrl """
        pass

    def urlChanged(self, *args, **kwargs):  # real signature unknown
        """ QGraphicsWebView.urlChanged[QUrl] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def wheelEvent(self, QGraphicsSceneWheelEvent):
        """ QGraphicsWebView.wheelEvent(QGraphicsSceneWheelEvent) """
        pass

    def zoomFactor(self):  # real signature unknown; restored from __doc__
        """ QGraphicsWebView.zoomFactor() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def __init__(self, QGraphicsItem_parent=None):
        pass


class QWebDatabase():  # skipped bases: <type 'sip.simplewrapper'>

    """ QWebDatabase(QWebDatabase) """

    def displayName(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.displayName() -> QString """
        pass

    def expectedSize(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.expectedSize() -> int """
        return 0

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.fileName() -> QString """
        pass

    def name(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.name() -> QString """
        pass

    def origin(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.origin() -> QWebSecurityOrigin """
        return QWebSecurityOrigin

    # real signature unknown; restored from __doc__
    def removeAllDatabases(self):
        """ QWebDatabase.removeAllDatabases() """
        pass

    # real signature unknown; restored from __doc__
    def removeDatabase(self, QWebDatabase):
        """ QWebDatabase.removeDatabase(QWebDatabase) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QWebDatabase.size() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QWebDatabase):
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebElement():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QWebElement()
    QWebElement(QWebElement)
    """
    # real signature unknown; restored from __doc__

    def addClass(self, QString):
        """ QWebElement.addClass(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def appendInside(self, *__args):
        """
        QWebElement.appendInside(QString)
        QWebElement.appendInside(QWebElement)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def appendOutside(self, *__args):
        """
        QWebElement.appendOutside(QString)
        QWebElement.appendOutside(QWebElement)
        """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def attribute(self, QString, QString_defaultValue=None, *args, **kwargs):
        """ QWebElement.attribute(QString, QString defaultValue=QString()) -> QString """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def attributeNames(self, QString_namespaceUri=None, *args, **kwargs):
        """ QWebElement.attributeNames(QString namespaceUri=QString()) -> QStringList """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def attributeNS(self, QString, QString_1, QString_defaultValue=None, *args, **kwargs):
        """ QWebElement.attributeNS(QString, QString, QString defaultValue=QString()) -> QString """
        pass

    def classes(self):  # real signature unknown; restored from __doc__
        """ QWebElement.classes() -> QStringList """
        pass

    def clone(self):  # real signature unknown; restored from __doc__
        """ QWebElement.clone() -> QWebElement """
        return QWebElement

    def document(self):  # real signature unknown; restored from __doc__
        """ QWebElement.document() -> QWebElement """
        return QWebElement

    # real signature unknown; restored from __doc__ with multiple overloads
    def encloseContentsWith(self, *__args):
        """
        QWebElement.encloseContentsWith(QWebElement)
        QWebElement.encloseContentsWith(QString)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def encloseWith(self, *__args):
        """
        QWebElement.encloseWith(QString)
        QWebElement.encloseWith(QWebElement)
        """
        pass

    # real signature unknown; restored from __doc__
    def evaluateJavaScript(self, QString):
        """ QWebElement.evaluateJavaScript(QString) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def findAll(self, QString):
        """ QWebElement.findAll(QString) -> QWebElementCollection """
        return QWebElementCollection

    # real signature unknown; restored from __doc__
    def findFirst(self, QString):
        """ QWebElement.findFirst(QString) -> QWebElement """
        return QWebElement

    def firstChild(self):  # real signature unknown; restored from __doc__
        """ QWebElement.firstChild() -> QWebElement """
        return QWebElement

    def geometry(self):  # real signature unknown; restored from __doc__
        """ QWebElement.geometry() -> QRect """
        pass

    # real signature unknown; restored from __doc__
    def hasAttribute(self, QString):
        """ QWebElement.hasAttribute(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hasAttributeNS(self, QString, QString_1):
        """ QWebElement.hasAttributeNS(QString, QString) -> bool """
        return False

    def hasAttributes(self):  # real signature unknown; restored from __doc__
        """ QWebElement.hasAttributes() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hasClass(self, QString):
        """ QWebElement.hasClass(QString) -> bool """
        return False

    def hasFocus(self):  # real signature unknown; restored from __doc__
        """ QWebElement.hasFocus() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QWebElement.isNull() -> bool """
        return False

    def lastChild(self):  # real signature unknown; restored from __doc__
        """ QWebElement.lastChild() -> QWebElement """
        return QWebElement

    def localName(self):  # real signature unknown; restored from __doc__
        """ QWebElement.localName() -> QString """
        pass

    def namespaceUri(self):  # real signature unknown; restored from __doc__
        """ QWebElement.namespaceUri() -> QString """
        pass

    def nextSibling(self):  # real signature unknown; restored from __doc__
        """ QWebElement.nextSibling() -> QWebElement """
        return QWebElement

    def parent(self):  # real signature unknown; restored from __doc__
        """ QWebElement.parent() -> QWebElement """
        return QWebElement

    def prefix(self):  # real signature unknown; restored from __doc__
        """ QWebElement.prefix() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def prependInside(self, *__args):
        """
        QWebElement.prependInside(QString)
        QWebElement.prependInside(QWebElement)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def prependOutside(self, *__args):
        """
        QWebElement.prependOutside(QString)
        QWebElement.prependOutside(QWebElement)
        """
        pass

    def previousSibling(self):  # real signature unknown; restored from __doc__
        """ QWebElement.previousSibling() -> QWebElement """
        return QWebElement

    # real signature unknown; restored from __doc__
    def removeAllChildren(self):
        """ QWebElement.removeAllChildren() """
        pass

    # real signature unknown; restored from __doc__
    def removeAttribute(self, QString):
        """ QWebElement.removeAttribute(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeAttributeNS(self, QString, QString_1):
        """ QWebElement.removeAttributeNS(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeClass(self, QString):
        """ QWebElement.removeClass(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeFromDocument(self):
        """ QWebElement.removeFromDocument() """
        pass

    # real signature unknown; restored from __doc__
    def render(self, QPainter):
        """ QWebElement.render(QPainter) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def replace(self, *__args):
        """
        QWebElement.replace(QString)
        QWebElement.replace(QWebElement)
        """
        pass

    # real signature unknown; restored from __doc__
    def setAttribute(self, QString, QString_1):
        """ QWebElement.setAttribute(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setAttributeNS(self, QString, QString_1, QString_2):
        """ QWebElement.setAttributeNS(QString, QString, QString) """
        pass

    def setFocus(self):  # real signature unknown; restored from __doc__
        """ QWebElement.setFocus() """
        pass

    # real signature unknown; restored from __doc__
    def setInnerXml(self, QString):
        """ QWebElement.setInnerXml(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOuterXml(self, QString):
        """ QWebElement.setOuterXml(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPlainText(self, QString):
        """ QWebElement.setPlainText(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setStyleProperty(self, QString, QString_1):
        """ QWebElement.setStyleProperty(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def styleProperty(self, QString, QWebElement_StyleResolveStrategy):
        """ QWebElement.styleProperty(QString, QWebElement.StyleResolveStrategy) -> QString """
        pass

    def StyleResolveStrategy(self, *args, **kwargs):  # real signature unknown
        pass

    def tagName(self):  # real signature unknown; restored from __doc__
        """ QWebElement.tagName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def takeFromDocument(self):
        """ QWebElement.takeFromDocument() -> QWebElement """
        return QWebElement

    # real signature unknown; restored from __doc__
    def toggleClass(self, QString):
        """ QWebElement.toggleClass(QString) """
        pass

    def toInnerXml(self):  # real signature unknown; restored from __doc__
        """ QWebElement.toInnerXml() -> QString """
        pass

    def toOuterXml(self):  # real signature unknown; restored from __doc__
        """ QWebElement.toOuterXml() -> QString """
        pass

    def toPlainText(self):  # real signature unknown; restored from __doc__
        """ QWebElement.toPlainText() -> QString """
        pass

    def webFrame(self):  # real signature unknown; restored from __doc__
        """ QWebElement.webFrame() -> QWebFrame """
        return QWebFrame

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QWebElement=None):
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

    CascadedStyle = 1
    ComputedStyle = 2
    InlineStyle = 0


class QWebElementCollection():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QWebElementCollection()
    QWebElementCollection(QWebElement, QString)
    QWebElementCollection(QWebElementCollection)
    """
    # real signature unknown; restored from __doc__

    def append(self, QWebElementCollection):
        """ QWebElementCollection.append(QWebElementCollection) """
        pass

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QWebElementCollection.at(int) -> QWebElement """
        return QWebElement

    def count(self):  # real signature unknown; restored from __doc__
        """ QWebElementCollection.count() -> int """
        return 0

    def first(self):  # real signature unknown; restored from __doc__
        """ QWebElementCollection.first() -> QWebElement """
        return QWebElement

    def last(self):  # real signature unknown; restored from __doc__
        """ QWebElementCollection.last() -> QWebElement """
        return QWebElement

    def toList(self):  # real signature unknown; restored from __doc__
        """ QWebElementCollection.toList() -> list-of-QWebElement """
        pass

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+=y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebFrame(__PyQt4_QtCore.QObject):
    # no doc
    # real signature unknown; restored from __doc__

    def addToJavaScriptWindowObject(self, QString, QObject):
        """ QWebFrame.addToJavaScriptWindowObject(QString, QObject) """
        pass

    def baseUrl(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.baseUrl() -> QUrl """
        pass

    def childFrames(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.childFrames() -> list-of-QWebFrame """
        pass

    def contentsSize(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.contentsSize() -> QSize """
        pass

    def contentsSizeChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.contentsSizeChanged[QSize] [signal] """
        pass

    def documentElement(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.documentElement() -> QWebElement """
        return QWebElement

    # real signature unknown; restored from __doc__
    def evaluateJavaScript(self, QString):
        """ QWebFrame.evaluateJavaScript(QString) -> QVariant """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QWebFrame.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def findAllElements(self, QString):
        """ QWebFrame.findAllElements(QString) -> QWebElementCollection """
        return QWebElementCollection

    # real signature unknown; restored from __doc__
    def findFirstElement(self, QString):
        """ QWebFrame.findFirstElement(QString) -> QWebElement """
        return QWebElement

    def frameName(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.frameName() -> QString """
        pass

    def geometry(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.geometry() -> QRect """
        pass

    def hasFocus(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.hasFocus() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hitTestContent(self, QPoint):
        """ QWebFrame.hitTestContent(QPoint) -> QWebHitTestResult """
        return QWebHitTestResult

    def icon(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.icon() -> QIcon """
        pass

    def iconChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.iconChanged[] [signal] """
        pass

    # real signature unknown
    def initialLayoutCompleted(self, *args, **kwargs):
        """ QWebFrame.initialLayoutCompleted[] [signal] """
        pass

    # real signature unknown
    def javaScriptWindowObjectCleared(self, *args, **kwargs):
        """ QWebFrame.javaScriptWindowObjectCleared[] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def load(self, *__args):
        """
        QWebFrame.load(QUrl)
        QWebFrame.load(QNetworkRequest, QNetworkAccessManager.Operation operation=QNetworkAccessManager.GetOperation, QByteArray body=QByteArray())
        """
        pass

    def loadFinished(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.loadFinished[bool] [signal] """
        pass

    def loadStarted(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.loadStarted[] [signal] """
        pass

    def metaData(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.metaData() -> dict-of-QString-list-of-QString """
        pass

    def page(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.page() -> QWebPage """
        return QWebPage

    def pageChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.pageChanged[] [signal] """
        pass

    def parentFrame(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.parentFrame() -> QWebFrame """
        return QWebFrame

    def pos(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.pos() -> QPoint """
        pass

    # real signature unknown; restored from __doc__
    def print_(self, QPrinter):
        """ QWebFrame.print_(QPrinter) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def render(self, QPainter, *__args):
        """
        QWebFrame.render(QPainter, QRegion)
        QWebFrame.render(QPainter)
        QWebFrame.render(QPainter, QWebFrame.RenderLayer, QRegion clip=QRegion())
        """
        pass

    def RenderLayer(self, *args, **kwargs):  # real signature unknown
        pass

    def renderTreeDump(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.renderTreeDump() -> QString """
        pass

    def requestedUrl(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.requestedUrl() -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def scroll(self, p_int, p_int_1):
        """ QWebFrame.scroll(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def scrollBarGeometry(self, Qt_Orientation):
        """ QWebFrame.scrollBarGeometry(Qt.Orientation) -> QRect """
        pass

    # real signature unknown; restored from __doc__
    def scrollBarMaximum(self, Qt_Orientation):
        """ QWebFrame.scrollBarMaximum(Qt.Orientation) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def scrollBarMinimum(self, Qt_Orientation):
        """ QWebFrame.scrollBarMinimum(Qt.Orientation) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def scrollBarPolicy(self, Qt_Orientation):
        """ QWebFrame.scrollBarPolicy(Qt.Orientation) -> Qt.ScrollBarPolicy """
        pass

    # real signature unknown; restored from __doc__
    def scrollBarValue(self, Qt_Orientation):
        """ QWebFrame.scrollBarValue(Qt.Orientation) -> int """
        return 0

    def scrollPosition(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.scrollPosition() -> QPoint """
        pass

    # real signature unknown; restored from __doc__
    def scrollToAnchor(self, QString):
        """ QWebFrame.scrollToAnchor(QString) """
        pass

    def securityOrigin(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.securityOrigin() -> QWebSecurityOrigin """
        return QWebSecurityOrigin

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setContent(self, QByteArray, QString_mimeType=None, *args, **kwargs):
        """ QWebFrame.setContent(QByteArray, QString mimeType=QString(), QUrl baseUrl=QUrl()) """
        pass

    def setFocus(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.setFocus() """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setHtml(self, QString, QUrl_baseUrl=None, *args, **kwargs):
        """ QWebFrame.setHtml(QString, QUrl baseUrl=QUrl()) """
        pass

    # real signature unknown; restored from __doc__
    def setScrollBarPolicy(self, Qt_Orientation, Qt_ScrollBarPolicy):
        """ QWebFrame.setScrollBarPolicy(Qt.Orientation, Qt.ScrollBarPolicy) """
        pass

    # real signature unknown; restored from __doc__
    def setScrollBarValue(self, Qt_Orientation, p_int):
        """ QWebFrame.setScrollBarValue(Qt.Orientation, int) """
        pass

    # real signature unknown; restored from __doc__
    def setScrollPosition(self, QPoint):
        """ QWebFrame.setScrollPosition(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setTextSizeMultiplier(self, p_float):
        """ QWebFrame.setTextSizeMultiplier(float) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QWebFrame.setUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setZoomFactor(self, p_float):
        """ QWebFrame.setZoomFactor(float) """
        pass

    # real signature unknown; restored from __doc__
    def textSizeMultiplier(self):
        """ QWebFrame.textSizeMultiplier() -> float """
        return 0.0

    def title(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.title() -> QString """
        pass

    def titleChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.titleChanged[QString] [signal] """
        pass

    def toHtml(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.toHtml() -> QString """
        pass

    def toPlainText(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.toPlainText() -> QString """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.url() -> QUrl """
        pass

    def urlChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebFrame.urlChanged[QUrl] [signal] """
        pass

    def zoomFactor(self):  # real signature unknown; restored from __doc__
        """ QWebFrame.zoomFactor() -> float """
        return 0.0

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    AllLayers = 255
    ContentsLayer = 16
    PanIconLayer = 64
    ScrollBarLayer = 32


class QWebHistory():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def back(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.back() """
        pass

    def backItem(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.backItem() -> QWebHistoryItem """
        return QWebHistoryItem

    # real signature unknown; restored from __doc__
    def backItems(self, p_int):
        """ QWebHistory.backItems(int) -> list-of-QWebHistoryItem """
        pass

    def canGoBack(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.canGoBack() -> bool """
        return False

    def canGoForward(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.canGoForward() -> bool """
        return False

    def clear(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.clear() """
        pass

    def count(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.count() -> int """
        return 0

    def currentItem(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.currentItem() -> QWebHistoryItem """
        return QWebHistoryItem

    # real signature unknown; restored from __doc__
    def currentItemIndex(self):
        """ QWebHistory.currentItemIndex() -> int """
        return 0

    def forward(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.forward() """
        pass

    def forwardItem(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.forwardItem() -> QWebHistoryItem """
        return QWebHistoryItem

    # real signature unknown; restored from __doc__
    def forwardItems(self, p_int):
        """ QWebHistory.forwardItems(int) -> list-of-QWebHistoryItem """
        pass

    # real signature unknown; restored from __doc__
    def goToItem(self, QWebHistoryItem):
        """ QWebHistory.goToItem(QWebHistoryItem) """
        pass

    def itemAt(self, p_int):  # real signature unknown; restored from __doc__
        """ QWebHistory.itemAt(int) -> QWebHistoryItem """
        return QWebHistoryItem

    def items(self):  # real signature unknown; restored from __doc__
        """ QWebHistory.items() -> list-of-QWebHistoryItem """
        pass

    # real signature unknown; restored from __doc__
    def maximumItemCount(self):
        """ QWebHistory.maximumItemCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setMaximumItemCount(self, p_int):
        """ QWebHistory.setMaximumItemCount(int) """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebHistoryInterface(__PyQt4_QtCore.QObject):

    """ QWebHistoryInterface(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addHistoryEntry(self, QString):
        """ QWebHistoryInterface.addHistoryEntry(QString) """
        pass

    # real signature unknown; restored from __doc__
    def defaultInterface(self):
        """ QWebHistoryInterface.defaultInterface() -> QWebHistoryInterface """
        return QWebHistoryInterface

    # real signature unknown; restored from __doc__
    def historyContains(self, QString):
        """ QWebHistoryInterface.historyContains(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setDefaultInterface(self, QWebHistoryInterface):
        """ QWebHistoryInterface.setDefaultInterface(QWebHistoryInterface) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QWebHistoryItem():  # skipped bases: <type 'sip.simplewrapper'>

    """ QWebHistoryItem(QWebHistoryItem) """

    def icon(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.icon() -> QIcon """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.isValid() -> bool """
        return False

    def lastVisited(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.lastVisited() -> QDateTime """
        pass

    def originalUrl(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.originalUrl() -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def setUserData(self, QVariant):
        """ QWebHistoryItem.setUserData(QVariant) """
        pass

    def title(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.title() -> QString """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.url() -> QUrl """
        pass

    def userData(self):  # real signature unknown; restored from __doc__
        """ QWebHistoryItem.userData() -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWebHistoryItem):
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebHitTestResult():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QWebHitTestResult()
    QWebHitTestResult(QWebHitTestResult)
    """

    def alternateText(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.alternateText() -> QString """
        pass

    def boundingRect(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.boundingRect() -> QRect """
        pass

    def element(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.element() -> QWebElement """
        return QWebElement

    # real signature unknown; restored from __doc__
    def enclosingBlockElement(self):
        """ QWebHitTestResult.enclosingBlockElement() -> QWebElement """
        return QWebElement

    def frame(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.frame() -> QWebFrame """
        return QWebFrame

    def imageUrl(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.imageUrl() -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def isContentEditable(self):
        """ QWebHitTestResult.isContentEditable() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isContentSelected(self):
        """ QWebHitTestResult.isContentSelected() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.isNull() -> bool """
        return False

    def linkElement(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.linkElement() -> QWebElement """
        return QWebElement

    def linkTargetFrame(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.linkTargetFrame() -> QWebFrame """
        return QWebFrame

    def linkText(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.linkText() -> QString """
        pass

    def linkTitle(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.linkTitle() -> QUrl """
        pass

    def linkUrl(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.linkUrl() -> QUrl """
        pass

    def pixmap(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.pixmap() -> QPixmap """
        pass

    def pos(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.pos() -> QPoint """
        pass

    def title(self):  # real signature unknown; restored from __doc__
        """ QWebHitTestResult.title() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QWebHitTestResult=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebInspector(__PyQt4_QtGui.QWidget):

    """ QWebInspector(QWidget parent=None) """
    # real signature unknown; restored from __doc__

    def closeEvent(self, QCloseEvent):
        """ QWebInspector.closeEvent(QCloseEvent) """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QWebInspector.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hideEvent(self, QHideEvent):
        """ QWebInspector.hideEvent(QHideEvent) """
        pass

    def page(self):  # real signature unknown; restored from __doc__
        """ QWebInspector.page() -> QWebPage """
        return QWebPage

    # real signature unknown; restored from __doc__
    def resizeEvent(self, QResizeEvent):
        """ QWebInspector.resizeEvent(QResizeEvent) """
        pass

    # real signature unknown; restored from __doc__
    def setPage(self, QWebPage):
        """ QWebInspector.setPage(QWebPage) """
        pass

    # real signature unknown; restored from __doc__
    def showEvent(self, QShowEvent):
        """ QWebInspector.showEvent(QShowEvent) """
        pass

    def sizeHint(self):  # real signature unknown; restored from __doc__
        """ QWebInspector.sizeHint() -> QSize """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget_parent=None):
        pass


class QWebPage(__PyQt4_QtCore.QObject):

    """ QWebPage(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def acceptNavigationRequest(self, QWebFrame, QNetworkRequest, QWebPage_NavigationType):
        """ QWebPage.acceptNavigationRequest(QWebFrame, QNetworkRequest, QWebPage.NavigationType) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def action(self, QWebPage_WebAction):
        """ QWebPage.action(QWebPage.WebAction) -> QAction """
        pass

    def bytesReceived(self):  # real signature unknown; restored from __doc__
        """ QWebPage.bytesReceived() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def chooseFile(self, QWebFrame, QString):
        """ QWebPage.chooseFile(QWebFrame, QString) -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ChooseMultipleFilesExtensionOption(self, QWebPage_ChooseMultipleFilesExtensionOption=None):
        """
        QWebPage.ChooseMultipleFilesExtensionOption()
        QWebPage.ChooseMultipleFilesExtensionOption(QWebPage.ChooseMultipleFilesExtensionOption)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ChooseMultipleFilesExtensionReturn(self, QWebPage_ChooseMultipleFilesExtensionReturn=None):
        """
        QWebPage.ChooseMultipleFilesExtensionReturn()
        QWebPage.ChooseMultipleFilesExtensionReturn(QWebPage.ChooseMultipleFilesExtensionReturn)
        """
        pass

    def contentsChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.contentsChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def createPlugin(self, QString, QUrl, QStringList, QStringList_1):
        """ QWebPage.createPlugin(QString, QUrl, QStringList, QStringList) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def createStandardContextMenu(self):
        """ QWebPage.createStandardContextMenu() -> QMenu """
        pass

    # real signature unknown; restored from __doc__
    def createWindow(self, QWebPage_WebWindowType):
        """ QWebPage.createWindow(QWebPage.WebWindowType) -> QWebPage """
        return QWebPage

    def currentFrame(self):  # real signature unknown; restored from __doc__
        """ QWebPage.currentFrame() -> QWebFrame """
        return QWebFrame

    def databaseQuotaExceeded(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.databaseQuotaExceeded[QWebFrame, QString] [signal] """
        pass

    def downloadRequested(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.downloadRequested[QNetworkRequest] [signal] """
        pass

    def ErrorDomain(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ErrorPageExtensionOption(self, QWebPage_ErrorPageExtensionOption=None):
        """
        QWebPage.ErrorPageExtensionOption()
        QWebPage.ErrorPageExtensionOption(QWebPage.ErrorPageExtensionOption)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ErrorPageExtensionReturn(self, QWebPage_ErrorPageExtensionReturn=None):
        """
        QWebPage.ErrorPageExtensionReturn()
        QWebPage.ErrorPageExtensionReturn(QWebPage.ErrorPageExtensionReturn)
        """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QWebPage.event(QEvent) -> bool """
        return False

    def Extension(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def extension(self, QWebPage_Extension, QWebPage_ExtensionOption_option=None, QWebPage_ExtensionReturn_output=None):
        """ QWebPage.extension(QWebPage.Extension, QWebPage.ExtensionOption option=None, QWebPage.ExtensionReturn output=None) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def ExtensionOption(self, QWebPage_ExtensionOption=None):
        """
        QWebPage.ExtensionOption()
        QWebPage.ExtensionOption(QWebPage.ExtensionOption)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ExtensionReturn(self, QWebPage_ExtensionReturn=None):
        """
        QWebPage.ExtensionReturn()
        QWebPage.ExtensionReturn(QWebPage.ExtensionReturn)
        """
        pass

    def FindFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def FindFlags(self, *__args):
        """
        QWebPage.FindFlags(QWebPage.FindFlags)
        QWebPage.FindFlags(int)
        QWebPage.FindFlags()
        """
        pass

    # real signature unknown; restored from __doc__
    def findText(self, QString, QWebPage_FindFlags_options=0):
        """ QWebPage.findText(QString, QWebPage.FindFlags options=0) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusNextPrevChild(self, bool):
        """ QWebPage.focusNextPrevChild(bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def forwardUnsupportedContent(self):
        """ QWebPage.forwardUnsupportedContent() -> bool """
        return False

    def frameAt(self, QPoint):  # real signature unknown; restored from __doc__
        """ QWebPage.frameAt(QPoint) -> QWebFrame """
        return QWebFrame

    def frameCreated(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.frameCreated[QWebFrame] [signal] """
        pass

    # real signature unknown
    def geometryChangeRequested(self, *args, **kwargs):
        """ QWebPage.geometryChangeRequested[QRect] [signal] """
        pass

    def history(self):  # real signature unknown; restored from __doc__
        """ QWebPage.history() -> QWebHistory """
        return QWebHistory

    # real signature unknown; restored from __doc__
    def inputMethodQuery(self, Qt_InputMethodQuery):
        """ QWebPage.inputMethodQuery(Qt.InputMethodQuery) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def isContentEditable(self):
        """ QWebPage.isContentEditable() -> bool """
        return False

    def isModified(self):  # real signature unknown; restored from __doc__
        """ QWebPage.isModified() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def javaScriptAlert(self, QWebFrame, QString):
        """ QWebPage.javaScriptAlert(QWebFrame, QString) """
        pass

    # real signature unknown; restored from __doc__
    def javaScriptConfirm(self, QWebFrame, QString):
        """ QWebPage.javaScriptConfirm(QWebFrame, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def javaScriptConsoleMessage(self, QString, p_int, QString_1):
        """ QWebPage.javaScriptConsoleMessage(QString, int, QString) """
        pass

    # real signature unknown; restored from __doc__
    def javaScriptPrompt(self, QWebFrame, QString, QString_1, QString_2):
        """ QWebPage.javaScriptPrompt(QWebFrame, QString, QString, QString) -> bool """
        return False

    def linkClicked(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.linkClicked[QUrl] [signal] """
        pass

    def LinkDelegationPolicy(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def linkDelegationPolicy(self):
        """ QWebPage.linkDelegationPolicy() -> QWebPage.LinkDelegationPolicy """
        pass

    def linkHovered(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.linkHovered[QString, QString, QString] [signal] """
        pass

    def loadFinished(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.loadFinished[bool] [signal] """
        pass

    def loadProgress(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.loadProgress[int] [signal] """
        pass

    def loadStarted(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.loadStarted[] [signal] """
        pass

    def mainFrame(self):  # real signature unknown; restored from __doc__
        """ QWebPage.mainFrame() -> QWebFrame """
        return QWebFrame

    # real signature unknown
    def menuBarVisibilityChangeRequested(self, *args, **kwargs):
        """ QWebPage.menuBarVisibilityChangeRequested[bool] [signal] """
        pass

    def microFocusChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.microFocusChanged[] [signal] """
        pass

    def NavigationType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def networkAccessManager(self):
        """ QWebPage.networkAccessManager() -> QNetworkAccessManager """
        pass

    def palette(self):  # real signature unknown; restored from __doc__
        """ QWebPage.palette() -> QPalette """
        pass

    def pluginFactory(self):  # real signature unknown; restored from __doc__
        """ QWebPage.pluginFactory() -> QWebPluginFactory """
        return QWebPluginFactory

    # real signature unknown; restored from __doc__
    def preferredContentsSize(self):
        """ QWebPage.preferredContentsSize() -> QSize """
        pass

    def printRequested(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.printRequested[QWebFrame] [signal] """
        pass

    def repaintRequested(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.repaintRequested[QRect] [signal] """
        pass

    # real signature unknown
    def restoreFrameStateRequested(self, *args, **kwargs):
        """ QWebPage.restoreFrameStateRequested[QWebFrame] [signal] """
        pass

    # real signature unknown
    def saveFrameStateRequested(self, *args, **kwargs):
        """ QWebPage.saveFrameStateRequested[QWebFrame, QWebHistoryItem] [signal] """
        pass

    def scrollRequested(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.scrollRequested[int, int, QRect] [signal] """
        pass

    def selectedText(self):  # real signature unknown; restored from __doc__
        """ QWebPage.selectedText() -> QString """
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.selectionChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setContentEditable(self, bool):
        """ QWebPage.setContentEditable(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setForwardUnsupportedContent(self, bool):
        """ QWebPage.setForwardUnsupportedContent(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setLinkDelegationPolicy(self, QWebPage_LinkDelegationPolicy):
        """ QWebPage.setLinkDelegationPolicy(QWebPage.LinkDelegationPolicy) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessManager(self, QNetworkAccessManager):
        """ QWebPage.setNetworkAccessManager(QNetworkAccessManager) """
        pass

    # real signature unknown; restored from __doc__
    def setPalette(self, QPalette):
        """ QWebPage.setPalette(QPalette) """
        pass

    # real signature unknown; restored from __doc__
    def setPluginFactory(self, QWebPluginFactory):
        """ QWebPage.setPluginFactory(QWebPluginFactory) """
        pass

    # real signature unknown; restored from __doc__
    def setPreferredContentsSize(self, QSize):
        """ QWebPage.setPreferredContentsSize(QSize) """
        pass

    def settings(self):  # real signature unknown; restored from __doc__
        """ QWebPage.settings() -> QWebSettings """
        return QWebSettings

    # real signature unknown; restored from __doc__
    def setView(self, QWidget):
        """ QWebPage.setView(QWidget) """
        pass

    # real signature unknown; restored from __doc__
    def setViewportSize(self, QSize):
        """ QWebPage.setViewportSize(QSize) """
        pass

    # real signature unknown; restored from __doc__
    def shouldInterruptJavaScript(self):
        """ QWebPage.shouldInterruptJavaScript() -> bool """
        return False

    def statusBarMessage(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.statusBarMessage[QString] [signal] """
        pass

    # real signature unknown
    def statusBarVisibilityChangeRequested(self, *args, **kwargs):
        """ QWebPage.statusBarVisibilityChangeRequested[bool] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def supportsExtension(self, QWebPage_Extension):
        """ QWebPage.supportsExtension(QWebPage.Extension) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def swallowContextMenuEvent(self, QContextMenuEvent):
        """ QWebPage.swallowContextMenuEvent(QContextMenuEvent) -> bool """
        return False

    # real signature unknown
    def toolBarVisibilityChangeRequested(self, *args, **kwargs):
        """ QWebPage.toolBarVisibilityChangeRequested[bool] [signal] """
        pass

    def totalBytes(self):  # real signature unknown; restored from __doc__
        """ QWebPage.totalBytes() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def triggerAction(self, QWebPage_WebAction, bool_checked=False):
        """ QWebPage.triggerAction(QWebPage.WebAction, bool checked=False) """
        pass

    def undoStack(self):  # real signature unknown; restored from __doc__
        """ QWebPage.undoStack() -> QUndoStack """
        pass

    def unsupportedContent(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.unsupportedContent[QNetworkReply] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def updatePositionDependentActions(self, QPoint):
        """ QWebPage.updatePositionDependentActions(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def userAgentForUrl(self, QUrl):
        """ QWebPage.userAgentForUrl(QUrl) -> QString """
        pass

    def view(self):  # real signature unknown; restored from __doc__
        """ QWebPage.view() -> QWidget """
        pass

    def viewportSize(self):  # real signature unknown; restored from __doc__
        """ QWebPage.viewportSize() -> QSize """
        pass

    def WebAction(self, *args, **kwargs):  # real signature unknown
        pass

    def WebWindowType(self, *args, **kwargs):  # real signature unknown
        pass

    def windowCloseRequested(self, *args, **kwargs):  # real signature unknown
        """ QWebPage.windowCloseRequested[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    AlignCenter = 63
    AlignJustified = 64
    AlignLeft = 65
    AlignRight = 66
    Back = 8
    ChooseMultipleFilesExtension = 0
    Copy = 13
    CopyImageToClipboard = 7
    CopyLinkToClipboard = 4
    Cut = 12
    DelegateAllLinks = 2
    DelegateExternalLinks = 1
    DeleteEndOfWord = 42
    DeleteStartOfWord = 41
    DontDelegateLinks = 0
    DownloadImageToDisk = 6
    DownloadLinkToDisk = 3
    ErrorPageExtension = 1
    FindBackward = 1
    FindCaseSensitively = 2
    FindWrapsAroundDocument = 4
    Forward = 9
    HighlightAllOccurrences = 8
    Http = 1
    Indent = 61
    InsertLineSeparator = 51
    InsertOrderedList = 60
    InsertParagraphSeparator = 50
    InsertUnorderedList = 59
    InspectElement = 49
    MoveToEndOfBlock = 26
    MoveToEndOfDocument = 28
    MoveToEndOfLine = 24
    MoveToNextChar = 17
    MoveToNextLine = 21
    MoveToNextWord = 19
    MoveToPreviousChar = 18
    MoveToPreviousLine = 22
    MoveToPreviousWord = 20
    MoveToStartOfBlock = 25
    MoveToStartOfDocument = 27
    MoveToStartOfLine = 23
    NavigationTypeBackOrForward = 2
    NavigationTypeFormResubmitted = 4
    NavigationTypeFormSubmitted = 1
    NavigationTypeLinkClicked = 0
    NavigationTypeOther = 5
    NavigationTypeReload = 3
    NoWebAction = -1
    OpenFrameInNewWindow = 2
    OpenImageInNewWindow = 5
    OpenLink = 0
    OpenLinkInNewWindow = 1
    Outdent = 62
    Paste = 14
    PasteAndMatchStyle = 54
    QtNetwork = 0
    Redo = 16
    Reload = 11
    ReloadAndBypassCache = 53
    RemoveFormat = 55
    SelectAll = 52
    SelectEndOfBlock = 38
    SelectEndOfDocument = 40
    SelectEndOfLine = 36
    SelectNextChar = 29
    SelectNextLine = 33
    SelectNextWord = 31
    SelectPreviousChar = 30
    SelectPreviousLine = 34
    SelectPreviousWord = 32
    SelectStartOfBlock = 37
    SelectStartOfDocument = 39
    SelectStartOfLine = 35
    SetTextDirectionDefault = 43
    SetTextDirectionLeftToRight = 44
    SetTextDirectionRightToLeft = 45
    Stop = 10
    StopScheduledPageRefresh = 67
    ToggleBold = 46
    ToggleItalic = 47
    ToggleStrikethrough = 56
    ToggleSubscript = 57
    ToggleSuperscript = 58
    ToggleUnderline = 48
    Undo = 15
    WebBrowserWindow = 0
    WebKit = 2
    WebModalDialog = 1


class QWebPluginFactory(__PyQt4_QtCore.QObject):

    """ QWebPluginFactory(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def create(self, QString, QUrl, QStringList, QStringList_1):
        """ QWebPluginFactory.create(QString, QUrl, QStringList, QStringList) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def extension(self, QWebPluginFactory_Extension, QWebPluginFactory_ExtensionOption_option=None, QWebPluginFactory_ExtensionReturn_output=None):
        """ QWebPluginFactory.extension(QWebPluginFactory.Extension, QWebPluginFactory.ExtensionOption option=None, QWebPluginFactory.ExtensionReturn output=None) -> bool """
        return False

    def Extension(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ExtensionOption(self, QWebPluginFactory_ExtensionOption=None):
        """
        QWebPluginFactory.ExtensionOption()
        QWebPluginFactory.ExtensionOption(QWebPluginFactory.ExtensionOption)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ExtensionReturn(self, QWebPluginFactory_ExtensionReturn=None):
        """
        QWebPluginFactory.ExtensionReturn()
        QWebPluginFactory.ExtensionReturn(QWebPluginFactory.ExtensionReturn)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def MimeType(self, QWebPluginFactory_MimeType=None):
        """
        QWebPluginFactory.MimeType()
        QWebPluginFactory.MimeType(QWebPluginFactory.MimeType)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Plugin(self, QWebPluginFactory_Plugin=None):
        """
        QWebPluginFactory.Plugin()
        QWebPluginFactory.Plugin(QWebPluginFactory.Plugin)
        """
        pass

    def plugins(self):  # real signature unknown; restored from __doc__
        """ QWebPluginFactory.plugins() -> list-of-QWebPluginFactory.Plugin """
        pass

    def refreshPlugins(self):  # real signature unknown; restored from __doc__
        """ QWebPluginFactory.refreshPlugins() """
        pass

    # real signature unknown; restored from __doc__
    def supportsExtension(self, QWebPluginFactory_Extension):
        """ QWebPluginFactory.supportsExtension(QWebPluginFactory.Extension) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QWebSecurityOrigin():  # skipped bases: <type 'sip.simplewrapper'>

    """ QWebSecurityOrigin(QWebSecurityOrigin) """
    # real signature unknown; restored from __doc__

    def addLocalScheme(self, QString):
        """ QWebSecurityOrigin.addLocalScheme(QString) """
        pass

    def allOrigins(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.allOrigins() -> list-of-QWebSecurityOrigin """
        pass

    def databaseQuota(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.databaseQuota() -> int """
        return 0

    def databases(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.databases() -> list-of-QWebDatabase """
        pass

    def databaseUsage(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.databaseUsage() -> int """
        return 0

    def host(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.host() -> QString """
        pass

    def localSchemes(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.localSchemes() -> QStringList """
        pass

    def port(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.port() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def removeLocalScheme(self, QString):
        """ QWebSecurityOrigin.removeLocalScheme(QString) """
        pass

    def scheme(self):  # real signature unknown; restored from __doc__
        """ QWebSecurityOrigin.scheme() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setDatabaseQuota(self, p_int):
        """ QWebSecurityOrigin.setDatabaseQuota(int) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWebSecurityOrigin):
        pass

    __weakref__ = property(lambda self: object())  # default


class QWebSettings():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc
    # real signature unknown; restored from __doc__

    def clearIconDatabase(self):
        """ QWebSettings.clearIconDatabase() """
        pass

    # real signature unknown; restored from __doc__
    def clearMemoryCaches(self):
        """ QWebSettings.clearMemoryCaches() """
        pass

    # real signature unknown; restored from __doc__
    def defaultTextEncoding(self):
        """ QWebSettings.defaultTextEncoding() -> QString """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def enablePersistentStorage(self, QString_path=None, *args, **kwargs):
        """ QWebSettings.enablePersistentStorage(QString path=QString()) """
        pass

    # real signature unknown; restored from __doc__
    def fontFamily(self, QWebSettings_FontFamily):
        """ QWebSettings.fontFamily(QWebSettings.FontFamily) -> QString """
        pass

    def FontFamily(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def fontSize(self, QWebSettings_FontSize):
        """ QWebSettings.fontSize(QWebSettings.FontSize) -> int """
        return 0

    def FontSize(self, *args, **kwargs):  # real signature unknown
        pass

    def globalSettings(self):  # real signature unknown; restored from __doc__
        """ QWebSettings.globalSettings() -> QWebSettings """
        return QWebSettings

    # real signature unknown; restored from __doc__
    def iconDatabasePath(self):
        """ QWebSettings.iconDatabasePath() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def iconForUrl(self, QUrl):
        """ QWebSettings.iconForUrl(QUrl) -> QIcon """
        pass

    # real signature unknown; restored from __doc__
    def localStoragePath(self):
        """ QWebSettings.localStoragePath() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def maximumPagesInCache(self):
        """ QWebSettings.maximumPagesInCache() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def offlineStorageDefaultQuota(self):
        """ QWebSettings.offlineStorageDefaultQuota() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def offlineStoragePath(self):
        """ QWebSettings.offlineStoragePath() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def offlineWebApplicationCachePath(self):
        """ QWebSettings.offlineWebApplicationCachePath() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def offlineWebApplicationCacheQuota(self):
        """ QWebSettings.offlineWebApplicationCacheQuota() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def resetAttribute(self, QWebSettings_WebAttribute):
        """ QWebSettings.resetAttribute(QWebSettings.WebAttribute) """
        pass

    # real signature unknown; restored from __doc__
    def resetFontFamily(self, QWebSettings_FontFamily):
        """ QWebSettings.resetFontFamily(QWebSettings.FontFamily) """
        pass

    # real signature unknown; restored from __doc__
    def resetFontSize(self, QWebSettings_FontSize):
        """ QWebSettings.resetFontSize(QWebSettings.FontSize) """
        pass

    # real signature unknown; restored from __doc__
    def setAttribute(self, QWebSettings_WebAttribute, bool):
        """ QWebSettings.setAttribute(QWebSettings.WebAttribute, bool) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultTextEncoding(self, QString):
        """ QWebSettings.setDefaultTextEncoding(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setFontFamily(self, QWebSettings_FontFamily, QString):
        """ QWebSettings.setFontFamily(QWebSettings.FontFamily, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setFontSize(self, QWebSettings_FontSize, p_int):
        """ QWebSettings.setFontSize(QWebSettings.FontSize, int) """
        pass

    # real signature unknown; restored from __doc__
    def setIconDatabasePath(self, QString):
        """ QWebSettings.setIconDatabasePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setLocalStoragePath(self, QString):
        """ QWebSettings.setLocalStoragePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setMaximumPagesInCache(self, p_int):
        """ QWebSettings.setMaximumPagesInCache(int) """
        pass

    # real signature unknown; restored from __doc__
    def setObjectCacheCapacities(self, p_int, p_int_1, p_int_2):
        """ QWebSettings.setObjectCacheCapacities(int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setOfflineStorageDefaultQuota(self, p_int):
        """ QWebSettings.setOfflineStorageDefaultQuota(int) """
        pass

    # real signature unknown; restored from __doc__
    def setOfflineStoragePath(self, QString):
        """ QWebSettings.setOfflineStoragePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOfflineWebApplicationCachePath(self, QString):
        """ QWebSettings.setOfflineWebApplicationCachePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOfflineWebApplicationCacheQuota(self, p_int):
        """ QWebSettings.setOfflineWebApplicationCacheQuota(int) """
        pass

    # real signature unknown; restored from __doc__
    def setUserStyleSheetUrl(self, QUrl):
        """ QWebSettings.setUserStyleSheetUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setWebGraphic(self, QWebSettings_WebGraphic, QPixmap):
        """ QWebSettings.setWebGraphic(QWebSettings.WebGraphic, QPixmap) """
        pass

    # real signature unknown; restored from __doc__
    def testAttribute(self, QWebSettings_WebAttribute):
        """ QWebSettings.testAttribute(QWebSettings.WebAttribute) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def userStyleSheetUrl(self):
        """ QWebSettings.userStyleSheetUrl() -> QUrl """
        pass

    def WebAttribute(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def webGraphic(self, QWebSettings_WebGraphic):
        """ QWebSettings.webGraphic(QWebSettings.WebGraphic) -> QPixmap """
        pass

    def WebGraphic(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    AcceleratedCompositingEnabled = 17
    AutoLoadImages = 0
    CursiveFont = 4
    DefaultFixedFontSize = 3
    DefaultFontSize = 2
    DefaultFrameIconGraphic = 2
    DeveloperExtrasEnabled = 7
    DnsPrefetchEnabled = 15
    FantasyFont = 5
    FixedFont = 1
    FrameFlatteningEnabled = 21
    JavaEnabled = 2
    JavascriptCanAccessClipboard = 6
    JavascriptCanOpenWindows = 5
    JavascriptEnabled = 1
    LinksIncludedInFocusChain = 8
    LocalContentCanAccessFileUrls = 19
    LocalContentCanAccessRemoteUrls = 14
    LocalStorageDatabaseEnabled = 13
    LocalStorageEnabled = 13
    MinimumFontSize = 0
    MinimumLogicalFontSize = 1
    MissingImageGraphic = 0
    MissingPluginGraphic = 1
    OfflineStorageDatabaseEnabled = 11
    OfflineWebApplicationCacheEnabled = 12
    PluginsEnabled = 3
    PrintElementBackgrounds = 10
    PrivateBrowsingEnabled = 4
    SansSerifFont = 3
    SerifFont = 2
    SiteSpecificQuirksEnabled = 22
    SpatialNavigationEnabled = 18
    StandardFont = 0
    TextAreaSizeGripCornerGraphic = 3
    TiledBackingStoreEnabled = 20
    XSSAuditingEnabled = 16
    ZoomTextOnly = 9


class QWebView(__PyQt4_QtGui.QWidget):

    """ QWebView(QWidget parent=None) """

    def back(self):  # real signature unknown; restored from __doc__
        """ QWebView.back() """
        pass

    # real signature unknown; restored from __doc__
    def changeEvent(self, QEvent):
        """ QWebView.changeEvent(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def contextMenuEvent(self, QContextMenuEvent):
        """ QWebView.contextMenuEvent(QContextMenuEvent) """
        pass

    # real signature unknown; restored from __doc__
    def createWindow(self, QWebPage_WebWindowType):
        """ QWebView.createWindow(QWebPage.WebWindowType) -> QWebView """
        return QWebView

    # real signature unknown; restored from __doc__
    def dragEnterEvent(self, QDragEnterEvent):
        """ QWebView.dragEnterEvent(QDragEnterEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragLeaveEvent(self, QDragLeaveEvent):
        """ QWebView.dragLeaveEvent(QDragLeaveEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragMoveEvent(self, QDragMoveEvent):
        """ QWebView.dragMoveEvent(QDragMoveEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dropEvent(self, QDropEvent):
        """ QWebView.dropEvent(QDropEvent) """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QWebView.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def findText(self, QString, QWebPage_FindFlags_options=0):
        """ QWebView.findText(QString, QWebPage.FindFlags options=0) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusInEvent(self, QFocusEvent):
        """ QWebView.focusInEvent(QFocusEvent) """
        pass

    # real signature unknown; restored from __doc__
    def focusNextPrevChild(self, bool):
        """ QWebView.focusNextPrevChild(bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusOutEvent(self, QFocusEvent):
        """ QWebView.focusOutEvent(QFocusEvent) """
        pass

    def forward(self):  # real signature unknown; restored from __doc__
        """ QWebView.forward() """
        pass

    def history(self):  # real signature unknown; restored from __doc__
        """ QWebView.history() -> QWebHistory """
        return QWebHistory

    def icon(self):  # real signature unknown; restored from __doc__
        """ QWebView.icon() -> QIcon """
        pass

    def iconChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebView.iconChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def inputMethodEvent(self, QInputMethodEvent):
        """ QWebView.inputMethodEvent(QInputMethodEvent) """
        pass

    # real signature unknown; restored from __doc__
    def inputMethodQuery(self, Qt_InputMethodQuery):
        """ QWebView.inputMethodQuery(Qt.InputMethodQuery) -> QVariant """
        pass

    def isModified(self):  # real signature unknown; restored from __doc__
        """ QWebView.isModified() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def keyPressEvent(self, QKeyEvent):
        """ QWebView.keyPressEvent(QKeyEvent) """
        pass

    # real signature unknown; restored from __doc__
    def keyReleaseEvent(self, QKeyEvent):
        """ QWebView.keyReleaseEvent(QKeyEvent) """
        pass

    def linkClicked(self, *args, **kwargs):  # real signature unknown
        """ QWebView.linkClicked[QUrl] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def load(self, *__args):
        """
        QWebView.load(QUrl)
        QWebView.load(QNetworkRequest, QNetworkAccessManager.Operation operation=QNetworkAccessManager.GetOperation, QByteArray body=QByteArray())
        """
        pass

    def loadFinished(self, *args, **kwargs):  # real signature unknown
        """ QWebView.loadFinished[bool] [signal] """
        pass

    def loadProgress(self, *args, **kwargs):  # real signature unknown
        """ QWebView.loadProgress[int] [signal] """
        pass

    def loadStarted(self, *args, **kwargs):  # real signature unknown
        """ QWebView.loadStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def mouseDoubleClickEvent(self, QMouseEvent):
        """ QWebView.mouseDoubleClickEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseMoveEvent(self, QMouseEvent):
        """ QWebView.mouseMoveEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mousePressEvent(self, QMouseEvent):
        """ QWebView.mousePressEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseReleaseEvent(self, QMouseEvent):
        """ QWebView.mouseReleaseEvent(QMouseEvent) """
        pass

    def page(self):  # real signature unknown; restored from __doc__
        """ QWebView.page() -> QWebPage """
        return QWebPage

    # real signature unknown; restored from __doc__
    def pageAction(self, QWebPage_WebAction):
        """ QWebView.pageAction(QWebPage.WebAction) -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def paintEvent(self, QPaintEvent):
        """ QWebView.paintEvent(QPaintEvent) """
        pass

    # real signature unknown; restored from __doc__
    def print_(self, QPrinter):
        """ QWebView.print_(QPrinter) """
        pass

    def reload(self):  # real signature unknown; restored from __doc__
        """ QWebView.reload() """
        pass

    def renderHints(self):  # real signature unknown; restored from __doc__
        """ QWebView.renderHints() -> QPainter.RenderHints """
        pass

    # real signature unknown; restored from __doc__
    def resizeEvent(self, QResizeEvent):
        """ QWebView.resizeEvent(QResizeEvent) """
        pass

    def selectedText(self):  # real signature unknown; restored from __doc__
        """ QWebView.selectedText() -> QString """
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebView.selectionChanged[] [signal] """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setContent(self, QByteArray, QString_mimeType=None, *args, **kwargs):
        """ QWebView.setContent(QByteArray, QString mimeType=QString(), QUrl baseUrl=QUrl()) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setHtml(self, QString, QUrl_baseUrl=None, *args, **kwargs):
        """ QWebView.setHtml(QString, QUrl baseUrl=QUrl()) """
        pass

    # real signature unknown; restored from __doc__
    def setPage(self, QWebPage):
        """ QWebView.setPage(QWebPage) """
        pass

    # real signature unknown; restored from __doc__
    def setRenderHint(self, QPainter_RenderHint, bool_enabled=True):
        """ QWebView.setRenderHint(QPainter.RenderHint, bool enabled=True) """
        pass

    # real signature unknown; restored from __doc__
    def setRenderHints(self, QPainter_RenderHints):
        """ QWebView.setRenderHints(QPainter.RenderHints) """
        pass

    # real signature unknown; restored from __doc__
    def setTextSizeMultiplier(self, p_float):
        """ QWebView.setTextSizeMultiplier(float) """
        pass

    def settings(self):  # real signature unknown; restored from __doc__
        """ QWebView.settings() -> QWebSettings """
        return QWebSettings

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QWebView.setUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def setZoomFactor(self, p_float):
        """ QWebView.setZoomFactor(float) """
        pass

    def sizeHint(self):  # real signature unknown; restored from __doc__
        """ QWebView.sizeHint() -> QSize """
        pass

    def statusBarMessage(self, *args, **kwargs):  # real signature unknown
        """ QWebView.statusBarMessage[QString] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QWebView.stop() """
        pass

    # real signature unknown; restored from __doc__
    def textSizeMultiplier(self):
        """ QWebView.textSizeMultiplier() -> float """
        return 0.0

    def title(self):  # real signature unknown; restored from __doc__
        """ QWebView.title() -> QString """
        pass

    def titleChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebView.titleChanged[QString] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def triggerPageAction(self, QWebPage_WebAction, bool_checked=False):
        """ QWebView.triggerPageAction(QWebPage.WebAction, bool checked=False) """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QWebView.url() -> QUrl """
        pass

    def urlChanged(self, *args, **kwargs):  # real signature unknown
        """ QWebView.urlChanged[QUrl] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def wheelEvent(self, QWheelEvent):
        """ QWebView.wheelEvent(QWheelEvent) """
        pass

    def zoomFactor(self):  # real signature unknown; restored from __doc__
        """ QWebView.zoomFactor() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget_parent=None):
        pass

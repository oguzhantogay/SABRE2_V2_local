# encoding: utf-8
# module PyQt4.QtXmlPatterns
# from /usr/lib/python2.7/dist-packages/PyQt4/QtXmlPatterns.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore


# no functions
# classes

class QAbstractMessageHandler(__PyQt4_QtCore.QObject):

    """ QAbstractMessageHandler(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def handleMessage(self, QtMsgType, QString, QUrl, QSourceLocation):
        """ QAbstractMessageHandler.handleMessage(QtMsgType, QString, QUrl, QSourceLocation) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def message(self, QtMsgType, QString, QUrl_identifier=None, *args, **kwargs):
        """ QAbstractMessageHandler.message(QtMsgType, QString, QUrl identifier=QUrl(), QSourceLocation sourceLocation=QSourceLocation()) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractUriResolver(__PyQt4_QtCore.QObject):

    """ QAbstractUriResolver(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def resolve(self, QUrl, QUrl_1):
        """ QAbstractUriResolver.resolve(QUrl, QUrl) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractXmlNodeModel():  # skipped bases: <type 'sip.simplewrapper'>

    """ QAbstractXmlNodeModel() """
    # real signature unknown; restored from __doc__

    def attributes(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.attributes(QXmlNodeModelIndex) -> list-of-QXmlNodeModelIndex """
        pass

    # real signature unknown; restored from __doc__
    def baseUri(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.baseUri(QXmlNodeModelIndex) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def compareOrder(self, QXmlNodeModelIndex, QXmlNodeModelIndex_1):
        """ QAbstractXmlNodeModel.compareOrder(QXmlNodeModelIndex, QXmlNodeModelIndex) -> QXmlNodeModelIndex.DocumentOrder """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def createIndex(self, *__args):
        """
        QAbstractXmlNodeModel.createIndex(int) -> QXmlNodeModelIndex
        QAbstractXmlNodeModel.createIndex(int, int) -> QXmlNodeModelIndex
        QAbstractXmlNodeModel.createIndex(object, int additionalData=0) -> QXmlNodeModelIndex
        """
        return QXmlNodeModelIndex

    # real signature unknown; restored from __doc__
    def documentUri(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.documentUri(QXmlNodeModelIndex) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def elementById(self, QXmlName):
        """ QAbstractXmlNodeModel.elementById(QXmlName) -> QXmlNodeModelIndex """
        return QXmlNodeModelIndex

    # real signature unknown; restored from __doc__
    def kind(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.kind(QXmlNodeModelIndex) -> QXmlNodeModelIndex.NodeKind """
        pass

    # real signature unknown; restored from __doc__
    def name(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.name(QXmlNodeModelIndex) -> QXmlName """
        return QXmlName

    # real signature unknown; restored from __doc__
    def namespaceBindings(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.namespaceBindings(QXmlNodeModelIndex) -> list-of-QXmlName """
        pass

    # real signature unknown; restored from __doc__
    def nextFromSimpleAxis(self, QAbstractXmlNodeModel_SimpleAxis, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.nextFromSimpleAxis(QAbstractXmlNodeModel.SimpleAxis, QXmlNodeModelIndex) -> QXmlNodeModelIndex """
        return QXmlNodeModelIndex

    # real signature unknown; restored from __doc__
    def nodesByIdref(self, QXmlName):
        """ QAbstractXmlNodeModel.nodesByIdref(QXmlName) -> list-of-QXmlNodeModelIndex """
        pass

    # real signature unknown; restored from __doc__
    def root(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.root(QXmlNodeModelIndex) -> QXmlNodeModelIndex """
        return QXmlNodeModelIndex

    def SimpleAxis(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def sourceLocation(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.sourceLocation(QXmlNodeModelIndex) -> QSourceLocation """
        return QSourceLocation

    # real signature unknown; restored from __doc__
    def stringValue(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.stringValue(QXmlNodeModelIndex) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def typedValue(self, QXmlNodeModelIndex):
        """ QAbstractXmlNodeModel.typedValue(QXmlNodeModelIndex) -> QVariant """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default

    FirstChild = 1
    NextSibling = 3
    Parent = 0
    PreviousSibling = 2


class QAbstractXmlReceiver():  # skipped bases: <type 'sip.simplewrapper'>

    """ QAbstractXmlReceiver() """
    # real signature unknown; restored from __doc__

    def atomicValue(self, QVariant):
        """ QAbstractXmlReceiver.atomicValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def attribute(self, QXmlName, QStringRef):
        """ QAbstractXmlReceiver.attribute(QXmlName, QStringRef) """
        pass

    # real signature unknown; restored from __doc__
    def characters(self, QStringRef):
        """ QAbstractXmlReceiver.characters(QStringRef) """
        pass

    # real signature unknown; restored from __doc__
    def comment(self, QString):
        """ QAbstractXmlReceiver.comment(QString) """
        pass

    def endDocument(self):  # real signature unknown; restored from __doc__
        """ QAbstractXmlReceiver.endDocument() """
        pass

    def endElement(self):  # real signature unknown; restored from __doc__
        """ QAbstractXmlReceiver.endElement() """
        pass

    def endOfSequence(self):  # real signature unknown; restored from __doc__
        """ QAbstractXmlReceiver.endOfSequence() """
        pass

    # real signature unknown; restored from __doc__
    def namespaceBinding(self, QXmlName):
        """ QAbstractXmlReceiver.namespaceBinding(QXmlName) """
        pass

    # real signature unknown; restored from __doc__
    def processingInstruction(self, QXmlName, QString):
        """ QAbstractXmlReceiver.processingInstruction(QXmlName, QString) """
        pass

    def startDocument(self):  # real signature unknown; restored from __doc__
        """ QAbstractXmlReceiver.startDocument() """
        pass

    # real signature unknown; restored from __doc__
    def startElement(self, QXmlName):
        """ QAbstractXmlReceiver.startElement(QXmlName) """
        pass

    def startOfSequence(self):  # real signature unknown; restored from __doc__
        """ QAbstractXmlReceiver.startOfSequence() """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default


class QSimpleXmlNodeModel(QAbstractXmlNodeModel):

    """ QSimpleXmlNodeModel(QXmlNamePool) """
    # real signature unknown; restored from __doc__

    def baseUri(self, QXmlNodeModelIndex):
        """ QSimpleXmlNodeModel.baseUri(QXmlNodeModelIndex) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def elementById(self, QXmlName):
        """ QSimpleXmlNodeModel.elementById(QXmlName) -> QXmlNodeModelIndex """
        return QXmlNodeModelIndex

    def namePool(self):  # real signature unknown; restored from __doc__
        """ QSimpleXmlNodeModel.namePool() -> QXmlNamePool """
        return QXmlNamePool

    # real signature unknown; restored from __doc__
    def namespaceBindings(self, QXmlNodeModelIndex):
        """ QSimpleXmlNodeModel.namespaceBindings(QXmlNodeModelIndex) -> list-of-QXmlName """
        pass

    # real signature unknown; restored from __doc__
    def nodesByIdref(self, QXmlName):
        """ QSimpleXmlNodeModel.nodesByIdref(QXmlName) -> list-of-QXmlNodeModelIndex """
        pass

    # real signature unknown; restored from __doc__
    def stringValue(self, QXmlNodeModelIndex):
        """ QSimpleXmlNodeModel.stringValue(QXmlNodeModelIndex) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QXmlNamePool):
        pass


class QSourceLocation():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSourceLocation()
    QSourceLocation(QSourceLocation)
    QSourceLocation(QUrl, int line=-1, int column=-1)
    """

    def column(self):  # real signature unknown; restored from __doc__
        """ QSourceLocation.column() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSourceLocation.isNull() -> bool """
        return False

    def line(self):  # real signature unknown; restored from __doc__
        """ QSourceLocation.line() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setColumn(self, p_int):
        """ QSourceLocation.setColumn(int) """
        pass

    def setLine(self, p_int):  # real signature unknown; restored from __doc__
        """ QSourceLocation.setLine(int) """
        pass

    def setUri(self, QUrl):  # real signature unknown; restored from __doc__
        """ QSourceLocation.setUri(QUrl) """
        pass

    def uri(self):  # real signature unknown; restored from __doc__
        """ QSourceLocation.uri() -> QUrl """
        pass

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


class QXmlSerializer(QAbstractXmlReceiver):

    """ QXmlSerializer(QXmlQuery, QIODevice) """
    # real signature unknown; restored from __doc__

    def atomicValue(self, QVariant):
        """ QXmlSerializer.atomicValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def attribute(self, QXmlName, QStringRef):
        """ QXmlSerializer.attribute(QXmlName, QStringRef) """
        pass

    # real signature unknown; restored from __doc__
    def characters(self, QStringRef):
        """ QXmlSerializer.characters(QStringRef) """
        pass

    def codec(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.codec() -> QTextCodec """
        pass

    # real signature unknown; restored from __doc__
    def comment(self, QString):
        """ QXmlSerializer.comment(QString) """
        pass

    def endDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.endDocument() """
        pass

    def endElement(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.endElement() """
        pass

    def endOfSequence(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.endOfSequence() """
        pass

    # real signature unknown; restored from __doc__
    def namespaceBinding(self, QXmlName):
        """ QXmlSerializer.namespaceBinding(QXmlName) """
        pass

    def outputDevice(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.outputDevice() -> QIODevice """
        pass

    # real signature unknown; restored from __doc__
    def processingInstruction(self, QXmlName, QString):
        """ QXmlSerializer.processingInstruction(QXmlName, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setCodec(self, QTextCodec):
        """ QXmlSerializer.setCodec(QTextCodec) """
        pass

    def startDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.startDocument() """
        pass

    # real signature unknown; restored from __doc__
    def startElement(self, QXmlName):
        """ QXmlSerializer.startElement(QXmlName) """
        pass

    def startOfSequence(self):  # real signature unknown; restored from __doc__
        """ QXmlSerializer.startOfSequence() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QXmlQuery, QIODevice):
        pass


class QXmlFormatter(QXmlSerializer):

    """ QXmlFormatter(QXmlQuery, QIODevice) """
    # real signature unknown; restored from __doc__

    def atomicValue(self, QVariant):
        """ QXmlFormatter.atomicValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def attribute(self, QXmlName, QStringRef):
        """ QXmlFormatter.attribute(QXmlName, QStringRef) """
        pass

    # real signature unknown; restored from __doc__
    def characters(self, QStringRef):
        """ QXmlFormatter.characters(QStringRef) """
        pass

    # real signature unknown; restored from __doc__
    def comment(self, QString):
        """ QXmlFormatter.comment(QString) """
        pass

    def endDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlFormatter.endDocument() """
        pass

    def endElement(self):  # real signature unknown; restored from __doc__
        """ QXmlFormatter.endElement() """
        pass

    def endOfSequence(self):  # real signature unknown; restored from __doc__
        """ QXmlFormatter.endOfSequence() """
        pass

    # real signature unknown; restored from __doc__
    def indentationDepth(self):
        """ QXmlFormatter.indentationDepth() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def processingInstruction(self, QXmlName, QString):
        """ QXmlFormatter.processingInstruction(QXmlName, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationDepth(self, p_int):
        """ QXmlFormatter.setIndentationDepth(int) """
        pass

    def startDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlFormatter.startDocument() """
        pass

    # real signature unknown; restored from __doc__
    def startElement(self, QXmlName):
        """ QXmlFormatter.startElement(QXmlName) """
        pass

    def startOfSequence(self):  # real signature unknown; restored from __doc__
        """ QXmlFormatter.startOfSequence() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QXmlQuery, QIODevice):
        pass


class QXmlItem():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlItem()
    QXmlItem(QXmlItem)
    QXmlItem(QXmlNodeModelIndex)
    QXmlItem(QVariant)
    """

    def isAtomicValue(self):  # real signature unknown; restored from __doc__
        """ QXmlItem.isAtomicValue() -> bool """
        return False

    def isNode(self):  # real signature unknown; restored from __doc__
        """ QXmlItem.isNode() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QXmlItem.isNull() -> bool """
        return False

    def toAtomicValue(self):  # real signature unknown; restored from __doc__
        """ QXmlItem.toAtomicValue() -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def toNodeModelIndex(self):
        """ QXmlItem.toNodeModelIndex() -> QXmlNodeModelIndex """
        return QXmlNodeModelIndex

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


class QXmlName():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlName()
    QXmlName(QXmlNamePool, QString, QString namespaceUri=QString(), QString prefix=QString())
    QXmlName(QXmlName)
    """
    # real signature unknown; restored from __doc__

    def fromClarkName(self, QString, QXmlNamePool):
        """ QXmlName.fromClarkName(QString, QXmlNamePool) -> QXmlName """
        return QXmlName

    # real signature unknown; restored from __doc__
    def isNCName(self, QString):
        """ QXmlName.isNCName(QString) -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QXmlName.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def localName(self, QXmlNamePool):
        """ QXmlName.localName(QXmlNamePool) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def namespaceUri(self, QXmlNamePool):
        """ QXmlName.namespaceUri(QXmlNamePool) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def prefix(self, QXmlNamePool):
        """ QXmlName.prefix(QXmlNamePool) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def toClarkName(self, QXmlNamePool):
        """ QXmlName.toClarkName(QXmlNamePool) -> QString """
        pass

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


class QXmlNamePool():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlNamePool()
    QXmlNamePool(QXmlNamePool)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def __init__(self, QXmlNamePool=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QXmlNodeModelIndex():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlNodeModelIndex()
    QXmlNodeModelIndex(QXmlNodeModelIndex)
    """

    def additionalData(self):  # real signature unknown; restored from __doc__
        """ QXmlNodeModelIndex.additionalData() -> int """
        return 0

    def data(self):  # real signature unknown; restored from __doc__
        """ QXmlNodeModelIndex.data() -> int """
        return 0

    def DocumentOrder(self, *args, **kwargs):  # real signature unknown
        pass

    def internalPointer(self):  # real signature unknown; restored from __doc__
        """ QXmlNodeModelIndex.internalPointer() -> object """
        return object()

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QXmlNodeModelIndex.isNull() -> bool """
        return False

    def model(self):  # real signature unknown; restored from __doc__
        """ QXmlNodeModelIndex.model() -> QAbstractXmlNodeModel """
        return QAbstractXmlNodeModel

    def NodeKind(self, *args, **kwargs):  # real signature unknown
        pass

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
    def __init__(self, QXmlNodeModelIndex=None):
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

    Attribute = 1
    Comment = 2
    Document = 4
    Element = 8
    Follows = 1
    Is = 0
    Namespace = 16
    Precedes = -1
    ProcessingInstruction = 32
    Text = 64


class QXmlQuery():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlQuery()
    QXmlQuery(QXmlQuery)
    QXmlQuery(QXmlNamePool)
    QXmlQuery(QXmlQuery.QueryLanguage, QXmlNamePool pool=QXmlNamePool())
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def bindVariable(self, *__args):
        """
        QXmlQuery.bindVariable(QXmlName, QXmlItem)
        QXmlQuery.bindVariable(QXmlName, QIODevice)
        QXmlQuery.bindVariable(QXmlName, QXmlQuery)
        QXmlQuery.bindVariable(QString, QXmlItem)
        QXmlQuery.bindVariable(QString, QIODevice)
        QXmlQuery.bindVariable(QString, QXmlQuery)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def evaluateTo(self, *__args):
        """
        QXmlQuery.evaluateTo(QXmlResultItems)
        QXmlQuery.evaluateTo(QAbstractXmlReceiver) -> bool
        QXmlQuery.evaluateTo(QStringList) -> bool
        QXmlQuery.evaluateTo(QIODevice) -> bool
        QXmlQuery.evaluateTo(QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def evaluateToString(self):
        """ QXmlQuery.evaluateToString() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def evaluateToStringList(self):
        """ QXmlQuery.evaluateToStringList() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def initialTemplateName(self):
        """ QXmlQuery.initialTemplateName() -> QXmlName """
        return QXmlName

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QXmlQuery.isValid() -> bool """
        return False

    def messageHandler(self):  # real signature unknown; restored from __doc__
        """ QXmlQuery.messageHandler() -> QAbstractMessageHandler """
        return QAbstractMessageHandler

    def namePool(self):  # real signature unknown; restored from __doc__
        """ QXmlQuery.namePool() -> QXmlNamePool """
        return QXmlNamePool

    # real signature unknown; restored from __doc__
    def networkAccessManager(self):
        """ QXmlQuery.networkAccessManager() -> QNetworkAccessManager """
        pass

    def QueryLanguage(self, *args, **kwargs):  # real signature unknown
        pass

    def queryLanguage(self):  # real signature unknown; restored from __doc__
        """ QXmlQuery.queryLanguage() -> QXmlQuery.QueryLanguage """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setFocus(self, *__args):
        """
        QXmlQuery.setFocus(QXmlItem)
        QXmlQuery.setFocus(QUrl) -> bool
        QXmlQuery.setFocus(QIODevice) -> bool
        QXmlQuery.setFocus(QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def setInitialTemplateName(self, *__args):
        """
        QXmlQuery.setInitialTemplateName(QXmlName)
        QXmlQuery.setInitialTemplateName(QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def setMessageHandler(self, QAbstractMessageHandler):
        """ QXmlQuery.setMessageHandler(QAbstractMessageHandler) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessManager(self, QNetworkAccessManager):
        """ QXmlQuery.setNetworkAccessManager(QNetworkAccessManager) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setQuery(self, *__args):
        """
        QXmlQuery.setQuery(QString, QUrl documentUri=QUrl())
        QXmlQuery.setQuery(QIODevice, QUrl documentUri=QUrl())
        QXmlQuery.setQuery(QUrl, QUrl baseUri=QUrl())
        """
        pass

    # real signature unknown; restored from __doc__
    def setUriResolver(self, QAbstractUriResolver):
        """ QXmlQuery.setUriResolver(QAbstractUriResolver) """
        pass

    def uriResolver(self):  # real signature unknown; restored from __doc__
        """ QXmlQuery.uriResolver() -> QAbstractUriResolver """
        return QAbstractUriResolver

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    XQuery10 = 1
    XSLT20 = 2


class QXmlResultItems():  # skipped bases: <type 'sip.simplewrapper'>

    """ QXmlResultItems() """

    def current(self):  # real signature unknown; restored from __doc__
        """ QXmlResultItems.current() -> QXmlItem """
        return QXmlItem

    def hasError(self):  # real signature unknown; restored from __doc__
        """ QXmlResultItems.hasError() -> bool """
        return False

    def next(self):  # real signature unknown; restored from __doc__
        """ QXmlResultItems.next() -> QXmlItem """
        return QXmlItem

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default


class QXmlSchema():  # skipped bases: <type 'sip.simplewrapper'>

    """ QXmlSchema() """

    def documentUri(self):  # real signature unknown; restored from __doc__
        """ QXmlSchema.documentUri() -> QUrl """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QXmlSchema.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def load(self, *__args):
        """
        QXmlSchema.load(QUrl) -> bool
        QXmlSchema.load(QIODevice, QUrl documentUri=QUrl()) -> bool
        QXmlSchema.load(QByteArray, QUrl documentUri=QUrl()) -> bool
        """
        return False

    def messageHandler(self):  # real signature unknown; restored from __doc__
        """ QXmlSchema.messageHandler() -> QAbstractMessageHandler """
        return QAbstractMessageHandler

    def namePool(self):  # real signature unknown; restored from __doc__
        """ QXmlSchema.namePool() -> QXmlNamePool """
        return QXmlNamePool

    # real signature unknown; restored from __doc__
    def networkAccessManager(self):
        """ QXmlSchema.networkAccessManager() -> QNetworkAccessManager """
        pass

    # real signature unknown; restored from __doc__
    def setMessageHandler(self, QAbstractMessageHandler):
        """ QXmlSchema.setMessageHandler(QAbstractMessageHandler) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessManager(self, QNetworkAccessManager):
        """ QXmlSchema.setNetworkAccessManager(QNetworkAccessManager) """
        pass

    # real signature unknown; restored from __doc__
    def setUriResolver(self, QAbstractUriResolver):
        """ QXmlSchema.setUriResolver(QAbstractUriResolver) """
        pass

    def uriResolver(self):  # real signature unknown; restored from __doc__
        """ QXmlSchema.uriResolver() -> QAbstractUriResolver """
        return QAbstractUriResolver

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default


class QXmlSchemaValidator():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlSchemaValidator()
    QXmlSchemaValidator(QXmlSchema)
    """

    def messageHandler(self):  # real signature unknown; restored from __doc__
        """ QXmlSchemaValidator.messageHandler() -> QAbstractMessageHandler """
        return QAbstractMessageHandler

    def namePool(self):  # real signature unknown; restored from __doc__
        """ QXmlSchemaValidator.namePool() -> QXmlNamePool """
        return QXmlNamePool

    # real signature unknown; restored from __doc__
    def networkAccessManager(self):
        """ QXmlSchemaValidator.networkAccessManager() -> QNetworkAccessManager """
        pass

    def schema(self):  # real signature unknown; restored from __doc__
        """ QXmlSchemaValidator.schema() -> QXmlSchema """
        return QXmlSchema

    # real signature unknown; restored from __doc__
    def setMessageHandler(self, QAbstractMessageHandler):
        """ QXmlSchemaValidator.setMessageHandler(QAbstractMessageHandler) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessManager(self, QNetworkAccessManager):
        """ QXmlSchemaValidator.setNetworkAccessManager(QNetworkAccessManager) """
        pass

    # real signature unknown; restored from __doc__
    def setSchema(self, QXmlSchema):
        """ QXmlSchemaValidator.setSchema(QXmlSchema) """
        pass

    # real signature unknown; restored from __doc__
    def setUriResolver(self, QAbstractUriResolver):
        """ QXmlSchemaValidator.setUriResolver(QAbstractUriResolver) """
        pass

    def uriResolver(self):  # real signature unknown; restored from __doc__
        """ QXmlSchemaValidator.uriResolver() -> QAbstractUriResolver """
        return QAbstractUriResolver

    # real signature unknown; restored from __doc__ with multiple overloads
    def validate(self, *__args):
        """
        QXmlSchemaValidator.validate(QUrl) -> bool
        QXmlSchemaValidator.validate(QIODevice, QUrl documentUri=QUrl()) -> bool
        QXmlSchemaValidator.validate(QByteArray, QUrl documentUri=QUrl()) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QXmlSchema=None):
        pass

    __weakref__ = property(lambda self: object())  # default

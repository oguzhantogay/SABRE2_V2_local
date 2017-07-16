# encoding: utf-8
# module PyQt4.QtHelp
# from /usr/lib/python2.7/dist-packages/PyQt4/QtHelp.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# no functions
# classes

class QHelpContentItem():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def child(self, p_int):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.child(int) -> QHelpContentItem """
        return QHelpContentItem

    def childCount(self):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.childCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def childPosition(self, QHelpContentItem):
        """ QHelpContentItem.childPosition(QHelpContentItem) -> int """
        return 0

    def parent(self):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.parent() -> QHelpContentItem """
        return QHelpContentItem

    def row(self):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.row() -> int """
        return 0

    def title(self):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.title() -> QString """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QHelpContentItem.url() -> QUrl """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QHelpContentModel(__PyQt4_QtCore.QAbstractItemModel):
    # no doc
    # real signature unknown; NOTE: unreliably restored from __doc__

    def columnCount(self, QModelIndex_parent=None, *args, **kwargs):
        """ QHelpContentModel.columnCount(QModelIndex parent=QModelIndex()) -> int """
        pass

    # real signature unknown; restored from __doc__
    def contentItemAt(self, QModelIndex):
        """ QHelpContentModel.contentItemAt(QModelIndex) -> QHelpContentItem """
        return QHelpContentItem

    def contentsCreated(self, *args, **kwargs):  # real signature unknown
        """ QHelpContentModel.contentsCreated[] [signal] """
        pass

    # real signature unknown
    def contentsCreationStarted(self, *args, **kwargs):
        """ QHelpContentModel.contentsCreationStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def createContents(self, QString):
        """ QHelpContentModel.createContents(QString) """
        pass

    # real signature unknown; restored from __doc__
    def data(self, QModelIndex, p_int):
        """ QHelpContentModel.data(QModelIndex, int) -> QVariant """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def index(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QHelpContentModel.index(int, int, QModelIndex parent=QModelIndex()) -> QModelIndex """
        pass

    # real signature unknown; restored from __doc__
    def isCreatingContents(self):
        """ QHelpContentModel.isCreatingContents() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def parent(self, QModelIndex):
        """ QHelpContentModel.parent(QModelIndex) -> QModelIndex """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def rowCount(self, QModelIndex_parent=None, *args, **kwargs):
        """ QHelpContentModel.rowCount(QModelIndex parent=QModelIndex()) -> int """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QHelpContentWidget(__PyQt4_QtGui.QTreeView):
    # no doc

    def indexOf(self, QUrl):  # real signature unknown; restored from __doc__
        """ QHelpContentWidget.indexOf(QUrl) -> QModelIndex """
        pass

    def linkActivated(self, *args, **kwargs):  # real signature unknown
        """ QHelpContentWidget.linkActivated[QUrl] [signal] """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QHelpEngineCore(__PyQt4_QtCore.QObject):

    """ QHelpEngineCore(QString, QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addCustomFilter(self, QString, QStringList):
        """ QHelpEngineCore.addCustomFilter(QString, QStringList) -> bool """
        return False

    def autoSaveFilter(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.autoSaveFilter() -> bool """
        return False

    def collectionFile(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.collectionFile() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def copyCollectionFile(self, QString):
        """ QHelpEngineCore.copyCollectionFile(QString) -> bool """
        return False

    def currentFilter(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.currentFilter() -> QString """
        pass

    def currentFilterChanged(self, *args, **kwargs):  # real signature unknown
        """ QHelpEngineCore.currentFilterChanged[QString] [signal] """
        pass

    def customFilters(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.customFilters() -> QStringList """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def customValue(self, QString, QVariant_defaultValue=None, *args, **kwargs):
        """ QHelpEngineCore.customValue(QString, QVariant defaultValue=QVariant()) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def documentationFileName(self, QString):
        """ QHelpEngineCore.documentationFileName(QString) -> QString """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.error() -> QString """
        pass

    def fileData(self, QUrl):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.fileData(QUrl) -> QByteArray """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def files(self, QString, QStringList, QString_extensionFilter=None, *args, **kwargs):
        """ QHelpEngineCore.files(QString, QStringList, QString extensionFilter=QString()) -> list-of-QUrl """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def filterAttributes(self, QString=None):
        """
        QHelpEngineCore.filterAttributes() -> QStringList
        QHelpEngineCore.filterAttributes(QString) -> QStringList
        """
        pass

    # real signature unknown; restored from __doc__
    def filterAttributeSets(self, QString):
        """ QHelpEngineCore.filterAttributeSets(QString) -> list-of-QStringList """
        pass

    def findFile(self, QUrl):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.findFile(QUrl) -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def linksForIdentifier(self, QString):
        """ QHelpEngineCore.linksForIdentifier(QString) -> dict-of-QString-QUrl """
        pass

    # real signature unknown; restored from __doc__
    def metaData(self, QString, QString_1):
        """ QHelpEngineCore.metaData(QString, QString) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def namespaceName(self, QString):
        """ QHelpEngineCore.namespaceName(QString) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def registerDocumentation(self, QString):
        """ QHelpEngineCore.registerDocumentation(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def registeredDocumentations(self):
        """ QHelpEngineCore.registeredDocumentations() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def removeCustomFilter(self, QString):
        """ QHelpEngineCore.removeCustomFilter(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def removeCustomValue(self, QString):
        """ QHelpEngineCore.removeCustomValue(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setAutoSaveFilter(self, bool):
        """ QHelpEngineCore.setAutoSaveFilter(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setCollectionFile(self, QString):
        """ QHelpEngineCore.setCollectionFile(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setCurrentFilter(self, QString):
        """ QHelpEngineCore.setCurrentFilter(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setCustomValue(self, QString, QVariant):
        """ QHelpEngineCore.setCustomValue(QString, QVariant) -> bool """
        return False

    def setupData(self):  # real signature unknown; restored from __doc__
        """ QHelpEngineCore.setupData() -> bool """
        return False

    def setupFinished(self, *args, **kwargs):  # real signature unknown
        """ QHelpEngineCore.setupFinished[] [signal] """
        pass

    def setupStarted(self, *args, **kwargs):  # real signature unknown
        """ QHelpEngineCore.setupStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def unregisterDocumentation(self, QString):
        """ QHelpEngineCore.unregisterDocumentation(QString) -> bool """
        return False

    def warning(self, *args, **kwargs):  # real signature unknown
        """ QHelpEngineCore.warning[QString] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QString, QObject_parent=None):
        pass


class QHelpEngine(QHelpEngineCore):

    """ QHelpEngine(QString, QObject parent=None) """

    def contentModel(self):  # real signature unknown; restored from __doc__
        """ QHelpEngine.contentModel() -> QHelpContentModel """
        return QHelpContentModel

    def contentWidget(self):  # real signature unknown; restored from __doc__
        """ QHelpEngine.contentWidget() -> QHelpContentWidget """
        return QHelpContentWidget

    def indexModel(self):  # real signature unknown; restored from __doc__
        """ QHelpEngine.indexModel() -> QHelpIndexModel """
        return QHelpIndexModel

    def indexWidget(self):  # real signature unknown; restored from __doc__
        """ QHelpEngine.indexWidget() -> QHelpIndexWidget """
        return QHelpIndexWidget

    def searchEngine(self):  # real signature unknown; restored from __doc__
        """ QHelpEngine.searchEngine() -> QHelpSearchEngine """
        return QHelpSearchEngine

    # real signature unknown; restored from __doc__
    def __init__(self, QString, QObject_parent=None):
        pass


class QHelpIndexModel(__PyQt4_QtGui.QStringListModel):
    # no doc
    # real signature unknown; restored from __doc__

    def createIndex(self, QString):
        """ QHelpIndexModel.createIndex(QString) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def filter(self, QString, QString_wildcard=None, *args, **kwargs):
        """ QHelpIndexModel.filter(QString, QString wildcard=QString()) -> QModelIndex """
        pass

    def indexCreated(self, *args, **kwargs):  # real signature unknown
        """ QHelpIndexModel.indexCreated[] [signal] """
        pass

    def indexCreationStarted(self, *args, **kwargs):  # real signature unknown
        """ QHelpIndexModel.indexCreationStarted[] [signal] """
        pass

    def isCreatingIndex(self):  # real signature unknown; restored from __doc__
        """ QHelpIndexModel.isCreatingIndex() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def linksForKeyword(self, QString):
        """ QHelpIndexModel.linksForKeyword(QString) -> dict-of-QString-QUrl """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QHelpIndexWidget(__PyQt4_QtGui.QListView):
    # no doc
    # real signature unknown; restored from __doc__

    def activateCurrentItem(self):
        """ QHelpIndexWidget.activateCurrentItem() """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def filterIndices(self, QString, QString_wildcard=None, *args, **kwargs):
        """ QHelpIndexWidget.filterIndices(QString, QString wildcard=QString()) """
        pass

    def linkActivated(self, *args, **kwargs):  # real signature unknown
        """ QHelpIndexWidget.linkActivated[QUrl, QString] [signal] """
        pass

    def linksActivated(self, *args, **kwargs):  # real signature unknown
        """ QHelpIndexWidget.linksActivated[dict-of-QString-QUrl, QString] [signal] """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QHelpSearchEngine(__PyQt4_QtCore.QObject):

    """ QHelpSearchEngine(QHelpEngineCore, QObject parent=None) """

    def cancelIndexing(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.cancelIndexing() """
        pass

    def cancelSearching(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.cancelSearching() """
        pass

    def hitCount(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.hitCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def hits(self, p_int, p_int_1):
        """ QHelpSearchEngine.hits(int, int) -> list-of-tuple-of-QString-QString """
        pass

    def hitsCount(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.hitsCount() -> int """
        return 0

    def indexingFinished(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchEngine.indexingFinished[] [signal] """
        pass

    def indexingStarted(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchEngine.indexingStarted[] [signal] """
        pass

    def query(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.query() -> list-of-QHelpSearchQuery """
        pass

    def queryWidget(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.queryWidget() -> QHelpSearchQueryWidget """
        return QHelpSearchQueryWidget

    # real signature unknown; restored from __doc__
    def reindexDocumentation(self):
        """ QHelpSearchEngine.reindexDocumentation() """
        pass

    def resultWidget(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchEngine.resultWidget() -> QHelpSearchResultWidget """
        return QHelpSearchResultWidget

    # real signature unknown; restored from __doc__
    def search(self, list_of_QHelpSearchQuery):
        """ QHelpSearchEngine.search(list-of-QHelpSearchQuery) """
        pass

    def searchingFinished(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchEngine.searchingFinished[int] [signal] """
        pass

    def searchingStarted(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchEngine.searchingStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QHelpEngineCore, QObject_parent=None):
        pass


class QHelpSearchQuery():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QHelpSearchQuery()
    QHelpSearchQuery(QHelpSearchQuery.FieldName, QStringList)
    QHelpSearchQuery(QHelpSearchQuery)
    """

    def FieldName(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    ALL = 4
    ATLEAST = 5
    DEFAULT = 0
    FUZZY = 1
    PHRASE = 3
    WITHOUT = 2


class QHelpSearchQueryWidget(__PyQt4_QtGui.QWidget):

    """ QHelpSearchQueryWidget(QWidget parent=None) """

    def query(self):  # real signature unknown; restored from __doc__
        """ QHelpSearchQueryWidget.query() -> list-of-QHelpSearchQuery """
        pass

    def search(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchQueryWidget.search[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget_parent=None):
        pass


class QHelpSearchResultWidget(__PyQt4_QtGui.QWidget):
    # no doc

    def linkAt(self, QPoint):  # real signature unknown; restored from __doc__
        """ QHelpSearchResultWidget.linkAt(QPoint) -> QUrl """
        pass

    def requestShowLink(self, *args, **kwargs):  # real signature unknown
        """ QHelpSearchResultWidget.requestShowLink[QUrl] [signal] """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

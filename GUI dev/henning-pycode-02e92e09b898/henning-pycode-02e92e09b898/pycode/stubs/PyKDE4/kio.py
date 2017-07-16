# encoding: utf-8
# module PyKDE4.kio
# from /usr/lib/python2.7/dist-packages/PyKDE4/kio.so by generator 1.96
# no doc

# imports
import PyKDE4.kdeui as __PyKDE4_kdeui
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# functions

def qHash(*args, **kwargs):  # real signature unknown
    pass


# classes

class KAbstractFileItemActionPlugin(__PyQt4_QtCore.QObject):
    # no doc

    def actions(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KAbstractFileModule(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createFileWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def getStartUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def selectDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setStartDir(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KAbstractFileWidget():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def actionCollection(self, *args, **kwargs):  # real signature unknown
        pass

    def baseUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def cancelButton(self, *args, **kwargs):  # real signature unknown
        pass

    def clearFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilterMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def currentMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def filterWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def keepsLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def locationEdit(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def okButton(self, *args, **kwargs):  # real signature unknown
        pass

    def operationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def OperationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFile(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrls(self, *args, **kwargs):  # real signature unknown
        pass

    def setConfirmOverwrite(self, *args, **kwargs):  # real signature unknown
        pass

    def setCustomWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setInlinePreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def setKeepLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def setLocationLabel(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setOperationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setPreviewWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setSelection(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCancel(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def toolBar(self, *args, **kwargs):  # real signature unknown
        pass

    def virtual_hook(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Opening = 1
    Other = 0
    Saving = 2


class KACL():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def allGroupPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def allUserPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def asString(self, *args, **kwargs):  # real signature unknown
        pass

    def basePermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def isExtended(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def maskPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def namedGroupPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def namedUserPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def othersPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def ownerPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def owningGroupPermissions(self, *args, **kwargs):
        pass

    def setACL(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setAllGroupPermissions(self, *args, **kwargs):
        pass

    def setAllUserPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def setMaskPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setNamedGroupPermissions(self, *args, **kwargs):
        pass

    # real signature unknown
    def setNamedUserPermissions(self, *args, **kwargs):
        pass

    def setOthersPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def setOwnerPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setOwningGroupPermissions(self, *args, **kwargs):
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

    def __init__(self, *args, **kwargs):  # real signature unknown
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


class KArchive():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def addLocalDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def addLocalFile(self, *args, **kwargs):  # real signature unknown
        pass

    def close(self, *args, **kwargs):  # real signature unknown
        pass

    def closeArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def device(self, *args, **kwargs):  # real signature unknown
        pass

    def directory(self, *args, **kwargs):  # real signature unknown
        pass

    def doFinishWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doPrepareWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteDir(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteSymLink(self, *args, **kwargs):  # real signature unknown
        pass

    def fileName(self, *args, **kwargs):  # real signature unknown
        pass

    def findOrCreate(self, *args, **kwargs):  # real signature unknown
        pass

    def finishWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def isOpen(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def open(self, *args, **kwargs):  # real signature unknown
        pass

    def openArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def prepareWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def rootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def setRootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def writeData(self, *args, **kwargs):  # real signature unknown
        pass

    def writeDir(self, *args, **kwargs):  # real signature unknown
        pass

    def writeFile(self, *args, **kwargs):  # real signature unknown
        pass

    def writeSymLink(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    UnknownTime = -1


class KAr(KArchive):
    # no doc

    def closeArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def doFinishWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doPrepareWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteDir(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteSymLink(self, *args, **kwargs):  # real signature unknown
        pass

    def findOrCreate(self, *args, **kwargs):  # real signature unknown
        pass

    def openArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def rootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def setRootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KArchiveEntry():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def archive(self, *args, **kwargs):  # real signature unknown
        pass

    def date(self, *args, **kwargs):  # real signature unknown
        pass

    def datetime(self, *args, **kwargs):  # real signature unknown
        pass

    def group(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def isFile(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def permissions(self, *args, **kwargs):  # real signature unknown
        pass

    def symLinkTarget(self, *args, **kwargs):  # real signature unknown
        pass

    def user(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KArchiveDirectory(KArchiveEntry):
    # no doc

    def addEntry(self, *args, **kwargs):  # real signature unknown
        pass

    def archive(self, *args, **kwargs):  # real signature unknown
        pass

    def copyTo(self, *args, **kwargs):  # real signature unknown
        pass

    def entries(self, *args, **kwargs):  # real signature unknown
        pass

    def entry(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KArchiveFile(KArchiveEntry):
    # no doc

    def archive(self, *args, **kwargs):  # real signature unknown
        pass

    def copyTo(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def data(self, *args, **kwargs):  # real signature unknown
        pass

    def isFile(self, *args, **kwargs):  # real signature unknown
        pass

    def position(self, *args, **kwargs):  # real signature unknown
        pass

    def setSize(self, *args, **kwargs):  # real signature unknown
        pass

    def size(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KAutoMount(__PyQt4_QtCore.QObject):
    # no doc

    def error(self, *args, **kwargs):  # real signature unknown
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KAutoUnmount(__PyQt4_QtCore.QObject):
    # no doc

    def error(self, *args, **kwargs):  # real signature unknown
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmark():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def address(self, *args, **kwargs):  # real signature unknown
        pass

    def commonParent(self, *args, **kwargs):  # real signature unknown
        pass

    def description(self, *args, **kwargs):  # real signature unknown
        pass

    def fullText(self, *args, **kwargs):  # real signature unknown
        pass

    def hasParent(self, *args, **kwargs):  # real signature unknown
        pass

    def icon(self, *args, **kwargs):  # real signature unknown
        pass

    def internalElement(self, *args, **kwargs):  # real signature unknown
        pass

    def isGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def isNull(self, *args, **kwargs):  # real signature unknown
        pass

    def isSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def List(self, *args, **kwargs):  # real signature unknown
        pass

    def metaData(self, *args, **kwargs):  # real signature unknown
        pass

    def metaDataItem(self, *args, **kwargs):  # real signature unknown
        pass

    def MetaDataOverwriteMode(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def nextAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def parentAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def parentGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def populateMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def positionInParent(self, *args, **kwargs):  # real signature unknown
        pass

    def previousAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def setDescription(self, *args, **kwargs):  # real signature unknown
        pass

    def setFullText(self, *args, **kwargs):  # real signature unknown
        pass

    def setIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def setMetaDataItem(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def setShowInToolbar(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showInToolbar(self, *args, **kwargs):  # real signature unknown
        pass

    def standaloneBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def text(self, *args, **kwargs):  # real signature unknown
        pass

    def toGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def updateAccessMetadata(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
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

    def __init__(self, *args, **kwargs):  # real signature unknown
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

    DontOverwriteMetaData = 1
    OverwriteMetaData = 0


class KBookmarkActionInterface():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def bookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KBookmarkAction(__PyKDE4_kdeui.KAction, KBookmarkActionInterface):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createdWidgets(self, *args, **kwargs):  # real signature unknown
        pass

    def createWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def slotSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkActionMenu(__PyKDE4_kdeui.KActionMenu, KBookmarkActionInterface):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createdWidgets(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkContextMenu(__PyKDE4_kdeui.KMenu):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def addActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmarkActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addFolderActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addOpenFolderInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def addProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def bookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def initStyleOption(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def manager(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def owner(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCopyLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def slotEditAt(self, *args, **kwargs):  # real signature unknown
        pass

    def slotInsert(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOpenFolderInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def slotProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def slotRemove(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def aboutToShow(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def BookmarkDialogMode(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def createNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def editBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fillGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def initLayout(self, *args, **kwargs):  # real signature unknown
        pass

    def initLayoutPrivate(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def newFolderButton(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def parentBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def save(self, *args, **kwargs):  # real signature unknown
        pass

    def selectFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setParentBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    EditBookmark = 2
    NewBookmark = 1
    NewFolder = 0
    NewMultipleBookmarks = 3
    SelectFolder = 4


class KBookmarkDomBuilder(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectImporter(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def endFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def newBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def newFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def newSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkExporterBase():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def write(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KBookmarkGroup(KBookmark):
    # no doc

    def addBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def createNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def createNewSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def findToolbar(self, *args, **kwargs):  # real signature unknown
        pass

    def first(self, *args, **kwargs):  # real signature unknown
        pass

    def groupUrlList(self, *args, **kwargs):  # real signature unknown
        pass

    def indexOf(self, *args, **kwargs):  # real signature unknown
        pass

    def isOpen(self, *args, **kwargs):  # real signature unknown
        pass

    def isToolbarGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def moveBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def moveItem(self, *args, **kwargs):  # real signature unknown
        pass

    def next(self, *args, **kwargs):  # real signature unknown
        pass

    def nextKnownTag(self, *args, **kwargs):  # real signature unknown
        pass

    def previous(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkGroupTraverser():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def traverse(self, *args, **kwargs):  # real signature unknown
        pass

    def visit(self, *args, **kwargs):  # real signature unknown
        pass

    def visitEnter(self, *args, **kwargs):  # real signature unknown
        pass

    def visitLeave(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KBookmarkImporterBase(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def endFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def factory(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def newBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def newFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def newSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilename(self, *args, **kwargs):  # real signature unknown
        pass

    def setupSignalForwards(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkManager(__PyQt4_QtCore.QObject):
    # no doc
    # real signature unknown

    def autoErrorHandlingEnabled(self, *args, **kwargs):
        pass

    # real signature unknown
    def bookmarkCompleteChange(self, *args, **kwargs):
        pass

    def bookmarkConfigChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def bookmarksChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def changed(self, *args, **kwargs):  # real signature unknown
        pass

    def configChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def createTempManager(self, *args, **kwargs):  # real signature unknown
        pass

    def emitChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def emitConfigChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self, *args, **kwargs):  # real signature unknown
        pass

    def findByAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def internalDocument(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def managerForExternalFile(self, *args, **kwargs):
        pass

    def managerForFile(self, *args, **kwargs):  # real signature unknown
        pass

    def notifyCompleteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def notifyConfigChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def path(self, *args, **kwargs):  # real signature unknown
        pass

    def root(self, *args, **kwargs):  # real signature unknown
        pass

    def save(self, *args, **kwargs):  # real signature unknown
        pass

    def saveAs(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setAutoErrorHandlingEnabled(self, *args, **kwargs):
        pass

    def setEditorOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def setUpdate(self, *args, **kwargs):  # real signature unknown
        pass

    def slotEditBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def slotEditBookmarksAtAddress(self, *args, **kwargs):
        pass

    def toolbar(self, *args, **kwargs):  # real signature unknown
        pass

    def updateAccessMetadata(self, *args, **kwargs):  # real signature unknown
        pass

    def updateFavicon(self, *args, **kwargs):  # real signature unknown
        pass

    def userBookmarksManager(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkMenu(__PyQt4_QtCore.QObject):
    # no doc

    def actionForBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addAddBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addAddBookmarksList(self, *args, **kwargs):  # real signature unknown
        pass

    def addEditBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def addNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def addOpenInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def ensureUpToDate(self, *args, **kwargs):  # real signature unknown
        pass

    def fillBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirty(self, *args, **kwargs):  # real signature unknown
        pass

    def isRoot(self, *args, **kwargs):  # real signature unknown
        pass

    def manager(self, *args, **kwargs):  # real signature unknown
        pass

    def owner(self, *args, **kwargs):  # real signature unknown
        pass

    def parentAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def parentMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def refill(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAboutToShow(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAddBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAddBookmarksList(self, *args, **kwargs):  # real signature unknown
        pass

    def slotBookmarksChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def slotNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOpenFolderInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KBookmarkOwner():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def bookmarkDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def BookmarkOption(self, *args, **kwargs):  # real signature unknown
        pass

    def currentBookmarkList(self, *args, **kwargs):  # real signature unknown
        pass

    def currentTitle(self, *args, **kwargs):  # real signature unknown
        pass

    def currentUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def enableOption(self, *args, **kwargs):  # real signature unknown
        pass

    def openBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def openFolderinTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    ShowAddBookmark = 0
    ShowEditBookmark = 1


class KBuildSycocaProgressDialog(__PyQt4_QtGui.QProgressDialog):
    # no doc

    def rebuildKSycoca(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KCrashBookmarkImporter(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def crashBookmarksDir(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def endFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def newBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def newFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def newSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def parseCrashBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KCrashBookmarkImporterImpl(KBookmarkImporterBase):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def getCrashLogs(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setShouldDelete(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDataTool(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def componentData(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def run(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setComponentData(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDataToolAction(__PyKDE4_kdeui.KAction):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createdWidgets(self, *args, **kwargs):  # real signature unknown
        pass

    def createWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dataToolActionList(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def slotActivated(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toolActivated(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDataToolInfo():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def commands(self, *args, **kwargs):  # real signature unknown
        pass

    def componentData(self, *args, **kwargs):  # real signature unknown
        pass

    def createTool(self, *args, **kwargs):  # real signature unknown
        pass

    def dataType(self, *args, **kwargs):  # real signature unknown
        pass

    def icon(self, *args, **kwargs):  # real signature unknown
        pass

    def iconName(self, *args, **kwargs):  # real signature unknown
        pass

    def isReadOnly(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def miniIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def query(self, *args, **kwargs):  # real signature unknown
        pass

    def service(self, *args, **kwargs):  # real signature unknown
        pass

    def userCommands(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KDBusServiceStarter():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def findServiceFor(self, *args, **kwargs):  # real signature unknown
        pass

    def self(self, *args, **kwargs):  # real signature unknown
        pass

    def startServiceFor(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KDesktopFileActions():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def builtinServices(self, *args, **kwargs):  # real signature unknown
        pass

    def executeService(self, *args, **kwargs):  # real signature unknown
        pass

    def run(self, *args, **kwargs):  # real signature unknown
        pass

    def userDefinedServices(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KDeviceListModel(__PyQt4_QtCore.QAbstractItemModel):
    # no doc

    def beginInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def changePersistentIndex(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def changePersistentIndexList(self, *args, **kwargs):
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def data(self, *args, **kwargs):  # real signature unknown
        pass

    def decodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def deviceForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def encodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def headerData(self, *args, **kwargs):  # real signature unknown
        pass

    def index(self, *args, **kwargs):  # real signature unknown
        pass

    def modelInitialized(self, *args, **kwargs):  # real signature unknown
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    def persistentIndexList(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        pass

    def rootIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def rowCount(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setRoleNames(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDirLister(__PyQt4_QtCore.QObject):
    # no doc
    # real signature unknown

    def autoErrorHandlingEnabled(self, *args, **kwargs):
        pass

    def autoUpdate(self, *args, **kwargs):  # real signature unknown
        pass

    def cachedItemForUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def canceled(self, *args, **kwargs):  # real signature unknown
        pass

    def Changes(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self, *args, **kwargs):  # real signature unknown
        pass

    def clearMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def completed(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def delayedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteItem(self, *args, **kwargs):  # real signature unknown
        pass

    def directories(self, *args, **kwargs):  # real signature unknown
        pass

    def dirOnlyMode(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def doMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def doNameFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def emitChanges(self, *args, **kwargs):  # real signature unknown
        pass

    def findByName(self, *args, **kwargs):  # real signature unknown
        pass

    def findByUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def handleError(self, *args, **kwargs):  # real signature unknown
        pass

    def infoMessage(self, *args, **kwargs):  # real signature unknown
        pass

    def isFinished(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def itemsAdded(self, *args, **kwargs):  # real signature unknown
        pass

    def itemsDeleted(self, *args, **kwargs):  # real signature unknown
        pass

    def itemsFilteredByMime(self, *args, **kwargs):  # real signature unknown
        pass

    def itemsForDir(self, *args, **kwargs):  # real signature unknown
        pass

    def mainWindow(self, *args, **kwargs):  # real signature unknown
        pass

    def matchesFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def matchesMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeFilters(self, *args, **kwargs):  # real signature unknown
        pass

    def nameFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def newItems(self, *args, **kwargs):  # real signature unknown
        pass

    def openUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def OpenUrlFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def OpenUrlFlags(self, *args, **kwargs):  # real signature unknown
        pass

    def percent(self, *args, **kwargs):  # real signature unknown
        pass

    def processedSize(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def redirection(self, *args, **kwargs):  # real signature unknown
        pass

    def refreshItems(self, *args, **kwargs):  # real signature unknown
        pass

    def rootItem(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setAutoErrorHandlingEnabled(self, *args, **kwargs):
        pass

    def setAutoUpdate(self, *args, **kwargs):  # real signature unknown
        pass

    def setDelayedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirOnlyMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setMainWindow(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeExcludeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setNameFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setShowingDotFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def showingDotFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def speed(self, *args, **kwargs):  # real signature unknown
        pass

    def started(self, *args, **kwargs):  # real signature unknown
        pass

    def stop(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def totalSize(self, *args, **kwargs):  # real signature unknown
        pass

    def updateDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def WhichItems(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    AllItems = 0
    DIR_ONLY_MODE = 8
    DOT_FILES = 4
    FilteredItems = 1
    Keep = 1
    MIME_FILTER = 2
    NAME_FILTER = 1
    NoFlags = 0
    NONE = 0
    Reload = 2


class KDirModel(__PyQt4_QtCore.QAbstractItemModel):
    # no doc

    def AdditionalRoles(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def canFetchMore(self, *args, **kwargs):  # real signature unknown
        pass

    def changePersistentIndex(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def changePersistentIndexList(self, *args, **kwargs):
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def data(self, *args, **kwargs):  # real signature unknown
        pass

    def decodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def dirLister(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dropMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def DropsAllowed(self, *args, **kwargs):  # real signature unknown
        pass

    def DropsAllowedFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def encodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def expand(self, *args, **kwargs):  # real signature unknown
        pass

    def expandToUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def fetchMore(self, *args, **kwargs):  # real signature unknown
        pass

    def flags(self, *args, **kwargs):  # real signature unknown
        pass

    def hasChildren(self, *args, **kwargs):  # real signature unknown
        pass

    def headerData(self, *args, **kwargs):  # real signature unknown
        pass

    def index(self, *args, **kwargs):  # real signature unknown
        pass

    def indexForItem(self, *args, **kwargs):  # real signature unknown
        pass

    def indexForUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def itemChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def itemForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def jobTransfersVisible(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def ModelColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def needSequenceIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    def persistentIndexList(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def requestSequenceIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        pass

    def rowCount(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setData(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirLister(self, *args, **kwargs):  # real signature unknown
        pass

    def setDropsAllowed(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setJobTransfersVisible(self, *args, **kwargs):
        pass

    def setRoleNames(self, *args, **kwargs):  # real signature unknown
        pass

    def simplifiedUrlList(self, *args, **kwargs):  # real signature unknown
        pass

    def sort(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    ChildCountRole = 743246400
    ChildCountUnknown = -1
    ColumnCount = 7
    DropOnAnyFile = 2
    DropOnDirectory = 1
    DropOnLocalExecutable = 4
    FileItemRole = 128082943
    Group = 5
    HasJobRole = 31806885
    ModifiedTime = 2
    Name = 0
    NoDrops = 0
    Owner = 4
    Permissions = 3
    Size = 1
    Type = 6


class KDirOperator(__PyQt4_QtGui.QWidget):
    # no doc

    def actionCollection(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def ActionType(self, *args, **kwargs):  # real signature unknown
        pass

    def activatedMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def back(self, *args, **kwargs):  # real signature unknown
        pass

    def cdUp(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def checkPreviewSupport(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clearFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def clearHistory(self, *args, **kwargs):  # real signature unknown
        pass

    def close(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def completion(self, *args, **kwargs):  # real signature unknown
        pass

    def completionObject(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def contextMenuAboutToShow(self, *args, **kwargs):
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def createView(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def currentIconSizeChanged(self, *args, **kwargs):
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def decorationPosition(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def del_(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def dirActivated(self, *args, **kwargs):  # real signature unknown
        pass

    def dirCompletionObject(self, *args, **kwargs):  # real signature unknown
        pass

    def dirHighlighting(self, *args, **kwargs):  # real signature unknown
        pass

    def dirLister(self, *args, **kwargs):  # real signature unknown
        pass

    def dirOnlyMode(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropped(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileHighlighted(self, *args, **kwargs):  # real signature unknown
        pass

    def fileSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def finishedLoading(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def forward(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def highlightFile(self, *args, **kwargs):  # real signature unknown
        pass

    def home(self, *args, **kwargs):  # real signature unknown
        pass

    def iconsZoom(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def isInlinePreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def isRoot(self, *args, **kwargs):  # real signature unknown
        pass

    def isSaving(self, *args, **kwargs):  # real signature unknown
        pass

    def isSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def makeCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def makeDirCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def mkdir(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def nameFilter(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def newFileMenuSupportedMimeTypes(self, *args, **kwargs):
        pass

    def numDirs(self, *args, **kwargs):  # real signature unknown
        pass

    def numFiles(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def onlyDoubleClickSelectsFiles(self, *args, **kwargs):
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def pathChanged(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def prepareCompletionObjects(self, *args, **kwargs):
        pass

    def previewGenerator(self, *args, **kwargs):  # real signature unknown
        pass

    def progressBar(self, *args, **kwargs):  # real signature unknown
        pass

    def readConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def rereadDir(self, *args, **kwargs):  # real signature unknown
        pass

    def resetCursor(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def selectDir(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedItems(self, *args, **kwargs):  # real signature unknown
        pass

    def selectFile(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setAcceptDrops(self, *args, **kwargs):  # real signature unknown
        pass

    def setCurrentItem(self, *args, **kwargs):  # real signature unknown
        pass

    def setCurrentItems(self, *args, **kwargs):  # real signature unknown
        pass

    def setDecorationPosition(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirLister(self, *args, **kwargs):  # real signature unknown
        pass

    def setDropOptions(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setEnableDirHighlighting(self, *args, **kwargs):
        pass

    def setIconsZoom(self, *args, **kwargs):  # real signature unknown
        pass

    def setInlinePreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def setIsSaving(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setNameFilter(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setNewFileMenuSupportedMimeTypes(self, *args, **kwargs):
        pass

    # real signature unknown
    def setOnlyDoubleClickSelectsFiles(self, *args, **kwargs):
        pass

    def setPreviewWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setShowHiddenFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def setSorting(self, *args, **kwargs):  # real signature unknown
        pass

    def setupActions(self, *args, **kwargs):  # real signature unknown
        pass

    def setupMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def setView(self, *args, **kwargs):  # real signature unknown
        pass

    def setViewConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showHiddenFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCompletionMatch(self, *args, **kwargs):  # real signature unknown
        pass

    def sortByDate(self, *args, **kwargs):  # real signature unknown
        pass

    def sortByName(self, *args, **kwargs):  # real signature unknown
        pass

    def sortBySize(self, *args, **kwargs):  # real signature unknown
        pass

    def sortByType(self, *args, **kwargs):  # real signature unknown
        pass

    def sorting(self, *args, **kwargs):  # real signature unknown
        pass

    def sortReversed(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toggleDirsFirst(self, *args, **kwargs):  # real signature unknown
        pass

    def toggleIgnoreCase(self, *args, **kwargs):  # real signature unknown
        pass

    def trash(self, *args, **kwargs):  # real signature unknown
        pass

    def trashSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def updateDir(self, *args, **kwargs):  # real signature unknown
        pass

    def updateInformation(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def updateSelectionDependentActions(self, *args, **kwargs):
        pass

    def updateSortActions(self, *args, **kwargs):  # real signature unknown
        pass

    def updateViewActions(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def urlEntered(self, *args, **kwargs):  # real signature unknown
        pass

    def view(self, *args, **kwargs):  # real signature unknown
        pass

    def viewChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def viewConfigGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def writeConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    AllActions = 15
    FileActions = 8
    NavActions = 4
    SortActions = 1
    ViewActions = 2


class KDirSelectDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def localOnly(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def selectDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCurrentUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def startDir(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def view(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDirSortFilterProxyModel(__PyKDE4_kdeui.KCategorizedSortFilterProxyModel):
    # no doc

    def beginInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def canFetchMore(self, *args, **kwargs):  # real signature unknown
        pass

    def changePersistentIndex(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def changePersistentIndexList(self, *args, **kwargs):
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def compareCategories(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def decodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def encodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def filterAcceptsColumn(self, *args, **kwargs):  # real signature unknown
        pass

    def filterAcceptsRow(self, *args, **kwargs):  # real signature unknown
        pass

    def filterChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def hasChildren(self, *args, **kwargs):  # real signature unknown
        pass

    def invalidateFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def lessThan(self, *args, **kwargs):  # real signature unknown
        pass

    def persistentIndexList(self, *args, **kwargs):  # real signature unknown
        pass

    def pointsForPermissions(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setRoleNames(self, *args, **kwargs):  # real signature unknown
        pass

    def setSortFoldersFirst(self, *args, **kwargs):  # real signature unknown
        pass

    def sortFoldersFirst(self, *args, **kwargs):  # real signature unknown
        pass

    def subSortLessThan(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDirWatch(__PyQt4_QtCore.QObject):
    # no doc

    def addDir(self, *args, **kwargs):  # real signature unknown
        pass

    def addFile(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contains(self, *args, **kwargs):  # real signature unknown
        pass

    def created(self, *args, **kwargs):  # real signature unknown
        pass

    def ctime(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def deleted(self, *args, **kwargs):  # real signature unknown
        pass

    def dirty(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def exists(self, *args, **kwargs):  # real signature unknown
        pass

    def internalMethod(self, *args, **kwargs):  # real signature unknown
        pass

    def isStopped(self, *args, **kwargs):  # real signature unknown
        pass

    def Method(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def removeDir(self, *args, **kwargs):  # real signature unknown
        pass

    def removeFile(self, *args, **kwargs):  # real signature unknown
        pass

    def restartDirScan(self, *args, **kwargs):  # real signature unknown
        pass

    def self(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCreated(self, *args, **kwargs):  # real signature unknown
        pass

    def setDeleted(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirty(self, *args, **kwargs):  # real signature unknown
        pass

    def startScan(self, *args, **kwargs):  # real signature unknown
        pass

    def statistics(self, *args, **kwargs):  # real signature unknown
        pass

    def stopDirScan(self, *args, **kwargs):  # real signature unknown
        pass

    def stopScan(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def WatchMode(self, *args, **kwargs):  # real signature unknown
        pass

    def WatchModes(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    DNotify = 2
    FAM = 0
    INotify = 1
    Stat = 3
    WatchDirOnly = 0
    WatchFiles = 1
    WatchSubDirs = 2


class KDiskFreeSpace(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def done(self, *args, **kwargs):  # real signature unknown
        pass

    def findUsageInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def foundMountPoint(self, *args, **kwargs):  # real signature unknown
        pass

    def readDF(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KDiskFreeSpaceInfo():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def available(self, *args, **kwargs):  # real signature unknown
        pass

    def freeSpaceInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def mountPoint(self, *args, **kwargs):  # real signature unknown
        pass

    def size(self, *args, **kwargs):  # real signature unknown
        pass

    def used(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KEMailSettings():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def currentProfileName(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultProfileName(self, *args, **kwargs):  # real signature unknown
        pass

    def Extension(self, *args, **kwargs):  # real signature unknown
        pass

    def getSetting(self, *args, **kwargs):  # real signature unknown
        pass

    def profiles(self, *args, **kwargs):  # real signature unknown
        pass

    def setDefault(self, *args, **kwargs):  # real signature unknown
        pass

    def setProfile(self, *args, **kwargs):  # real signature unknown
        pass

    def setSetting(self, *args, **kwargs):  # real signature unknown
        pass

    def Setting(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    ClientProgram = 0
    ClientTerminal = 1
    EmailAddress = 3
    InServer = 12
    InServerLogin = 13
    InServerMBXType = 16
    InServerPass = 14
    InServerTLS = 17
    InServerType = 15
    Organization = 5
    OTHER = 2
    OutServer = 6
    OutServerCommand = 10
    OutServerLogin = 7
    OutServerPass = 8
    OutServerTLS = 11
    OutServerType = 9
    POP3 = 0
    RealName = 2
    ReplyToAddress = 4
    SMTP = 1


class KFileDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def actionCollection(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def baseUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def cancelButton(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clearFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilterMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def currentMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileHighlighted(self, *args, **kwargs):  # real signature unknown
        pass

    def fileSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def fileWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def filterChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def filterWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getExistingDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def getExistingDirectoryUrl(self, *args, **kwargs):
        pass

    def getImageOpenUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def getOpenFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def getOpenFileNames(self, *args, **kwargs):  # real signature unknown
        pass

    def getOpenFileNameWId(self, *args, **kwargs):  # real signature unknown
        pass

    def getOpenUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def getOpenUrls(self, *args, **kwargs):  # real signature unknown
        pass

    def getSaveFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def getSaveFileNameWId(self, *args, **kwargs):  # real signature unknown
        pass

    def getSaveUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def getStartUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keepsLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def locationEdit(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def okButton(self, *args, **kwargs):  # real signature unknown
        pass

    def operationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def OperationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def Option(self, *args, **kwargs):  # real signature unknown
        pass

    def Options(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFile(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrls(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setConfirmOverwrite(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setInlinePreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def setKeepLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def setLocationLabel(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setOperationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setPreviewWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setSelection(self, *args, **kwargs):  # real signature unknown
        pass

    def setStartDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCancel(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toolBar(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    ConfirmOverwrite = 1
    Opening = 1
    Other = 0
    Saving = 2
    ShowInlinePreview = 2


class KEncodingFileDialog(KFileDialog):
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def getOpenFileNameAndEncoding(self, *args, **kwargs):
        pass

    # real signature unknown
    def getOpenFileNamesAndEncoding(self, *args, **kwargs):
        pass

    def getOpenUrlAndEncoding(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def getOpenUrlsAndEncoding(self, *args, **kwargs):
        pass

    # real signature unknown
    def getSaveFileNameAndEncoding(self, *args, **kwargs):
        pass

    def getSaveUrlAndEncoding(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def Result(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedEncoding(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCancel(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFile():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def FileView(self, *args, **kwargs):  # real signature unknown
        pass

    def isDefaultView(self, *args, **kwargs):  # real signature unknown
        pass

    def isDetailTreeView(self, *args, **kwargs):  # real signature unknown
        pass

    def isDetailView(self, *args, **kwargs):  # real signature unknown
        pass

    def isPreviewContents(self, *args, **kwargs):  # real signature unknown
        pass

    def isPreviewInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def isSeparateDirs(self, *args, **kwargs):  # real signature unknown
        pass

    def isSimpleView(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortByDate(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortByName(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortBySize(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortByType(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortCaseInsensitive(self, *args, **kwargs):  # real signature unknown
        pass

    def isSortDirsFirst(self, *args, **kwargs):  # real signature unknown
        pass

    def isTreeView(self, *args, **kwargs):  # real signature unknown
        pass

    def Mode(self, *args, **kwargs):  # real signature unknown
        pass

    def Modes(self, *args, **kwargs):  # real signature unknown
        pass

    def SelectionMode(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Default = 0
    Detail = 2
    DetailTree = 64
    Directory = 2
    ExistingOnly = 8
    Extended = 4
    File = 1
    Files = 4
    FileViewMax = 65536
    LocalOnly = 16
    ModeMax = 65536
    Multi = 2
    NoSelection = 8
    PreviewContents = 8
    PreviewInfo = 16
    SeparateDirs = 4
    Simple = 1
    Single = 1
    Tree = 32


class KFileFilterCombo(__PyKDE4_kdeui.KComboBox):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def delegate(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def filterChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def filters(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getKeyBindings(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def initStyleOption(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodQuery(self, *args, **kwargs):  # real signature unknown
        pass

    def isMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def makeCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def minimumSizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCompletedText(self, *args, **kwargs):  # real signature unknown
        pass

    def setCurrentFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setDefaultFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setDelegate(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showsAllTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileItem():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def acceptsDrops(self, *args, **kwargs):  # real signature unknown
        pass

    def ACL(self, *args, **kwargs):  # real signature unknown
        pass

    def assign(self, *args, **kwargs):  # real signature unknown
        pass

    def cmp(self, *args, **kwargs):  # real signature unknown
        pass

    def comment(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultACL(self, *args, **kwargs):  # real signature unknown
        pass

    def determineMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def entry(self, *args, **kwargs):  # real signature unknown
        pass

    def FileTimes(self, *args, **kwargs):  # real signature unknown
        pass

    def getStatusBarInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def getToolTipText(self, *args, **kwargs):  # real signature unknown
        pass

    def group(self, *args, **kwargs):  # real signature unknown
        pass

    def hasExtendedACL(self, *args, **kwargs):  # real signature unknown
        pass

    def iconName(self, *args, **kwargs):  # real signature unknown
        pass

    def isDesktopFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isDir(self, *args, **kwargs):  # real signature unknown
        pass

    def isFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isHidden(self, *args, **kwargs):  # real signature unknown
        pass

    def isLink(self, *args, **kwargs):  # real signature unknown
        pass

    def isLocalFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isMarked(self, *args, **kwargs):  # real signature unknown
        pass

    def isMimeTypeKnown(self, *args, **kwargs):  # real signature unknown
        pass

    def isNull(self, *args, **kwargs):  # real signature unknown
        pass

    def isReadable(self, *args, **kwargs):  # real signature unknown
        pass

    def isRegularFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isWritable(self, *args, **kwargs):  # real signature unknown
        pass

    def linkDest(self, *args, **kwargs):  # real signature unknown
        pass

    def localPath(self, *args, **kwargs):  # real signature unknown
        pass

    def mark(self, *args, **kwargs):  # real signature unknown
        pass

    def metaInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeComment(self, *args, **kwargs):  # real signature unknown
        pass

    def mimetype(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypePtr(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mostLocalUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def nepomukUri(self, *args, **kwargs):  # real signature unknown
        pass

    def overlays(self, *args, **kwargs):  # real signature unknown
        pass

    def permissions(self, *args, **kwargs):  # real signature unknown
        pass

    def permissionsString(self, *args, **kwargs):  # real signature unknown
        pass

    def pixmap(self, *args, **kwargs):  # real signature unknown
        pass

    def refresh(self, *args, **kwargs):  # real signature unknown
        pass

    def refreshMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def run(self, *args, **kwargs):  # real signature unknown
        pass

    def setMetaInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def setName(self, *args, **kwargs):  # real signature unknown
        pass

    def setUDSEntry(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def size(self, *args, **kwargs):  # real signature unknown
        pass

    def targetUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def text(self, *args, **kwargs):  # real signature unknown
        pass

    def time(self, *args, **kwargs):  # real signature unknown
        pass

    def timeString(self, *args, **kwargs):  # real signature unknown
        pass

    def unmark(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def user(self, *args, **kwargs):  # real signature unknown
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

    def __init__(self, *args, **kwargs):  # real signature unknown
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

    AccessTime = 1
    CreationTime = 2
    ModificationTime = 0
    Unknown = -1


class KFileItemActionPlugin(__PyQt4_QtCore.QObject):
    # no doc

    def actions(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileItemActions(__PyQt4_QtCore.QObject):
    # no doc

    def addOpenWithActionsTo(self, *args, **kwargs):  # real signature unknown
        pass

    def addServiceActionsTo(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def associatedApplications(self, *args, **kwargs):
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def preferredOpenWithAction(self, *args, **kwargs):
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def runPreferredApplications(self, *args, **kwargs):
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setItemListProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def setParentWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileItemDelegate(__PyQt4_QtGui.QAbstractItemDelegate):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createEditor(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def editorEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def helpEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def iconRect(self, *args, **kwargs):  # real signature unknown
        pass

    def Information(self, *args, **kwargs):  # real signature unknown
        pass

    def jobTransfersVisible(self, *args, **kwargs):  # real signature unknown
        pass

    def maximumSize(self, *args, **kwargs):  # real signature unknown
        pass

    def paint(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setEditorData(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setJobTransfersVisible(self, *args, **kwargs):
        pass

    def setMaximumSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setModelData(self, *args, **kwargs):  # real signature unknown
        pass

    def setShadowBlur(self, *args, **kwargs):  # real signature unknown
        pass

    def setShadowColor(self, *args, **kwargs):  # real signature unknown
        pass

    def setShadowOffset(self, *args, **kwargs):  # real signature unknown
        pass

    def setShowInformation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setShowToolTipWhenElided(self, *args, **kwargs):
        pass

    def setWrapMode(self, *args, **kwargs):  # real signature unknown
        pass

    def shadowBlur(self, *args, **kwargs):  # real signature unknown
        pass

    def shadowColor(self, *args, **kwargs):  # real signature unknown
        pass

    def shadowOffset(self, *args, **kwargs):  # real signature unknown
        pass

    def shape(self, *args, **kwargs):  # real signature unknown
        pass

    def showToolTipWhenElided(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateEditorGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def wrapMode(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    AccessTime = 8
    Comment = 13
    CreationTime = 6
    FriendlyMimeType = 10
    LinkDest = 11
    LocalPathOrUrl = 12
    MimeType = 9
    ModificationTime = 7
    NoInformation = 0
    OctalPermissions = 3
    Owner = 4
    OwnerAndGroup = 5
    Permissions = 2
    Size = 1


class KFileItemList():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def findByName(self, *args, **kwargs):  # real signature unknown
        pass

    def findByUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def targetUrlList(self, *args, **kwargs):  # real signature unknown
        pass

    def urlList(self, *args, **kwargs):  # real signature unknown
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    __weakref__ = property(lambda self: object())  # default


class KFileItemListProperties():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def isDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def isLocal(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def setItems(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsDeleting(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsMoving(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsReading(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def urlList(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KFileMetaDataConfigurationWidget(__PyQt4_QtGui.QWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def save(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setItems(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileMetaDataWidget(__PyQt4_QtGui.QWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def isReadOnly(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def metaDataRequestFinished(self, *args, **kwargs):
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setItems(self, *args, **kwargs):  # real signature unknown
        pass

    def setReadOnly(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def urlActivated(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileMetaInfo():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def applyChanges(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def item(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def keys(self, *args, **kwargs):  # real signature unknown
        pass

    def preferredKeys(self, *args, **kwargs):  # real signature unknown
        pass

    def supportedKeys(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def What(self, *args, **kwargs):  # real signature unknown
        pass

    def WhatFlags(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    ContentInfo = 8
    Everything = 65535
    ExternalSources = 16
    Fastest = 1
    LinkedData = 128
    TechnicalInfo = 4
    Thumbnail = 32


class KFileMetaInfoItem():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def addValue(self, *args, **kwargs):  # real signature unknown
        pass

    def isEditable(self, *args, **kwargs):  # real signature unknown
        pass

    def isModified(self, *args, **kwargs):  # real signature unknown
        pass

    def isRemoved(self, *args, **kwargs):  # real signature unknown
        pass

    def isSkipped(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def prefix(self, *args, **kwargs):  # real signature unknown
        pass

    def properties(self, *args, **kwargs):  # real signature unknown
        pass

    def setValue(self, *args, **kwargs):  # real signature unknown
        pass

    def suffix(self, *args, **kwargs):  # real signature unknown
        pass

    def value(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KFilePlacesModel(__PyQt4_QtCore.QAbstractItemModel):
    # no doc

    def AdditionalRoles(self, *args, **kwargs):  # real signature unknown
        pass

    def addPlace(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def beginRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def beginResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def bookmarkForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def changePersistentIndex(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def changePersistentIndexList(self, *args, **kwargs):
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closestItem(self, *args, **kwargs):  # real signature unknown
        pass

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def data(self, *args, **kwargs):  # real signature unknown
        pass

    def decodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def deviceForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dropMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def editPlace(self, *args, **kwargs):  # real signature unknown
        pass

    def ejectActionForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def encodeData(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endInsertRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endMoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveColumns(self, *args, **kwargs):  # real signature unknown
        pass

    def endRemoveRows(self, *args, **kwargs):  # real signature unknown
        pass

    def endResetModel(self, *args, **kwargs):  # real signature unknown
        pass

    def errorMessage(self, *args, **kwargs):  # real signature unknown
        pass

    def flags(self, *args, **kwargs):  # real signature unknown
        pass

    def hiddenCount(self, *args, **kwargs):  # real signature unknown
        pass

    def icon(self, *args, **kwargs):  # real signature unknown
        pass

    def index(self, *args, **kwargs):  # real signature unknown
        pass

    def isDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def isHidden(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    def persistentIndexList(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def removePlace(self, *args, **kwargs):  # real signature unknown
        pass

    def requestEject(self, *args, **kwargs):  # real signature unknown
        pass

    def requestSetup(self, *args, **kwargs):  # real signature unknown
        pass

    def requestTeardown(self, *args, **kwargs):  # real signature unknown
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        pass

    def rowCount(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setPlaceHidden(self, *args, **kwargs):  # real signature unknown
        pass

    def setRoleNames(self, *args, **kwargs):  # real signature unknown
        pass

    def setupDone(self, *args, **kwargs):  # real signature unknown
        pass

    def setupNeeded(self, *args, **kwargs):  # real signature unknown
        pass

    def supportedDropActions(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def teardownActionForIndex(self, *args, **kwargs):
        pass

    def text(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    CapacityBarRecommendedRole = 357090756
    FixedDeviceRole = 858298049
    HiddenRole = 121752236
    SetupNeededRole = 94016349
    UrlRole = 110940459


class KFilePlacesView(__PyQt4_QtGui.QListView):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEditor(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def commitData(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dataChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def dirtyRegionOffset(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropIndicatorPosition(self, *args, **kwargs):  # real signature unknown
        pass

    def edit(self, *args, **kwargs):  # real signature unknown
        pass

    def editorDestroyed(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def executeDelayedItemsLayout(self, *args, **kwargs):
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def horizontalOffset(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def horizontalScrollbarAction(self, *args, **kwargs):
        pass

    # real signature unknown
    def horizontalScrollbarValueChanged(self, *args, **kwargs):
        pass

    # real signature unknown
    def horizontalStepsPerItem(self, *args, **kwargs):
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def isAutoResizeItemsEnabled(self, *args, **kwargs):
        pass

    def isDropOnPlaceEnabled(self, *args, **kwargs):  # real signature unknown
        pass

    def isIndexHidden(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveCursor(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def rectForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def rowsAboutToBeRemoved(self, *args, **kwargs):  # real signature unknown
        pass

    def rowsInserted(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def scheduleDelayedItemsLayout(self, *args, **kwargs):
        pass

    def scrollContentsBy(self, *args, **kwargs):  # real signature unknown
        pass

    def scrollDirtyRegion(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedIndexes(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionCommand(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setAutoResizeItemsEnabled(self, *args, **kwargs):
        pass

    def setDirtyRegion(self, *args, **kwargs):  # real signature unknown
        pass

    def setDropOnPlaceEnabled(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setHorizontalStepsPerItem(self, *args, **kwargs):
        pass

    def setModel(self, *args, **kwargs):  # real signature unknown
        pass

    def setPositionForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def setSelection(self, *args, **kwargs):  # real signature unknown
        pass

    def setShowAll(self, *args, **kwargs):  # real signature unknown
        pass

    def setState(self, *args, **kwargs):  # real signature unknown
        pass

    def setupViewport(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setVerticalStepsPerItem(self, *args, **kwargs):
        pass

    def setViewportMargins(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def startDrag(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateEditorData(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def updateEditorGeometries(self, *args, **kwargs):
        pass

    def updateGeometries(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def urlChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def urlsDropped(self, *args, **kwargs):  # real signature unknown
        pass

    def verticalOffset(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def verticalScrollbarAction(self, *args, **kwargs):
        pass

    # real signature unknown
    def verticalScrollbarValueChanged(self, *args, **kwargs):
        pass

    def verticalStepsPerItem(self, *args, **kwargs):  # real signature unknown
        pass

    def viewOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def viewportEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def visualRegionForSelection(self, *args, **kwargs):
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFilePreviewGenerator(__PyQt4_QtCore.QObject):
    # no doc

    def cancelPreviews(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledPlugins(self, *args, **kwargs):  # real signature unknown
        pass

    def isPreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setEnabledPlugins(self, *args, **kwargs):  # real signature unknown
        pass

    def setPreviewShown(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateIcons(self, *args, **kwargs):  # real signature unknown
        pass

    def updatePreviews(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileShare():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def authorization(self, *args, **kwargs):  # real signature unknown
        pass

    def Authorization(self, *args, **kwargs):  # real signature unknown
        pass

    def fileShareGroup(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectoryShared(self, *args, **kwargs):  # real signature unknown
        pass

    def isRestricted(self, *args, **kwargs):  # real signature unknown
        pass

    def nfsEnabled(self, *args, **kwargs):  # real signature unknown
        pass

    def readConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def readShareList(self, *args, **kwargs):  # real signature unknown
        pass

    def sambaEnabled(self, *args, **kwargs):  # real signature unknown
        pass

    def setShared(self, *args, **kwargs):  # real signature unknown
        pass

    def shareMode(self, *args, **kwargs):  # real signature unknown
        pass

    def ShareMode(self, *args, **kwargs):  # real signature unknown
        pass

    def sharingEnabled(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Advanced = 1
    Authorized = 2
    ErrorNotFound = 1
    NotInitialized = 0
    Simple = 0
    UserNotAllowed = 3


class KPropertiesDialogPlugin(__PyQt4_QtCore.QObject):
    # no doc

    def applyChanges(self, *args, **kwargs):  # real signature unknown
        pass

    def changed(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def fontHeight(self, *args, **kwargs):  # real signature unknown
        pass

    def isDesktopFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirty(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirty(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileSharePropsPlugin(KPropertiesDialogPlugin):
    # no doc

    def applyChanges(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def fontHeight(self, *args, **kwargs):  # real signature unknown
        pass

    def page(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def slotConfigureFileSharing(self, *args, **kwargs):
        pass

    # real signature unknown
    def slotConfigureFileSharingDone(self, *args, **kwargs):
        pass

    def supports(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileWidget(__PyQt4_QtGui.QWidget, KAbstractFileWidget):
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def accepted(self, *args, **kwargs):  # real signature unknown
        pass

    def actionCollection(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def baseUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def cancelButton(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clearFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def currentFilterMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def currentMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def dirOperator(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileHighlighted(self, *args, **kwargs):  # real signature unknown
        pass

    def fileSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def filterChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def filterWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getStartUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keepsLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def locationEdit(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def okButton(self, *args, **kwargs):  # real signature unknown
        pass

    def operationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def readConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFile(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrls(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCustomWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setKeepLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def setLocationLabel(self, *args, **kwargs):  # real signature unknown
        pass

    def setMimeFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setOperationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setPreviewWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setSelection(self, *args, **kwargs):  # real signature unknown
        pass

    def setStartDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCancel(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toolBar(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KFileWritePlugin(__PyQt4_QtCore.QObject):
    # no doc

    def canWrite(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def write(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KIconButton(__PyQt4_QtGui.QPushButton):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def buttonIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def checkStateSet(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def hitButton(self, *args, **kwargs):  # real signature unknown
        pass

    def icon(self, *args, **kwargs):  # real signature unknown
        pass

    def iconChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def iconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def initStyleOption(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def nextCheckState(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setButtonIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def setIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setIconType(self, *args, **kwargs):  # real signature unknown
        pass

    def setStrictIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def strictIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KIconCanvas(__PyKDE4_kdeui.KListWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEditor(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def commitData(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dataChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def dirtyRegionOffset(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    def dropIndicatorPosition(self, *args, **kwargs):  # real signature unknown
        pass

    def dropMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def edit(self, *args, **kwargs):  # real signature unknown
        pass

    def editorDestroyed(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def executeDelayedItemsLayout(self, *args, **kwargs):
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getCurrent(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def horizontalOffset(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def horizontalScrollbarAction(self, *args, **kwargs):
        pass

    # real signature unknown
    def horizontalScrollbarValueChanged(self, *args, **kwargs):
        pass

    # real signature unknown
    def horizontalStepsPerItem(self, *args, **kwargs):
        pass

    def indexFromItem(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def isIndexHidden(self, *args, **kwargs):  # real signature unknown
        pass

    def itemFromIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def loadFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveCursor(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def nameChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def progress(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def rectForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def rowsAboutToBeRemoved(self, *args, **kwargs):  # real signature unknown
        pass

    def rowsInserted(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def scheduleDelayedItemsLayout(self, *args, **kwargs):
        pass

    def scrollContentsBy(self, *args, **kwargs):  # real signature unknown
        pass

    def scrollDirtyRegion(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedIndexes(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def selectionCommand(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setDirtyRegion(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setHorizontalStepsPerItem(self, *args, **kwargs):
        pass

    def setPositionForIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def setSelection(self, *args, **kwargs):  # real signature unknown
        pass

    def setState(self, *args, **kwargs):  # real signature unknown
        pass

    def setupViewport(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setVerticalStepsPerItem(self, *args, **kwargs):
        pass

    def setViewportMargins(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def startDrag(self, *args, **kwargs):  # real signature unknown
        pass

    def startLoading(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self, *args, **kwargs):  # real signature unknown
        pass

    def stopLoading(self, *args, **kwargs):  # real signature unknown
        pass

    def supportedDropActions(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateEditorData(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def updateEditorGeometries(self, *args, **kwargs):
        pass

    def updateGeometries(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def verticalOffset(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def verticalScrollbarAction(self, *args, **kwargs):
        pass

    # real signature unknown
    def verticalScrollbarValueChanged(self, *args, **kwargs):
        pass

    def verticalStepsPerItem(self, *args, **kwargs):  # real signature unknown
        pass

    def viewOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def viewportEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def visualRegionForSelection(self, *args, **kwargs):
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KIconDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getIcon(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def iconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def newIconName(self, *args, **kwargs):  # real signature unknown
        pass

    def openDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCustomLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def setIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setStrictIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setup(self, *args, **kwargs):  # real signature unknown
        pass

    def showDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def strictIconSize(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KIEBookmarkExporterImpl(KBookmarkExporterBase):
    # no doc

    def write(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KIEBookmarkImporterImpl(KBookmarkImporterBase):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KPreviewWidgetBase(__PyQt4_QtGui.QWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clearPreview(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setSupportedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showPreview(self, *args, **kwargs):  # real signature unknown
        pass

    def supportedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KImageFilePreview(KPreviewWidgetBase):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clearPreview(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def createJob(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def gotPreview(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setSupportedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showPreview(self, *args, **kwargs):  # real signature unknown
        pass

    def sizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KImageIO():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def isSupported(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def Mode(self, *args, **kwargs):  # real signature unknown
        pass

    def pattern(self, *args, **kwargs):  # real signature unknown
        pass

    def typeForMime(self, *args, **kwargs):  # real signature unknown
        pass

    def types(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Reading = 0
    Writing = 1


class KIO():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def AccessManager(self, *args, **kwargs):  # real signature unknown
        pass

    def AuthInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def buildErrorString(self, *args, **kwargs):  # real signature unknown
        pass

    def CacheControl(self, *args, **kwargs):  # real signature unknown
        pass

    def calculateRemaining(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def calculateRemainingSeconds(self, *args, **kwargs):
        pass

    def canPasteMimeSource(self, *args, **kwargs):  # real signature unknown
        pass

    def chmod(self, *args, **kwargs):  # real signature unknown
        pass

    def ChmodJob(self, *args, **kwargs):  # real signature unknown
        pass

    def chown(self, *args, **kwargs):  # real signature unknown
        pass

    def Command(self, *args, **kwargs):  # real signature unknown
        pass

    def Connection(self, *args, **kwargs):  # real signature unknown
        pass

    def ConnectionServer(self, *args, **kwargs):  # real signature unknown
        pass

    def convertSeconds(self, *args, **kwargs):  # real signature unknown
        pass

    def convertSize(self, *args, **kwargs):  # real signature unknown
        pass

    def convertSizeFromKiB(self, *args, **kwargs):  # real signature unknown
        pass

    def copy(self, *args, **kwargs):  # real signature unknown
        pass

    def copyAs(self, *args, **kwargs):  # real signature unknown
        pass

    def CopyInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def CopyJob(self, *args, **kwargs):  # real signature unknown
        pass

    def DavJob(self, *args, **kwargs):  # real signature unknown
        pass

    def davPropFind(self, *args, **kwargs):  # real signature unknown
        pass

    def davPropPatch(self, *args, **kwargs):  # real signature unknown
        pass

    def davReport(self, *args, **kwargs):  # real signature unknown
        pass

    def davSearch(self, *args, **kwargs):  # real signature unknown
        pass

    def decodeFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def DeleteJob(self, *args, **kwargs):  # real signature unknown
        pass

    def del_(self, *args, **kwargs):  # real signature unknown
        pass

    def directorySize(self, *args, **kwargs):  # real signature unknown
        pass

    def DirectorySizeJob(self, *args, **kwargs):  # real signature unknown
        pass

    def encodeFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def FileCopyJob(self, *args, **kwargs):  # real signature unknown
        pass

    def FileJob(self, *args, **kwargs):  # real signature unknown
        pass

    def fileMetaInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def filePreview(self, *args, **kwargs):  # real signature unknown
        pass

    def FileUndoManager(self, *args, **kwargs):  # real signature unknown
        pass

    def file_copy(self, *args, **kwargs):  # real signature unknown
        pass

    def file_delete(self, *args, **kwargs):  # real signature unknown
        pass

    def file_move(self, *args, **kwargs):  # real signature unknown
        pass

    def ForwardingSlaveBase(self, *args, **kwargs):  # real signature unknown
        pass

    def get(self, *args, **kwargs):  # real signature unknown
        pass

    def getCacheControlString(self, *args, **kwargs):  # real signature unknown
        pass

    def getJobTracker(self, *args, **kwargs):  # real signature unknown
        pass

    def http_post(self, *args, **kwargs):  # real signature unknown
        pass

    def http_update_cache(self, *args, **kwargs):  # real signature unknown
        pass

    def Info(self, *args, **kwargs):  # real signature unknown
        pass

    def Integration(self, *args, **kwargs):  # real signature unknown
        pass

    def itemsSummaryString(self, *args, **kwargs):  # real signature unknown
        pass

    def Job(self, *args, **kwargs):  # real signature unknown
        pass

    def JobFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def JobFlags(self, *args, **kwargs):  # real signature unknown
        pass

    def JobUiDelegate(self, *args, **kwargs):  # real signature unknown
        pass

    def link(self, *args, **kwargs):  # real signature unknown
        pass

    def linkAs(self, *args, **kwargs):  # real signature unknown
        pass

    def listDir(self, *args, **kwargs):  # real signature unknown
        pass

    def ListJob(self, *args, **kwargs):  # real signature unknown
        pass

    def listRecursive(self, *args, **kwargs):  # real signature unknown
        pass

    def LoadType(self, *args, **kwargs):  # real signature unknown
        pass

    def Message(self, *args, **kwargs):  # real signature unknown
        pass

    def MetaInfoJob(self, *args, **kwargs):  # real signature unknown
        pass

    def mimetype(self, *args, **kwargs):  # real signature unknown
        pass

    def MimetypeJob(self, *args, **kwargs):  # real signature unknown
        pass

    def mkdir(self, *args, **kwargs):  # real signature unknown
        pass

    def mostLocalUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def mount(self, *args, **kwargs):  # real signature unknown
        pass

    def move(self, *args, **kwargs):  # real signature unknown
        pass

    def moveAs(self, *args, **kwargs):  # real signature unknown
        pass

    def MultiGetJob(self, *args, **kwargs):  # real signature unknown
        pass

    def multi_get(self, *args, **kwargs):  # real signature unknown
        pass

    def NetAccess(self, *args, **kwargs):  # real signature unknown
        pass

    def NetRC(self, *args, **kwargs):  # real signature unknown
        pass

    def number(self, *args, **kwargs):  # real signature unknown
        pass

    def open(self, *args, **kwargs):  # real signature unknown
        pass

    def parseCacheControl(self, *args, **kwargs):  # real signature unknown
        pass

    def PasswordDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteActionText(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteClipboard(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteData(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteDataAsync(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def pasteMimeSource(self, *args, **kwargs):  # real signature unknown
        pass

    def PreviewJob(self, *args, **kwargs):  # real signature unknown
        pass

    def put(self, *args, **kwargs):  # real signature unknown
        pass

    def rawErrorDetail(self, *args, **kwargs):  # real signature unknown
        pass

    def rename(self, *args, **kwargs):  # real signature unknown
        pass

    def RenameDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def RenameDialogPlugin(self, *args, **kwargs):  # real signature unknown
        pass

    def RenameDialog_Mode(self, *args, **kwargs):  # real signature unknown
        pass

    def RenameDialog_Result(self, *args, **kwargs):  # real signature unknown
        pass

    def rmdir(self, *args, **kwargs):  # real signature unknown
        pass

    def Scheduler(self, *args, **kwargs):  # real signature unknown
        pass

    def SessionData(self, *args, **kwargs):  # real signature unknown
        pass

    def setModificationTime(self, *args, **kwargs):  # real signature unknown
        pass

    def SimpleJob(self, *args, **kwargs):  # real signature unknown
        pass

    def SkipDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def SkipDialog_Result(self, *args, **kwargs):  # real signature unknown
        pass

    def Slave(self, *args, **kwargs):  # real signature unknown
        pass

    def SlaveBase(self, *args, **kwargs):  # real signature unknown
        pass

    def SlaveConfig(self, *args, **kwargs):  # real signature unknown
        pass

    def SlaveInterface(self, *args, **kwargs):  # real signature unknown
        pass

    def special(self, *args, **kwargs):  # real signature unknown
        pass

    def SpecialJob(self, *args, **kwargs):  # real signature unknown
        pass

    def SslUi(self, *args, **kwargs):  # real signature unknown
        pass

    def stat(self, *args, **kwargs):  # real signature unknown
        pass

    def StatJob(self, *args, **kwargs):  # real signature unknown
        pass

    def storedGet(self, *args, **kwargs):  # real signature unknown
        pass

    def storedHttpPost(self, *args, **kwargs):  # real signature unknown
        pass

    def storedPut(self, *args, **kwargs):  # real signature unknown
        pass

    def StoredTransferJob(self, *args, **kwargs):  # real signature unknown
        pass

    def symlink(self, *args, **kwargs):  # real signature unknown
        pass

    def TCPSlaveBase(self, *args, **kwargs):  # real signature unknown
        pass

    def TransferJob(self, *args, **kwargs):  # real signature unknown
        pass

    def trash(self, *args, **kwargs):  # real signature unknown
        pass

    def UDSEntry(self, *args, **kwargs):  # real signature unknown
        pass

    def unmount(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def unsupportedActionErrorString(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    CC_Cache = 1
    CC_CacheOnly = 0
    CC_Refresh = 3
    CC_Reload = 4
    CC_Verify = 2
    CMD_CHMOD = 76
    CMD_CHOWN = 89
    CMD_CLOSE = 93
    CMD_CONFIG = 85
    CMD_CONNECT = 49
    CMD_COPY = 74
    CMD_DEL = 75
    CMD_DISCONNECT = 50
    CMD_GET = 67
    CMD_HOST = 48
    CMD_HOST_INFO = 94
    CMD_LISTDIR = 71
    CMD_MESSAGEBOXANSWER = 83
    CMD_META_DATA = 80
    CMD_MIMETYPE = 70
    CMD_MKDIR = 72
    CMD_MULTI_GET = 86
    CMD_NONE = 65
    CMD_OPEN = 88
    CMD_PUT = 68
    CMD_READ = 90
    CMD_RENAME = 73
    CMD_REPARSECONFIGURATION = 79
    CMD_RESUMEANSWER = 84
    CMD_SEEK = 92
    CMD_SETLINKDEST = 87
    CMD_SETMODIFICATIONTIME = 78
    CMD_SLAVE_CONNECT = 52
    CMD_SLAVE_HOLD = 53
    CMD_SLAVE_STATUS = 51
    CMD_SPECIAL = 77
    CMD_STAT = 69
    CMD_SUBURL = 82
    CMD_SYMLINK = 81
    CMD_TESTDIR = 66
    CMD_WRITE = 91
    DefaultFlags = 0
    ERR_ABORTED = 147
    ERR_ACCESS_DENIED = 115
    ERR_CANNOT_CHMOD = 141
    ERR_CANNOT_CHOWN = 168
    ERR_CANNOT_DELETE = 142
    ERR_CANNOT_DELETE_ORIGINAL = 154
    ERR_CANNOT_DELETE_PARTIAL = 155
    ERR_CANNOT_ENTER_DIRECTORY = 117
    ERR_CANNOT_LAUNCH_PROCESS = 103
    ERR_CANNOT_OPEN_FOR_READING = 101
    ERR_CANNOT_OPEN_FOR_WRITING = 102
    ERR_CANNOT_RENAME = 140
    ERR_CANNOT_RENAME_ORIGINAL = 156
    ERR_CANNOT_RENAME_PARTIAL = 157
    ERR_CANNOT_RESUME = 139
    ERR_CANNOT_SETTIME = 167
    ERR_CANNOT_SYMLINK = 159
    ERR_CONNECTION_BROKEN = 124
    ERR_COULD_NOT_ACCEPT = 132
    ERR_COULD_NOT_AUTHENTICATE = 146
    ERR_COULD_NOT_BIND = 130
    ERR_COULD_NOT_CLOSEDIR = 135
    ERR_COULD_NOT_CONNECT = 123
    ERR_COULD_NOT_CREATE_SOCKET = 122
    ERR_COULD_NOT_LISTEN = 131
    ERR_COULD_NOT_LOGIN = 133
    ERR_COULD_NOT_MKDIR = 137
    ERR_COULD_NOT_MOUNT = 126
    ERR_COULD_NOT_READ = 128
    ERR_COULD_NOT_RMDIR = 138
    ERR_COULD_NOT_SEEK = 166
    ERR_COULD_NOT_STAT = 134
    ERR_COULD_NOT_UNMOUNT = 127
    ERR_COULD_NOT_WRITE = 129
    ERR_CYCLIC_COPY = 121
    ERR_CYCLIC_LINK = 119
    ERR_DIR_ALREADY_EXIST = 113
    ERR_DISK_FULL = 161
    ERR_DOES_NOT_EXIST = 111
    ERR_FILE_ALREADY_EXIST = 112
    ERR_IDENTICAL_FILES = 162
    ERR_INTERNAL = 104
    ERR_INTERNAL_SERVER = 148
    ERR_IS_DIRECTORY = 109
    ERR_IS_FILE = 110
    ERR_MALFORMED_URL = 105
    ERR_NEED_PASSWD = 158
    ERR_NOT_FILTER_PROTOCOL = 125
    ERR_NO_CONTENT = 160
    ERR_NO_SOURCE_PROTOCOL = 107
    ERR_OUT_OF_MEMORY = 144
    ERR_POST_DENIED = 165
    ERR_POST_NO_SIZE = 169
    ERR_PROTOCOL_IS_NOT_A_FILESYSTEM = 118
    ERR_SERVER_TIMEOUT = 149
    ERR_SERVICE_NOT_AVAILABLE = 150
    ERR_SLAVE_DEFINED = 163
    ERR_SLAVE_DIED = 143
    ERR_UNKNOWN = 151
    ERR_UNKNOWN_HOST = 114
    ERR_UNKNOWN_INTERRUPT = 153
    ERR_UNKNOWN_PROXY_HOST = 145
    ERR_UNSUPPORTED_ACTION = 108
    ERR_UNSUPPORTED_PROTOCOL = 106
    ERR_UPGRADE_REQUIRED = 164
    ERR_USER_CANCELED = 1
    ERR_WRITE_ACCESS_DENIED = 116
    HideProgressInfo = 1
    INF_ERROR_PAGE = 22
    INF_GETTING_FILE = 24
    INF_INFOMESSAGE = 26
    INF_MESSAGEBOX = 29
    INF_META_DATA = 27
    INF_MIME_TYPE = 21
    INF_NETWORK_STATUS = 28
    INF_POSITION = 30
    INF_PROCESSED_SIZE = 11
    INF_REDIRECTION = 20
    INF_SPEED = 12
    INF_TOTAL_SIZE = 10
    INF_UNUSED = 25
    INF_WARNING = 23
    MSG_AUTH_KEY = 115
    MSG_CANRESUME = 114
    MSG_CONNECTED = 103
    MSG_DATA = 100
    MSG_DATA_REQ = 101
    MSG_DEL_AUTH_KEY = 116
    MSG_ERROR = 102
    MSG_FINISHED = 104
    MSG_HOST_INFO_REQ = 119
    MSG_LIST_ENTRIES = 106
    MSG_NEED_SUBURL_DATA = 113
    MSG_NET_DROP = 112
    MSG_NET_REQUEST = 111
    MSG_OPENED = 117
    MSG_RENAMED = 107
    MSG_RESUME = 108
    MSG_SLAVE_ACK = 110
    MSG_SLAVE_STATUS = 109
    MSG_STAT_ENTRY = 105
    MSG_WRITTEN = 118
    M_ISDIR = 128
    M_MULTI = 16
    M_NORENAME = 64
    M_OVERWRITE = 1
    M_OVERWRITE_ITSELF = 2
    M_RESUME = 32
    M_SINGLE = 8
    M_SKIP = 4
    NoReload = 1
    Overwrite = 4
    Reload = 0
    Resume = 2
    R_AUTO_RENAME = 8
    R_AUTO_SKIP = 3
    R_CANCEL = 0
    R_OVERWRITE = 4
    R_OVERWRITE_ALL = 5
    R_RENAME = 1
    R_RESUME = 6
    R_RESUME_ALL = 7
    R_SKIP = 2
    S_AUTO_SKIP = 2
    S_CANCEL = 0
    S_SKIP = 1


class KMimeTypeChooser(__PyKDE4_kdeui.KVBox):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def patterns(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def Visuals(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    Comments = 1
    EditButton = 4
    Patterns = 2


class KMimeTypeChooserDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def chooser(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KMountPoint():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def currentMountPoints(self, *args, **kwargs):  # real signature unknown
        pass

    def DetailsNeededFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def DetailsNeededFlags(self, *args, **kwargs):  # real signature unknown
        pass

    def FileSystemFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def List(self, *args, **kwargs):  # real signature unknown
        pass

    def mountedFrom(self, *args, **kwargs):  # real signature unknown
        pass

    def mountOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def mountPoint(self, *args, **kwargs):  # real signature unknown
        pass

    def mountType(self, *args, **kwargs):  # real signature unknown
        pass

    def possibleMountPoints(self, *args, **kwargs):  # real signature unknown
        pass

    def probablySlow(self, *args, **kwargs):  # real signature unknown
        pass

    def realDeviceName(self, *args, **kwargs):  # real signature unknown
        pass

    def testFileSystemFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    BasicInfoNeeded = 0
    CaseInsensitive = 4
    NeedMountOptions = 1
    NeedRealDeviceName = 2
    SupportsChmod = 0
    SupportsChown = 1
    SupportsSymlinks = 3
    SupportsUTime = 2


class KNSBookmarkImporterImpl(KBookmarkImporterBase):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setUtf8(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KMozillaBookmarkImporterImpl(KNSBookmarkImporterImpl):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KNameAndUrlInputDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setSuggestedName(self, *args, **kwargs):  # real signature unknown
        pass

    def setSuggestedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KNewFileMenu(__PyKDE4_kdeui.KActionMenu):
    # no doc

    def checkUpToDate(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def createDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def createdWidgets(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def deleteWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def directoryCreated(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileCreated(self, *args, **kwargs):  # real signature unknown
        pass

    def isModal(self, *args, **kwargs):  # real signature unknown
        pass

    def popupFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setModal(self, *args, **kwargs):  # real signature unknown
        pass

    def setParentWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setPopupFiles(self, *args, **kwargs):  # real signature unknown
        pass

    def setSupportedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setViewShowsHiddenFiles(self, *args, **kwargs):
        pass

    def slotResult(self, *args, **kwargs):  # real signature unknown
        pass

    def supportedMimeTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KNFSShare(__PyQt4_QtCore.QObject):
    # no doc

    def changed(self, *args, **kwargs):  # real signature unknown
        pass

    def exportsPath(self, *args, **kwargs):  # real signature unknown
        pass

    def instance(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectoryShared(self, *args, **kwargs):  # real signature unknown
        pass

    def sharedDirectories(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KNSBookmarkExporterImpl(KBookmarkExporterBase):
    # no doc

    def folderAsString(self, *args, **kwargs):  # real signature unknown
        pass

    def setUtf8(self, *args, **kwargs):  # real signature unknown
        pass

    def write(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KOCRDialog(__PyKDE4_kdeui.KPageDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getOCRDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def id(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def nextId(self, *args, **kwargs):  # real signature unknown
        pass

    def pageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setPageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def textRecognized(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KonqBookmarkContextMenu(KBookmarkContextMenu):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def addActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addBookmarkActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addFolderActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addOpenFolderInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def addProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def bookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def initStyleOption(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def manager(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def openInNewTab(self, *args, **kwargs):  # real signature unknown
        pass

    def openInNewWindow(self, *args, **kwargs):  # real signature unknown
        pass

    def owner(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toggleShowInToolbar(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KonqBookmarkMenu(KBookmarkMenu):
    # no doc

    def actionForBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addActions(self, *args, **kwargs):  # real signature unknown
        pass

    def addAddBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def addAddBookmarksList(self, *args, **kwargs):  # real signature unknown
        pass

    def addEditBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def addNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def addOpenInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dynamicBookmarksList(self, *args, **kwargs):  # real signature unknown
        pass

    def fillBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def fillDynamicBookmarks(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirty(self, *args, **kwargs):  # real signature unknown
        pass

    def isRoot(self, *args, **kwargs):  # real signature unknown
        pass

    def manager(self, *args, **kwargs):  # real signature unknown
        pass

    def owner(self, *args, **kwargs):  # real signature unknown
        pass

    def parentAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def parentMenu(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def refill(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAboutToShow(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAddBookmark(self, *args, **kwargs):  # real signature unknown
        pass

    def slotAddBookmarksList(self, *args, **kwargs):  # real signature unknown
        pass

    def slotNewFolder(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOpenFolderInTabs(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KonqBookmarkOwner(KBookmarkOwner):
    # no doc

    def openInNewTab(self, *args, **kwargs):  # real signature unknown
        pass

    def openInNewWindow(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KOpenWithDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def accept(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def hideNoCloseOnExit(self, *args, **kwargs):  # real signature unknown
        pass

    def hideRunInTerminal(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def service(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setSaveNewApplications(self, *args, **kwargs):
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def slotHighlighted(self, *args, **kwargs):  # real signature unknown
        pass

    def slotSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def slotTerminalToggled(self, *args, **kwargs):  # real signature unknown
        pass

    def slotTextChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def text(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KOperaBookmarkExporterImpl(KBookmarkExporterBase):
    # no doc

    def write(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KOperaBookmarkImporterImpl(KBookmarkImporterBase):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KPropertiesDialog(__PyKDE4_kdeui.KPageDialog):
    # no doc

    def abortApplying(self, *args, **kwargs):  # real signature unknown
        pass

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def applied(self, *args, **kwargs):  # real signature unknown
        pass

    def canceled(self, *args, **kwargs):  # real signature unknown
        pass

    def canDisplay(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def currentDir(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultName(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def insertPlugin(self, *args, **kwargs):  # real signature unknown
        pass

    def item(self, *args, **kwargs):  # real signature unknown
        pass

    def items(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def kurl(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveModality(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def pageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def propertiesClosed(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def rename(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def saveAs(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setFileNameReadOnly(self, *args, **kwargs):  # real signature unknown
        pass

    def setFileSharingPage(self, *args, **kwargs):  # real signature unknown
        pass

    def setPageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def showDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showFileSharingPage(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def slotCancel(self, *args, **kwargs):  # real signature unknown
        pass

    def slotOk(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def updateUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KProtocolManager():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def acceptLanguagesHeader(self, *args, **kwargs):  # real signature unknown
        pass

    def autoResume(self, *args, **kwargs):  # real signature unknown
        pass

    def badProxy(self, *args, **kwargs):  # real signature unknown
        pass

    def cacheControl(self, *args, **kwargs):  # real signature unknown
        pass

    def cacheDir(self, *args, **kwargs):  # real signature unknown
        pass

    def canCopyFromFile(self, *args, **kwargs):  # real signature unknown
        pass

    def canCopyToFile(self, *args, **kwargs):  # real signature unknown
        pass

    def canDeleteRecursive(self, *args, **kwargs):  # real signature unknown
        pass

    def canRenameFromFile(self, *args, **kwargs):  # real signature unknown
        pass

    def canRenameToFile(self, *args, **kwargs):  # real signature unknown
        pass

    def connectTimeout(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultMimetype(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultUserAgent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def fileNameUsedForCopying(self, *args, **kwargs):
        pass

    # real signature unknown
    def getSystemNameVersionAndMachine(self, *args, **kwargs):
        pass

    def inputType(self, *args, **kwargs):  # real signature unknown
        pass

    def isSourceProtocol(self, *args, **kwargs):  # real signature unknown
        pass

    def listing(self, *args, **kwargs):  # real signature unknown
        pass

    def markPartial(self, *args, **kwargs):  # real signature unknown
        pass

    def maxCacheAge(self, *args, **kwargs):  # real signature unknown
        pass

    def maxCacheSize(self, *args, **kwargs):  # real signature unknown
        pass

    def minimumKeepSize(self, *args, **kwargs):  # real signature unknown
        pass

    def noProxyFor(self, *args, **kwargs):  # real signature unknown
        pass

    def outputType(self, *args, **kwargs):  # real signature unknown
        pass

    def persistentConnections(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def persistentProxyConnection(self, *args, **kwargs):
        pass

    # real signature unknown
    def protocolForArchiveMimetype(self, *args, **kwargs):
        pass

    def proxiesForUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def ProxyAuthMode(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyAuthMode(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyConfigScript(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyConnectTimeout(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyFor(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyForUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def proxyType(self, *args, **kwargs):  # real signature unknown
        pass

    def ProxyType(self, *args, **kwargs):  # real signature unknown
        pass

    def readTimeout(self, *args, **kwargs):  # real signature unknown
        pass

    def reparseConfiguration(self, *args, **kwargs):  # real signature unknown
        pass

    def responseTimeout(self, *args, **kwargs):  # real signature unknown
        pass

    def slaveProtocol(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsDeleting(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsLinking(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsListing(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsMakeDir(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsMoving(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsOpening(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsReading(self, *args, **kwargs):  # real signature unknown
        pass

    def supportsWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def useCache(self, *args, **kwargs):  # real signature unknown
        pass

    def useProxy(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def userAgentForApplication(self, *args, **kwargs):
        pass

    def userAgentForHost(self, *args, **kwargs):  # real signature unknown
        pass

    def useReverseProxy(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Automatic = 1
    EnvVarProxy = 4
    ManualProxy = 1
    NoProxy = 0
    PACProxy = 2
    Prompt = 0
    WPADProxy = 3


class KRecentDirs():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def add(self, *args, **kwargs):  # real signature unknown
        pass

    def dir(self, *args, **kwargs):  # real signature unknown
        pass

    def list(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KRecentDocument():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def add(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self, *args, **kwargs):  # real signature unknown
        pass

    def maximumItems(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def recentDocumentDirectory(self, *args, **kwargs):
        pass

    def recentDocuments(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KRemoteEncoding():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def decode(self, *args, **kwargs):  # real signature unknown
        pass

    def directory(self, *args, **kwargs):  # real signature unknown
        pass

    def encode(self, *args, **kwargs):  # real signature unknown
        pass

    def encoding(self, *args, **kwargs):  # real signature unknown
        pass

    def encodingMib(self, *args, **kwargs):  # real signature unknown
        pass

    def fileName(self, *args, **kwargs):  # real signature unknown
        pass

    def setEncoding(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KRun(__PyQt4_QtCore.QObject):
    # no doc

    def abort(self, *args, **kwargs):  # real signature unknown
        pass

    def autoDelete(self, *args, **kwargs):  # real signature unknown
        pass

    def binaryName(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def displayOpenWithDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def doScanFile(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self, *args, **kwargs):  # real signature unknown
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        pass

    def foundMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def hasError(self, *args, **kwargs):  # real signature unknown
        pass

    def hasFinished(self, *args, **kwargs):  # real signature unknown
        pass

    def init(self, *args, **kwargs):  # real signature unknown
        pass

    def initializeNextAction(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectory(self, *args, **kwargs):  # real signature unknown
        pass

    def isExecutable(self, *args, **kwargs):  # real signature unknown
        pass

    def isExecutableFile(self, *args, **kwargs):  # real signature unknown
        pass

    def isLocalFile(self, *args, **kwargs):  # real signature unknown
        pass

    def job(self, *args, **kwargs):  # real signature unknown
        pass

    def killJob(self, *args, **kwargs):  # real signature unknown
        pass

    def mimeTypeDetermined(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def processDesktopExec(self, *args, **kwargs):  # real signature unknown
        pass

    def progressInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def run(self, *args, **kwargs):  # real signature unknown
        pass

    def runCommand(self, *args, **kwargs):  # real signature unknown
        pass

    def runUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def scanFile(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setAutoDelete(self, *args, **kwargs):  # real signature unknown
        pass

    def setDoScanFile(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setEnableExternalBrowser(self, *args, **kwargs):
        pass

    def setError(self, *args, **kwargs):  # real signature unknown
        pass

    def setFinished(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setInitializeNextAction(self, *args, **kwargs):
        pass

    def setIsDirecory(self, *args, **kwargs):  # real signature unknown
        pass

    def setIsLocalFile(self, *args, **kwargs):  # real signature unknown
        pass

    def setJob(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setPreferredService(self, *args, **kwargs):  # real signature unknown
        pass

    def setProgressInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def setRunExecutables(self, *args, **kwargs):  # real signature unknown
        pass

    def setSuggestedFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def shellQuote(self, *args, **kwargs):  # real signature unknown
        pass

    def slotScanFinished(self, *args, **kwargs):  # real signature unknown
        pass

    def slotScanMimeType(self, *args, **kwargs):  # real signature unknown
        pass

    def slotStatResult(self, *args, **kwargs):  # real signature unknown
        pass

    def slotTimeout(self, *args, **kwargs):  # real signature unknown
        pass

    def suggestedFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def timer(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KSambaShare(__PyQt4_QtCore.QObject):
    # no doc

    def changed(self, *args, **kwargs):  # real signature unknown
        pass

    def getShareByName(self, *args, **kwargs):  # real signature unknown
        pass

    def getSharesByPath(self, *args, **kwargs):  # real signature unknown
        pass

    def instance(self, *args, **kwargs):  # real signature unknown
        pass

    def isDirectoryShared(self, *args, **kwargs):  # real signature unknown
        pass

    def isShareNameAvailable(self, *args, **kwargs):  # real signature unknown
        pass

    def sharedDirectories(self, *args, **kwargs):  # real signature unknown
        pass

    def shareNames(self, *args, **kwargs):  # real signature unknown
        pass

    def smbConfPath(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KSambaShareData():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def acl(self, *args, **kwargs):  # real signature unknown
        pass

    def comment(self, *args, **kwargs):  # real signature unknown
        pass

    def guestPermission(self, *args, **kwargs):  # real signature unknown
        pass

    def GuestPermission(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def path(self, *args, **kwargs):  # real signature unknown
        pass

    def remove(self, *args, **kwargs):  # real signature unknown
        pass

    def save(self, *args, **kwargs):  # real signature unknown
        pass

    def setAcl(self, *args, **kwargs):  # real signature unknown
        pass

    def setComment(self, *args, **kwargs):  # real signature unknown
        pass

    def setGuestPermission(self, *args, **kwargs):  # real signature unknown
        pass

    def setName(self, *args, **kwargs):  # real signature unknown
        pass

    def setPath(self, *args, **kwargs):  # real signature unknown
        pass

    def UserShareError(self, *args, **kwargs):  # real signature unknown
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

    def __init__(self, *args, **kwargs):  # real signature unknown
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

    GuestsAllowed = 1
    GuestsNotAllowed = 0
    UserShareAclInvalid = 12
    UserShareAclOk = 11
    UserShareAclUserNotValid = 13
    UserShareCommentOk = 14
    UserShareExceedMaxShares = 1
    UserShareGuestsInvalid = 16
    UserShareGuestsNotAllowed = 17
    UserShareGuestsOk = 15
    UserShareNameInUse = 4
    UserShareNameInvalid = 3
    UserShareNameOk = 2
    UserShareOk = 0
    UserSharePathInvalid = 6
    UserSharePathNotAbsolute = 9
    UserSharePathNotAllowed = 10
    UserSharePathNotDirectory = 8
    UserSharePathNotExists = 7
    UserSharePathOk = 5
    UserShareSystemError = 18


class KScanDialog(__PyKDE4_kdeui.KPageDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def finalImage(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getScanDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def id(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def nextId(self, *args, **kwargs):  # real signature unknown
        pass

    def pageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def preview(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setPageWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def setup(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def textRecognized(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUrlCompletion(__PyKDE4_kdeui.KCompletion):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dir(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def isRunning(self, *args, **kwargs):  # real signature unknown
        pass

    def makeCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def Mode(self, *args, **kwargs):  # real signature unknown
        pass

    def postProcessMatch(self, *args, **kwargs):  # real signature unknown
        pass

    def postProcessMatches(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def replacedPath(self, *args, **kwargs):  # real signature unknown
        pass

    def replaceEnv(self, *args, **kwargs):  # real signature unknown
        pass

    def replaceHome(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setReplaceEnv(self, *args, **kwargs):  # real signature unknown
        pass

    def setReplaceHome(self, *args, **kwargs):  # real signature unknown
        pass

    def stop(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    DirCompletion = 3
    ExeCompletion = 1
    FileCompletion = 2


class KShellCompletion(KUrlCompletion):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def makeCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def postProcessMatch(self, *args, **kwargs):  # real signature unknown
        pass

    def postProcessMatches(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KStatusBarOfflineIndicator(__PyQt4_QtGui.QWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KTar(KArchive):
    # no doc

    def closeArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def doFinishWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doPrepareWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteDir(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteSymLink(self, *args, **kwargs):  # real signature unknown
        pass

    def findOrCreate(self, *args, **kwargs):  # real signature unknown
        pass

    def openArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def rootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def setOrigFileName(self, *args, **kwargs):  # real signature unknown
        pass

    def setRootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUriFilter():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def filteredUri(self, *args, **kwargs):  # real signature unknown
        pass

    def filterSearchUri(self, *args, **kwargs):  # real signature unknown
        pass

    def filterUri(self, *args, **kwargs):  # real signature unknown
        pass

    def loadPlugins(self, *args, **kwargs):  # real signature unknown
        pass

    def pluginNames(self, *args, **kwargs):  # real signature unknown
        pass

    def SearchFilterType(self, *args, **kwargs):  # real signature unknown
        pass

    def SearchFilterTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def self(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    NormalTextFilter = 1
    WebShortcutFilter = 2


class KUriFilterData():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def absolutePath(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def allQueriesForSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def alternateDefaultSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def alternateSearchProviders(self, *args, **kwargs):
        pass

    def argsAndOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def checkForExecutables(self, *args, **kwargs):  # real signature unknown
        pass

    def defaultUrlScheme(self, *args, **kwargs):  # real signature unknown
        pass

    def errorMsg(self, *args, **kwargs):  # real signature unknown
        pass

    def hasAbsolutePath(self, *args, **kwargs):  # real signature unknown
        pass

    def hasArgsAndOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def iconName(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def iconNameForPreferredSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def preferredSearchProviders(self, *args, **kwargs):
        pass

    # real signature unknown
    def queryForPreferredSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def queryForSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def searchFilteringOptions(self, *args, **kwargs):
        pass

    def SearchFilterOption(self, *args, **kwargs):  # real signature unknown
        pass

    def SearchFilterOptions(self, *args, **kwargs):  # real signature unknown
        pass

    def searchProvider(self, *args, **kwargs):  # real signature unknown
        pass

    def searchTerm(self, *args, **kwargs):  # real signature unknown
        pass

    def searchTermSeparator(self, *args, **kwargs):  # real signature unknown
        pass

    def setAbsolutePath(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setAlternateDefaultSearchProvider(self, *args, **kwargs):
        pass

    # real signature unknown
    def setAlternateSearchProviders(self, *args, **kwargs):
        pass

    # real signature unknown
    def setCheckForExecutables(self, *args, **kwargs):
        pass

    def setData(self, *args, **kwargs):  # real signature unknown
        pass

    def setDefaultUrlScheme(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setSearchFilteringOptions(self, *args, **kwargs):
        pass

    def typedString(self, *args, **kwargs):  # real signature unknown
        pass

    def uri(self, *args, **kwargs):  # real signature unknown
        pass

    def uriType(self, *args, **kwargs):  # real signature unknown
        pass

    def UriTypes(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Blocked = 6
    Error = 7
    Executable = 3
    Help = 4
    LocalDir = 2
    LocalFile = 1
    NetProtocol = 0
    RetrieveAvailableSearchProvidersOnly = 3
    RetrievePreferredSearchProvidersOnly = 2
    RetrieveSearchProvidersOnly = 1
    SearchFilterOptionNone = 0
    Shell = 5
    Unknown = 8


class KUriFilterPlugin(__PyQt4_QtCore.QObject):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def configModule(self, *args, **kwargs):  # real signature unknown
        pass

    def configName(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def filterUri(self, *args, **kwargs):  # real signature unknown
        pass

    def iconNameFor(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resolveName(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setArguments(self, *args, **kwargs):  # real signature unknown
        pass

    def setErrorMsg(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilteredUri(self, *args, **kwargs):  # real signature unknown
        pass

    def setSearchProvider(self, *args, **kwargs):  # real signature unknown
        pass

    def setSearchProviders(self, *args, **kwargs):  # real signature unknown
        pass

    def setUriType(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUriFilterSearchProvider():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def defaultKey(self, *args, **kwargs):  # real signature unknown
        pass

    def desktopEntryName(self, *args, **kwargs):  # real signature unknown
        pass

    def iconName(self, *args, **kwargs):  # real signature unknown
        pass

    def keys(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def setDesktopEntryName(self, *args, **kwargs):  # real signature unknown
        pass

    def setIconName(self, *args, **kwargs):  # real signature unknown
        pass

    def setKeys(self, *args, **kwargs):  # real signature unknown
        pass

    def setName(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class KUrlComboBox(__PyKDE4_kdeui.KComboBox):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def addDefaultUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def delegate(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getKeyBindings(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def initStyleOption(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodQuery(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def makeCompletion(self, *args, **kwargs):  # real signature unknown
        pass

    def maxItems(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def minimumSizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def Mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def OverLoadResolving(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def removeUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setCompletedText(self, *args, **kwargs):  # real signature unknown
        pass

    def setCompletionObject(self, *args, **kwargs):  # real signature unknown
        pass

    def setDefaults(self, *args, **kwargs):  # real signature unknown
        pass

    def setDelegate(self, *args, **kwargs):  # real signature unknown
        pass

    def setMaxItems(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrls(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def urlActivated(self, *args, **kwargs):  # real signature unknown
        pass

    def urls(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    Both = 0
    Directories = 1
    Files = -1
    RemoveBottom = 1
    RemoveTop = 0


class KUrlRequester(__PyKDE4_kdeui.KHBox):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def button(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self, *args, **kwargs):  # real signature unknown
        pass

    def clickMessage(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def comboBox(self, *args, **kwargs):  # real signature unknown
        pass

    def completionObject(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEditor(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def fileDialogModality(self, *args, **kwargs):  # real signature unknown
        pass

    def filter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def lineEdit(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mode(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def openFileDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def returnPressed(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setClickMessage(self, *args, **kwargs):  # real signature unknown
        pass

    def setFileDialogModality(self, *args, **kwargs):  # real signature unknown
        pass

    def setFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def setMode(self, *args, **kwargs):  # real signature unknown
        pass

    def setPath(self, *args, **kwargs):  # real signature unknown
        pass

    def setStartDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setText(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def startDir(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def text(self, *args, **kwargs):  # real signature unknown
        pass

    def textChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def urlSelected(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUrlComboRequester(KUrlRequester):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUrlNavigator(__PyQt4_QtGui.QWidget):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def activated(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def customProtocols(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def editableStateChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def editor(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def goBack(self, *args, **kwargs):  # real signature unknown
        pass

    def goForward(self, *args, **kwargs):  # real signature unknown
        pass

    def goHome(self, *args, **kwargs):  # real signature unknown
        pass

    def goUp(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def historyChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def historyIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def historySize(self, *args, **kwargs):  # real signature unknown
        pass

    def historyUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def homeUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def isActive(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def isPlacesSelectorVisible(self, *args, **kwargs):
        pass

    def isUrlEditable(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def locationState(self, *args, **kwargs):  # real signature unknown
        pass

    def locationUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def requestActivation(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def returnPressed(self, *args, **kwargs):  # real signature unknown
        pass

    def savedPosition(self, *args, **kwargs):  # real signature unknown
        pass

    def savedRootUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def saveLocationState(self, *args, **kwargs):  # real signature unknown
        pass

    def savePosition(self, *args, **kwargs):  # real signature unknown
        pass

    def saveRootUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def setActive(self, *args, **kwargs):  # real signature unknown
        pass

    def setCustomProtocols(self, *args, **kwargs):  # real signature unknown
        pass

    def setFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def setHomeUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def setLocationUrl(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def setPlacesSelectorVisible(self, *args, **kwargs):
        pass

    def setShowFullPath(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def setUrlEditable(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def showFullPath(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabRequested(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def uncommittedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def url(self, *args, **kwargs):  # real signature unknown
        pass

    def urlAboutToBeChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def urlChanged(self, *args, **kwargs):  # real signature unknown
        pass

    def urlsDropped(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUrlPixmapProvider(__PyKDE4_kdeui.KPixmapProvider):
    # no doc

    def pixmapFor(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KUrlRequesterDialog(__PyKDE4_kdeui.KDialog):
    # no doc

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dragEnterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragLeaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dragMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def dropEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    def eventFilter(self, *args, **kwargs):  # real signature unknown
        pass

    def fileDialog(self, *args, **kwargs):  # real signature unknown
        pass

    def focusInEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusNextPrevChild(self, *args, **kwargs):  # real signature unknown
        pass

    def focusOutEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def getUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseDoubleClickEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseMoveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mousePressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def mouseReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def selectedUrl(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def slotButtonClicked(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def updateGeometry(self, *args, **kwargs):  # real signature unknown
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def urlRequester(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KXBELBookmarkImporterImpl(KBookmarkImporterBase, KBookmarkGroupTraverser):
    # no doc

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def findDefaultLocation(self, *args, **kwargs):  # real signature unknown
        pass

    def parse(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def traverse(self, *args, **kwargs):  # real signature unknown
        pass

    def visit(self, *args, **kwargs):  # real signature unknown
        pass

    def visitEnter(self, *args, **kwargs):  # real signature unknown
        pass

    def visitLeave(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class KZip(KArchive):
    # no doc

    def closeArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def compression(self, *args, **kwargs):  # real signature unknown
        pass

    def Compression(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def doFinishWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doPrepareWriting(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteDir(self, *args, **kwargs):  # real signature unknown
        pass

    def doWriteSymLink(self, *args, **kwargs):  # real signature unknown
        pass

    def ExtraField(self, *args, **kwargs):  # real signature unknown
        pass

    def extraField(self, *args, **kwargs):  # real signature unknown
        pass

    def findOrCreate(self, *args, **kwargs):  # real signature unknown
        pass

    def openArchive(self, *args, **kwargs):  # real signature unknown
        pass

    def rootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def setCompression(self, *args, **kwargs):  # real signature unknown
        pass

    def setDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def setExtraField(self, *args, **kwargs):  # real signature unknown
        pass

    def setRootDir(self, *args, **kwargs):  # real signature unknown
        pass

    def writeData(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    DefaultExtraField = 1
    DeflateCompression = 1
    ModificationTime = 1
    NoCompression = 0
    NoExtraField = 0


class KZipFileEntry(KArchiveFile):
    # no doc

    def archive(self, *args, **kwargs):  # real signature unknown
        pass

    def compressedSize(self, *args, **kwargs):  # real signature unknown
        pass

    def crc32(self, *args, **kwargs):  # real signature unknown
        pass

    def createDevice(self, *args, **kwargs):  # real signature unknown
        pass

    def data(self, *args, **kwargs):  # real signature unknown
        pass

    def encoding(self, *args, **kwargs):  # real signature unknown
        pass

    def headerStart(self, *args, **kwargs):  # real signature unknown
        pass

    def path(self, *args, **kwargs):  # real signature unknown
        pass

    def setCompressedSize(self, *args, **kwargs):  # real signature unknown
        pass

    def setCRC32(self, *args, **kwargs):  # real signature unknown
        pass

    def setHeaderStart(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class PredicateProperties():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def Attributes(self, *args, **kwargs):  # real signature unknown
        pass

    def attributes(self, *args, **kwargs):  # real signature unknown
        pass

    def createValidator(self, *args, **kwargs):  # real signature unknown
        pass

    def isValid(self, *args, **kwargs):  # real signature unknown
        pass

    def maxCardinality(self, *args, **kwargs):  # real signature unknown
        pass

    def minCardinality(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self, *args, **kwargs):  # real signature unknown
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    def suggestedValues(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    Addable = 1
    Averaged = 16
    Cumulative = 8
    Modifiable = 4
    MultiLine = 32
    Removable = 2
    SqueezeText = 64


class ThumbCreator():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def flags(self, *args, **kwargs):  # real signature unknown
        pass

    def Flags(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    BlendIcon = 2
    DrawFrame = 1
    None = 0


class ThumbCreatorV2(ThumbCreator):
    # no doc
    # real signature unknown

    def createConfigurationWidget(self, *args, **kwargs):
        pass

    def writeConfiguration(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class ThumbSequenceCreator(ThumbCreator):
    # no doc

    def sequenceIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def setSequenceIndex(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

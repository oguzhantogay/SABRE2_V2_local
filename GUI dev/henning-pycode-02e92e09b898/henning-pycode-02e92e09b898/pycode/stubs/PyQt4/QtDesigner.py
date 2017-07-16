# encoding: utf-8
# module PyQt4.QtDesigner
# from /usr/lib/python2.7/dist-packages/PyQt4/QtDesigner.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# no functions
# classes

class QAbstractExtensionFactory():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QAbstractExtensionFactory()
    QAbstractExtensionFactory(QAbstractExtensionFactory)
    """
    # real signature unknown; restored from __doc__

    def extension(self, QObject, QString):
        """ QAbstractExtensionFactory.extension(QObject, QString) -> QObject """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QAbstractExtensionFactory=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QAbstractExtensionManager():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QAbstractExtensionManager()
    QAbstractExtensionManager(QAbstractExtensionManager)
    """
    # real signature unknown; restored from __doc__

    def extension(self, QObject, QString):
        """ QAbstractExtensionManager.extension(QObject, QString) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def registerExtensions(self, QAbstractExtensionFactory, QString):
        """ QAbstractExtensionManager.registerExtensions(QAbstractExtensionFactory, QString) """
        pass

    # real signature unknown; restored from __doc__
    def unregisterExtensions(self, QAbstractExtensionFactory, QString):
        """ QAbstractExtensionManager.unregisterExtensions(QAbstractExtensionFactory, QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QAbstractExtensionManager=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QAbstractFormBuilder():  # skipped bases: <type 'sip.simplewrapper'>

    """ QAbstractFormBuilder() """
    # real signature unknown; restored from __doc__

    def load(self, QIODevice, QWidget_parent=None):
        """ QAbstractFormBuilder.load(QIODevice, QWidget parent=None) -> QWidget """
        pass

    # real signature unknown; restored from __doc__
    def save(self, QIODevice, QWidget):
        """ QAbstractFormBuilder.save(QIODevice, QWidget) """
        pass

    # real signature unknown; restored from __doc__
    def setWorkingDirectory(self, QDir):
        """ QAbstractFormBuilder.setWorkingDirectory(QDir) """
        pass

    # real signature unknown; restored from __doc__
    def workingDirectory(self):
        """ QAbstractFormBuilder.workingDirectory() -> QDir """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default


class QDesignerActionEditorInterface(__PyQt4_QtGui.QWidget):

    """ QDesignerActionEditorInterface(QWidget, Qt.WindowFlags flags=0) """

    def core(self):  # real signature unknown; restored from __doc__
        """ QDesignerActionEditorInterface.core() -> QDesignerFormEditorInterface """
        return QDesignerFormEditorInterface

    # real signature unknown; restored from __doc__
    def manageAction(self, QAction):
        """ QDesignerActionEditorInterface.manageAction(QAction) """
        pass

    # real signature unknown; restored from __doc__
    def setFormWindow(self, QDesignerFormWindowInterface):
        """ QDesignerActionEditorInterface.setFormWindow(QDesignerFormWindowInterface) """
        pass

    # real signature unknown; restored from __doc__
    def unmanageAction(self, QAction):
        """ QDesignerActionEditorInterface.unmanageAction(QAction) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget, Qt_WindowFlags_flags=0):
        pass


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerContainerExtension():

    """
    QDesignerContainerExtension()
    QDesignerContainerExtension(QDesignerContainerExtension)
    """
    # real signature unknown; restored from __doc__

    def addWidget(self, QWidget):
        """ QDesignerContainerExtension.addWidget(QWidget) """
        pass

    def count(self):  # real signature unknown; restored from __doc__
        """ QDesignerContainerExtension.count() -> int """
        return 0

    def currentIndex(self):  # real signature unknown; restored from __doc__
        """ QDesignerContainerExtension.currentIndex() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def insertWidget(self, p_int, QWidget):
        """ QDesignerContainerExtension.insertWidget(int, QWidget) """
        pass

    def remove(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerContainerExtension.remove(int) """
        pass

    # real signature unknown; restored from __doc__
    def setCurrentIndex(self, p_int):
        """ QDesignerContainerExtension.setCurrentIndex(int) """
        pass

    def widget(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerContainerExtension.widget(int) -> QWidget """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerContainerExtension=None):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerCustomWidgetCollectionInterface():

    """
    QDesignerCustomWidgetCollectionInterface()
    QDesignerCustomWidgetCollectionInterface(QDesignerCustomWidgetCollectionInterface)
    """

    def customWidgets(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetCollectionInterface.customWidgets() -> list-of-QDesignerCustomWidgetInterface """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerCustomWidgetCollectionInterface=None):
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerCustomWidgetInterface():

    """
    QDesignerCustomWidgetInterface()
    QDesignerCustomWidgetInterface(QDesignerCustomWidgetInterface)
    """

    def codeTemplate(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.codeTemplate() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def createWidget(self, QWidget):
        """ QDesignerCustomWidgetInterface.createWidget(QWidget) -> QWidget """
        pass

    def domXml(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.domXml() -> QString """
        pass

    def group(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.group() -> QString """
        pass

    def icon(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.icon() -> QIcon """
        pass

    def includeFile(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.includeFile() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def initialize(self, QDesignerFormEditorInterface):
        """ QDesignerCustomWidgetInterface.initialize(QDesignerFormEditorInterface) """
        pass

    def isContainer(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.isContainer() -> bool """
        return False

    def isInitialized(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.isInitialized() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.name() -> QString """
        pass

    def toolTip(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.toolTip() -> QString """
        pass

    def whatsThis(self):  # real signature unknown; restored from __doc__
        """ QDesignerCustomWidgetInterface.whatsThis() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerCustomWidgetInterface=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDesignerFormEditorInterface(__PyQt4_QtCore.QObject):

    """ QDesignerFormEditorInterface(QObject parent=None) """

    def actionEditor(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormEditorInterface.actionEditor() -> QDesignerActionEditorInterface """
        return QDesignerActionEditorInterface

    # real signature unknown; restored from __doc__
    def extensionManager(self):
        """ QDesignerFormEditorInterface.extensionManager() -> QExtensionManager """
        return QExtensionManager

    # real signature unknown; restored from __doc__
    def formWindowManager(self):
        """ QDesignerFormEditorInterface.formWindowManager() -> QDesignerFormWindowManagerInterface """
        return QDesignerFormWindowManagerInterface

    def objectInspector(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormEditorInterface.objectInspector() -> QDesignerObjectInspectorInterface """
        return QDesignerObjectInspectorInterface

    def propertyEditor(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormEditorInterface.propertyEditor() -> QDesignerPropertyEditorInterface """
        return QDesignerPropertyEditorInterface

    # real signature unknown; restored from __doc__
    def setActionEditor(self, QDesignerActionEditorInterface):
        """ QDesignerFormEditorInterface.setActionEditor(QDesignerActionEditorInterface) """
        pass

    # real signature unknown; restored from __doc__
    def setObjectInspector(self, QDesignerObjectInspectorInterface):
        """ QDesignerFormEditorInterface.setObjectInspector(QDesignerObjectInspectorInterface) """
        pass

    # real signature unknown; restored from __doc__
    def setPropertyEditor(self, QDesignerPropertyEditorInterface):
        """ QDesignerFormEditorInterface.setPropertyEditor(QDesignerPropertyEditorInterface) """
        pass

    # real signature unknown; restored from __doc__
    def setWidgetBox(self, QDesignerWidgetBoxInterface):
        """ QDesignerFormEditorInterface.setWidgetBox(QDesignerWidgetBoxInterface) """
        pass

    def topLevel(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormEditorInterface.topLevel() -> QWidget """
        pass

    def widgetBox(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormEditorInterface.widgetBox() -> QDesignerWidgetBoxInterface """
        return QDesignerWidgetBoxInterface

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerFormWindowCursorInterface():

    """
    QDesignerFormWindowCursorInterface()
    QDesignerFormWindowCursorInterface(QDesignerFormWindowCursorInterface)
    """

    def current(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.current() -> QWidget """
        pass

    def formWindow(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.formWindow() -> QDesignerFormWindowInterface """
        return QDesignerFormWindowInterface

    def hasSelection(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.hasSelection() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isWidgetSelected(self, QWidget):
        """ QDesignerFormWindowCursorInterface.isWidgetSelected(QWidget) -> bool """
        return False

    def MoveMode(self, *args, **kwargs):  # real signature unknown
        pass

    def MoveOperation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def movePosition(self, QDesignerFormWindowCursorInterface_MoveOperation, QDesignerFormWindowCursorInterface_MoveMode_mode=None):
        """ QDesignerFormWindowCursorInterface.movePosition(QDesignerFormWindowCursorInterface.MoveOperation, QDesignerFormWindowCursorInterface.MoveMode mode=QDesignerFormWindowCursorInterface.MoveAnchor) -> bool """
        return False

    def position(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.position() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def resetWidgetProperty(self, QWidget, QString):
        """ QDesignerFormWindowCursorInterface.resetWidgetProperty(QWidget, QString) """
        pass

    # real signature unknown; restored from __doc__
    def selectedWidget(self, p_int):
        """ QDesignerFormWindowCursorInterface.selectedWidget(int) -> QWidget """
        pass

    # real signature unknown; restored from __doc__
    def selectedWidgetCount(self):
        """ QDesignerFormWindowCursorInterface.selectedWidgetCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setPosition(self, p_int, QDesignerFormWindowCursorInterface_MoveMode_mode=None):
        """ QDesignerFormWindowCursorInterface.setPosition(int, QDesignerFormWindowCursorInterface.MoveMode mode=QDesignerFormWindowCursorInterface.MoveAnchor) """
        pass

    # real signature unknown; restored from __doc__
    def setProperty(self, QString, QVariant):
        """ QDesignerFormWindowCursorInterface.setProperty(QString, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setWidgetProperty(self, QWidget, QString, QVariant):
        """ QDesignerFormWindowCursorInterface.setWidgetProperty(QWidget, QString, QVariant) """
        pass

    def widget(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.widget(int) -> QWidget """
        pass

    def widgetCount(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowCursorInterface.widgetCount() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerFormWindowCursorInterface=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    Down = 8
    End = 2
    KeepAnchor = 1
    Left = 5
    MoveAnchor = 0
    Next = 3
    NoMove = 0
    Prev = 4
    Right = 6
    Start = 1
    Up = 7


class QDesignerFormWindowInterface(__PyQt4_QtGui.QWidget):
    # no doc

    def aboutToUnmanageWidget(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.aboutToUnmanageWidget[QWidget] [signal] """
        pass

    def absoluteDir(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.absoluteDir() -> QDir """
        pass

    def activated(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.activated[QWidget] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def addResourceFile(self, QString):
        """ QDesignerFormWindowInterface.addResourceFile(QString) """
        pass

    def author(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.author() -> QString """
        pass

    def changed(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.changed[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def clearSelection(self, bool_update=True):
        """ QDesignerFormWindowInterface.clearSelection(bool update=True) """
        pass

    def comment(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.comment() -> QString """
        pass

    def contents(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.contents() -> QString """
        pass

    def core(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.core() -> QDesignerFormEditorInterface """
        return QDesignerFormEditorInterface

    def cursor(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.cursor() -> QDesignerFormWindowCursorInterface """
        return QDesignerFormWindowCursorInterface

    # real signature unknown; restored from __doc__
    def emitSelectionChanged(self):
        """ QDesignerFormWindowInterface.emitSelectionChanged() """
        pass

    def exportMacro(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.exportMacro() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Feature(self, *__args):
        """
        QDesignerFormWindowInterface.Feature(QDesignerFormWindowInterface.Feature)
        QDesignerFormWindowInterface.Feature(int)
        QDesignerFormWindowInterface.Feature()
        """
        pass

    def featureChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.featureChanged[QDesignerFormWindowInterface.Feature] [signal] """
        pass

    def FeatureFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def features(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.features() -> QDesignerFormWindowInterface.Feature """
        pass

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.fileName() -> QString """
        pass

    def fileNameChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.fileNameChanged[QString] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def findFormWindow(self, *__args):
        """
        QDesignerFormWindowInterface.findFormWindow(QWidget) -> QDesignerFormWindowInterface
        QDesignerFormWindowInterface.findFormWindow(QObject) -> QDesignerFormWindowInterface
        """
        return QDesignerFormWindowInterface

    def geometryChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.geometryChanged[] [signal] """
        pass

    def grid(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.grid() -> QPoint """
        pass

    # real signature unknown; restored from __doc__
    def hasFeature(self, QDesignerFormWindowInterface_Feature):
        """ QDesignerFormWindowInterface.hasFeature(QDesignerFormWindowInterface.Feature) -> bool """
        return False

    def includeHints(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.includeHints() -> QStringList """
        pass

    def isDirty(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.isDirty() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isManaged(self, QWidget):
        """ QDesignerFormWindowInterface.isManaged(QWidget) -> bool """
        return False

    def layoutDefault(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.layoutDefault() -> (int, int) """
        pass

    def layoutFunction(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.layoutFunction() -> (QString, QString) """
        pass

    def mainContainer(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.mainContainer() -> QWidget """
        pass

    def mainContainerChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.mainContainerChanged[QWidget] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def manageWidget(self, QWidget):
        """ QDesignerFormWindowInterface.manageWidget(QWidget) """
        pass

    def objectRemoved(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.objectRemoved[QObject] [signal] """
        pass

    def pixmapFunction(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.pixmapFunction() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def removeResourceFile(self, QString):
        """ QDesignerFormWindowInterface.removeResourceFile(QString) """
        pass

    def resourceFiles(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.resourceFiles() -> QStringList """
        pass

    def resourceFilesChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.resourceFilesChanged[] [signal] """
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.selectionChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def selectWidget(self, QWidget, bool_select=True):
        """ QDesignerFormWindowInterface.selectWidget(QWidget, bool select=True) """
        pass

    # real signature unknown; restored from __doc__
    def setAuthor(self, QString):
        """ QDesignerFormWindowInterface.setAuthor(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setComment(self, QString):
        """ QDesignerFormWindowInterface.setComment(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setContents(self, *__args):
        """
        QDesignerFormWindowInterface.setContents(QIODevice)
        QDesignerFormWindowInterface.setContents(QString)
        """
        pass

    def setDirty(self, bool):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.setDirty(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setExportMacro(self, QString):
        """ QDesignerFormWindowInterface.setExportMacro(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setFeatures(self, QDesignerFormWindowInterface_Feature):
        """ QDesignerFormWindowInterface.setFeatures(QDesignerFormWindowInterface.Feature) """
        pass

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QDesignerFormWindowInterface.setFileName(QString) """
        pass

    def setGrid(self, QPoint):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowInterface.setGrid(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setIncludeHints(self, QStringList):
        """ QDesignerFormWindowInterface.setIncludeHints(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setLayoutDefault(self, p_int, p_int_1):
        """ QDesignerFormWindowInterface.setLayoutDefault(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setLayoutFunction(self, QString, QString_1):
        """ QDesignerFormWindowInterface.setLayoutFunction(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setMainContainer(self, QWidget):
        """ QDesignerFormWindowInterface.setMainContainer(QWidget) """
        pass

    # real signature unknown; restored from __doc__
    def setPixmapFunction(self, QString):
        """ QDesignerFormWindowInterface.setPixmapFunction(QString) """
        pass

    # real signature unknown; restored from __doc__
    def unmanageWidget(self, QWidget):
        """ QDesignerFormWindowInterface.unmanageWidget(QWidget) """
        pass

    def widgetManaged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.widgetManaged[QWidget] [signal] """
        pass

    def widgetRemoved(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.widgetRemoved[QWidget] [signal] """
        pass

    def widgetUnmanaged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowInterface.widgetUnmanaged[QWidget] [signal] """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    DefaultFeature = 3
    EditFeature = 1
    GridFeature = 2
    TabOrderFeature = 4


class QDesignerFormWindowManagerInterface(__PyQt4_QtCore.QObject):
    # no doc

    # real signature unknown; restored from __doc__
    def actionAdjustSize(self):
        """ QDesignerFormWindowManagerInterface.actionAdjustSize() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionBreakLayout(self):
        """ QDesignerFormWindowManagerInterface.actionBreakLayout() -> QAction """
        pass

    def actionCopy(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionCopy() -> QAction """
        pass

    def actionCut(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionCut() -> QAction """
        pass

    def actionDelete(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionDelete() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionFormLayout(self):
        """ QDesignerFormWindowManagerInterface.actionFormLayout() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionGridLayout(self):
        """ QDesignerFormWindowManagerInterface.actionGridLayout() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionHorizontalLayout(self):
        """ QDesignerFormWindowManagerInterface.actionHorizontalLayout() -> QAction """
        pass

    def actionLower(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionLower() -> QAction """
        pass

    def actionPaste(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionPaste() -> QAction """
        pass

    def actionRaise(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionRaise() -> QAction """
        pass

    def actionRedo(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionRedo() -> QAction """
        pass

    def actionSelectAll(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionSelectAll() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionSimplifyLayout(self):
        """ QDesignerFormWindowManagerInterface.actionSimplifyLayout() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionSplitHorizontal(self):
        """ QDesignerFormWindowManagerInterface.actionSplitHorizontal() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionSplitVertical(self):
        """ QDesignerFormWindowManagerInterface.actionSplitVertical() -> QAction """
        pass

    def actionUndo(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.actionUndo() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def actionVerticalLayout(self):
        """ QDesignerFormWindowManagerInterface.actionVerticalLayout() -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def activeFormWindow(self):
        """ QDesignerFormWindowManagerInterface.activeFormWindow() -> QDesignerFormWindowInterface """
        return QDesignerFormWindowInterface

    # real signature unknown
    def activeFormWindowChanged(self, *args, **kwargs):
        """ QDesignerFormWindowManagerInterface.activeFormWindowChanged[QDesignerFormWindowInterface] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def addFormWindow(self, QDesignerFormWindowInterface):
        """ QDesignerFormWindowManagerInterface.addFormWindow(QDesignerFormWindowInterface) """
        pass

    def core(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.core() -> QDesignerFormEditorInterface """
        return QDesignerFormEditorInterface

    # real signature unknown; restored from __doc__
    def createFormWindow(self, QWidget_parent=None, Qt_WindowFlags_flags=0):
        """ QDesignerFormWindowManagerInterface.createFormWindow(QWidget parent=None, Qt.WindowFlags flags=0) -> QDesignerFormWindowInterface """
        return QDesignerFormWindowInterface

    # real signature unknown; restored from __doc__
    def formWindow(self, p_int):
        """ QDesignerFormWindowManagerInterface.formWindow(int) -> QDesignerFormWindowInterface """
        return QDesignerFormWindowInterface

    def formWindowAdded(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowManagerInterface.formWindowAdded[QDesignerFormWindowInterface] [signal] """
        pass

    def formWindowCount(self):  # real signature unknown; restored from __doc__
        """ QDesignerFormWindowManagerInterface.formWindowCount() -> int """
        return 0

    def formWindowRemoved(self, *args, **kwargs):  # real signature unknown
        """ QDesignerFormWindowManagerInterface.formWindowRemoved[QDesignerFormWindowInterface] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def removeFormWindow(self, QDesignerFormWindowInterface):
        """ QDesignerFormWindowManagerInterface.removeFormWindow(QDesignerFormWindowInterface) """
        pass

    # real signature unknown; restored from __doc__
    def setActiveFormWindow(self, QDesignerFormWindowInterface):
        """ QDesignerFormWindowManagerInterface.setActiveFormWindow(QDesignerFormWindowInterface) """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerMemberSheetExtension():

    """
    QDesignerMemberSheetExtension()
    QDesignerMemberSheetExtension(QDesignerMemberSheetExtension)
    """

    def count(self):  # real signature unknown; restored from __doc__
        """ QDesignerMemberSheetExtension.count() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def declaredInClass(self, p_int):
        """ QDesignerMemberSheetExtension.declaredInClass(int) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def indexOf(self, QString):
        """ QDesignerMemberSheetExtension.indexOf(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def inheritedFromWidget(self, p_int):
        """ QDesignerMemberSheetExtension.inheritedFromWidget(int) -> bool """
        return False

    def isSignal(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerMemberSheetExtension.isSignal(int) -> bool """
        return False

    def isSlot(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerMemberSheetExtension.isSlot(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isVisible(self, p_int):
        """ QDesignerMemberSheetExtension.isVisible(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def memberGroup(self, p_int):
        """ QDesignerMemberSheetExtension.memberGroup(int) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def memberName(self, p_int):
        """ QDesignerMemberSheetExtension.memberName(int) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def parameterNames(self, p_int):
        """ QDesignerMemberSheetExtension.parameterNames(int) -> list-of-QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def parameterTypes(self, p_int):
        """ QDesignerMemberSheetExtension.parameterTypes(int) -> list-of-QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def setMemberGroup(self, p_int, QString):
        """ QDesignerMemberSheetExtension.setMemberGroup(int, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setVisible(self, p_int, bool):
        """ QDesignerMemberSheetExtension.setVisible(int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def signature(self, p_int):
        """ QDesignerMemberSheetExtension.signature(int) -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerMemberSheetExtension=None):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QDesignerObjectInspectorInterface(__PyQt4_QtGui.QWidget):

    """ QDesignerObjectInspectorInterface(QWidget, Qt.WindowFlags flags=0) """

    def core(self):  # real signature unknown; restored from __doc__
        """ QDesignerObjectInspectorInterface.core() -> QDesignerFormEditorInterface """
        return QDesignerFormEditorInterface

    # real signature unknown; restored from __doc__
    def setFormWindow(self, QDesignerFormWindowInterface):
        """ QDesignerObjectInspectorInterface.setFormWindow(QDesignerFormWindowInterface) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget, Qt_WindowFlags_flags=0):
        pass


class QDesignerPropertyEditorInterface(__PyQt4_QtGui.QWidget):

    """ QDesignerPropertyEditorInterface(QWidget, Qt.WindowFlags flags=0) """

    def core(self):  # real signature unknown; restored from __doc__
        """ QDesignerPropertyEditorInterface.core() -> QDesignerFormEditorInterface """
        return QDesignerFormEditorInterface

    # real signature unknown; restored from __doc__
    def currentPropertyName(self):
        """ QDesignerPropertyEditorInterface.currentPropertyName() -> QString """
        pass

    def isReadOnly(self):  # real signature unknown; restored from __doc__
        """ QDesignerPropertyEditorInterface.isReadOnly() -> bool """
        return False

    def object(self):  # real signature unknown; restored from __doc__
        """ QDesignerPropertyEditorInterface.object() -> QObject """
        pass

    def propertyChanged(self, *args, **kwargs):  # real signature unknown
        """ QDesignerPropertyEditorInterface.propertyChanged[QString, QVariant] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setObject(self, QObject):
        """ QDesignerPropertyEditorInterface.setObject(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setPropertyValue(self, QString, QVariant, bool_changed=True):
        """ QDesignerPropertyEditorInterface.setPropertyValue(QString, QVariant, bool changed=True) """
        pass

    # real signature unknown; restored from __doc__
    def setReadOnly(self, bool):
        """ QDesignerPropertyEditorInterface.setReadOnly(bool) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget, Qt_WindowFlags_flags=0):
        pass


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerPropertySheetExtension():

    """
    QDesignerPropertySheetExtension()
    QDesignerPropertySheetExtension(QDesignerPropertySheetExtension)
    """

    def count(self):  # real signature unknown; restored from __doc__
        """ QDesignerPropertySheetExtension.count() -> int """
        return 0

    def hasReset(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerPropertySheetExtension.hasReset(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indexOf(self, QString):
        """ QDesignerPropertySheetExtension.indexOf(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def isAttribute(self, p_int):
        """ QDesignerPropertySheetExtension.isAttribute(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isChanged(self, p_int):
        """ QDesignerPropertySheetExtension.isChanged(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isVisible(self, p_int):
        """ QDesignerPropertySheetExtension.isVisible(int) -> bool """
        return False

    def property(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerPropertySheetExtension.property(int) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def propertyGroup(self, p_int):
        """ QDesignerPropertySheetExtension.propertyGroup(int) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def propertyName(self, p_int):
        """ QDesignerPropertySheetExtension.propertyName(int) -> QString """
        pass

    def reset(self, p_int):  # real signature unknown; restored from __doc__
        """ QDesignerPropertySheetExtension.reset(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setAttribute(self, p_int, bool):
        """ QDesignerPropertySheetExtension.setAttribute(int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def setChanged(self, p_int, bool):
        """ QDesignerPropertySheetExtension.setChanged(int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def setProperty(self, p_int, QVariant):
        """ QDesignerPropertySheetExtension.setProperty(int, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setPropertyGroup(self, p_int, QString):
        """ QDesignerPropertySheetExtension.setPropertyGroup(int, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setVisible(self, p_int, bool):
        """ QDesignerPropertySheetExtension.setVisible(int, bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerPropertySheetExtension=None):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QDesignerTaskMenuExtension():

    """
    QDesignerTaskMenuExtension()
    QDesignerTaskMenuExtension(QDesignerTaskMenuExtension)
    """
    # real signature unknown; restored from __doc__

    def preferredEditAction(self):
        """ QDesignerTaskMenuExtension.preferredEditAction() -> QAction """
        pass

    def taskActions(self):  # real signature unknown; restored from __doc__
        """ QDesignerTaskMenuExtension.taskActions() -> list-of-QAction """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QDesignerTaskMenuExtension=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QDesignerWidgetBoxInterface(__PyQt4_QtGui.QWidget):
    # no doc

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QDesignerWidgetBoxInterface.fileName() -> QString """
        pass

    def load(self):  # real signature unknown; restored from __doc__
        """ QDesignerWidgetBoxInterface.load() -> bool """
        return False

    def save(self):  # real signature unknown; restored from __doc__
        """ QDesignerWidgetBoxInterface.save() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QDesignerWidgetBoxInterface.setFileName(QString) """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QExtensionFactory(__PyQt4_QtCore.QObject, QAbstractExtensionFactory):

    """ QExtensionFactory(QExtensionManager parent=None) """
    # real signature unknown; restored from __doc__

    def createExtension(self, QObject, QString, QObject_1):
        """ QExtensionFactory.createExtension(QObject, QString, QObject) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def extension(self, QObject, QString):
        """ QExtensionFactory.extension(QObject, QString) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def extensionManager(self):
        """ QExtensionFactory.extensionManager() -> QExtensionManager """
        return QExtensionManager

    # real signature unknown; restored from __doc__
    def __init__(self, QExtensionManager_parent=None):
        pass


class QExtensionManager(__PyQt4_QtCore.QObject, QAbstractExtensionManager):

    """ QExtensionManager(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def extension(self, QObject, QString):
        """ QExtensionManager.extension(QObject, QString) -> QObject """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def registerExtensions(self, QAbstractExtensionFactory, QString_iid=None, *args, **kwargs):
        """ QExtensionManager.registerExtensions(QAbstractExtensionFactory, QString iid=QString()) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def unregisterExtensions(self, QAbstractExtensionFactory, QString_iid=None, *args, **kwargs):
        """ QExtensionManager.unregisterExtensions(QAbstractExtensionFactory, QString iid=QString()) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QFormBuilder(QAbstractFormBuilder):

    """ QFormBuilder() """
    # real signature unknown; restored from __doc__

    def addPluginPath(self, QString):
        """ QFormBuilder.addPluginPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def clearPluginPaths(self):
        """ QFormBuilder.clearPluginPaths() """
        pass

    def customWidgets(self):  # real signature unknown; restored from __doc__
        """ QFormBuilder.customWidgets() -> list-of-QDesignerCustomWidgetInterface """
        pass

    def pluginPaths(self):  # real signature unknown; restored from __doc__
        """ QFormBuilder.pluginPaths() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def setPluginPath(self, QStringList):
        """ QFormBuilder.setPluginPath(QStringList) """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass


class QPyDesignerContainerExtension(__PyQt4_QtCore.QObject, QDesignerContainerExtension):

    """ QPyDesignerContainerExtension(QObject) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject):
        pass


class QPyDesignerCustomWidgetCollectionPlugin(__PyQt4_QtCore.QObject, QDesignerCustomWidgetCollectionInterface):

    """ QPyDesignerCustomWidgetCollectionPlugin(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject_parent=None):
        pass


class QPyDesignerCustomWidgetPlugin(__PyQt4_QtCore.QObject, QDesignerCustomWidgetInterface):

    """ QPyDesignerCustomWidgetPlugin(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject_parent=None):
        pass


class QPyDesignerMemberSheetExtension(__PyQt4_QtCore.QObject, QDesignerMemberSheetExtension):

    """ QPyDesignerMemberSheetExtension(QObject) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject):
        pass


class QPyDesignerPropertySheetExtension(__PyQt4_QtCore.QObject, QDesignerPropertySheetExtension):

    """ QPyDesignerPropertySheetExtension(QObject) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject):
        pass


class QPyDesignerTaskMenuExtension(__PyQt4_QtCore.QObject, QDesignerTaskMenuExtension):

    """ QPyDesignerTaskMenuExtension(QObject) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject):
        pass

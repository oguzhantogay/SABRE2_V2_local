# encoding: utf-8
# module PyQt4.QtCore
# from /usr/lib/python2.7/dist-packages/PyQt4/QtCore.so by generator 1.96
# no doc

# imports
import sip as __sip


# Variables with simple values

PYQT_VERSION = 264197

PYQT_VERSION_STR = '4.8.5'

QtCriticalMsg = 2
QtDebugMsg = 0
QtFatalMsg = 3
QtSystemMsg = 2
QtWarningMsg = 1

QT_VERSION = 263939

QT_VERSION_STR = '4.7.3'

# functions


def bin(QTextStream):  # real signature unknown; restored from __doc__
    """ bin(QTextStream) -> QTextStream """
    return QTextStream


def bom(QTextStream):  # real signature unknown; restored from __doc__
    """ bom(QTextStream) -> QTextStream """
    return QTextStream


def center(QTextStream):  # real signature unknown; restored from __doc__
    """ center(QTextStream) -> QTextStream """
    return QTextStream


def dec(QTextStream):  # real signature unknown; restored from __doc__
    """ dec(QTextStream) -> QTextStream """
    return QTextStream


def endl(QTextStream):  # real signature unknown; restored from __doc__
    """ endl(QTextStream) -> QTextStream """
    return QTextStream


def fixed(QTextStream):  # real signature unknown; restored from __doc__
    """ fixed(QTextStream) -> QTextStream """
    return QTextStream


def flush(QTextStream):  # real signature unknown; restored from __doc__
    """ flush(QTextStream) -> QTextStream """
    return QTextStream


def forcepoint(QTextStream):  # real signature unknown; restored from __doc__
    """ forcepoint(QTextStream) -> QTextStream """
    return QTextStream


def forcesign(QTextStream):  # real signature unknown; restored from __doc__
    """ forcesign(QTextStream) -> QTextStream """
    return QTextStream


def hex(QTextStream):  # real signature unknown; restored from __doc__
    """ hex(QTextStream) -> QTextStream """
    return QTextStream


def left(QTextStream):  # real signature unknown; restored from __doc__
    """ left(QTextStream) -> QTextStream """
    return QTextStream


# real signature unknown; restored from __doc__
def lowercasebase(QTextStream):
    """ lowercasebase(QTextStream) -> QTextStream """
    return QTextStream


# real signature unknown; restored from __doc__
def lowercasedigits(QTextStream):
    """ lowercasedigits(QTextStream) -> QTextStream """
    return QTextStream


def noforcepoint(QTextStream):  # real signature unknown; restored from __doc__
    """ noforcepoint(QTextStream) -> QTextStream """
    return QTextStream


def noforcesign(QTextStream):  # real signature unknown; restored from __doc__
    """ noforcesign(QTextStream) -> QTextStream """
    return QTextStream


def noshowbase(QTextStream):  # real signature unknown; restored from __doc__
    """ noshowbase(QTextStream) -> QTextStream """
    return QTextStream


def oct(QTextStream):  # real signature unknown; restored from __doc__
    """ oct(QTextStream) -> QTextStream """
    return QTextStream


def pyqtRemoveInputHook():  # real signature unknown; restored from __doc__
    """ pyqtRemoveInputHook() """
    pass


def pyqtRestoreInputHook():  # real signature unknown; restored from __doc__
    """ pyqtRestoreInputHook() """
    pass


# real signature unknown; restored from __doc__
def pyqtSignature(str_signature, str_result=None):
    """
    @pyqtSignature(str signature,  str result=None)
    
    This is deprecated, use pyqtSlot() instead.
    
    This is a decorator applied to Python methods of a QObject that marks them
    as Qt slots.
    signature is a string specifying the C++ signature of the slot.
    result is type of the value returned by the slot.
    """
    pass


def pyqtSlot(*types, **keywords):  # known case of PyQt4.QtCore.pyqtSlot
    """
    @pyqtSlot(*types, str name=None, str result=None)
    
    This is a decorator applied to Python methods of a QObject that marks them
    as Qt slots.
    The non-keyword arguments are the types of the slot arguments and each may
    be a Python type object or a string specifying a C++ type.
    name is the name of the slot and defaults to the name of the method.
    result is type of the value returned by the slot.
    """
    pass


def qAbs(p_float):  # real signature unknown; restored from __doc__
    """ qAbs(float) -> float """
    return 0.0


def qAddPostRoutine(callable):  # real signature unknown; restored from __doc__
    """ qAddPostRoutine(callable) """
    pass


def qChecksum(p_str):  # real signature unknown; restored from __doc__
    """ qChecksum(str) -> int """
    return 0


# real signature unknown; restored from __doc__
def qCompress(QByteArray, int_compressionLevel=-1):
    """ qCompress(QByteArray, int compressionLevel=-1) -> QByteArray """
    return QByteArray


def qCritical(p_str):  # real signature unknown; restored from __doc__
    """ qCritical(str) """
    pass


def qDebug(p_str):  # real signature unknown; restored from __doc__
    """ qDebug(str) """
    pass


# real signature unknown; restored from __doc__
def qErrnoWarning(p_int, p_str):
    """
    qErrnoWarning(int, str)
    qErrnoWarning(str)
    """
    pass


def qFatal(p_str):  # real signature unknown; restored from __doc__
    """ qFatal(str) """
    pass


# real signature unknown; restored from __doc__
def qFuzzyCompare(p_float, p_float_1):
    """ qFuzzyCompare(float, float) -> bool """
    return False


def qInf():  # real signature unknown; restored from __doc__
    """ qInf() -> float """
    return 0.0


# real signature unknown; restored from __doc__
def qInstallMsgHandler(callable):
    """ qInstallMsgHandler(callable) -> callable """
    pass


def qIsFinite(p_float):  # real signature unknown; restored from __doc__
    """ qIsFinite(float) -> bool """
    return False


def qIsInf(p_float):  # real signature unknown; restored from __doc__
    """ qIsInf(float) -> bool """
    return False


def qIsNaN(p_float):  # real signature unknown; restored from __doc__
    """ qIsNaN(float) -> bool """
    return False


def qIsNull(p_float):  # real signature unknown; restored from __doc__
    """ qIsNull(float) -> bool """
    return False


def qQNaN():  # real signature unknown; restored from __doc__
    """ qQNaN() -> float """
    return 0.0


def qrand():  # real signature unknown; restored from __doc__
    """ qrand() -> int """
    return 0


# real signature unknown; restored from __doc__
def qRegisterResourceData(p_int, p_str, p_str_1, p_str_2):
    """ qRegisterResourceData(int, str, str, str) -> bool """
    return False


# real signature unknown; restored from __doc__
def qRemovePostRoutine(callable):
    """ qRemovePostRoutine(callable) """
    pass


def qRound(p_float):  # real signature unknown; restored from __doc__
    """ qRound(float) -> int """
    return 0


def qRound64(p_float):  # real signature unknown; restored from __doc__
    """ qRound64(float) -> int """
    return 0


def qSetFieldWidth(p_int):  # real signature unknown; restored from __doc__
    """ qSetFieldWidth(int) -> QTextStreamManipulator """
    return QTextStreamManipulator


def qSetPadChar(QChar):  # real signature unknown; restored from __doc__
    """ qSetPadChar(QChar) -> QTextStreamManipulator """
    return QTextStreamManipulator


# real signature unknown; restored from __doc__
def qSetRealNumberPrecision(p_int):
    """ qSetRealNumberPrecision(int) -> QTextStreamManipulator """
    return QTextStreamManipulator


def qSharedBuild():  # real signature unknown; restored from __doc__
    """ qSharedBuild() -> bool """
    return False


def qSNaN():  # real signature unknown; restored from __doc__
    """ qSNaN() -> float """
    return 0.0


def qsrand(p_int):  # real signature unknown; restored from __doc__
    """ qsrand(int) """
    pass


# real signature unknown; restored from __doc__
def qSwap(QBitArray, QBitArray_1):
    """
    qSwap(QBitArray, QBitArray)
    qSwap(QByteArray, QByteArray)
    qSwap(QString, QString)
    qSwap(QUrl, QUrl)
    qSwap(QVariant, QVariant)
    """
    pass


# real signature unknown; restored from __doc__
def QT_TRANSLATE_NOOP(p_str, p_str_1):
    """ QT_TRANSLATE_NOOP(str, str) -> str """
    return ""


def QT_TR_NOOP(p_str):  # real signature unknown; restored from __doc__
    """ QT_TR_NOOP(str) -> str """
    return ""


def QT_TR_NOOP_UTF8(p_str):  # real signature unknown; restored from __doc__
    """ QT_TR_NOOP_UTF8(str) -> str """
    return ""


def qUncompress(QByteArray):  # real signature unknown; restored from __doc__
    """ qUncompress(QByteArray) -> QByteArray """
    return QByteArray


# real signature unknown; restored from __doc__
def qUnregisterResourceData(p_int, p_str, p_str_1, p_str_2):
    """ qUnregisterResourceData(int, str, str, str) -> bool """
    return False


def qVersion():  # real signature unknown; restored from __doc__
    """ qVersion() -> str """
    return ""


def qWarning(p_str):  # real signature unknown; restored from __doc__
    """ qWarning(str) """
    pass


# real signature unknown; restored from __doc__
def Q_ARG(p_object, p_object_1):
    """ Q_ARG(object, object) -> QGenericArgument """
    return QGenericArgument


def Q_ENUMS(*more):  # real signature unknown; restored from __doc__
    """ Q_ENUMS(...) """
    pass


def Q_FLAGS(*more):  # real signature unknown; restored from __doc__
    """ Q_FLAGS(...) """
    pass


def Q_RETURN_ARG(p_object):  # real signature unknown; restored from __doc__
    """ Q_RETURN_ARG(object) -> QGenericReturnArgument """
    return QGenericReturnArgument


def reset(QTextStream):  # real signature unknown; restored from __doc__
    """ reset(QTextStream) -> QTextStream """
    return QTextStream


def right(QTextStream):  # real signature unknown; restored from __doc__
    """ right(QTextStream) -> QTextStream """
    return QTextStream


def scientific(QTextStream):  # real signature unknown; restored from __doc__
    """ scientific(QTextStream) -> QTextStream """
    return QTextStream


def showbase(QTextStream):  # real signature unknown; restored from __doc__
    """ showbase(QTextStream) -> QTextStream """
    return QTextStream


def SIGNAL(p_str):  # real signature unknown; restored from __doc__
    """ SIGNAL(str) -> str """
    return ""


def SLOT(p_str):  # real signature unknown; restored from __doc__
    """ SLOT(str) -> str """
    return ""


# real signature unknown; restored from __doc__
def uppercasebase(QTextStream):
    """ uppercasebase(QTextStream) -> QTextStream """
    return QTextStream


# real signature unknown; restored from __doc__
def uppercasedigits(QTextStream):
    """ uppercasedigits(QTextStream) -> QTextStream """
    return QTextStream


def ws(QTextStream):  # real signature unknown; restored from __doc__
    """ ws(QTextStream) -> QTextStream """
    return QTextStream


# classes

class pyqtProperty(object):

    """
    pyqtProperty(type, fget=None, fset=None, freset=None, fdel=None, doc=None,
            designable=True, scriptable=True, stored=True, user=False,
            constant=False, final=False, notify=None) -> property attribute
    
    type is the type of the property.  It is either a type object or a string
    that is the name of a C++ type.
    freset is a function for resetting an attribute to its default value.
    designable sets the DESIGNABLE flag (the default is True for writable
    properties and False otherwise).
    scriptable sets the SCRIPTABLE flag.
    stored sets the STORED flag.
    user sets the USER flag.
    constant sets the CONSTANT flag.
    final sets the FINAL flag.
    notify is the NOTIFY signal.
    The other parameters are the same as those required by the standard Python
    property type.  Properties defined using pyqtProperty behave as both Python
    and Qt properties.
    Decorators can be used to define new properties or to modify existing ones.
    """

    def deleter(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the deleter on a property. """
        pass

    def getter(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the getter on a property. """
        pass

    def read(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the getter on a property. """
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the reset on a property. """
        pass

    def setter(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the setter on a property. """
        pass

    def write(self, *args, **kwargs):  # real signature unknown
        """ Descriptor to change the setter on a property. """
        pass

    def __call__(self, *more):  # real signature unknown; restored from __doc__
        """ x.__call__(...) <==> x(...) """
        pass

    def __delete__(self, obj):  # real signature unknown; restored from __doc__
        """ descr.__delete__(obj) """
        pass

    # real signature unknown; restored from __doc__
    def __getattribute__(self, name):
        """ x.__getattribute__('name') <==> x.name """
        pass

    # real signature unknown; restored from __doc__
    def __get__(self, obj, type=None):
        """ descr.__get__(obj[, type]) -> value """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, type, fget=None, fset=None, freset=None, fdel=None, doc=None, designable=True, scriptable=True, stored=True, user=False, constant=False, final=False, notify=None):
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    # real signature unknown; restored from __doc__
    def __set__(self, obj, value):
        """ descr.__set__(obj, value) """
        pass

    fdel = property(lambda self: object())  # default
    fget = property(lambda self: object())  # default
    freset = property(lambda self: object())  # default
    fset = property(lambda self: object())  # default
    type = property(lambda self: object())  # default


class pyqtSignal(object):

    """
    pyqtSignal(*types, name=str) -> signal
    
    types is normally a sequence of individual types.  Each type is either a
    type object or a string that is the name of a C++ type.  Alternatively
    each type could itself be a sequence of types each describing a different
    overloaded signal.
    name is the optional C++ name of the signal.  If it is not specified then
    the name of the class attribute that is bound to the signal is used.
    """

    def __call__(self, *more):  # real signature unknown; restored from __doc__
        """ x.__call__(...) <==> x(...) """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    # real signature unknown; restored from __doc__
    def __get__(self, obj, type=None):
        """ descr.__get__(obj[, type]) -> value """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, *types, name=None):
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass


class pyqtWrapperType(__sip.wrappertype):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class QObject():  # skipped bases: <type 'sip.wrapper'>

    """ QObject(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def blockSignals(self, bool):
        """ QObject.blockSignals(bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def childEvent(self, QChildEvent):
        """ QObject.childEvent(QChildEvent) """
        pass

    def children(self):  # real signature unknown; restored from __doc__
        """ QObject.children() -> list-of-QObject """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def connect(self, QObject, SIGNAL, *args, **kwargs):
        """
        QObject.connect(QObject, SIGNAL(), QObject, SLOT(), Qt.ConnectionType=Qt.AutoConnection) -> bool
        QObject.connect(QObject, SIGNAL(), callable, Qt.ConnectionType=Qt.AutoConnection) -> bool
        QObject.connect(QObject, SIGNAL(), SLOT(), Qt.ConnectionType=Qt.AutoConnection) -> bool
        """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def connectNotify(self, SIGNAL, *args, **kwargs):
        """ QObject.connectNotify(SIGNAL()) """
        pass

    # real signature unknown; restored from __doc__
    def customEvent(self, QEvent):
        """ QObject.customEvent(QEvent) """
        pass

    def deleteLater(self):  # real signature unknown; restored from __doc__
        """ QObject.deleteLater() """
        pass

    def destroyed(self, *args, **kwargs):  # real signature unknown
        """
        QObject.destroyed[QObject] [signal]
        QObject.destroyed[] [signal]
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def disconnect(self, QObject, SIGNAL, *args, **kwargs):
        """
        QObject.disconnect(QObject, SIGNAL(), QObject, SLOT()) -> bool
        QObject.disconnect(QObject, SIGNAL(), callable) -> bool
        """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def disconnectNotify(self, SIGNAL, *args, **kwargs):
        """ QObject.disconnectNotify(SIGNAL()) """
        pass

    def dumpObjectInfo(self):  # real signature unknown; restored from __doc__
        """ QObject.dumpObjectInfo() """
        pass

    def dumpObjectTree(self):  # real signature unknown; restored from __doc__
        """ QObject.dumpObjectTree() """
        pass

    # real signature unknown; restored from __doc__
    def dynamicPropertyNames(self):
        """ QObject.dynamicPropertyNames() -> list-of-QByteArray """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def emit(self, SIGNAL, *args, **kwargs):
        """ QObject.emit(SIGNAL(), ...) """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QObject.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def eventFilter(self, QObject, QEvent):
        """ QObject.eventFilter(QObject, QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def findChild(self, *__args):
        """
        QObject.findChild(type, QString name=QString()) -> QObject
        QObject.findChild(tuple, QString name=QString()) -> QObject
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def findChildren(self, *__args):
        """
        QObject.findChildren(type, QString name=QString()) -> list-of-QObject
        QObject.findChildren(tuple, QString name=QString()) -> list-of-QObject
        QObject.findChildren(type, QRegExp) -> list-of-QObject
        QObject.findChildren(tuple, QRegExp) -> list-of-QObject
        """
        pass

    def inherits(self, p_str):  # real signature unknown; restored from __doc__
        """ QObject.inherits(str) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def installEventFilter(self, QObject):
        """ QObject.installEventFilter(QObject) """
        pass

    def isWidgetType(self):  # real signature unknown; restored from __doc__
        """ QObject.isWidgetType() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def killTimer(self, p_int):
        """ QObject.killTimer(int) """
        pass

    def metaObject(self):  # real signature unknown; restored from __doc__
        """ QObject.metaObject() -> QMetaObject """
        return QMetaObject

    # real signature unknown; restored from __doc__
    def moveToThread(self, QThread):
        """ QObject.moveToThread(QThread) """
        pass

    def objectName(self):  # real signature unknown; restored from __doc__
        """ QObject.objectName() -> QString """
        return QString

    def parent(self):  # real signature unknown; restored from __doc__
        """ QObject.parent() -> QObject """
        return QObject

    def property(self, p_str):  # real signature unknown; restored from __doc__
        """ QObject.property(str) -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def pyqtConfigure(self, *more):
        """
        QObject.pyqtConfigure(...)
        
        Each keyword argument is either the name of a Qt property or a Qt signal.
        For properties the property is set to the given value which should be of an
        appropriate type.
        For signals the signal is connected to the given value which should be a
        callable.
        """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def receivers(self, SIGNAL, *args, **kwargs):
        """ QObject.receivers(SIGNAL()) -> int """
        pass

    # real signature unknown; restored from __doc__
    def removeEventFilter(self, QObject):
        """ QObject.removeEventFilter(QObject) """
        pass

    def sender(self):  # real signature unknown; restored from __doc__
        """ QObject.sender() -> QObject """
        return QObject

    # real signature unknown; restored from __doc__
    def setObjectName(self, QString):
        """ QObject.setObjectName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setParent(self, QObject):
        """ QObject.setParent(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setProperty(self, p_str, QVariant):
        """ QObject.setProperty(str, QVariant) -> bool """
        return False

    def signalsBlocked(self):  # real signature unknown; restored from __doc__
        """ QObject.signalsBlocked() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def startTimer(self, p_int):
        """ QObject.startTimer(int) -> int """
        return 0

    def thread(self):  # real signature unknown; restored from __doc__
        """ QObject.thread() -> QThread """
        return QThread

    # real signature unknown; restored from __doc__
    def timerEvent(self, QTimerEvent):
        """ QObject.timerEvent(QTimerEvent) """
        pass

    # real signature unknown; restored from __doc__
    def tr(self, p_str, str_disambiguation=None, int_n=-1):
        """ QObject.tr(str, str disambiguation=None, int n=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def trUtf8(self, p_str, str_disambiguation=None, int_n=-1):
        """ QObject.trUtf8(str, str disambiguation=None, int n=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def __getattr__(self, p_str):
        """ QObject.__getattr__(str) -> object """
        return object()

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    staticMetaObject = None  # (!) real value is ''


class QAbstractAnimation(QObject):

    """ QAbstractAnimation(QObject parent=None) """

    def currentLoop(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.currentLoop() -> int """
        return 0

    def currentLoopChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractAnimation.currentLoopChanged[int] [signal] """
        pass

    def currentLoopTime(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.currentLoopTime() -> int """
        return 0

    def currentTime(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.currentTime() -> int """
        return 0

    def DeletionPolicy(self, *args, **kwargs):  # real signature unknown
        pass

    def Direction(self, *args, **kwargs):  # real signature unknown
        pass

    def direction(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.direction() -> QAbstractAnimation.Direction """
        pass

    def directionChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractAnimation.directionChanged[QAbstractAnimation.Direction] [signal] """
        pass

    def duration(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.duration() -> int """
        return 0

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.event(QEvent) -> bool """
        return False

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QAbstractAnimation.finished[] [signal] """
        pass

    def group(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.group() -> QAnimationGroup """
        return QAnimationGroup

    def loopCount(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.loopCount() -> int """
        return 0

    def pause(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.pause() """
        pass

    def resume(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.resume() """
        pass

    # real signature unknown; restored from __doc__
    def setCurrentTime(self, p_int):
        """ QAbstractAnimation.setCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def setDirection(self, QAbstractAnimation_Direction):
        """ QAbstractAnimation.setDirection(QAbstractAnimation.Direction) """
        pass

    # real signature unknown; restored from __doc__
    def setLoopCount(self, p_int):
        """ QAbstractAnimation.setLoopCount(int) """
        pass

    def setPaused(self, bool):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.setPaused(bool) """
        pass

    # real signature unknown; restored from __doc__
    def start(self, QAbstractAnimation_DeletionPolicy_policy=None):
        """ QAbstractAnimation.start(QAbstractAnimation.DeletionPolicy policy=QAbstractAnimation.KeepWhenStopped) """
        pass

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.state() -> QAbstractAnimation.State """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractAnimation.stateChanged[QAbstractAnimation.State, QAbstractAnimation.State] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.stop() """
        pass

    def totalDuration(self):  # real signature unknown; restored from __doc__
        """ QAbstractAnimation.totalDuration() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def updateCurrentTime(self, p_int):
        """ QAbstractAnimation.updateCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateDirection(self, QAbstractAnimation_Direction):
        """ QAbstractAnimation.updateDirection(QAbstractAnimation.Direction) """
        pass

    # real signature unknown; restored from __doc__
    def updateState(self, QAbstractAnimation_State, QAbstractAnimation_State_1):
        """ QAbstractAnimation.updateState(QAbstractAnimation.State, QAbstractAnimation.State) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Backward = 1
    DeleteWhenStopped = 1
    Forward = 0
    KeepWhenStopped = 0
    Paused = 1
    Running = 2
    Stopped = 0


class QAbstractEventDispatcher(QObject):

    """ QAbstractEventDispatcher(QObject parent=None) """

    def aboutToBlock(self, *args, **kwargs):  # real signature unknown
        """ QAbstractEventDispatcher.aboutToBlock[] [signal] """
        pass

    def awake(self, *args, **kwargs):  # real signature unknown
        """ QAbstractEventDispatcher.awake[] [signal] """
        pass

    def closingDown(self):  # real signature unknown; restored from __doc__
        """ QAbstractEventDispatcher.closingDown() """
        pass

    # real signature unknown; restored from __doc__
    def filterEvent(self, sip_voidptr):
        """ QAbstractEventDispatcher.filterEvent(sip.voidptr) -> bool """
        return False

    def flush(self):  # real signature unknown; restored from __doc__
        """ QAbstractEventDispatcher.flush() """
        pass

    # real signature unknown; restored from __doc__
    def hasPendingEvents(self):
        """ QAbstractEventDispatcher.hasPendingEvents() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def instance(self, QThread_thread=None):
        """ QAbstractEventDispatcher.instance(QThread thread=None) -> QAbstractEventDispatcher """
        return QAbstractEventDispatcher

    def interrupt(self):  # real signature unknown; restored from __doc__
        """ QAbstractEventDispatcher.interrupt() """
        pass

    # real signature unknown; restored from __doc__
    def processEvents(self, QEventLoop_ProcessEventsFlags):
        """ QAbstractEventDispatcher.processEvents(QEventLoop.ProcessEventsFlags) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def registeredTimers(self, QObject):
        """ QAbstractEventDispatcher.registeredTimers(QObject) -> list-of-tuple-of-int-int """
        pass

    # real signature unknown; restored from __doc__
    def registerSocketNotifier(self, QSocketNotifier):
        """ QAbstractEventDispatcher.registerSocketNotifier(QSocketNotifier) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def registerTimer(self, p_int, *__args):
        """
        QAbstractEventDispatcher.registerTimer(int, QObject) -> int
        QAbstractEventDispatcher.registerTimer(int, int, QObject)
        """
        return 0

    # real signature unknown; restored from __doc__
    def setEventFilter(self, callable):
        """ QAbstractEventDispatcher.setEventFilter(callable) -> callable """
        pass

    def startingUp(self):  # real signature unknown; restored from __doc__
        """ QAbstractEventDispatcher.startingUp() """
        pass

    # real signature unknown; restored from __doc__
    def unregisterSocketNotifier(self, QSocketNotifier):
        """ QAbstractEventDispatcher.unregisterSocketNotifier(QSocketNotifier) """
        pass

    # real signature unknown; restored from __doc__
    def unregisterTimer(self, p_int):
        """ QAbstractEventDispatcher.unregisterTimer(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def unregisterTimers(self, QObject):
        """ QAbstractEventDispatcher.unregisterTimers(QObject) -> bool """
        return False

    def wakeUp(self):  # real signature unknown; restored from __doc__
        """ QAbstractEventDispatcher.wakeUp() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractFileEngine():  # skipped bases: <type 'sip.wrapper'>

    """ QAbstractFileEngine() """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.atEnd() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def beginEntryList(self, QDir_Filters, QStringList):
        """ QAbstractFileEngine.beginEntryList(QDir.Filters, QStringList) -> QAbstractFileEngineIterator """
        return QAbstractFileEngineIterator

    def caseSensitive(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.caseSensitive() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.close() -> bool """
        return False

    def copy(self, QString):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.copy(QString) -> bool """
        return False

    def create(self, QString):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.create(QString) -> QAbstractFileEngine """
        return QAbstractFileEngine

    # real signature unknown; restored from __doc__
    def entryList(self, QDir_Filters, QStringList):
        """ QAbstractFileEngine.entryList(QDir.Filters, QStringList) -> QStringList """
        return QStringList

    def error(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.error() -> QFile.FileError """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.errorString() -> QString """
        return QString

    def FileFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def FileFlags(self, *__args):
        """
        QAbstractFileEngine.FileFlags(QAbstractFileEngine.FileFlags)
        QAbstractFileEngine.FileFlags(int)
        QAbstractFileEngine.FileFlags()
        """
        pass

    # real signature unknown; restored from __doc__
    def fileFlags(self, QAbstractFileEngine_FileFlags_type=None):
        """ QAbstractFileEngine.fileFlags(QAbstractFileEngine.FileFlags type=QAbstractFileEngine.FileInfoAll) -> QAbstractFileEngine.FileFlags """
        pass

    # real signature unknown; restored from __doc__
    def fileName(self, QAbstractFileEngine_FileName_file=None):
        """ QAbstractFileEngine.fileName(QAbstractFileEngine.FileName file=QAbstractFileEngine.DefaultName) -> QString """
        return QString

    def FileName(self, *args, **kwargs):  # real signature unknown
        pass

    def FileOwner(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def fileTime(self, QAbstractFileEngine_FileTime):
        """ QAbstractFileEngine.fileTime(QAbstractFileEngine.FileTime) -> QDateTime """
        return QDateTime

    def FileTime(self, *args, **kwargs):  # real signature unknown
        pass

    def flush(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.flush() -> bool """
        return False

    def handle(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.handle() -> int """
        return 0

    def isRelativePath(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.isRelativePath() -> bool """
        return False

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.isSequential() -> bool """
        return False

    def link(self, QString):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.link(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def map(self, p_int, p_int_1, QFile_MemoryMapFlags):
        """ QAbstractFileEngine.map(int, int, QFile.MemoryMapFlags) -> sip.voidptr """
        pass

    # real signature unknown; restored from __doc__
    def mkdir(self, QString, bool):
        """ QAbstractFileEngine.mkdir(QString, bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def open(self, QIODevice_OpenMode):
        """ QAbstractFileEngine.open(QIODevice.OpenMode) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def owner(self, QAbstractFileEngine_FileOwner):
        """ QAbstractFileEngine.owner(QAbstractFileEngine.FileOwner) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def ownerId(self, QAbstractFileEngine_FileOwner):
        """ QAbstractFileEngine.ownerId(QAbstractFileEngine.FileOwner) -> int """
        return 0

    def pos(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.pos() -> int """
        return 0

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.read(int) -> str """
        return ""

    def readLine(self, p_int):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.readLine(int) -> str """
        return ""

    def remove(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.remove() -> bool """
        return False

    def rename(self, QString):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.rename(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def rmdir(self, QString, bool):
        """ QAbstractFileEngine.rmdir(QString, bool) -> bool """
        return False

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setError(self, QFile_FileError, QString):
        """ QAbstractFileEngine.setError(QFile.FileError, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QAbstractFileEngine.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPermissions(self, p_int):
        """ QAbstractFileEngine.setPermissions(int) -> bool """
        return False

    def setSize(self, p_int):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.setSize(int) -> bool """
        return False

    def size(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.size() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def unmap(self, sip_voidptr):
        """ QAbstractFileEngine.unmap(sip.voidptr) -> bool """
        return False

    def write(self, p_str):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngine.write(str) -> int """
        return 0

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default

    AbsoluteName = 3
    AbsolutePathName = 4
    AccessTime = 2
    BaseName = 1
    BundleName = 8
    BundleType = 524288
    CanonicalName = 6
    CanonicalPathName = 7
    CreationTime = 0
    DefaultName = 0
    DirectoryType = 262144
    ExeGroupPerm = 16
    ExeOtherPerm = 1
    ExeOwnerPerm = 4096
    ExeUserPerm = 256
    ExistsFlag = 4194304
    FileInfoAll = 268435455
    FileType = 131072
    FlagsMask = 267386880
    HiddenFlag = 1048576
    LinkName = 5
    LinkType = 65536
    LocalDiskFlag = 2097152
    ModificationTime = 1
    OwnerGroup = 1
    OwnerUser = 0
    PathName = 2
    PermsMask = 65535
    ReadGroupPerm = 64
    ReadOtherPerm = 4
    ReadOwnerPerm = 16384
    ReadUserPerm = 1024
    Refresh = 16777216
    RootFlag = 8388608
    TypesMask = 983040
    WriteGroupPerm = 32
    WriteOtherPerm = 2
    WriteOwnerPerm = 8192
    WriteUserPerm = 512


# skipped bases: <type 'sip.simplewrapper'>
class QAbstractFileEngineHandler():

    """
    QAbstractFileEngineHandler()
    QAbstractFileEngineHandler(QAbstractFileEngineHandler)
    """

    def create(self, QString):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineHandler.create(QString) -> QAbstractFileEngine """
        return QAbstractFileEngine

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QAbstractFileEngineHandler=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QAbstractFileEngineIterator():  # skipped bases: <type 'sip.wrapper'>

    """ QAbstractFileEngineIterator(QDir.Filters, QStringList) """

    def currentFileInfo(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.currentFileInfo() -> QFileInfo """
        return QFileInfo

    def currentFileName(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.currentFileName() -> QString """
        return QString

    def currentFilePath(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.currentFilePath() -> QString """
        return QString

    def filters(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.filters() -> QDir.Filters """
        pass

    def hasNext(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.hasNext() -> bool """
        return False

    def nameFilters(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.nameFilters() -> QStringList """
        return QStringList

    def next(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.next() -> QString """
        return QString

    def path(self):  # real signature unknown; restored from __doc__
        """ QAbstractFileEngineIterator.path() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def __init__(self, QDir_Filters, QStringList):
        pass

    __weakref__ = property(lambda self: object())  # default


class QAbstractItemModel(QObject):

    """ QAbstractItemModel(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def beginInsertColumns(self, QModelIndex, p_int, p_int_1):
        """ QAbstractItemModel.beginInsertColumns(QModelIndex, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def beginInsertRows(self, QModelIndex, p_int, p_int_1):
        """ QAbstractItemModel.beginInsertRows(QModelIndex, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def beginMoveColumns(self, QModelIndex, p_int, p_int_1, QModelIndex_1, p_int_2):
        """ QAbstractItemModel.beginMoveColumns(QModelIndex, int, int, QModelIndex, int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def beginMoveRows(self, QModelIndex, p_int, p_int_1, QModelIndex_1, p_int_2):
        """ QAbstractItemModel.beginMoveRows(QModelIndex, int, int, QModelIndex, int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def beginRemoveColumns(self, QModelIndex, p_int, p_int_1):
        """ QAbstractItemModel.beginRemoveColumns(QModelIndex, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def beginRemoveRows(self, QModelIndex, p_int, p_int_1):
        """ QAbstractItemModel.beginRemoveRows(QModelIndex, int, int) """
        pass

    def beginResetModel(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.beginResetModel() """
        pass

    # real signature unknown; restored from __doc__
    def buddy(self, QModelIndex):
        """ QAbstractItemModel.buddy(QModelIndex) -> QModelIndex """
        return QModelIndex

    # real signature unknown; restored from __doc__
    def canFetchMore(self, QModelIndex):
        """ QAbstractItemModel.canFetchMore(QModelIndex) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def changePersistentIndex(self, QModelIndex, QModelIndex_1):
        """ QAbstractItemModel.changePersistentIndex(QModelIndex, QModelIndex) """
        pass

    # real signature unknown; restored from __doc__
    def changePersistentIndexList(self, list_of_QModelIndex, list_of_QModelIndex_1):
        """ QAbstractItemModel.changePersistentIndexList(list-of-QModelIndex, list-of-QModelIndex) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def columnCount(self, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.columnCount(QModelIndex parent=QModelIndex()) -> int """
        pass

    # real signature unknown
    def columnsAboutToBeInserted(self, *args, **kwargs):
        """ QAbstractItemModel.columnsAboutToBeInserted[QModelIndex, int, int] [signal] """
        pass

    def columnsAboutToBeMoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.columnsAboutToBeMoved[QModelIndex, int, int, QModelIndex, int] [signal] """
        pass

    # real signature unknown
    def columnsAboutToBeRemoved(self, *args, **kwargs):
        """ QAbstractItemModel.columnsAboutToBeRemoved[QModelIndex, int, int] [signal] """
        pass

    def columnsInserted(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.columnsInserted[QModelIndex, int, int] [signal] """
        pass

    def columnsMoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.columnsMoved[QModelIndex, int, int, QModelIndex, int] [signal] """
        pass

    def columnsRemoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.columnsRemoved[QModelIndex, int, int] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def createIndex(self, p_int, p_int_1, object_object=0):
        """ QAbstractItemModel.createIndex(int, int, object object=0) -> QModelIndex """
        return QModelIndex

    # real signature unknown; restored from __doc__
    def data(self, QModelIndex, int_role=None):
        """ QAbstractItemModel.data(QModelIndex, int role=Qt.DisplayRole) -> QVariant """
        return QVariant

    def dataChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.dataChanged[QModelIndex, QModelIndex] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def decodeData(self, p_int, p_int_1, QModelIndex, QDataStream):
        """ QAbstractItemModel.decodeData(int, int, QModelIndex, QDataStream) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def dropMimeData(self, QMimeData, Qt_DropAction, p_int, p_int_1, QModelIndex):
        """ QAbstractItemModel.dropMimeData(QMimeData, Qt.DropAction, int, int, QModelIndex) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def encodeData(self, list_of_QModelIndex, QDataStream):
        """ QAbstractItemModel.encodeData(list-of-QModelIndex, QDataStream) """
        pass

    # real signature unknown; restored from __doc__
    def endInsertColumns(self):
        """ QAbstractItemModel.endInsertColumns() """
        pass

    def endInsertRows(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.endInsertRows() """
        pass

    def endMoveColumns(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.endMoveColumns() """
        pass

    def endMoveRows(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.endMoveRows() """
        pass

    # real signature unknown; restored from __doc__
    def endRemoveColumns(self):
        """ QAbstractItemModel.endRemoveColumns() """
        pass

    def endRemoveRows(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.endRemoveRows() """
        pass

    def endResetModel(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.endResetModel() """
        pass

    # real signature unknown; restored from __doc__
    def fetchMore(self, QModelIndex):
        """ QAbstractItemModel.fetchMore(QModelIndex) """
        pass

    # real signature unknown; restored from __doc__
    def flags(self, QModelIndex):
        """ QAbstractItemModel.flags(QModelIndex) -> Qt.ItemFlags """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def hasChildren(self, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.hasChildren(QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def hasIndex(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.hasIndex(int, int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; restored from __doc__
    def headerData(self, p_int, Qt_Orientation, int_role=None):
        """ QAbstractItemModel.headerData(int, Qt.Orientation, int role=Qt.DisplayRole) -> QVariant """
        return QVariant

    def headerDataChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.headerDataChanged[Qt.Orientation, int, int] [signal] """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def index(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.index(int, int, QModelIndex parent=QModelIndex()) -> QModelIndex """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def insertColumn(self, p_int, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.insertColumn(int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def insertColumns(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.insertColumns(int, int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def insertRow(self, p_int, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.insertRow(int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def insertRows(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.insertRows(int, int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; restored from __doc__
    def itemData(self, QModelIndex):
        """ QAbstractItemModel.itemData(QModelIndex) -> dict-of-int-QVariant """
        pass

    # real signature unknown
    def layoutAboutToBeChanged(self, *args, **kwargs):
        """ QAbstractItemModel.layoutAboutToBeChanged[] [signal] """
        pass

    def layoutChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.layoutChanged[] [signal] """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def match(self, QModelIndex, p_int, QVariant, int_hits=1, Qt_MatchFlags_flags=None, *args, **kwargs):
        """ QAbstractItemModel.match(QModelIndex, int, QVariant, int hits=1, Qt.MatchFlags flags=Qt.MatchStartsWith|Qt.MatchWrap) -> list-of-QModelIndex """
        pass

    # real signature unknown; restored from __doc__
    def mimeData(self, list_of_QModelIndex):
        """ QAbstractItemModel.mimeData(list-of-QModelIndex) -> QMimeData """
        return QMimeData

    def mimeTypes(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.mimeTypes() -> QStringList """
        return QStringList

    def modelAboutToBeReset(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.modelAboutToBeReset[] [signal] """
        pass

    def modelReset(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.modelReset[] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def parent(self, QModelIndex=None):
        """
        QAbstractItemModel.parent(QModelIndex) -> QModelIndex
        QAbstractItemModel.parent() -> QObject
        """
        return QModelIndex or QObject

    # real signature unknown; restored from __doc__
    def persistentIndexList(self):
        """ QAbstractItemModel.persistentIndexList() -> list-of-QModelIndex """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def removeColumn(self, p_int, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.removeColumn(int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def removeColumns(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.removeColumns(int, int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def removeRow(self, p_int, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.removeRow(int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def removeRows(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.removeRows(int, int, QModelIndex parent=QModelIndex()) -> bool """
        pass

    def reset(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.reset() """
        pass

    def revert(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.revert() """
        pass

    def roleNames(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.roleNames() -> dict-of-int-QByteArray """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def rowCount(self, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractItemModel.rowCount(QModelIndex parent=QModelIndex()) -> int """
        pass

    def rowsAboutToBeInserted(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsAboutToBeInserted[QModelIndex, int, int] [signal] """
        pass

    def rowsAboutToBeMoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsAboutToBeMoved[QModelIndex, int, int, QModelIndex, int] [signal] """
        pass

    def rowsAboutToBeRemoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsAboutToBeRemoved[QModelIndex, int, int] [signal] """
        pass

    def rowsInserted(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsInserted[QModelIndex, int, int] [signal] """
        pass

    def rowsMoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsMoved[QModelIndex, int, int, QModelIndex, int] [signal] """
        pass

    def rowsRemoved(self, *args, **kwargs):  # real signature unknown
        """ QAbstractItemModel.rowsRemoved[QModelIndex, int, int] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setData(self, QModelIndex, QVariant, int_role=None):
        """ QAbstractItemModel.setData(QModelIndex, QVariant, int role=Qt.EditRole) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setHeaderData(self, p_int, Qt_Orientation, QVariant, int_role=None):
        """ QAbstractItemModel.setHeaderData(int, Qt.Orientation, QVariant, int role=Qt.EditRole) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setItemData(self, QModelIndex, dict_of_int_QVariant):
        """ QAbstractItemModel.setItemData(QModelIndex, dict-of-int-QVariant) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setRoleNames(self, dict_of_int_QByteArray):
        """ QAbstractItemModel.setRoleNames(dict-of-int-QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setSupportedDragActions(self, Qt_DropActions):
        """ QAbstractItemModel.setSupportedDragActions(Qt.DropActions) """
        pass

    # real signature unknown; restored from __doc__
    def sibling(self, p_int, p_int_1, QModelIndex):
        """ QAbstractItemModel.sibling(int, int, QModelIndex) -> QModelIndex """
        return QModelIndex

    # real signature unknown; restored from __doc__
    def sort(self, p_int, Qt_SortOrder_order=None):
        """ QAbstractItemModel.sort(int, Qt.SortOrder order=Qt.AscendingOrder) """
        pass

    # real signature unknown; restored from __doc__
    def span(self, QModelIndex):
        """ QAbstractItemModel.span(QModelIndex) -> QSize """
        return QSize

    def submit(self):  # real signature unknown; restored from __doc__
        """ QAbstractItemModel.submit() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def supportedDragActions(self):
        """ QAbstractItemModel.supportedDragActions() -> Qt.DropActions """
        pass

    # real signature unknown; restored from __doc__
    def supportedDropActions(self):
        """ QAbstractItemModel.supportedDropActions() -> Qt.DropActions """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractListModel(QAbstractItemModel):

    """ QAbstractListModel(QObject parent=None) """

    def columnCount(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def dropMimeData(self, QMimeData, Qt_DropAction, p_int, p_int_1, QModelIndex):
        """ QAbstractListModel.dropMimeData(QMimeData, Qt.DropAction, int, int, QModelIndex) -> bool """
        return False

    def hasChildren(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def index(self, p_int, int_column=0, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractListModel.index(int, int column=0, QModelIndex parent=QModelIndex()) -> QModelIndex """
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractState(QObject):

    """ QAbstractState(QState parent=None) """

    def entered(self, *args, **kwargs):  # real signature unknown
        """ QAbstractState.entered[] [signal] """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAbstractState.event(QEvent) -> bool """
        return False

    def exited(self, *args, **kwargs):  # real signature unknown
        """ QAbstractState.exited[] [signal] """
        pass

    def machine(self):  # real signature unknown; restored from __doc__
        """ QAbstractState.machine() -> QStateMachine """
        return QStateMachine

    def onEntry(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAbstractState.onEntry(QEvent) """
        pass

    def onExit(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAbstractState.onExit(QEvent) """
        pass

    def parentState(self):  # real signature unknown; restored from __doc__
        """ QAbstractState.parentState() -> QState """
        return QState

    # real signature unknown; restored from __doc__
    def __init__(self, QState_parent=None):
        pass


class QAbstractTableModel(QAbstractItemModel):

    """ QAbstractTableModel(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def dropMimeData(self, QMimeData, Qt_DropAction, p_int, p_int_1, QModelIndex):
        """ QAbstractTableModel.dropMimeData(QMimeData, Qt.DropAction, int, int, QModelIndex) -> bool """
        return False

    def hasChildren(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def index(self, p_int, p_int_1, QModelIndex_parent=None, *args, **kwargs):
        """ QAbstractTableModel.index(int, int, QModelIndex parent=QModelIndex()) -> QModelIndex """
        pass

    def parent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractTransition(QObject):

    """ QAbstractTransition(QState sourceState=None) """
    # real signature unknown; restored from __doc__

    def addAnimation(self, QAbstractAnimation):
        """ QAbstractTransition.addAnimation(QAbstractAnimation) """
        pass

    def animations(self):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.animations() -> list-of-QAbstractAnimation """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def eventTest(self, QEvent):
        """ QAbstractTransition.eventTest(QEvent) -> bool """
        return False

    def machine(self):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.machine() -> QStateMachine """
        return QStateMachine

    # real signature unknown; restored from __doc__
    def onTransition(self, QEvent):
        """ QAbstractTransition.onTransition(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def removeAnimation(self, QAbstractAnimation):
        """ QAbstractTransition.removeAnimation(QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def setTargetState(self, QAbstractState):
        """ QAbstractTransition.setTargetState(QAbstractState) """
        pass

    # real signature unknown; restored from __doc__
    def setTargetStates(self, list_of_QAbstractState):
        """ QAbstractTransition.setTargetStates(list-of-QAbstractState) """
        pass

    def sourceState(self):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.sourceState() -> QState """
        return QState

    def targetState(self):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.targetState() -> QAbstractState """
        return QAbstractState

    def targetStates(self):  # real signature unknown; restored from __doc__
        """ QAbstractTransition.targetStates() -> list-of-QAbstractState """
        pass

    def triggered(self, *args, **kwargs):  # real signature unknown
        """ QAbstractTransition.triggered[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QState_sourceState=None):
        pass


class QAnimationGroup(QAbstractAnimation):

    """ QAnimationGroup(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addAnimation(self, QAbstractAnimation):
        """ QAnimationGroup.addAnimation(QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def animationAt(self, p_int):
        """ QAnimationGroup.animationAt(int) -> QAbstractAnimation """
        return QAbstractAnimation

    def animationCount(self):  # real signature unknown; restored from __doc__
        """ QAnimationGroup.animationCount() -> int """
        return 0

    def clear(self):  # real signature unknown; restored from __doc__
        """ QAnimationGroup.clear() """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QAnimationGroup.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indexOfAnimation(self, QAbstractAnimation):
        """ QAnimationGroup.indexOfAnimation(QAbstractAnimation) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def insertAnimation(self, p_int, QAbstractAnimation):
        """ QAnimationGroup.insertAnimation(int, QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def removeAnimation(self, QAbstractAnimation):
        """ QAnimationGroup.removeAnimation(QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def takeAnimation(self, p_int):
        """ QAnimationGroup.takeAnimation(int) -> QAbstractAnimation """
        return QAbstractAnimation

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QBasicTimer():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QBasicTimer()
    QBasicTimer(QBasicTimer)
    """

    def isActive(self):  # real signature unknown; restored from __doc__
        """ QBasicTimer.isActive() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def start(self, p_int, QObject):
        """ QBasicTimer.start(int, QObject) """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QBasicTimer.stop() """
        pass

    def timerId(self):  # real signature unknown; restored from __doc__
        """ QBasicTimer.timerId() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QBasicTimer=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QBitArray():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QBitArray()
    QBitArray(int, bool value=False)
    QBitArray(QBitArray)
    """

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QBitArray.at(int) -> bool """
        return False

    def clear(self):  # real signature unknown; restored from __doc__
        """ QBitArray.clear() """
        pass

    def clearBit(self, p_int):  # real signature unknown; restored from __doc__
        """ QBitArray.clearBit(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def count(self, bool=None):
        """
        QBitArray.count() -> int
        QBitArray.count(bool) -> int
        """
        return 0

    def detach(self):  # real signature unknown; restored from __doc__
        """ QBitArray.detach() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def fill(self, bool, *__args):
        """
        QBitArray.fill(bool, int, int)
        QBitArray.fill(bool, int size=-1) -> bool
        """
        return False

    def isDetached(self):  # real signature unknown; restored from __doc__
        """ QBitArray.isDetached() -> bool """
        return False

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QBitArray.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QBitArray.isNull() -> bool """
        return False

    def resize(self, p_int):  # real signature unknown; restored from __doc__
        """ QBitArray.resize(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setBit(self, p_int, bool=None):
        """
        QBitArray.setBit(int)
        QBitArray.setBit(int, bool)
        """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QBitArray.size() -> int """
        return 0

    def testBit(self, p_int):  # real signature unknown; restored from __doc__
        """ QBitArray.testBit(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def toggleBit(self, p_int):
        """ QBitArray.toggleBit(int) -> bool """
        return False

    def truncate(self, p_int):  # real signature unknown; restored from __doc__
        """ QBitArray.truncate(int) """
        pass

    def __and__(self, y):  # real signature unknown; restored from __doc__
        """ x.__and__(y) <==> x&y """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
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

    def __iand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iand__(y) <==> x&y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __invert__(self):  # real signature unknown; restored from __doc__
        """ x.__invert__() <==> ~x """
        pass

    def __ior__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ior__(y) <==> x|y """
        pass

    def __ixor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ixor__(y) <==> x^y """
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
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

    def __or__(self, y):  # real signature unknown; restored from __doc__
        """ x.__or__(y) <==> x|y """
        pass

    def __rand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rand__(y) <==> y&x """
        pass

    def __ror__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ror__(y) <==> y|x """
        pass

    def __rxor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rxor__(y) <==> y^x """
        pass

    def __xor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__xor__(y) <==> x^y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QIODevice(QObject):

    """
    QIODevice()
    QIODevice(QObject)
    """

    def aboutToClose(self, *args, **kwargs):  # real signature unknown
        """ QIODevice.aboutToClose[] [signal] """
        pass

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QIODevice.atEnd() -> bool """
        return False

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QIODevice.bytesAvailable() -> int """
        return 0

    def bytesToWrite(self):  # real signature unknown; restored from __doc__
        """ QIODevice.bytesToWrite() -> int """
        return 0

    def bytesWritten(self, *args, **kwargs):  # real signature unknown
        """ QIODevice.bytesWritten[int] [signal] """
        pass

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QIODevice.canReadLine() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QIODevice.close() """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QIODevice.errorString() -> QString """
        return QString

    def getChar(self):  # real signature unknown; restored from __doc__
        """ QIODevice.getChar() -> (bool, str) """
        pass

    def isOpen(self):  # real signature unknown; restored from __doc__
        """ QIODevice.isOpen() -> bool """
        return False

    def isReadable(self):  # real signature unknown; restored from __doc__
        """ QIODevice.isReadable() -> bool """
        return False

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QIODevice.isSequential() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isTextModeEnabled(self):
        """ QIODevice.isTextModeEnabled() -> bool """
        return False

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QIODevice.isWritable() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def open(self, QIODevice_OpenMode):
        """ QIODevice.open(QIODevice.OpenMode) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def OpenMode(self, *__args):
        """
        QIODevice.OpenMode(QIODevice.OpenMode)
        QIODevice.OpenMode(int)
        QIODevice.OpenMode()
        """
        pass

    def openMode(self):  # real signature unknown; restored from __doc__
        """ QIODevice.openMode() -> QIODevice.OpenMode """
        pass

    def OpenModeFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def peek(self, p_int):  # real signature unknown; restored from __doc__
        """ QIODevice.peek(int) -> QByteArray """
        return QByteArray

    def pos(self):  # real signature unknown; restored from __doc__
        """ QIODevice.pos() -> int """
        return 0

    def putChar(self, p_str):  # real signature unknown; restored from __doc__
        """ QIODevice.putChar(str) -> bool """
        return False

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QIODevice.read(int) -> str """
        return ""

    def readAll(self):  # real signature unknown; restored from __doc__
        """ QIODevice.readAll() -> QByteArray """
        return QByteArray

    def readChannelFinished(self, *args, **kwargs):  # real signature unknown
        """ QIODevice.readChannelFinished[] [signal] """
        pass

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QIODevice.readData(int) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readLine(self, int_maxlen=0):
        """ QIODevice.readLine(int maxlen=0) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readLineData(self, p_int):
        """ QIODevice.readLineData(int) -> str """
        return ""

    def readyRead(self, *args, **kwargs):  # real signature unknown
        """ QIODevice.readyRead[] [signal] """
        pass

    def reset(self):  # real signature unknown; restored from __doc__
        """ QIODevice.reset() -> bool """
        return False

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QIODevice.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setErrorString(self, QString):
        """ QIODevice.setErrorString(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOpenMode(self, QIODevice_OpenMode):
        """ QIODevice.setOpenMode(QIODevice.OpenMode) """
        pass

    # real signature unknown; restored from __doc__
    def setTextModeEnabled(self, bool):
        """ QIODevice.setTextModeEnabled(bool) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QIODevice.size() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def ungetChar(self, p_str):
        """ QIODevice.ungetChar(str) """
        pass

    # real signature unknown; restored from __doc__
    def waitForBytesWritten(self, p_int):
        """ QIODevice.waitForBytesWritten(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForReadyRead(self, p_int):
        """ QIODevice.waitForReadyRead(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def write(self, QByteArray):
        """ QIODevice.write(QByteArray) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QIODevice.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QObject=None):
        pass

    Append = 4
    NotOpen = 0
    ReadOnly = 1
    ReadWrite = 3
    Text = 16
    Truncate = 8
    Unbuffered = 32
    WriteOnly = 2


class QBuffer(QIODevice):

    """
    QBuffer(QObject parent=None)
    QBuffer(QByteArray, QObject parent=None)
    """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QBuffer.atEnd() -> bool """
        return False

    def buffer(self):  # real signature unknown; restored from __doc__
        """ QBuffer.buffer() -> QByteArray """
        return QByteArray

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QBuffer.canReadLine() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QBuffer.close() """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def connectNotify(self, SIGNAL, *args, **kwargs):
        """ QBuffer.connectNotify(SIGNAL()) """
        pass

    def data(self):  # real signature unknown; restored from __doc__
        """ QBuffer.data() -> QByteArray """
        return QByteArray

    # real signature unknown; NOTE: unreliably restored from __doc__
    def disconnectNotify(self, SIGNAL, *args, **kwargs):
        """ QBuffer.disconnectNotify(SIGNAL()) """
        pass

    # real signature unknown; restored from __doc__
    def open(self, QIODevice_OpenMode):
        """ QBuffer.open(QIODevice.OpenMode) -> bool """
        return False

    def pos(self):  # real signature unknown; restored from __doc__
        """ QBuffer.pos() -> int """
        return 0

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QBuffer.readData(int) -> str """
        return ""

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QBuffer.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setBuffer(self, QByteArray):
        """ QBuffer.setBuffer(QByteArray) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setData(self, *__args):
        """
        QBuffer.setData(QByteArray)
        QBuffer.setData(str)
        """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QBuffer.size() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QBuffer.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QByteArray():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QByteArray()
    QByteArray(int, str)
    QByteArray(QByteArray)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def append(self, *__args):
        """
        QByteArray.append(QByteArray) -> QByteArray
        QByteArray.append(QString) -> QByteArray
        """
        return QByteArray

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.at(int) -> str """
        return ""

    def capacity(self):  # real signature unknown; restored from __doc__
        """ QByteArray.capacity() -> int """
        return 0

    def chop(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.chop(int) """
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QByteArray.clear() """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QByteArray):
        """ QByteArray.contains(QByteArray) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def count(self, QByteArray=None):
        """
        QByteArray.count(QByteArray) -> int
        QByteArray.count() -> int
        """
        return 0

    def data(self):  # real signature unknown; restored from __doc__
        """ QByteArray.data() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def endsWith(self, QByteArray):
        """ QByteArray.endsWith(QByteArray) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def fill(self, p_str, int_size=-1):
        """ QByteArray.fill(str, int size=-1) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def fromBase64(self, QByteArray):
        """ QByteArray.fromBase64(QByteArray) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def fromHex(self, QByteArray):
        """ QByteArray.fromHex(QByteArray) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def fromPercentEncoding(self, QByteArray, str_percent='%'):
        """ QByteArray.fromPercentEncoding(QByteArray, str percent='%') -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def fromRawData(self, p_str):
        """ QByteArray.fromRawData(str) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def indexOf(self, *__args):
        """
        QByteArray.indexOf(QByteArray, int from=0) -> int
        QByteArray.indexOf(QString, int from=0) -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def insert(self, p_int, *__args):
        """
        QByteArray.insert(int, QByteArray) -> QByteArray
        QByteArray.insert(int, QString) -> QByteArray
        """
        return QByteArray

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QByteArray.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QByteArray.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def lastIndexOf(self, *__args):
        """
        QByteArray.lastIndexOf(QByteArray, int from=-1) -> int
        QByteArray.lastIndexOf(QString, int from=-1) -> int
        """
        return 0

    def left(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.left(int) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def leftJustified(self, p_int, str_fill=' ', bool_truncate=False):
        """ QByteArray.leftJustified(int, str fill=' ', bool truncate=False) -> QByteArray """
        return QByteArray

    def length(self):  # real signature unknown; restored from __doc__
        """ QByteArray.length() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def mid(self, p_int, int_length=-1):
        """ QByteArray.mid(int, int length=-1) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def number(self, *__args):
        """
        QByteArray.number(int, int base=10) -> QByteArray
        QByteArray.number(float, str format='g', int precision=6) -> QByteArray
        QByteArray.number(int, int base=10) -> QByteArray
        QByteArray.number(int, int base=10) -> QByteArray
        """
        return QByteArray

    # real signature unknown; restored from __doc__
    def prepend(self, QByteArray):
        """ QByteArray.prepend(QByteArray) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def push_back(self, QByteArray):
        """ QByteArray.push_back(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def push_front(self, QByteArray):
        """ QByteArray.push_front(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def remove(self, p_int, p_int_1):
        """ QByteArray.remove(int, int) -> QByteArray """
        return QByteArray

    def repeated(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.repeated(int) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def replace(self, *__args):
        """
        QByteArray.replace(int, int, QByteArray) -> QByteArray
        QByteArray.replace(QByteArray, QByteArray) -> QByteArray
        QByteArray.replace(QString, QByteArray) -> QByteArray
        """
        return QByteArray

    def reserve(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.reserve(int) """
        pass

    def resize(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.resize(int) """
        pass

    def right(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.right(int) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def rightJustified(self, p_int, str_fill=' ', bool_truncate=False):
        """ QByteArray.rightJustified(int, str fill=' ', bool truncate=False) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def setNum(self, *__args):
        """
        QByteArray.setNum(int, int base=10) -> QByteArray
        QByteArray.setNum(float, str format='g', int precision=6) -> QByteArray
        QByteArray.setNum(int, int base=10) -> QByteArray
        QByteArray.setNum(int, int base=10) -> QByteArray
        """
        return QByteArray

    def simplified(self):  # real signature unknown; restored from __doc__
        """ QByteArray.simplified() -> QByteArray """
        return QByteArray

    def size(self):  # real signature unknown; restored from __doc__
        """ QByteArray.size() -> int """
        return 0

    def split(self, p_str):  # real signature unknown; restored from __doc__
        """ QByteArray.split(str) -> list-of-QByteArray """
        pass

    def squeeze(self):  # real signature unknown; restored from __doc__
        """ QByteArray.squeeze() """
        pass

    # real signature unknown; restored from __doc__
    def startsWith(self, QByteArray):
        """ QByteArray.startsWith(QByteArray) -> bool """
        return False

    def toBase64(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toBase64() -> QByteArray """
        return QByteArray

    def toDouble(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toDouble() -> (float, bool) """
        pass

    def toFloat(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toFloat() -> (float, bool) """
        pass

    def toHex(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toHex() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def toInt(self, int_base=10):
        """ QByteArray.toInt(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toLong(self, int_base=10):
        """ QByteArray.toLong(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toLongLong(self, int_base=10):
        """ QByteArray.toLongLong(int base=10) -> (int, bool) """
        pass

    def toLower(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toLower() -> QByteArray """
        return QByteArray

    # real signature unknown; NOTE: unreliably restored from __doc__
    def toPercentEncoding(self, QByteArray_exclude=None, *args, **kwargs):
        """ QByteArray.toPercentEncoding(QByteArray exclude=QByteArray(), QByteArray include=QByteArray(), str percent='%') -> QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def toShort(self, int_base=10):
        """ QByteArray.toShort(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toUInt(self, int_base=10):
        """ QByteArray.toUInt(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toULong(self, int_base=10):
        """ QByteArray.toULong(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toULongLong(self, int_base=10):
        """ QByteArray.toULongLong(int base=10) -> (int, bool) """
        pass

    def toUpper(self):  # real signature unknown; restored from __doc__
        """ QByteArray.toUpper() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def toUShort(self, int_base=10):
        """ QByteArray.toUShort(int base=10) -> (int, bool) """
        pass

    def trimmed(self):  # real signature unknown; restored from __doc__
        """ QByteArray.trimmed() -> QByteArray """
        return QByteArray

    def truncate(self, p_int):  # real signature unknown; restored from __doc__
        """ QByteArray.truncate(int) """
        pass

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+=y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*=y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__mul__(n) <==> x*n """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__rmul__(n) <==> n*x """
        pass

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QByteArrayMatcher():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QByteArrayMatcher()
    QByteArrayMatcher(QByteArray)
    QByteArrayMatcher(QByteArrayMatcher)
    """
    # real signature unknown; restored from __doc__

    def indexIn(self, QByteArray, int_from=0):
        """ QByteArrayMatcher.indexIn(QByteArray, int from=0) -> int """
        return 0

    def pattern(self):  # real signature unknown; restored from __doc__
        """ QByteArrayMatcher.pattern() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def setPattern(self, QByteArray):
        """ QByteArrayMatcher.setPattern(QByteArray) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


class QChar():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QChar()
    QChar(str)
    QChar(QLatin1Char)
    QChar(str, str)
    QChar(int)
    QChar(QChar.SpecialCharacter)
    QChar(QChar)
    """

    def Category(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def category(self, p_int=None):
        """
        QChar.category() -> QChar.Category
        QChar.category(int) -> QChar.Category
        """
        pass

    def cell(self):  # real signature unknown; restored from __doc__
        """ QChar.cell() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def combiningClass(self, p_int=None):
        """
        QChar.combiningClass() -> str
        QChar.combiningClass(int) -> str
        """
        return ""

    def CombiningClass(self, *args, **kwargs):  # real signature unknown
        pass

    def Decomposition(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def decomposition(self, p_int=None):
        """
        QChar.decomposition() -> QString
        QChar.decomposition(int) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def decompositionTag(self, p_int=None):
        """
        QChar.decompositionTag() -> QChar.Decomposition
        QChar.decompositionTag(int) -> QChar.Decomposition
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def digitValue(self, p_int=None):
        """
        QChar.digitValue() -> int
        QChar.digitValue(int) -> int
        """
        return 0

    def Direction(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def direction(self, p_int=None):
        """
        QChar.direction() -> QChar.Direction
        QChar.direction(int) -> QChar.Direction
        """
        pass

    # real signature unknown; restored from __doc__
    def fromAscii(self, p_str):
        """ QChar.fromAscii(str) -> QChar """
        return QChar

    # real signature unknown; restored from __doc__
    def fromLatin1(self, p_str):
        """ QChar.fromLatin1(str) -> QChar """
        return QChar

    def hasMirrored(self):  # real signature unknown; restored from __doc__
        """ QChar.hasMirrored() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def highSurrogate(self, p_int):
        """ QChar.highSurrogate(int) -> int """
        return 0

    def isDigit(self):  # real signature unknown; restored from __doc__
        """ QChar.isDigit() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def isHighSurrogate(self, p_int=None):
        """
        QChar.isHighSurrogate() -> bool
        QChar.isHighSurrogate(int) -> bool
        """
        return False

    def isLetter(self):  # real signature unknown; restored from __doc__
        """ QChar.isLetter() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isLetterOrNumber(self):
        """ QChar.isLetterOrNumber() -> bool """
        return False

    def isLower(self):  # real signature unknown; restored from __doc__
        """ QChar.isLower() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def isLowSurrogate(self, p_int=None):
        """
        QChar.isLowSurrogate() -> bool
        QChar.isLowSurrogate(int) -> bool
        """
        return False

    def isMark(self):  # real signature unknown; restored from __doc__
        """ QChar.isMark() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QChar.isNull() -> bool """
        return False

    def isNumber(self):  # real signature unknown; restored from __doc__
        """ QChar.isNumber() -> bool """
        return False

    def isPrint(self):  # real signature unknown; restored from __doc__
        """ QChar.isPrint() -> bool """
        return False

    def isPunct(self):  # real signature unknown; restored from __doc__
        """ QChar.isPunct() -> bool """
        return False

    def isSpace(self):  # real signature unknown; restored from __doc__
        """ QChar.isSpace() -> bool """
        return False

    def isSymbol(self):  # real signature unknown; restored from __doc__
        """ QChar.isSymbol() -> bool """
        return False

    def isTitleCase(self):  # real signature unknown; restored from __doc__
        """ QChar.isTitleCase() -> bool """
        return False

    def isUpper(self):  # real signature unknown; restored from __doc__
        """ QChar.isUpper() -> bool """
        return False

    def Joining(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def joining(self, p_int=None):
        """
        QChar.joining() -> QChar.Joining
        QChar.joining(int) -> QChar.Joining
        """
        pass

    # real signature unknown; restored from __doc__
    def lowSurrogate(self, p_int):
        """ QChar.lowSurrogate(int) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def mirroredChar(self, p_int=None):
        """
        QChar.mirroredChar() -> QChar
        QChar.mirroredChar(int) -> int
        """
        return QChar or 0

    # real signature unknown; restored from __doc__
    def requiresSurrogates(self, p_int):
        """ QChar.requiresSurrogates(int) -> bool """
        return False

    def row(self):  # real signature unknown; restored from __doc__
        """ QChar.row() -> str """
        return ""

    def setCell(self, p_str):  # real signature unknown; restored from __doc__
        """ QChar.setCell(str) """
        pass

    def setRow(self, p_str):  # real signature unknown; restored from __doc__
        """ QChar.setRow(str) """
        pass

    def SpecialCharacter(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def surrogateToUcs4(self, *__args):
        """
        QChar.surrogateToUcs4(int, int) -> int
        QChar.surrogateToUcs4(QChar, QChar) -> int
        """
        return 0

    def toAscii(self):  # real signature unknown; restored from __doc__
        """ QChar.toAscii() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def toCaseFolded(self, p_int=None):
        """
        QChar.toCaseFolded() -> QChar
        QChar.toCaseFolded(int) -> int
        """
        return QChar or 0

    def toLatin1(self):  # real signature unknown; restored from __doc__
        """ QChar.toLatin1() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def toLower(self, p_int=None):
        """
        QChar.toLower() -> QChar
        QChar.toLower(int) -> int
        """
        return QChar or 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def toTitleCase(self, p_int=None):
        """
        QChar.toTitleCase() -> QChar
        QChar.toTitleCase(int) -> int
        """
        return QChar or 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def toUpper(self, p_int=None):
        """
        QChar.toUpper() -> QChar
        QChar.toUpper(int) -> int
        """
        return QChar or 0

    def unicode(self):  # real signature unknown; restored from __doc__
        """ QChar.unicode() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def unicodeVersion(self, p_int=None):
        """
        QChar.unicodeVersion() -> QChar.UnicodeVersion
        QChar.unicodeVersion(int) -> QChar.UnicodeVersion
        """
        pass

    def UnicodeVersion(self, *args, **kwargs):  # real signature unknown
        pass

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
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

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    ByteOrderMark = 65279
    ByteOrderSwapped = 65534
    Canonical = 1
    Center = 3
    Circle = 8
    Combining_Above = 230
    Combining_AboveAttached = 214
    Combining_AboveLeft = 228
    Combining_AboveLeftAttached = 212
    Combining_AboveRight = 232
    Combining_AboveRightAttached = 216
    Combining_Below = 220
    Combining_BelowAttached = 202
    Combining_BelowLeft = 218
    Combining_BelowLeftAttached = 200
    Combining_BelowRight = 222
    Combining_BelowRightAttached = 204
    Combining_DoubleAbove = 234
    Combining_DoubleBelow = 233
    Combining_IotaSubscript = 240
    Combining_Left = 224
    Combining_LeftAttached = 208
    Combining_Right = 226
    Combining_RightAttached = 210
    Compat = 16
    DirAL = 13
    DirAN = 5
    DirB = 7
    DirBN = 18
    DirCS = 6
    DirEN = 2
    DirES = 3
    DirET = 4
    DirL = 0
    DirLRE = 11
    DirLRO = 12
    DirNSM = 17
    DirON = 10
    DirPDF = 16
    DirR = 1
    DirRLE = 14
    DirRLO = 15
    DirS = 8
    DirWS = 9
    Dual = 1
    Final = 6
    Font = 2
    Fraction = 17
    Initial = 4
    Isolated = 7
    Letter_Lowercase = 16
    Letter_Modifier = 18
    Letter_Other = 19
    Letter_Titlecase = 17
    Letter_Uppercase = 15
    LineSeparator = 8232
    Mark_Enclosing = 3
    Mark_NonSpacing = 1
    Mark_SpacingCombining = 2
    Medial = 5
    Narrow = 13
    Nbsp = 160
    NoBreak = 3
    NoCategory = 0
    NoDecomposition = 0
    Null = 0
    Number_DecimalDigit = 4
    Number_Letter = 5
    Number_Other = 6
    ObjectReplacementCharacter = 65532
    OtherJoining = 0
    Other_Control = 10
    Other_Format = 11
    Other_NotAssigned = 14
    Other_PrivateUse = 13
    Other_Surrogate = 12
    ParagraphSeparator = 8233
    Punctuation_Close = 23
    Punctuation_Connector = 20
    Punctuation_Dash = 21
    Punctuation_Dask = 21
    Punctuation_FinalQuote = 25
    Punctuation_InitialQuote = 24
    Punctuation_Open = 22
    Punctuation_Other = 26
    ReplacementCharacter = 65533
    Right = 2
    Separator_Line = 8
    Separator_Paragraph = 9
    Separator_Space = 7
    Small = 14
    Square = 15
    Sub = 10
    Super = 9
    Symbol_Currency = 28
    Symbol_Math = 27
    Symbol_Modifier = 29
    Symbol_Other = 30
    Unicode_1_1 = 1
    Unicode_2_0 = 2
    Unicode_2_1_2 = 3
    Unicode_3_0 = 4
    Unicode_3_1 = 5
    Unicode_3_2 = 6
    Unicode_4_0 = 7
    Unicode_4_1 = 8
    Unicode_5_0 = 9
    Unicode_Unassigned = 0
    Vertical = 11
    Wide = 12


class QEvent():  # skipped bases: <type 'sip.wrapper'>

    """
    QEvent(QEvent.Type)
    QEvent(QEvent)
    """

    def accept(self):  # real signature unknown; restored from __doc__
        """ QEvent.accept() """
        pass

    def ignore(self):  # real signature unknown; restored from __doc__
        """ QEvent.ignore() """
        pass

    def isAccepted(self):  # real signature unknown; restored from __doc__
        """ QEvent.isAccepted() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def registerEventType(self, int_hint=-1):
        """ QEvent.registerEventType(int hint=-1) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setAccepted(self, bool):
        """ QEvent.setAccepted(bool) """
        pass

    def spontaneous(self):  # real signature unknown; restored from __doc__
        """ QEvent.spontaneous() -> bool """
        return False

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QEvent.type() -> QEvent.Type """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    AccessibilityDescription = 130
    AccessibilityHelp = 119
    AccessibilityPrepare = 86
    ActionAdded = 114
    ActionChanged = 113
    ActionRemoved = 115
    ActivationChange = 99
    ApplicationActivate = 121
    ApplicationActivated = 121
    ApplicationDeactivate = 122
    ApplicationDeactivated = 122
    ApplicationFontChange = 36
    ApplicationLayoutDirectionChange = 37
    ApplicationPaletteChange = 38
    ApplicationWindowIconChange = 35
    ChildAdded = 68
    ChildPolished = 69
    ChildRemoved = 71
    Clipboard = 40
    Close = 19
    CloseSoftwareInputPanel = 200
    ContextMenu = 82
    CursorChange = 183
    DeferredDelete = 52
    DragEnter = 60
    DragLeave = 62
    DragMove = 61
    Drop = 63
    DynamicPropertyChange = 170
    EnabledChange = 98
    Enter = 10
    EnterWhatsThisMode = 124
    FileOpen = 116
    FocusIn = 8
    FocusOut = 9
    FontChange = 97
    Gesture = 198
    GestureOverride = 202
    GrabKeyboard = 188
    GrabMouse = 186
    GraphicsSceneContextMenu = 159
    GraphicsSceneDragEnter = 164
    GraphicsSceneDragLeave = 166
    GraphicsSceneDragMove = 165
    GraphicsSceneDrop = 167
    GraphicsSceneHelp = 163
    GraphicsSceneHoverEnter = 160
    GraphicsSceneHoverLeave = 162
    GraphicsSceneHoverMove = 161
    GraphicsSceneMouseDoubleClick = 158
    GraphicsSceneMouseMove = 155
    GraphicsSceneMousePress = 156
    GraphicsSceneMouseRelease = 157
    GraphicsSceneMove = 182
    GraphicsSceneResize = 181
    GraphicsSceneWheel = 168
    Hide = 18
    HideToParent = 27
    HoverEnter = 127
    HoverLeave = 128
    HoverMove = 129
    IconDrag = 96
    IconTextChange = 101
    InputMethod = 83
    KeyboardLayoutChange = 169
    KeyPress = 6
    KeyRelease = 7
    LanguageChange = 89
    LayoutDirectionChange = 90
    LayoutRequest = 76
    Leave = 11
    LeaveWhatsThisMode = 125
    LocaleChange = 88
    MaxUser = 65535
    MenubarUpdated = 153
    MetaCall = 43
    ModifiedChange = 102
    MouseButtonDblClick = 4
    MouseButtonPress = 2
    MouseButtonRelease = 3
    MouseMove = 5
    MouseTrackingChange = 109
    Move = 13
    None = 0
    OkRequest = 94
    Paint = 12
    PaletteChange = 39
    ParentAboutToChange = 131
    ParentChange = 21
    Polish = 75
    PolishRequest = 74
    QueryWhatsThis = 123
    RequestSoftwareInputPanel = 199
    Resize = 14
    Shortcut = 117
    ShortcutOverride = 51
    Show = 17
    ShowToParent = 26
    SockAct = 50
    StateMachineSignal = 192
    StateMachineWrapped = 193
    StatusTip = 112
    StyleChange = 100
    TabletEnterProximity = 171
    TabletLeaveProximity = 172
    TabletMove = 87
    TabletPress = 92
    TabletRelease = 93
    Timer = 1
    ToolBarChange = 120
    ToolTip = 110
    ToolTipChange = 184
    TouchBegin = 194
    TouchEnd = 196
    TouchUpdate = 195
    UngrabKeyboard = 189
    UngrabMouse = 187
    UpdateLater = 78
    UpdateRequest = 77
    User = 1000
    WhatsThis = 111
    WhatsThisClicked = 118
    Wheel = 31
    WindowActivate = 24
    WindowBlocked = 103
    WindowDeactivate = 25
    WindowIconChange = 34
    WindowStateChange = 105
    WindowTitleChange = 33
    WindowUnblocked = 104
    WinEventAct = 132
    WinIdChange = 203
    ZOrderChange = 126


class QChildEvent(QEvent):

    """
    QChildEvent(QEvent.Type, QObject)
    QChildEvent(QChildEvent)
    """

    def added(self):  # real signature unknown; restored from __doc__
        """ QChildEvent.added() -> bool """
        return False

    def child(self):  # real signature unknown; restored from __doc__
        """ QChildEvent.child() -> QObject """
        return QObject

    def polished(self):  # real signature unknown; restored from __doc__
        """ QChildEvent.polished() -> bool """
        return False

    def removed(self):  # real signature unknown; restored from __doc__
        """ QChildEvent.removed() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QCoreApplication(QObject):

    """ QCoreApplication(list-of-str) """

    def aboutToQuit(self, *args, **kwargs):  # real signature unknown
        """ QCoreApplication.aboutToQuit[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def addLibraryPath(self, QString):
        """ QCoreApplication.addLibraryPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def applicationDirPath(self):
        """ QCoreApplication.applicationDirPath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def applicationFilePath(self):
        """ QCoreApplication.applicationFilePath() -> QString """
        return QString

    def applicationName(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.applicationName() -> QString """
        return QString

    def applicationPid(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.applicationPid() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def applicationVersion(self):
        """ QCoreApplication.applicationVersion() -> QString """
        return QString

    def argc(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.argc() -> int """
        return 0

    def arguments(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.arguments() -> QStringList """
        return QStringList

    def argv(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.argv() -> list-of-str """
        pass

    def closingDown(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.closingDown() -> bool """
        return False

    def Encoding(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QCoreApplication.event(QEvent) -> bool """
        return False

    def exec_(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.exec_() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def exit(self, int_returnCode=0):
        """ QCoreApplication.exit(int returnCode=0) """
        pass

    def flush(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.flush() """
        pass

    # real signature unknown; restored from __doc__
    def hasPendingEvents(self):
        """ QCoreApplication.hasPendingEvents() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def installTranslator(self, QTranslator):
        """ QCoreApplication.installTranslator(QTranslator) """
        pass

    def instance(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.instance() -> QCoreApplication """
        return QCoreApplication

    def libraryPaths(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.libraryPaths() -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def notify(self, QObject, QEvent):
        """ QCoreApplication.notify(QObject, QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def organizationDomain(self):
        """ QCoreApplication.organizationDomain() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def organizationName(self):
        """ QCoreApplication.organizationName() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def postEvent(self, QObject, QEvent, p_int=None):
        """
        QCoreApplication.postEvent(QObject, QEvent)
        QCoreApplication.postEvent(QObject, QEvent, int)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def processEvents(self, *__args):
        """
        QCoreApplication.processEvents(QEventLoop.ProcessEventsFlags flags=QEventLoop.AllEvents)
        QCoreApplication.processEvents(QEventLoop.ProcessEventsFlags, int)
        """
        pass

    def quit(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.quit() """
        pass

    # real signature unknown; restored from __doc__
    def removeLibraryPath(self, QString):
        """ QCoreApplication.removeLibraryPath(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def removePostedEvents(self, QObject, p_int=None):
        """
        QCoreApplication.removePostedEvents(QObject)
        QCoreApplication.removePostedEvents(QObject, int)
        """
        pass

    # real signature unknown; restored from __doc__
    def removeTranslator(self, QTranslator):
        """ QCoreApplication.removeTranslator(QTranslator) """
        pass

    # real signature unknown; restored from __doc__
    def sendEvent(self, QObject, QEvent):
        """ QCoreApplication.sendEvent(QObject, QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def sendPostedEvents(self, QObject=None, p_int=None):
        """
        QCoreApplication.sendPostedEvents(QObject, int)
        QCoreApplication.sendPostedEvents()
        """
        pass

    # real signature unknown; restored from __doc__
    def setApplicationName(self, QString):
        """ QCoreApplication.setApplicationName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setApplicationVersion(self, QString):
        """ QCoreApplication.setApplicationVersion(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setAttribute(self, Qt_ApplicationAttribute, bool_on=True):
        """ QCoreApplication.setAttribute(Qt.ApplicationAttribute, bool on=True) """
        pass

    # real signature unknown; restored from __doc__
    def setLibraryPaths(self, QStringList):
        """ QCoreApplication.setLibraryPaths(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setOrganizationDomain(self, QString):
        """ QCoreApplication.setOrganizationDomain(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOrganizationName(self, QString):
        """ QCoreApplication.setOrganizationName(QString) """
        pass

    def startingUp(self):  # real signature unknown; restored from __doc__
        """ QCoreApplication.startingUp() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def testAttribute(self, Qt_ApplicationAttribute):
        """ QCoreApplication.testAttribute(Qt.ApplicationAttribute) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, p_str, p_str_1, *__args):
        """
        QCoreApplication.translate(str, str, str disambiguation=None, QCoreApplication.Encoding encoding=QCoreApplication.CodecForTr) -> QString
        QCoreApplication.translate(str, str, str, QCoreApplication.Encoding, int) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def __init__(self, list_of_str):
        pass

    CodecForTr = 0
    DefaultCodec = 0
    UnicodeUTF8 = 1


class QCryptographicHash():  # skipped bases: <type 'sip.simplewrapper'>

    """ QCryptographicHash(QCryptographicHash.Algorithm) """
    # real signature unknown; restored from __doc__ with multiple overloads

    def addData(self, *__args):
        """
        QCryptographicHash.addData(str)
        QCryptographicHash.addData(QByteArray)
        """
        pass

    def Algorithm(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def hash(self, QByteArray, QCryptographicHash_Algorithm):
        """ QCryptographicHash.hash(QByteArray, QCryptographicHash.Algorithm) -> QByteArray """
        return QByteArray

    def reset(self):  # real signature unknown; restored from __doc__
        """ QCryptographicHash.reset() """
        pass

    def result(self):  # real signature unknown; restored from __doc__
        """ QCryptographicHash.result() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def __init__(self, QCryptographicHash_Algorithm):
        pass

    __weakref__ = property(lambda self: object())  # default

    Md4 = 0
    Md5 = 1
    Sha1 = 2


class QDataStream():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDataStream()
    QDataStream(QIODevice)
    QDataStream(QByteArray, QIODevice.OpenMode)
    QDataStream(QByteArray)
    """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QDataStream.atEnd() -> bool """
        return False

    def ByteOrder(self, *args, **kwargs):  # real signature unknown
        pass

    def byteOrder(self):  # real signature unknown; restored from __doc__
        """ QDataStream.byteOrder() -> QDataStream.ByteOrder """
        pass

    def device(self):  # real signature unknown; restored from __doc__
        """ QDataStream.device() -> QIODevice """
        return QIODevice

    # real signature unknown
    def FloatingPointPrecision(self, *args, **kwargs):
        pass

    # real signature unknown; restored from __doc__
    def floatingPointPrecision(self):
        """ QDataStream.floatingPointPrecision() -> QDataStream.FloatingPointPrecision """
        pass

    def readBool(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readBool() -> bool """
        return False

    def readBytes(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readBytes() -> str """
        return ""

    def readDouble(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readDouble() -> float """
        return 0.0

    def readFloat(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readFloat() -> float """
        return 0.0

    def readInt(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readInt() -> int """
        return 0

    def readInt16(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readInt16() -> int """
        return 0

    def readInt32(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readInt32() -> int """
        return 0

    def readInt64(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readInt64() -> int """
        return 0

    def readInt8(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readInt8() -> str """
        return ""

    def readQString(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readQString() -> QString """
        return QString

    def readQStringList(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readQStringList() -> QStringList """
        return QStringList

    def readQVariant(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readQVariant() -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def readQVariantHash(self):
        """ QDataStream.readQVariantHash() -> dict-of-QString-QVariant """
        pass

    # real signature unknown; restored from __doc__
    def readQVariantList(self):
        """ QDataStream.readQVariantList() -> list-of-QVariant """
        pass

    def readQVariantMap(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readQVariantMap() -> dict-of-QString-QVariant """
        pass

    # real signature unknown; restored from __doc__
    def readRawData(self, p_int):
        """ QDataStream.readRawData(int) -> str """
        return ""

    def readString(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readString() -> str """
        return ""

    def readUInt16(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readUInt16() -> int """
        return 0

    def readUInt32(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readUInt32() -> int """
        return 0

    def readUInt64(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readUInt64() -> int """
        return 0

    def readUInt8(self):  # real signature unknown; restored from __doc__
        """ QDataStream.readUInt8() -> str """
        return ""

    def resetStatus(self):  # real signature unknown; restored from __doc__
        """ QDataStream.resetStatus() """
        pass

    # real signature unknown; restored from __doc__
    def setByteOrder(self, QDataStream_ByteOrder):
        """ QDataStream.setByteOrder(QDataStream.ByteOrder) """
        pass

    # real signature unknown; restored from __doc__
    def setDevice(self, QIODevice):
        """ QDataStream.setDevice(QIODevice) """
        pass

    # real signature unknown; restored from __doc__
    def setFloatingPointPrecision(self, QDataStream_FloatingPointPrecision):
        """ QDataStream.setFloatingPointPrecision(QDataStream.FloatingPointPrecision) """
        pass

    # real signature unknown; restored from __doc__
    def setStatus(self, QDataStream_Status):
        """ QDataStream.setStatus(QDataStream.Status) """
        pass

    # real signature unknown; restored from __doc__
    def setVersion(self, p_int):
        """ QDataStream.setVersion(int) """
        pass

    # real signature unknown; restored from __doc__
    def skipRawData(self, p_int):
        """ QDataStream.skipRawData(int) -> int """
        return 0

    def Status(self, *args, **kwargs):  # real signature unknown
        pass

    def status(self):  # real signature unknown; restored from __doc__
        """ QDataStream.status() -> QDataStream.Status """
        pass

    def unsetDevice(self):  # real signature unknown; restored from __doc__
        """ QDataStream.unsetDevice() """
        pass

    def Version(self, *args, **kwargs):  # real signature unknown
        pass

    def version(self):  # real signature unknown; restored from __doc__
        """ QDataStream.version() -> int """
        return 0

    def writeBool(self, bool):  # real signature unknown; restored from __doc__
        """ QDataStream.writeBool(bool) """
        pass

    # real signature unknown; restored from __doc__
    def writeBytes(self, p_str):
        """ QDataStream.writeBytes(str) -> QDataStream """
        return QDataStream

    # real signature unknown; restored from __doc__
    def writeDouble(self, p_float):
        """ QDataStream.writeDouble(float) """
        pass

    # real signature unknown; restored from __doc__
    def writeFloat(self, p_float):
        """ QDataStream.writeFloat(float) """
        pass

    def writeInt(self, p_int):  # real signature unknown; restored from __doc__
        """ QDataStream.writeInt(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeInt16(self, p_int):
        """ QDataStream.writeInt16(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeInt32(self, p_int):
        """ QDataStream.writeInt32(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeInt64(self, p_int):
        """ QDataStream.writeInt64(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeInt8(self, p_str):
        """ QDataStream.writeInt8(str) """
        pass

    # real signature unknown; restored from __doc__
    def writeQString(self, QString):
        """ QDataStream.writeQString(QString) """
        pass

    # real signature unknown; restored from __doc__
    def writeQStringList(self, QStringList):
        """ QDataStream.writeQStringList(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def writeQVariant(self, QVariant):
        """ QDataStream.writeQVariant(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def writeQVariantHash(self, dict_of_QString_QVariant):
        """ QDataStream.writeQVariantHash(dict-of-QString-QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def writeQVariantList(self, list_of_QVariant):
        """ QDataStream.writeQVariantList(list-of-QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def writeQVariantMap(self, dict_of_QString_QVariant):
        """ QDataStream.writeQVariantMap(dict-of-QString-QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def writeRawData(self, p_str):
        """ QDataStream.writeRawData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def writeString(self, p_str):
        """ QDataStream.writeString(str) """
        pass

    # real signature unknown; restored from __doc__
    def writeUInt16(self, p_int):
        """ QDataStream.writeUInt16(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeUInt32(self, p_int):
        """ QDataStream.writeUInt32(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeUInt64(self, p_int):
        """ QDataStream.writeUInt64(int) """
        pass

    # real signature unknown; restored from __doc__
    def writeUInt8(self, p_str):
        """ QDataStream.writeUInt8(str) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __lshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lshift__(y) <==> x<<y """
        pass

    def __rlshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rlshift__(y) <==> y<<x """
        pass

    def __rrshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rrshift__(y) <==> y>>x """
        pass

    def __rshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rshift__(y) <==> x>>y """
        pass

    __weakref__ = property(lambda self: object())  # default

    BigEndian = 0
    DoublePrecision = 1
    LittleEndian = 1
    Ok = 0
    Qt_1_0 = 1
    Qt_2_0 = 2
    Qt_2_1 = 3
    Qt_3_0 = 4
    Qt_3_1 = 5
    Qt_3_3 = 6
    Qt_4_0 = 7
    Qt_4_1 = 7
    Qt_4_2 = 8
    Qt_4_3 = 9
    Qt_4_4 = 10
    Qt_4_5 = 11
    Qt_4_6 = 12
    Qt_4_7 = 12
    ReadCorruptData = 2
    ReadPastEnd = 1
    SinglePrecision = 0


class QDate():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDate()
    QDate(int, int, int)
    QDate(QDate)
    """

    def addDays(self, p_int):  # real signature unknown; restored from __doc__
        """ QDate.addDays(int) -> QDate """
        return QDate

    # real signature unknown; restored from __doc__
    def addMonths(self, p_int):
        """ QDate.addMonths(int) -> QDate """
        return QDate

    def addYears(self, p_int):  # real signature unknown; restored from __doc__
        """ QDate.addYears(int) -> QDate """
        return QDate

    def currentDate(self):  # real signature unknown; restored from __doc__
        """ QDate.currentDate() -> QDate """
        return QDate

    def day(self):  # real signature unknown; restored from __doc__
        """ QDate.day() -> int """
        return 0

    def dayOfWeek(self):  # real signature unknown; restored from __doc__
        """ QDate.dayOfWeek() -> int """
        return 0

    def dayOfYear(self):  # real signature unknown; restored from __doc__
        """ QDate.dayOfYear() -> int """
        return 0

    def daysInMonth(self):  # real signature unknown; restored from __doc__
        """ QDate.daysInMonth() -> int """
        return 0

    def daysInYear(self):  # real signature unknown; restored from __doc__
        """ QDate.daysInYear() -> int """
        return 0

    def daysTo(self, QDate):  # real signature unknown; restored from __doc__
        """ QDate.daysTo(QDate) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def fromJulianDay(self, p_int):
        """ QDate.fromJulianDay(int) -> QDate """
        return QDate

    # real signature unknown; restored from __doc__ with multiple overloads
    def fromString(self, QString, *__args):
        """
        QDate.fromString(QString, Qt.DateFormat format=Qt.TextDate) -> QDate
        QDate.fromString(QString, QString) -> QDate
        """
        return QDate

    def getDate(self):  # real signature unknown; restored from __doc__
        """ QDate.getDate() -> (int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def gregorianToJulian(self, p_int, p_int_1, p_int_2):
        """ QDate.gregorianToJulian(int, int, int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def isLeapYear(self, p_int):
        """ QDate.isLeapYear(int) -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QDate.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def isValid(self, p_int=None, p_int_1=None, p_int_2=None):
        """
        QDate.isValid() -> bool
        QDate.isValid(int, int, int) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def julianToGregorian(self, p_int):
        """ QDate.julianToGregorian(int) -> (int, int, int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def longDayName(self, p_int, QDate_MonthNameType=None):
        """
        QDate.longDayName(int) -> QString
        QDate.longDayName(int, QDate.MonthNameType) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def longMonthName(self, p_int, QDate_MonthNameType=None):
        """
        QDate.longMonthName(int) -> QString
        QDate.longMonthName(int, QDate.MonthNameType) -> QString
        """
        return QString

    def month(self):  # real signature unknown; restored from __doc__
        """ QDate.month() -> int """
        return 0

    def MonthNameType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setDate(self, p_int, p_int_1, p_int_2):
        """ QDate.setDate(int, int, int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setYMD(self, p_int, p_int_1, p_int_2):
        """ QDate.setYMD(int, int, int) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def shortDayName(self, p_int, QDate_MonthNameType=None):
        """
        QDate.shortDayName(int) -> QString
        QDate.shortDayName(int, QDate.MonthNameType) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def shortMonthName(self, p_int, QDate_MonthNameType=None):
        """
        QDate.shortMonthName(int) -> QString
        QDate.shortMonthName(int, QDate.MonthNameType) -> QString
        """
        return QString

    def toJulianDay(self):  # real signature unknown; restored from __doc__
        """ QDate.toJulianDay() -> int """
        return 0

    def toPyDate(self):  # real signature unknown; restored from __doc__
        """ QDate.toPyDate() -> datetime.date """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def toString(self, *__args):
        """
        QDate.toString(Qt.DateFormat format=Qt.TextDate) -> QString
        QDate.toString(QString) -> QString
        """
        return QString

    def weekNumber(self):  # real signature unknown; restored from __doc__
        """ QDate.weekNumber() -> (int, int) """
        pass

    def year(self):  # real signature unknown; restored from __doc__
        """ QDate.year() -> int """
        return 0

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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    DateFormat = 0
    StandaloneFormat = 1


class QDateTime():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDateTime()
    QDateTime(QDateTime)
    QDateTime(QDate)
    QDateTime(QDate, QTime, Qt.TimeSpec timeSpec=Qt.LocalTime)
    QDateTime(int, int, int, int, int, int s=0, int msec=0, int timeSpec=0)
    """

    def addDays(self, p_int):  # real signature unknown; restored from __doc__
        """ QDateTime.addDays(int) -> QDateTime """
        return QDateTime

    # real signature unknown; restored from __doc__
    def addMonths(self, p_int):
        """ QDateTime.addMonths(int) -> QDateTime """
        return QDateTime

    def addMSecs(self, p_int):  # real signature unknown; restored from __doc__
        """ QDateTime.addMSecs(int) -> QDateTime """
        return QDateTime

    def addSecs(self, p_int):  # real signature unknown; restored from __doc__
        """ QDateTime.addSecs(int) -> QDateTime """
        return QDateTime

    def addYears(self, p_int):  # real signature unknown; restored from __doc__
        """ QDateTime.addYears(int) -> QDateTime """
        return QDateTime

    def currentDateTime(self):  # real signature unknown; restored from __doc__
        """ QDateTime.currentDateTime() -> QDateTime """
        return QDateTime

    # real signature unknown; restored from __doc__
    def currentDateTimeUtc(self):
        """ QDateTime.currentDateTimeUtc() -> QDateTime """
        return QDateTime

    # real signature unknown; restored from __doc__
    def currentMSecsSinceEpoch(self):
        """ QDateTime.currentMSecsSinceEpoch() -> int """
        return 0

    def date(self):  # real signature unknown; restored from __doc__
        """ QDateTime.date() -> QDate """
        return QDate

    # real signature unknown; restored from __doc__
    def daysTo(self, QDateTime):
        """ QDateTime.daysTo(QDateTime) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def fromMSecsSinceEpoch(self, p_int):
        """ QDateTime.fromMSecsSinceEpoch(int) -> QDateTime """
        return QDateTime

    # real signature unknown; restored from __doc__ with multiple overloads
    def fromString(self, QString, *__args):
        """
        QDateTime.fromString(QString, Qt.DateFormat format=Qt.TextDate) -> QDateTime
        QDateTime.fromString(QString, QString) -> QDateTime
        """
        return QDateTime

    # real signature unknown; restored from __doc__
    def fromTime_t(self, p_int):
        """ QDateTime.fromTime_t(int) -> QDateTime """
        return QDateTime

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QDateTime.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QDateTime.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def msecsTo(self, QDateTime):
        """ QDateTime.msecsTo(QDateTime) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def secsTo(self, QDateTime):
        """ QDateTime.secsTo(QDateTime) -> int """
        return 0

    def setDate(self, QDate):  # real signature unknown; restored from __doc__
        """ QDateTime.setDate(QDate) """
        pass

    # real signature unknown; restored from __doc__
    def setMSecsSinceEpoch(self, p_int):
        """ QDateTime.setMSecsSinceEpoch(int) """
        pass

    def setTime(self, QTime):  # real signature unknown; restored from __doc__
        """ QDateTime.setTime(QTime) """
        pass

    # real signature unknown; restored from __doc__
    def setTimeSpec(self, Qt_TimeSpec):
        """ QDateTime.setTimeSpec(Qt.TimeSpec) """
        pass

    # real signature unknown; restored from __doc__
    def setTime_t(self, p_int):
        """ QDateTime.setTime_t(int) """
        pass

    def time(self):  # real signature unknown; restored from __doc__
        """ QDateTime.time() -> QTime """
        return QTime

    def timeSpec(self):  # real signature unknown; restored from __doc__
        """ QDateTime.timeSpec() -> Qt.TimeSpec """
        pass

    def toLocalTime(self):  # real signature unknown; restored from __doc__
        """ QDateTime.toLocalTime() -> QDateTime """
        return QDateTime

    # real signature unknown; restored from __doc__
    def toMSecsSinceEpoch(self):
        """ QDateTime.toMSecsSinceEpoch() -> int """
        return 0

    def toPyDateTime(self):  # real signature unknown; restored from __doc__
        """ QDateTime.toPyDateTime() -> datetime.datetime """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def toString(self, *__args):
        """
        QDateTime.toString(Qt.DateFormat format=Qt.TextDate) -> QString
        QDateTime.toString(QString) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def toTimeSpec(self, Qt_TimeSpec):
        """ QDateTime.toTimeSpec(Qt.TimeSpec) -> QDateTime """
        return QDateTime

    def toTime_t(self):  # real signature unknown; restored from __doc__
        """ QDateTime.toTime_t() -> int """
        return 0

    def toUTC(self):  # real signature unknown; restored from __doc__
        """ QDateTime.toUTC() -> QDateTime """
        return QDateTime

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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QDir():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDir(QDir)
    QDir(QString path=QString())
    QDir(QString, QString, QDir.SortFlags sort=QDir.Name|QDir.IgnoreCase, QDir.Filters filters=QDir.TypeMask)
    """
    # real signature unknown; restored from __doc__

    def absoluteFilePath(self, QString):
        """ QDir.absoluteFilePath(QString) -> QString """
        return QString

    def absolutePath(self):  # real signature unknown; restored from __doc__
        """ QDir.absolutePath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def addResourceSearchPath(self, QString):
        """ QDir.addResourceSearchPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def addSearchPath(self, QString, QString_1):
        """ QDir.addSearchPath(QString, QString) """
        pass

    def canonicalPath(self):  # real signature unknown; restored from __doc__
        """ QDir.canonicalPath() -> QString """
        return QString

    def cd(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.cd(QString) -> bool """
        return False

    def cdUp(self):  # real signature unknown; restored from __doc__
        """ QDir.cdUp() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def cleanPath(self, QString):
        """ QDir.cleanPath(QString) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def convertSeparators(self, QString):
        """ QDir.convertSeparators(QString) -> QString """
        return QString

    def count(self):  # real signature unknown; restored from __doc__
        """ QDir.count() -> int """
        return 0

    def current(self):  # real signature unknown; restored from __doc__
        """ QDir.current() -> QDir """
        return QDir

    def currentPath(self):  # real signature unknown; restored from __doc__
        """ QDir.currentPath() -> QString """
        return QString

    def dirName(self):  # real signature unknown; restored from __doc__
        """ QDir.dirName() -> QString """
        return QString

    def drives(self):  # real signature unknown; restored from __doc__
        """ QDir.drives() -> list-of-QFileInfo """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def entryInfoList(self, *__args):
        """
        QDir.entryInfoList(QDir.Filters filters=QDir.NoFilter, QDir.SortFlags sort=QDir.NoSort) -> list-of-QFileInfo
        QDir.entryInfoList(QStringList, QDir.Filters filters=QDir.NoFilter, QDir.SortFlags sort=QDir.NoSort) -> list-of-QFileInfo
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def entryList(self, *__args):
        """
        QDir.entryList(QDir.Filters filters=QDir.NoFilter, QDir.SortFlags sort=QDir.NoSort) -> QStringList
        QDir.entryList(QStringList, QDir.Filters filters=QDir.NoFilter, QDir.SortFlags sort=QDir.NoSort) -> QStringList
        """
        return QStringList

    # real signature unknown; restored from __doc__ with multiple overloads
    def exists(self, QString=None):
        """
        QDir.exists() -> bool
        QDir.exists(QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def filePath(self, QString):
        """ QDir.filePath(QString) -> QString """
        return QString

    def Filter(self, *args, **kwargs):  # real signature unknown
        pass

    def filter(self):  # real signature unknown; restored from __doc__
        """ QDir.filter() -> QDir.Filters """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Filters(self, *__args):
        """
        QDir.Filters(QDir.Filters)
        QDir.Filters(int)
        QDir.Filters()
        """
        pass

    # real signature unknown; restored from __doc__
    def fromNativeSeparators(self, QString):
        """ QDir.fromNativeSeparators(QString) -> QString """
        return QString

    def home(self):  # real signature unknown; restored from __doc__
        """ QDir.home() -> QDir """
        return QDir

    def homePath(self):  # real signature unknown; restored from __doc__
        """ QDir.homePath() -> QString """
        return QString

    def isAbsolute(self):  # real signature unknown; restored from __doc__
        """ QDir.isAbsolute() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isAbsolutePath(self, QString):
        """ QDir.isAbsolutePath(QString) -> bool """
        return False

    def isReadable(self):  # real signature unknown; restored from __doc__
        """ QDir.isReadable() -> bool """
        return False

    def isRelative(self):  # real signature unknown; restored from __doc__
        """ QDir.isRelative() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isRelativePath(self, QString):
        """ QDir.isRelativePath(QString) -> bool """
        return False

    def isRoot(self):  # real signature unknown; restored from __doc__
        """ QDir.isRoot() -> bool """
        return False

    def makeAbsolute(self):  # real signature unknown; restored from __doc__
        """ QDir.makeAbsolute() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def match(self, *__args):
        """
        QDir.match(QStringList, QString) -> bool
        QDir.match(QString, QString) -> bool
        """
        return False

    def mkdir(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.mkdir(QString) -> bool """
        return False

    def mkpath(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.mkpath(QString) -> bool """
        return False

    def nameFilters(self):  # real signature unknown; restored from __doc__
        """ QDir.nameFilters() -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def nameFiltersFromString(self, QString):
        """ QDir.nameFiltersFromString(QString) -> QStringList """
        return QStringList

    def path(self):  # real signature unknown; restored from __doc__
        """ QDir.path() -> QString """
        return QString

    def refresh(self):  # real signature unknown; restored from __doc__
        """ QDir.refresh() """
        pass

    # real signature unknown; restored from __doc__
    def relativeFilePath(self, QString):
        """ QDir.relativeFilePath(QString) -> QString """
        return QString

    def remove(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.remove(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def rename(self, QString, QString_1):
        """ QDir.rename(QString, QString) -> bool """
        return False

    def rmdir(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.rmdir(QString) -> bool """
        return False

    def rmpath(self, QString):  # real signature unknown; restored from __doc__
        """ QDir.rmpath(QString) -> bool """
        return False

    def root(self):  # real signature unknown; restored from __doc__
        """ QDir.root() -> QDir """
        return QDir

    def rootPath(self):  # real signature unknown; restored from __doc__
        """ QDir.rootPath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def searchPaths(self, QString):
        """ QDir.searchPaths(QString) -> QStringList """
        return QStringList

    def separator(self):  # real signature unknown; restored from __doc__
        """ QDir.separator() -> QChar """
        return QChar

    # real signature unknown; restored from __doc__
    def setCurrent(self, QString):
        """ QDir.setCurrent(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setFilter(self, QDir_Filters):
        """ QDir.setFilter(QDir.Filters) """
        pass

    # real signature unknown; restored from __doc__
    def setNameFilters(self, QStringList):
        """ QDir.setNameFilters(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setPath(self, QString):
        """ QDir.setPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setSearchPaths(self, QString, QStringList):
        """ QDir.setSearchPaths(QString, QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setSorting(self, QDir_SortFlags):
        """ QDir.setSorting(QDir.SortFlags) """
        pass

    def SortFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def SortFlags(self, *__args):
        """
        QDir.SortFlags(QDir.SortFlags)
        QDir.SortFlags(int)
        QDir.SortFlags()
        """
        pass

    def sorting(self):  # real signature unknown; restored from __doc__
        """ QDir.sorting() -> QDir.SortFlags """
        pass

    def temp(self):  # real signature unknown; restored from __doc__
        """ QDir.temp() -> QDir """
        return QDir

    def tempPath(self):  # real signature unknown; restored from __doc__
        """ QDir.tempPath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def toNativeSeparators(self, QString):
        """ QDir.toNativeSeparators(QString) -> QString """
        return QString

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
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

    AccessMask = 1008
    AllDirs = 1024
    AllEntries = 7
    CaseSensitive = 2048
    Dirs = 1
    DirsFirst = 4
    DirsLast = 32
    Drives = 4
    Executable = 64
    Files = 2
    Hidden = 256
    IgnoreCase = 16
    LocaleAware = 64
    Modified = 128
    Name = 0
    NoDot = 8192
    NoDotAndDotDot = 4096
    NoDotDot = 16384
    NoFilter = -1
    NoSort = -1
    NoSymLinks = 8
    PermissionMask = 112
    Readable = 16
    Reversed = 8
    Size = 2
    SortByMask = 3
    System = 512
    Time = 1
    Type = 128
    TypeMask = 15
    Unsorted = 3
    Writable = 32


class QDirIterator():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QDirIterator(QDir, QDirIterator.IteratorFlags flags=QDirIterator.NoIteratorFlags)
    QDirIterator(QString, QDirIterator.IteratorFlags flags=QDirIterator.NoIteratorFlags)
    QDirIterator(QString, QDir.Filters, QDirIterator.IteratorFlags flags=QDirIterator.NoIteratorFlags)
    QDirIterator(QString, QStringList, QDir.Filters filters=QDir.NoFilter, QDirIterator.IteratorFlags flags=QDirIterator.NoIteratorFlags)
    """

    def fileInfo(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.fileInfo() -> QFileInfo """
        return QFileInfo

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.fileName() -> QString """
        return QString

    def filePath(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.filePath() -> QString """
        return QString

    def hasNext(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.hasNext() -> bool """
        return False

    def IteratorFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def IteratorFlags(self, *__args):
        """
        QDirIterator.IteratorFlags(QDirIterator.IteratorFlags)
        QDirIterator.IteratorFlags(int)
        QDirIterator.IteratorFlags()
        """
        pass

    def next(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.next() -> QString """
        return QString

    def path(self):  # real signature unknown; restored from __doc__
        """ QDirIterator.path() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    FollowSymlinks = 1
    NoIteratorFlags = 0
    Subdirectories = 2


class QDynamicPropertyChangeEvent(QEvent):

    """
    QDynamicPropertyChangeEvent(QByteArray)
    QDynamicPropertyChangeEvent(QDynamicPropertyChangeEvent)
    """

    def propertyName(self):  # real signature unknown; restored from __doc__
        """ QDynamicPropertyChangeEvent.propertyName() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QEasingCurve():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QEasingCurve(QEasingCurve.Type type=QEasingCurve.Linear)
    QEasingCurve(QEasingCurve)
    """

    def amplitude(self):  # real signature unknown; restored from __doc__
        """ QEasingCurve.amplitude() -> float """
        return 0.0

    def customType(self):  # real signature unknown; restored from __doc__
        """ QEasingCurve.customType() -> callable """
        pass

    def overshoot(self):  # real signature unknown; restored from __doc__
        """ QEasingCurve.overshoot() -> float """
        return 0.0

    def period(self):  # real signature unknown; restored from __doc__
        """ QEasingCurve.period() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def setAmplitude(self, p_float):
        """ QEasingCurve.setAmplitude(float) """
        pass

    # real signature unknown; restored from __doc__
    def setCustomType(self, callable):
        """ QEasingCurve.setCustomType(callable) """
        pass

    # real signature unknown; restored from __doc__
    def setOvershoot(self, p_float):
        """ QEasingCurve.setOvershoot(float) """
        pass

    # real signature unknown; restored from __doc__
    def setPeriod(self, p_float):
        """ QEasingCurve.setPeriod(float) """
        pass

    # real signature unknown; restored from __doc__
    def setType(self, QEasingCurve_Type):
        """ QEasingCurve.setType(QEasingCurve.Type) """
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QEasingCurve.type() -> QEasingCurve.Type """
        pass

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def valueForProgress(self, p_float):
        """ QEasingCurve.valueForProgress(float) -> float """
        return 0.0

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

    CosineCurve = 44
    Custom = 45
    InBack = 33
    InBounce = 37
    InCirc = 25
    InCubic = 5
    InCurve = 41
    InElastic = 29
    InExpo = 21
    InOutBack = 35
    InOutBounce = 39
    InOutCirc = 27
    InOutCubic = 7
    InOutElastic = 31
    InOutExpo = 23
    InOutQuad = 3
    InOutQuart = 11
    InOutQuint = 15
    InOutSine = 19
    InQuad = 1
    InQuart = 9
    InQuint = 13
    InSine = 17
    Linear = 0
    OutBack = 34
    OutBounce = 38
    OutCirc = 26
    OutCubic = 6
    OutCurve = 42
    OutElastic = 30
    OutExpo = 22
    OutInBack = 36
    OutInBounce = 40
    OutInCirc = 28
    OutInCubic = 8
    OutInElastic = 32
    OutInExpo = 24
    OutInQuad = 4
    OutInQuart = 12
    OutInQuint = 16
    OutInSine = 20
    OutQuad = 2
    OutQuart = 10
    OutQuint = 14
    OutSine = 18
    SineCurve = 43


class QElapsedTimer():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QElapsedTimer()
    QElapsedTimer(QElapsedTimer)
    """

    def ClockType(self, *args, **kwargs):  # real signature unknown
        pass

    def clockType(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.clockType() -> QElapsedTimer.ClockType """
        pass

    def elapsed(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.elapsed() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def hasExpired(self, p_int):
        """ QElapsedTimer.hasExpired(int) -> bool """
        return False

    def invalidate(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.invalidate() """
        pass

    def isMonotonic(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.isMonotonic() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def msecsSinceReference(self):
        """ QElapsedTimer.msecsSinceReference() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def msecsTo(self, QElapsedTimer):
        """ QElapsedTimer.msecsTo(QElapsedTimer) -> int """
        return 0

    def restart(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.restart() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def secsTo(self, QElapsedTimer):
        """ QElapsedTimer.secsTo(QElapsedTimer) -> int """
        return 0

    def start(self):  # real signature unknown; restored from __doc__
        """ QElapsedTimer.start() """
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

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QElapsedTimer=None):
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

    MachAbsoluteTime = 3
    MonotonicClock = 1
    SystemTime = 0
    TickCounter = 2


class QEventLoop(QObject):

    """ QEventLoop(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def exec_(self, QEventLoop_ProcessEventsFlags_flags=None):
        """ QEventLoop.exec_(QEventLoop.ProcessEventsFlags flags=QEventLoop.AllEvents) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def exit(self, int_returnCode=0):
        """ QEventLoop.exit(int returnCode=0) """
        pass

    def isRunning(self):  # real signature unknown; restored from __doc__
        """ QEventLoop.isRunning() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def processEvents(self, *__args):
        """
        QEventLoop.processEvents(QEventLoop.ProcessEventsFlags flags=QEventLoop.AllEvents) -> bool
        QEventLoop.processEvents(QEventLoop.ProcessEventsFlags, int)
        """
        return False

    def ProcessEventsFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ProcessEventsFlags(self, *__args):
        """
        QEventLoop.ProcessEventsFlags(QEventLoop.ProcessEventsFlags)
        QEventLoop.ProcessEventsFlags(int)
        QEventLoop.ProcessEventsFlags()
        """
        pass

    def quit(self):  # real signature unknown; restored from __doc__
        """ QEventLoop.quit() """
        pass

    def wakeUp(self):  # real signature unknown; restored from __doc__
        """ QEventLoop.wakeUp() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    AllEvents = 0
    DeferredDeletion = 16
    ExcludeSocketNotifiers = 2
    ExcludeUserInputEvents = 1
    WaitForMoreEvents = 4
    X11ExcludeTimers = 8


class QEventTransition(QAbstractTransition):

    """
    QEventTransition(QState sourceState=None)
    QEventTransition(QObject, QEvent.Type, QState sourceState=None)
    """

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QEventTransition.event(QEvent) -> bool """
        return False

    def eventSource(self):  # real signature unknown; restored from __doc__
        """ QEventTransition.eventSource() -> QObject """
        return QObject

    # real signature unknown; restored from __doc__
    def eventTest(self, QEvent):
        """ QEventTransition.eventTest(QEvent) -> bool """
        return False

    def eventType(self):  # real signature unknown; restored from __doc__
        """ QEventTransition.eventType() -> QEvent.Type """
        pass

    # real signature unknown; restored from __doc__
    def onTransition(self, QEvent):
        """ QEventTransition.onTransition(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def setEventSource(self, QObject):
        """ QEventTransition.setEventSource(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setEventType(self, QEvent_Type):
        """ QEventTransition.setEventType(QEvent.Type) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QFile(QIODevice):

    """
    QFile()
    QFile(QString)
    QFile(QObject)
    QFile(QString, QObject)
    """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QFile.atEnd() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QFile.close() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def copy(self, QString, QString_1=None):
        """
        QFile.copy(QString) -> bool
        QFile.copy(QString, QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def decodeName(self, *__args):
        """
        QFile.decodeName(QByteArray) -> QString
        QFile.decodeName(str) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def encodeName(self, QString):
        """ QFile.encodeName(QString) -> QByteArray """
        return QByteArray

    def error(self):  # real signature unknown; restored from __doc__
        """ QFile.error() -> QFile.FileError """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def exists(self, QString=None):
        """
        QFile.exists() -> bool
        QFile.exists(QString) -> bool
        """
        return False

    def fileEngine(self):  # real signature unknown; restored from __doc__
        """ QFile.fileEngine() -> QAbstractFileEngine """
        return QAbstractFileEngine

    def FileError(self, *args, **kwargs):  # real signature unknown
        pass

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QFile.fileName() -> QString """
        return QString

    def flush(self):  # real signature unknown; restored from __doc__
        """ QFile.flush() -> bool """
        return False

    def handle(self):  # real signature unknown; restored from __doc__
        """ QFile.handle() -> int """
        return 0

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QFile.isSequential() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def link(self, QString, QString_1=None):
        """
        QFile.link(QString) -> bool
        QFile.link(QString, QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def map(self, p_int, p_int_1, QFile_MemoryMapFlags_flags=None):
        """ QFile.map(int, int, QFile.MemoryMapFlags flags=QFile.NoOptions) -> sip.voidptr """
        pass

    def MemoryMapFlags(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def open(self, *__args):
        """
        QFile.open(QIODevice.OpenMode) -> bool
        QFile.open(int, QIODevice.OpenMode) -> bool
        """
        return False

    def Permission(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Permissions(self, *__args):
        """
        QFile.Permissions(QFile.Permissions)
        QFile.Permissions(int)
        QFile.Permissions()
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def permissions(self, QString=None):
        """
        QFile.permissions() -> QFile.Permissions
        QFile.permissions(QString) -> QFile.Permissions
        """
        pass

    def pos(self):  # real signature unknown; restored from __doc__
        """ QFile.pos() -> int """
        return 0

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QFile.readData(int) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readLineData(self, p_int):
        """ QFile.readLineData(int) -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def readLink(self, QString=None):
        """
        QFile.readLink() -> QString
        QFile.readLink(QString) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def remove(self, QString=None):
        """
        QFile.remove() -> bool
        QFile.remove(QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def rename(self, QString, QString_1=None):
        """
        QFile.rename(QString) -> bool
        QFile.rename(QString, QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def resize(self, *__args):
        """
        QFile.resize(int) -> bool
        QFile.resize(QString, int) -> bool
        """
        return False

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QFile.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QFile.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setPermissions(self, *__args):
        """
        QFile.setPermissions(QFile.Permissions) -> bool
        QFile.setPermissions(QString, QFile.Permissions) -> bool
        """
        return False

    def size(self):  # real signature unknown; restored from __doc__
        """ QFile.size() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def symLinkTarget(self, QString=None):
        """
        QFile.symLinkTarget() -> QString
        QFile.symLinkTarget(QString) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def unmap(self, sip_voidptr):
        """ QFile.unmap(sip.voidptr) -> bool """
        return False

    def unsetError(self):  # real signature unknown; restored from __doc__
        """ QFile.unsetError() """
        pass

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QFile.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    AbortError = 6
    CopyError = 14
    ExeGroup = 16
    ExeOther = 1
    ExeOwner = 4096
    ExeUser = 256
    FatalError = 3
    NoError = 0
    NoOptions = 0
    OpenError = 5
    PermissionsError = 13
    PositionError = 11
    ReadError = 1
    ReadGroup = 64
    ReadOther = 4
    ReadOwner = 16384
    ReadUser = 1024
    RemoveError = 9
    RenameError = 10
    ResizeError = 12
    ResourceError = 4
    TimeOutError = 7
    UnspecifiedError = 8
    WriteError = 2
    WriteGroup = 32
    WriteOther = 2
    WriteOwner = 8192
    WriteUser = 512


class QFileInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QFileInfo()
    QFileInfo(QString)
    QFileInfo(QFile)
    QFileInfo(QDir, QString)
    QFileInfo(QFileInfo)
    """

    def absoluteDir(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.absoluteDir() -> QDir """
        return QDir

    # real signature unknown; restored from __doc__
    def absoluteFilePath(self):
        """ QFileInfo.absoluteFilePath() -> QString """
        return QString

    def absolutePath(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.absolutePath() -> QString """
        return QString

    def baseName(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.baseName() -> QString """
        return QString

    def bundleName(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.bundleName() -> QString """
        return QString

    def caching(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.caching() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def canonicalFilePath(self):
        """ QFileInfo.canonicalFilePath() -> QString """
        return QString

    def canonicalPath(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.canonicalPath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def completeBaseName(self):
        """ QFileInfo.completeBaseName() -> QString """
        return QString

    def completeSuffix(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.completeSuffix() -> QString """
        return QString

    def created(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.created() -> QDateTime """
        return QDateTime

    def detach(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.detach() """
        pass

    def dir(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.dir() -> QDir """
        return QDir

    def exists(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.exists() -> bool """
        return False

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.fileName() -> QString """
        return QString

    def filePath(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.filePath() -> QString """
        return QString

    def group(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.group() -> QString """
        return QString

    def groupId(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.groupId() -> int """
        return 0

    def isAbsolute(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isAbsolute() -> bool """
        return False

    def isBundle(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isBundle() -> bool """
        return False

    def isDir(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isDir() -> bool """
        return False

    def isExecutable(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isExecutable() -> bool """
        return False

    def isFile(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isFile() -> bool """
        return False

    def isHidden(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isHidden() -> bool """
        return False

    def isReadable(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isReadable() -> bool """
        return False

    def isRelative(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isRelative() -> bool """
        return False

    def isRoot(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isRoot() -> bool """
        return False

    def isSymLink(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isSymLink() -> bool """
        return False

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.isWritable() -> bool """
        return False

    def lastModified(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.lastModified() -> QDateTime """
        return QDateTime

    def lastRead(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.lastRead() -> QDateTime """
        return QDateTime

    def makeAbsolute(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.makeAbsolute() -> bool """
        return False

    def owner(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.owner() -> QString """
        return QString

    def ownerId(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.ownerId() -> int """
        return 0

    def path(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.path() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def permission(self, QFile_Permissions):
        """ QFileInfo.permission(QFile.Permissions) -> bool """
        return False

    def permissions(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.permissions() -> QFile.Permissions """
        pass

    def readLink(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.readLink() -> QString """
        return QString

    def refresh(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.refresh() """
        pass

    # real signature unknown; restored from __doc__
    def setCaching(self, bool):
        """ QFileInfo.setCaching(bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setFile(self, *__args):
        """
        QFileInfo.setFile(QString)
        QFileInfo.setFile(QFile)
        QFileInfo.setFile(QDir, QString)
        """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.size() -> int """
        return 0

    def suffix(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.suffix() -> QString """
        return QString

    def symLinkTarget(self):  # real signature unknown; restored from __doc__
        """ QFileInfo.symLinkTarget() -> QString """
        return QString

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


class QFileSystemWatcher(QObject):

    """
    QFileSystemWatcher(QObject parent=None)
    QFileSystemWatcher(QStringList, QObject parent=None)
    """

    # real signature unknown; restored from __doc__
    def addPath(self, QString):
        """ QFileSystemWatcher.addPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def addPaths(self, QStringList):
        """ QFileSystemWatcher.addPaths(QStringList) """
        pass

    def directories(self):  # real signature unknown; restored from __doc__
        """ QFileSystemWatcher.directories() -> QStringList """
        return QStringList

    def directoryChanged(self, *args, **kwargs):  # real signature unknown
        """ QFileSystemWatcher.directoryChanged[QString] [signal] """
        pass

    def fileChanged(self, *args, **kwargs):  # real signature unknown
        """ QFileSystemWatcher.fileChanged[QString] [signal] """
        pass

    def files(self):  # real signature unknown; restored from __doc__
        """ QFileSystemWatcher.files() -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def removePath(self, QString):
        """ QFileSystemWatcher.removePath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removePaths(self, QStringList):
        """ QFileSystemWatcher.removePaths(QStringList) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QFinalState(QAbstractState):

    """ QFinalState(QState parent=None) """

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QFinalState.event(QEvent) -> bool """
        return False

    def onEntry(self, QEvent):  # real signature unknown; restored from __doc__
        """ QFinalState.onEntry(QEvent) """
        pass

    def onExit(self, QEvent):  # real signature unknown; restored from __doc__
        """ QFinalState.onExit(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QState_parent=None):
        pass


class QFSFileEngine(QAbstractFileEngine):

    """
    QFSFileEngine()
    QFSFileEngine(QString)
    """

    def caseSensitive(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.caseSensitive() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.close() -> bool """
        return False

    def copy(self, QString):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.copy(QString) -> bool """
        return False

    # real signature unknown; NOTE: unreliably restored from __doc__
    def currentPath(self, QString_fileName=None, *args, **kwargs):
        """ QFSFileEngine.currentPath(QString fileName=QString()) -> QString """
        pass

    def drives(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.drives() -> list-of-QFileInfo """
        pass

    # real signature unknown; restored from __doc__
    def entryList(self, QDir_Filters, QStringList):
        """ QFSFileEngine.entryList(QDir.Filters, QStringList) -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def fileFlags(self, QAbstractFileEngine_FileFlags):
        """ QFSFileEngine.fileFlags(QAbstractFileEngine.FileFlags) -> QAbstractFileEngine.FileFlags """
        pass

    # real signature unknown; restored from __doc__
    def fileName(self, QAbstractFileEngine_FileName):
        """ QFSFileEngine.fileName(QAbstractFileEngine.FileName) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fileTime(self, QAbstractFileEngine_FileTime):
        """ QFSFileEngine.fileTime(QAbstractFileEngine.FileTime) -> QDateTime """
        return QDateTime

    def flush(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.flush() -> bool """
        return False

    def handle(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.handle() -> int """
        return 0

    def homePath(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.homePath() -> QString """
        return QString

    def isRelativePath(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.isRelativePath() -> bool """
        return False

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.isSequential() -> bool """
        return False

    def link(self, QString):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.link(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def mkdir(self, QString, bool):
        """ QFSFileEngine.mkdir(QString, bool) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def open(self, QIODevice_OpenMode, p_int=None):
        """
        QFSFileEngine.open(QIODevice.OpenMode) -> bool
        QFSFileEngine.open(QIODevice.OpenMode, int) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def owner(self, QAbstractFileEngine_FileOwner):
        """ QFSFileEngine.owner(QAbstractFileEngine.FileOwner) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def ownerId(self, QAbstractFileEngine_FileOwner):
        """ QFSFileEngine.ownerId(QAbstractFileEngine.FileOwner) -> int """
        return 0

    def pos(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.pos() -> int """
        return 0

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.read(int) -> str """
        return ""

    def readLine(self, p_int):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.readLine(int) -> str """
        return ""

    def remove(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.remove() -> bool """
        return False

    def rename(self, QString):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.rename(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def rmdir(self, QString, bool):
        """ QFSFileEngine.rmdir(QString, bool) -> bool """
        return False

    def rootPath(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.rootPath() -> QString """
        return QString

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setCurrentPath(self, QString):
        """ QFSFileEngine.setCurrentPath(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QFSFileEngine.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPermissions(self, p_int):
        """ QFSFileEngine.setPermissions(int) -> bool """
        return False

    def setSize(self, p_int):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.setSize(int) -> bool """
        return False

    def size(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.size() -> int """
        return 0

    def tempPath(self):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.tempPath() -> QString """
        return QString

    def write(self, p_str):  # real signature unknown; restored from __doc__
        """ QFSFileEngine.write(str) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QString=None):
        pass


class QGenericArgument():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QGenericReturnArgument():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QHistoryState(QAbstractState):

    """
    QHistoryState(QState parent=None)
    QHistoryState(QHistoryState.HistoryType, QState parent=None)
    """

    def defaultState(self):  # real signature unknown; restored from __doc__
        """ QHistoryState.defaultState() -> QAbstractState """
        return QAbstractState

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QHistoryState.event(QEvent) -> bool """
        return False

    def HistoryType(self, *args, **kwargs):  # real signature unknown
        pass

    def historyType(self):  # real signature unknown; restored from __doc__
        """ QHistoryState.historyType() -> QHistoryState.HistoryType """
        pass

    def onEntry(self, QEvent):  # real signature unknown; restored from __doc__
        """ QHistoryState.onEntry(QEvent) """
        pass

    def onExit(self, QEvent):  # real signature unknown; restored from __doc__
        """ QHistoryState.onExit(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultState(self, QAbstractState):
        """ QHistoryState.setDefaultState(QAbstractState) """
        pass

    # real signature unknown; restored from __doc__
    def setHistoryType(self, QHistoryState_HistoryType):
        """ QHistoryState.setHistoryType(QHistoryState.HistoryType) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    DeepHistory = 1
    ShallowHistory = 0


class QLatin1Char():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QLatin1Char(str)
    QLatin1Char(QLatin1Char)
    """

    def toLatin1(self):  # real signature unknown; restored from __doc__
        """ QLatin1Char.toLatin1() -> str """
        return ""

    def unicode(self):  # real signature unknown; restored from __doc__
        """ QLatin1Char.unicode() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QLatin1String():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QLatin1String(str)
    QLatin1String(QLatin1String)
    """

    def latin1(self):  # real signature unknown; restored from __doc__
        """ QLatin1String.latin1() -> str """
        return ""

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

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QLibrary(QObject):

    """
    QLibrary(QObject parent=None)
    QLibrary(QString, QObject parent=None)
    QLibrary(QString, int, QObject parent=None)
    QLibrary(QString, QString, QObject parent=None)
    """

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QLibrary.errorString() -> QString """
        return QString

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QLibrary.fileName() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def isLibrary(self, QString):
        """ QLibrary.isLibrary(QString) -> bool """
        return False

    def isLoaded(self):  # real signature unknown; restored from __doc__
        """ QLibrary.isLoaded() -> bool """
        return False

    def load(self):  # real signature unknown; restored from __doc__
        """ QLibrary.load() -> bool """
        return False

    def LoadHint(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def LoadHints(self, *__args):
        """
        QLibrary.LoadHints(QLibrary.LoadHints)
        QLibrary.LoadHints(int)
        QLibrary.LoadHints()
        """
        pass

    def loadHints(self):  # real signature unknown; restored from __doc__
        """ QLibrary.loadHints() -> QLibrary.LoadHints """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def resolve(self, *__args):
        """
        QLibrary.resolve(str) -> sip.voidptr
        QLibrary.resolve(QString, str) -> sip.voidptr
        QLibrary.resolve(QString, int, str) -> sip.voidptr
        QLibrary.resolve(QString, QString, str) -> sip.voidptr
        """
        pass

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QLibrary.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setFileNameAndVersion(self, QString, *__args):
        """
        QLibrary.setFileNameAndVersion(QString, int)
        QLibrary.setFileNameAndVersion(QString, QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def setLoadHints(self, QLibrary_LoadHints):
        """ QLibrary.setLoadHints(QLibrary.LoadHints) """
        pass

    def unload(self):  # real signature unknown; restored from __doc__
        """ QLibrary.unload() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    ExportExternalSymbolsHint = 2
    LoadArchiveMemberHint = 4
    ResolveAllSymbolsHint = 1


class QLibraryInfo():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def buildDate(self):  # real signature unknown; restored from __doc__
        """ QLibraryInfo.buildDate() -> QDate """
        return QDate

    def buildKey(self):  # real signature unknown; restored from __doc__
        """ QLibraryInfo.buildKey() -> QString """
        return QString

    def LibraryLocation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def licensedProducts(self):
        """ QLibraryInfo.licensedProducts() -> QString """
        return QString

    def licensee(self):  # real signature unknown; restored from __doc__
        """ QLibraryInfo.licensee() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def location(self, QLibraryInfo_LibraryLocation):
        """ QLibraryInfo.location(QLibraryInfo.LibraryLocation) -> QString """
        return QString

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    BinariesPath = 4
    DataPath = 6
    DemosPath = 9
    DocumentationPath = 1
    ExamplesPath = 10
    HeadersPath = 2
    ImportsPath = 11
    LibrariesPath = 3
    PluginsPath = 5
    PrefixPath = 0
    SettingsPath = 8
    TranslationsPath = 7


class QLine():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QLine()
    QLine(QPoint, QPoint)
    QLine(int, int, int, int)
    QLine(QLine)
    """

    def dx(self):  # real signature unknown; restored from __doc__
        """ QLine.dx() -> int """
        return 0

    def dy(self):  # real signature unknown; restored from __doc__
        """ QLine.dy() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QLine.isNull() -> bool """
        return False

    def p1(self):  # real signature unknown; restored from __doc__
        """ QLine.p1() -> QPoint """
        return QPoint

    def p2(self):  # real signature unknown; restored from __doc__
        """ QLine.p2() -> QPoint """
        return QPoint

    # real signature unknown; restored from __doc__
    def setLine(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QLine.setLine(int, int, int, int) """
        pass

    def setP1(self, QPoint):  # real signature unknown; restored from __doc__
        """ QLine.setP1(QPoint) """
        pass

    def setP2(self, QPoint):  # real signature unknown; restored from __doc__
        """ QLine.setP2(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setPoints(self, QPoint, QPoint_1):
        """ QLine.setPoints(QPoint, QPoint) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, *__args):
        """
        QLine.translate(QPoint)
        QLine.translate(int, int)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def translated(self, *__args):
        """
        QLine.translated(QPoint) -> QLine
        QLine.translated(int, int) -> QLine
        """
        return QLine

    def x1(self):  # real signature unknown; restored from __doc__
        """ QLine.x1() -> int """
        return 0

    def x2(self):  # real signature unknown; restored from __doc__
        """ QLine.x2() -> int """
        return 0

    def y1(self):  # real signature unknown; restored from __doc__
        """ QLine.y1() -> int """
        return 0

    def y2(self):  # real signature unknown; restored from __doc__
        """ QLine.y2() -> int """
        return 0

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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QLineF():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QLineF(QLine)
    QLineF()
    QLineF(QPointF, QPointF)
    QLineF(float, float, float, float)
    QLineF(QLineF)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def angle(self, QLineF=None):
        """
        QLineF.angle(QLineF) -> float
        QLineF.angle() -> float
        """
        return 0.0

    def angleTo(self, QLineF):  # real signature unknown; restored from __doc__
        """ QLineF.angleTo(QLineF) -> float """
        return 0.0

    def dx(self):  # real signature unknown; restored from __doc__
        """ QLineF.dx() -> float """
        return 0.0

    def dy(self):  # real signature unknown; restored from __doc__
        """ QLineF.dy() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def fromPolar(self, p_float, p_float_1):
        """ QLineF.fromPolar(float, float) -> QLineF """
        return QLineF

    # real signature unknown; restored from __doc__
    def intersect(self, QLineF, QPointF):
        """ QLineF.intersect(QLineF, QPointF) -> QLineF.IntersectType """
        pass

    def IntersectType(self, *args, **kwargs):  # real signature unknown
        pass

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QLineF.isNull() -> bool """
        return False

    def length(self):  # real signature unknown; restored from __doc__
        """ QLineF.length() -> float """
        return 0.0

    def normalVector(self):  # real signature unknown; restored from __doc__
        """ QLineF.normalVector() -> QLineF """
        return QLineF

    def p1(self):  # real signature unknown; restored from __doc__
        """ QLineF.p1() -> QPointF """
        return QPointF

    def p2(self):  # real signature unknown; restored from __doc__
        """ QLineF.p2() -> QPointF """
        return QPointF

    # real signature unknown; restored from __doc__
    def pointAt(self, p_float):
        """ QLineF.pointAt(float) -> QPointF """
        return QPointF

    # real signature unknown; restored from __doc__
    def setAngle(self, p_float):
        """ QLineF.setAngle(float) """
        pass

    # real signature unknown; restored from __doc__
    def setLength(self, p_float):
        """ QLineF.setLength(float) """
        pass

    # real signature unknown; restored from __doc__
    def setLine(self, p_float, p_float_1, p_float_2, p_float_3):
        """ QLineF.setLine(float, float, float, float) """
        pass

    def setP1(self, QPointF):  # real signature unknown; restored from __doc__
        """ QLineF.setP1(QPointF) """
        pass

    def setP2(self, QPointF):  # real signature unknown; restored from __doc__
        """ QLineF.setP2(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def setPoints(self, QPointF, QPointF_1):
        """ QLineF.setPoints(QPointF, QPointF) """
        pass

    def toLine(self):  # real signature unknown; restored from __doc__
        """ QLineF.toLine() -> QLine """
        return QLine

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, *__args):
        """
        QLineF.translate(QPointF)
        QLineF.translate(float, float)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def translated(self, *__args):
        """
        QLineF.translated(QPointF) -> QLineF
        QLineF.translated(float, float) -> QLineF
        """
        return QLineF

    def unitVector(self):  # real signature unknown; restored from __doc__
        """ QLineF.unitVector() -> QLineF """
        return QLineF

    def x1(self):  # real signature unknown; restored from __doc__
        """ QLineF.x1() -> float """
        return 0.0

    def x2(self):  # real signature unknown; restored from __doc__
        """ QLineF.x2() -> float """
        return 0.0

    def y1(self):  # real signature unknown; restored from __doc__
        """ QLineF.y1() -> float """
        return 0.0

    def y2(self):  # real signature unknown; restored from __doc__
        """ QLineF.y2() -> float """
        return 0.0

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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    BoundedIntersection = 1
    NoIntersection = 0
    UnboundedIntersection = 2


class QLocale():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QLocale()
    QLocale(QString)
    QLocale(QLocale.Language, QLocale.Country country=QLocale.AnyCountry)
    QLocale(QLocale)
    """

    def amText(self):  # real signature unknown; restored from __doc__
        """ QLocale.amText() -> QString """
        return QString

    def c(self):  # real signature unknown; restored from __doc__
        """ QLocale.c() -> QLocale """
        return QLocale

    # real signature unknown; restored from __doc__
    def countriesForLanguage(self, QLocale_Language):
        """ QLocale.countriesForLanguage(QLocale.Language) -> list-of-QLocale.Country """
        pass

    def Country(self, *args, **kwargs):  # real signature unknown
        pass

    def country(self):  # real signature unknown; restored from __doc__
        """ QLocale.country() -> QLocale.Country """
        pass

    # real signature unknown; restored from __doc__
    def countryToString(self, QLocale_Country):
        """ QLocale.countryToString(QLocale.Country) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def dateFormat(self, QLocale_FormatType_format=None):
        """ QLocale.dateFormat(QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def dateTimeFormat(self, QLocale_FormatType_format=None):
        """ QLocale.dateTimeFormat(QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def dayName(self, p_int, QLocale_FormatType_format=None):
        """ QLocale.dayName(int, QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    def decimalPoint(self):  # real signature unknown; restored from __doc__
        """ QLocale.decimalPoint() -> QChar """
        return QChar

    def exponential(self):  # real signature unknown; restored from __doc__
        """ QLocale.exponential() -> QChar """
        return QChar

    def FormatType(self, *args, **kwargs):  # real signature unknown
        pass

    def groupSeparator(self):  # real signature unknown; restored from __doc__
        """ QLocale.groupSeparator() -> QChar """
        return QChar

    def Language(self, *args, **kwargs):  # real signature unknown
        pass

    def language(self):  # real signature unknown; restored from __doc__
        """ QLocale.language() -> QLocale.Language """
        pass

    # real signature unknown; restored from __doc__
    def languageToString(self, QLocale_Language):
        """ QLocale.languageToString(QLocale.Language) -> QString """
        return QString

    def MeasurementSystem(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def measurementSystem(self):
        """ QLocale.measurementSystem() -> QLocale.MeasurementSystem """
        pass

    # real signature unknown; restored from __doc__
    def monthName(self, p_int, QLocale_FormatType_format=None):
        """ QLocale.monthName(int, QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    def name(self):  # real signature unknown; restored from __doc__
        """ QLocale.name() -> QString """
        return QString

    def negativeSign(self):  # real signature unknown; restored from __doc__
        """ QLocale.negativeSign() -> QChar """
        return QChar

    def NumberOption(self, *args, **kwargs):  # real signature unknown
        pass

    def numberOptions(self):  # real signature unknown; restored from __doc__
        """ QLocale.numberOptions() -> QLocale.NumberOptions """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def NumberOptions(self, *__args):
        """
        QLocale.NumberOptions(QLocale.NumberOptions)
        QLocale.NumberOptions(int)
        QLocale.NumberOptions()
        """
        pass

    def percent(self):  # real signature unknown; restored from __doc__
        """ QLocale.percent() -> QChar """
        return QChar

    def pmText(self):  # real signature unknown; restored from __doc__
        """ QLocale.pmText() -> QString """
        return QString

    def positiveSign(self):  # real signature unknown; restored from __doc__
        """ QLocale.positiveSign() -> QChar """
        return QChar

    # real signature unknown; restored from __doc__
    def setDefault(self, QLocale):
        """ QLocale.setDefault(QLocale) """
        pass

    # real signature unknown; restored from __doc__
    def setNumberOptions(self, QLocale_NumberOptions):
        """ QLocale.setNumberOptions(QLocale.NumberOptions) """
        pass

    # real signature unknown; restored from __doc__
    def standaloneDayName(self, p_int, QLocale_FormatType_format=None):
        """ QLocale.standaloneDayName(int, QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def standaloneMonthName(self, p_int, QLocale_FormatType_format=None):
        """ QLocale.standaloneMonthName(int, QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    def system(self):  # real signature unknown; restored from __doc__
        """ QLocale.system() -> QLocale """
        return QLocale

    def textDirection(self):  # real signature unknown; restored from __doc__
        """ QLocale.textDirection() -> Qt.LayoutDirection """
        pass

    # real signature unknown; restored from __doc__
    def timeFormat(self, QLocale_FormatType_format=None):
        """ QLocale.timeFormat(QLocale.FormatType format=QLocale.LongFormat) -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def toDate(self, QString, *__args):
        """
        QLocale.toDate(QString, QLocale.FormatType format=QLocale.LongFormat) -> QDate
        QLocale.toDate(QString, QString) -> QDate
        """
        return QDate

    # real signature unknown; restored from __doc__ with multiple overloads
    def toDateTime(self, QString, *__args):
        """
        QLocale.toDateTime(QString, QLocale.FormatType format=QLocale.LongFormat) -> QDateTime
        QLocale.toDateTime(QString, QString) -> QDateTime
        """
        return QDateTime

    # real signature unknown; restored from __doc__
    def toDouble(self, QString):
        """ QLocale.toDouble(QString) -> (float, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toFloat(self, QString):
        """ QLocale.toFloat(QString) -> (float, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toInt(self, QString, int_base=0):
        """ QLocale.toInt(QString, int base=0) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toLongLong(self, QString, int_base=0):
        """ QLocale.toLongLong(QString, int base=0) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toShort(self, QString, int_base=0):
        """ QLocale.toShort(QString, int base=0) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def toString(self, *__args):
        """
        QLocale.toString(int) -> QString
        QLocale.toString(float, str format='g', int precision=6) -> QString
        QLocale.toString(int) -> QString
        QLocale.toString(int) -> QString
        QLocale.toString(QDateTime, QString) -> QString
        QLocale.toString(QDateTime, QLocale.FormatType format=QLocale.LongFormat) -> QString
        QLocale.toString(QDate, QString) -> QString
        QLocale.toString(QDate, QLocale.FormatType format=QLocale.LongFormat) -> QString
        QLocale.toString(QTime, QString) -> QString
        QLocale.toString(QTime, QLocale.FormatType format=QLocale.LongFormat) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def toTime(self, QString, *__args):
        """
        QLocale.toTime(QString, QLocale.FormatType format=QLocale.LongFormat) -> QTime
        QLocale.toTime(QString, QString) -> QTime
        """
        return QTime

    # real signature unknown; restored from __doc__
    def toUInt(self, QString, int_base=0):
        """ QLocale.toUInt(QString, int base=0) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toULongLong(self, QString, int_base=0):
        """ QLocale.toULongLong(QString, int base=0) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toUShort(self, QString, int_base=0):
        """ QLocale.toUShort(QString, int base=0) -> (int, bool) """
        pass

    def zeroDigit(self):  # real signature unknown; restored from __doc__
        """ QLocale.zeroDigit() -> QChar """
        return QChar

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

    Abkhazian = 2
    Afan = 3
    Afar = 4
    Afghanistan = 1
    Afrikaans = 5
    Akan = 146
    Albania = 2
    Albanian = 6
    Algeria = 3
    AmericanSamoa = 4
    Amharic = 7
    Andorra = 5
    Angola = 6
    Anguilla = 7
    Antarctica = 8
    AntiguaAndBarbuda = 9
    AnyCountry = 0
    Arabic = 8
    Argentina = 10
    Armenia = 11
    Armenian = 9
    Aruba = 12
    Assamese = 10
    Asu = 205
    Atsam = 156
    Australia = 13
    Austria = 14
    Aymara = 11
    Azerbaijan = 15
    Azerbaijani = 12
    Bahamas = 16
    Bahrain = 17
    Bambara = 188
    Bangladesh = 18
    Barbados = 19
    Bashkir = 13
    Basque = 14
    Belarus = 20
    Belgium = 21
    Belize = 22
    Bemba = 195
    Bena = 186
    Bengali = 15
    Benin = 23
    Bermuda = 24
    Bhutan = 25
    Bhutani = 16
    Bihari = 17
    Bislama = 18
    Blin = 152
    Bolivia = 26
    BosniaAndHerzegowina = 27
    Bosnian = 142
    Botswana = 28
    BouvetIsland = 29
    Brazil = 30
    Breton = 19
    BritishIndianOceanTerritory = 31
    BritishVirginIslands = 233
    BruneiDarussalam = 32
    Bulgaria = 33
    Bulgarian = 20
    BurkinaFaso = 34
    Burmese = 21
    Burundi = 35
    Byelorussian = 22
    C = 1
    Cambodia = 36
    Cambodian = 23
    Cameroon = 37
    Canada = 38
    CapeVerde = 39
    Catalan = 24
    CaymanIslands = 40
    CentralAfricanRepublic = 41
    CentralMoroccoTamazight = 212
    Chad = 42
    Cherokee = 190
    Chewa = 165
    Chiga = 211
    Chile = 43
    China = 44
    Chinese = 25
    ChristmasIsland = 45
    CocosIslands = 46
    Colognian = 201
    Colombia = 47
    Comoros = 48
    CookIslands = 51
    Cornish = 145
    Corsican = 26
    CostaRica = 52
    Croatia = 54
    Croatian = 27
    Cuba = 55
    Cyprus = 56
    Czech = 28
    CzechRepublic = 57
    Danish = 29
    DemocraticRepublicOfCongo = 49
    DemocraticRepublicOfKorea = 113
    Denmark = 58
    Divehi = 143
    Djibouti = 59
    Dominica = 60
    DominicanRepublic = 61
    Dutch = 30
    EastTimor = 62
    Ecuador = 63
    Egypt = 64
    ElSalvador = 65
    Embu = 189
    English = 31
    EquatorialGuinea = 66
    Eritrea = 67
    Esperanto = 32
    Estonia = 68
    Estonian = 33
    Ethiopia = 69
    Ewe = 161
    FalklandIslands = 70
    FaroeIslands = 71
    Faroese = 34
    FijiCountry = 72
    FijiLanguage = 35
    Filipino = 166
    Finland = 73
    Finnish = 36
    France = 74
    French = 37
    FrenchGuiana = 76
    FrenchPolynesia = 77
    FrenchSouthernTerritories = 78
    Frisian = 38
    Friulian = 159
    Fulah = 177
    Ga = 148
    Gabon = 79
    Gaelic = 39
    Galician = 40
    Gambia = 80
    Ganda = 194
    Geez = 153
    Georgia = 81
    Georgian = 41
    German = 42
    Germany = 82
    Ghana = 83
    Gibraltar = 84
    Greece = 85
    Greek = 43
    Greenland = 86
    Greenlandic = 44
    Grenada = 87
    Guadeloupe = 88
    Guam = 89
    Guarani = 45
    Guatemala = 90
    Guinea = 91
    GuineaBissau = 92
    Gujarati = 46
    Gusii = 175
    Guyana = 93
    Haiti = 94
    Hausa = 47
    Hawaiian = 163
    HeardAndMcDonaldIslands = 95
    Hebrew = 48
    Hindi = 49
    Honduras = 96
    HongKong = 97
    Hungarian = 50
    Hungary = 98
    Iceland = 99
    Icelandic = 51
    Igbo = 149
    ImperialSystem = 1
    India = 100
    Indonesia = 101
    Indonesian = 52
    Interlingua = 53
    Interlingue = 54
    Inuktitut = 55
    Inupiak = 56
    Iran = 102
    Iraq = 103
    Ireland = 104
    Irish = 57
    Israel = 105
    Italian = 58
    Italy = 106
    IvoryCoast = 53
    Jamaica = 107
    Japan = 108
    Japanese = 59
    Javanese = 60
    Jju = 158
    Jordan = 109
    Kabuverdianu = 196
    Kabyle = 184
    Kalenjin = 198
    Kamba = 150
    Kannada = 61
    Kashmiri = 62
    Kazakh = 63
    Kazakhstan = 110
    Kenya = 111
    Kikuyu = 178
    Kinyarwanda = 64
    Kirghiz = 65
    Kiribati = 112
    Konkani = 147
    Korean = 66
    Koro = 154
    KoyraboroSenni = 213
    KoyraChiini = 208
    Kpelle = 169
    Kurdish = 67
    Kurundi = 68
    Kuwait = 115
    Kyrgyzstan = 116
    Langi = 193
    Lao = 117
    Laothian = 69
    LastCountry = 246
    LastLanguage = 214
    Latin = 70
    LatinAmericaAndTheCaribbean = 246
    Latvia = 118
    Latvian = 71
    Lebanon = 119
    Lesotho = 120
    Liberia = 121
    LibyanArabJamahiriya = 122
    Liechtenstein = 123
    Lingala = 72
    Lithuania = 124
    Lithuanian = 73
    LongFormat = 0
    LowGerman = 170
    Luo = 210
    Luxembourg = 125
    Luyia = 204
    Macau = 126
    Macedonia = 127
    Macedonian = 74
    Machame = 200
    Madagascar = 128
    Makonde = 192
    Malagasy = 75
    Malawi = 129
    Malay = 76
    Malayalam = 77
    Malaysia = 130
    Maldives = 131
    Mali = 132
    Malta = 133
    Maltese = 78
    Manx = 144
    Maori = 79
    Marathi = 80
    MarshallIslands = 134
    Martinique = 135
    Masai = 202
    Mauritania = 136
    Mauritius = 137
    Mayotte = 138
    Meru = 197
    MetricSystem = 0
    MetropolitanFrance = 75
    Mexico = 139
    Micronesia = 140
    Moldavian = 81
    Moldova = 141
    Monaco = 142
    Mongolia = 143
    Mongolian = 82
    Montenegro = 242
    Montserrat = 144
    Morisyen = 191
    Morocco = 145
    Mozambique = 146
    Myanmar = 147
    Nama = 199
    Namibia = 148
    NarrowFormat = 2
    NauruCountry = 149
    NauruLanguage = 83
    Nepal = 150
    Nepali = 84
    Netherlands = 151
    NetherlandsAntilles = 152
    NewCaledonia = 153
    NewZealand = 154
    Nicaragua = 155
    Niger = 156
    Nigeria = 157
    Niue = 158
    NorfolkIsland = 159
    NorthernMarianaIslands = 160
    NorthernSami = 173
    NorthernSotho = 172
    NorthNdebele = 181
    Norway = 161
    Norwegian = 85
    NorwegianBokmal = 85
    NorwegianNynorsk = 141
    Nyankole = 185
    Nynorsk = 141
    Occitan = 86
    Oman = 162
    OmitGroupSeparator = 1
    Oriya = 87
    Pakistan = 163
    Palau = 164
    PalestinianTerritory = 165
    Panama = 166
    PapuaNewGuinea = 167
    Paraguay = 168
    Pashto = 88
    PeoplesRepublicOfCongo = 50
    Persian = 89
    Peru = 169
    Philippines = 170
    Pitcairn = 171
    Poland = 172
    Polish = 90
    Portugal = 173
    Portuguese = 91
    PuertoRico = 174
    Punjabi = 92
    Qatar = 175
    Quechua = 93
    RejectGroupSeparator = 2
    RepublicOfKorea = 114
    Reunion = 176
    RhaetoRomance = 94
    Romania = 177
    Romanian = 95
    Rombo = 182
    Russian = 96
    RussianFederation = 178
    Rwa = 209
    Rwanda = 179
    Saho = 207
    SaintBarthelemy = 244
    SaintKittsAndNevis = 180
    SaintMartin = 245
    Samburu = 179
    Samoa = 183
    Samoan = 97
    Sangho = 98
    SanMarino = 184
    Sanskrit = 99
    SaoTomeAndPrincipe = 185
    SaudiArabia = 186
    Sena = 180
    Senegal = 187
    Serbia = 243
    SerbiaAndMontenegro = 241
    Serbian = 100
    SerboCroatian = 101
    Sesotho = 102
    Setswana = 103
    Seychelles = 188
    Shambala = 214
    Shona = 104
    ShortFormat = 1
    SichuanYi = 168
    Sidamo = 155
    SierraLeone = 189
    Sindhi = 105
    Singapore = 190
    Singhalese = 106
    Siswati = 107
    Slovak = 108
    Slovakia = 191
    Slovenia = 192
    Slovenian = 109
    Soga = 203
    SolomonIslands = 193
    Somali = 110
    Somalia = 194
    SouthAfrica = 195
    SouthGeorgiaAndTheSouthSandwichIslands = 196
    SouthNdebele = 171
    Spain = 197
    Spanish = 111
    SriLanka = 198
    StHelena = 199
    StLucia = 181
    StPierreAndMiquelon = 200
    StVincentAndTheGrenadines = 182
    Sudan = 201
    Sundanese = 112
    Suriname = 202
    SvalbardAndJanMayenIslands = 203
    Swahili = 113
    Swaziland = 204
    Sweden = 205
    Swedish = 114
    SwissGerman = 167
    Switzerland = 206
    Syriac = 151
    SyrianArabRepublic = 207
    Tachelhit = 183
    Tagalog = 115
    Taita = 176
    Taiwan = 208
    Tajik = 116
    Tajikistan = 209
    Tamil = 117
    Tanzania = 210
    Taroko = 174
    Tatar = 118
    Telugu = 119
    Teso = 206
    Thai = 120
    Thailand = 211
    Tibetan = 121
    Tigre = 157
    Tigrinya = 122
    Togo = 212
    Tokelau = 213
    TongaCountry = 214
    TongaLanguage = 123
    TrinidadAndTobago = 215
    Tsonga = 124
    Tunisia = 216
    Turkey = 217
    Turkish = 125
    Turkmen = 126
    Turkmenistan = 218
    TurksAndCaicosIslands = 219
    Tuvalu = 220
    Twi = 127
    Tyap = 164
    Uganda = 221
    Uigur = 128
    Ukraine = 222
    Ukrainian = 129
    UnitedArabEmirates = 223
    UnitedKingdom = 224
    UnitedStates = 225
    UnitedStatesMinorOutlyingIslands = 226
    Urdu = 130
    Uruguay = 227
    USVirginIslands = 234
    Uzbek = 131
    Uzbekistan = 228
    Vanuatu = 229
    VaticanCityState = 230
    Venda = 160
    Venezuela = 231
    VietNam = 232
    Vietnamese = 132
    Volapuk = 133
    Vunjo = 187
    Walamo = 162
    WallisAndFutunaIslands = 235
    Welsh = 134
    WesternSahara = 236
    Wolof = 135
    Xhosa = 136
    Yemen = 237
    Yiddish = 137
    Yoruba = 138
    Yugoslavia = 238
    Zambia = 239
    Zhuang = 139
    Zimbabwe = 240
    Zulu = 140


class QMargins():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMargins()
    QMargins(int, int, int, int)
    QMargins(QMargins)
    """

    def bottom(self):  # real signature unknown; restored from __doc__
        """ QMargins.bottom() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QMargins.isNull() -> bool """
        return False

    def left(self):  # real signature unknown; restored from __doc__
        """ QMargins.left() -> int """
        return 0

    def right(self):  # real signature unknown; restored from __doc__
        """ QMargins.right() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setBottom(self, p_int):
        """ QMargins.setBottom(int) """
        pass

    def setLeft(self, p_int):  # real signature unknown; restored from __doc__
        """ QMargins.setLeft(int) """
        pass

    def setRight(self, p_int):  # real signature unknown; restored from __doc__
        """ QMargins.setRight(int) """
        pass

    def setTop(self, p_int):  # real signature unknown; restored from __doc__
        """ QMargins.setTop(int) """
        pass

    def top(self):  # real signature unknown; restored from __doc__
        """ QMargins.top() -> int """
        return 0

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


class QMetaClassInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaClassInfo()
    QMetaClassInfo(QMetaClassInfo)
    """

    def name(self):  # real signature unknown; restored from __doc__
        """ QMetaClassInfo.name() -> str """
        return ""

    def value(self):  # real signature unknown; restored from __doc__
        """ QMetaClassInfo.value() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaClassInfo=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QMetaEnum():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaEnum()
    QMetaEnum(QMetaEnum)
    """

    def isFlag(self):  # real signature unknown; restored from __doc__
        """ QMetaEnum.isFlag() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QMetaEnum.isValid() -> bool """
        return False

    def key(self, p_int):  # real signature unknown; restored from __doc__
        """ QMetaEnum.key(int) -> str """
        return ""

    def keyCount(self):  # real signature unknown; restored from __doc__
        """ QMetaEnum.keyCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def keysToValue(self, p_str):
        """ QMetaEnum.keysToValue(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def keyToValue(self, p_str):
        """ QMetaEnum.keyToValue(str) -> int """
        return 0

    def name(self):  # real signature unknown; restored from __doc__
        """ QMetaEnum.name() -> str """
        return ""

    def scope(self):  # real signature unknown; restored from __doc__
        """ QMetaEnum.scope() -> str """
        return ""

    def value(self, p_int):  # real signature unknown; restored from __doc__
        """ QMetaEnum.value(int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def valueToKey(self, p_int):
        """ QMetaEnum.valueToKey(int) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def valueToKeys(self, p_int):
        """ QMetaEnum.valueToKeys(int) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaEnum=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QMetaMethod():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaMethod()
    QMetaMethod(QMetaMethod)
    """

    def access(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.access() -> QMetaMethod.Access """
        pass

    def Access(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def invoke(self, QObject, *__args):
        """
        QMetaMethod.invoke(QObject, Qt.ConnectionType, QGenericReturnArgument, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaMethod.invoke(QObject, QGenericReturnArgument, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaMethod.invoke(QObject, Qt.ConnectionType, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaMethod.invoke(QObject, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        """
        pass

    def methodIndex(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.methodIndex() -> int """
        return 0

    def MethodType(self, *args, **kwargs):  # real signature unknown
        pass

    def methodType(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.methodType() -> QMetaMethod.MethodType """
        pass

    def parameterNames(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.parameterNames() -> list-of-QByteArray """
        pass

    def parameterTypes(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.parameterTypes() -> list-of-QByteArray """
        pass

    def signature(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.signature() -> str """
        return ""

    def tag(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.tag() -> str """
        return ""

    def typeName(self):  # real signature unknown; restored from __doc__
        """ QMetaMethod.typeName() -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaMethod=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    Constructor = 3
    Method = 0
    Private = 0
    Protected = 1
    Public = 2
    Signal = 1
    Slot = 2


class QMetaObject():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaObject()
    QMetaObject(QMetaObject)
    """
    # real signature unknown; restored from __doc__

    def checkConnectArgs(self, p_str, p_str_1):
        """ QMetaObject.checkConnectArgs(str, str) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def classInfo(self, p_int):
        """ QMetaObject.classInfo(int) -> QMetaClassInfo """
        return QMetaClassInfo

    def classInfoCount(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.classInfoCount() -> int """
        return 0

    def classInfoOffset(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.classInfoOffset() -> int """
        return 0

    def className(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.className() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def connectSlotsByName(self, QObject):
        """ QMetaObject.connectSlotsByName(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def constructor(self, p_int):
        """ QMetaObject.constructor(int) -> QMetaMethod """
        return QMetaMethod

    # real signature unknown; restored from __doc__
    def constructorCount(self):
        """ QMetaObject.constructorCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def enumerator(self, p_int):
        """ QMetaObject.enumerator(int) -> QMetaEnum """
        return QMetaEnum

    def enumeratorCount(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.enumeratorCount() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def enumeratorOffset(self):
        """ QMetaObject.enumeratorOffset() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfClassInfo(self, p_str):
        """ QMetaObject.indexOfClassInfo(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfConstructor(self, p_str):
        """ QMetaObject.indexOfConstructor(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfEnumerator(self, p_str):
        """ QMetaObject.indexOfEnumerator(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfMethod(self, p_str):
        """ QMetaObject.indexOfMethod(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfProperty(self, p_str):
        """ QMetaObject.indexOfProperty(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfSignal(self, p_str):
        """ QMetaObject.indexOfSignal(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indexOfSlot(self, p_str):
        """ QMetaObject.indexOfSlot(str) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def invokeMethod(self, QObject, p_str, *__args):
        """
        QMetaObject.invokeMethod(QObject, str, Qt.ConnectionType, QGenericReturnArgument, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaObject.invokeMethod(QObject, str, QGenericReturnArgument, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaObject.invokeMethod(QObject, str, Qt.ConnectionType, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        QMetaObject.invokeMethod(QObject, str, QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> object
        """
        pass

    def method(self, p_int):  # real signature unknown; restored from __doc__
        """ QMetaObject.method(int) -> QMetaMethod """
        return QMetaMethod

    def methodCount(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.methodCount() -> int """
        return 0

    def methodOffset(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.methodOffset() -> int """
        return 0

    # real signature unknown; NOTE: unreliably restored from __doc__
    def newInstance(self, QGenericArgument_value0=None, *args, **kwargs):
        """ QMetaObject.newInstance(QGenericArgument value0=QGenericArgument(0,0), QGenericArgument value1=QGenericArgument(0,0), QGenericArgument value2=QGenericArgument(0,0), QGenericArgument value3=QGenericArgument(0,0), QGenericArgument value4=QGenericArgument(0,0), QGenericArgument value5=QGenericArgument(0,0), QGenericArgument value6=QGenericArgument(0,0), QGenericArgument value7=QGenericArgument(0,0), QGenericArgument value8=QGenericArgument(0,0), QGenericArgument value9=QGenericArgument(0,0)) -> QObject """
        pass

    # real signature unknown; restored from __doc__
    def normalizedSignature(self, p_str):
        """ QMetaObject.normalizedSignature(str) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def normalizedType(self, p_str):
        """ QMetaObject.normalizedType(str) -> QByteArray """
        return QByteArray

    def property(self, p_int):  # real signature unknown; restored from __doc__
        """ QMetaObject.property(int) -> QMetaProperty """
        return QMetaProperty

    def propertyCount(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.propertyCount() -> int """
        return 0

    def propertyOffset(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.propertyOffset() -> int """
        return 0

    def superClass(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.superClass() -> QMetaObject """
        return QMetaObject

    def userProperty(self):  # real signature unknown; restored from __doc__
        """ QMetaObject.userProperty() -> QMetaProperty """
        return QMetaProperty

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaObject=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QMetaProperty():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaProperty()
    QMetaProperty(QMetaProperty)
    """

    def enumerator(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.enumerator() -> QMetaEnum """
        return QMetaEnum

    def hasNotifySignal(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.hasNotifySignal() -> bool """
        return False

    def hasStdCppSet(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.hasStdCppSet() -> bool """
        return False

    def isConstant(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isConstant() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isDesignable(self, QObject_object=None):
        """ QMetaProperty.isDesignable(QObject object=None) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isEditable(self, QObject_object=None):
        """ QMetaProperty.isEditable(QObject object=None) -> bool """
        return False

    def isEnumType(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isEnumType() -> bool """
        return False

    def isFinal(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isFinal() -> bool """
        return False

    def isFlagType(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isFlagType() -> bool """
        return False

    def isReadable(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isReadable() -> bool """
        return False

    def isResettable(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isResettable() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isScriptable(self, QObject_object=None):
        """ QMetaProperty.isScriptable(QObject object=None) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isStored(self, QObject_object=None):
        """ QMetaProperty.isStored(QObject object=None) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isUser(self, QObject_object=None):
        """ QMetaProperty.isUser(QObject object=None) -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isValid() -> bool """
        return False

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.isWritable() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.name() -> str """
        return ""

    def notifySignal(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.notifySignal() -> QMetaMethod """
        return QMetaMethod

    # real signature unknown; restored from __doc__
    def notifySignalIndex(self):
        """ QMetaProperty.notifySignalIndex() -> int """
        return 0

    def propertyIndex(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.propertyIndex() -> int """
        return 0

    def read(self, QObject):  # real signature unknown; restored from __doc__
        """ QMetaProperty.read(QObject) -> QVariant """
        return QVariant

    def reset(self, QObject):  # real signature unknown; restored from __doc__
        """ QMetaProperty.reset(QObject) -> bool """
        return False

    def type(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.type() -> Type """
        pass

    def typeName(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.typeName() -> str """
        return ""

    def userType(self):  # real signature unknown; restored from __doc__
        """ QMetaProperty.userType() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def write(self, QObject, QVariant):
        """ QMetaProperty.write(QObject, QVariant) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaProperty=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QMetaType():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QMetaType()
    QMetaType(QMetaType)
    """
    # real signature unknown; restored from __doc__

    def isRegistered(self, p_int):
        """ QMetaType.isRegistered(int) -> bool """
        return False

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self, p_str):  # real signature unknown; restored from __doc__
        """ QMetaType.type(str) -> int """
        return 0

    def typeName(self, p_int):  # real signature unknown; restored from __doc__
        """ QMetaType.typeName(int) -> str """
        return ""

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QMetaType=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    Bool = 1
    Char = 131
    Double = 6
    FirstGuiType = 63
    Float = 135
    Int = 2
    LastCoreType = 29
    Long = 129
    LongLong = 4
    QBitArray = 13
    QBitmap = 73
    QBrush = 66
    QByteArray = 12
    QChar = 7
    QColor = 67
    QCursor = 74
    QDate = 14
    QDateTime = 16
    QEasingCurve = 29
    QFont = 64
    QIcon = 69
    QImage = 70
    QKeySequence = 76
    QLine = 23
    QLineF = 24
    QLocale = 18
    QMatrix = 80
    QMatrix4x4 = 82
    QObjectStar = 136
    QPalette = 68
    QPen = 77
    QPixmap = 65
    QPoint = 25
    QPointF = 26
    QPolygon = 71
    QQuaternion = 86
    QRect = 19
    QRectF = 20
    QRegExp = 27
    QRegion = 72
    QSize = 21
    QSizeF = 22
    QSizePolicy = 75
    QString = 10
    QStringList = 11
    QTextFormat = 79
    QTextLength = 78
    QTime = 15
    QTransform = 81
    QUrl = 17
    QVariant = 138
    QVariantHash = 28
    QVariantList = 9
    QVariantMap = 8
    QVector2D = 83
    QVector3D = 84
    QVector4D = 85
    QWidgetStar = 137
    Short = 130
    UChar = 134
    UInt = 3
    ULong = 132
    ULongLong = 5
    User = 256
    UShort = 133
    Void = 0
    VoidStar = 128


class QMimeData(QObject):

    """ QMimeData() """

    def clear(self):  # real signature unknown; restored from __doc__
        """ QMimeData.clear() """
        pass

    def colorData(self):  # real signature unknown; restored from __doc__
        """ QMimeData.colorData() -> QVariant """
        return QVariant

    def data(self, QString):  # real signature unknown; restored from __doc__
        """ QMimeData.data(QString) -> QByteArray """
        return QByteArray

    def formats(self):  # real signature unknown; restored from __doc__
        """ QMimeData.formats() -> QStringList """
        return QStringList

    def hasColor(self):  # real signature unknown; restored from __doc__
        """ QMimeData.hasColor() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hasFormat(self, QString):
        """ QMimeData.hasFormat(QString) -> bool """
        return False

    def hasHtml(self):  # real signature unknown; restored from __doc__
        """ QMimeData.hasHtml() -> bool """
        return False

    def hasImage(self):  # real signature unknown; restored from __doc__
        """ QMimeData.hasImage() -> bool """
        return False

    def hasText(self):  # real signature unknown; restored from __doc__
        """ QMimeData.hasText() -> bool """
        return False

    def hasUrls(self):  # real signature unknown; restored from __doc__
        """ QMimeData.hasUrls() -> bool """
        return False

    def html(self):  # real signature unknown; restored from __doc__
        """ QMimeData.html() -> QString """
        return QString

    def imageData(self):  # real signature unknown; restored from __doc__
        """ QMimeData.imageData() -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def removeFormat(self, QString):
        """ QMimeData.removeFormat(QString) """
        pass

    # real signature unknown; restored from __doc__
    def retrieveData(self, QString, Type):
        """ QMimeData.retrieveData(QString, Type) -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def setColorData(self, QVariant):
        """ QMimeData.setColorData(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setData(self, QString, QByteArray):
        """ QMimeData.setData(QString, QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setHtml(self, QString):
        """ QMimeData.setHtml(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setImageData(self, QVariant):
        """ QMimeData.setImageData(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setText(self, QString):
        """ QMimeData.setText(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setUrls(self, list_of_QUrl):
        """ QMimeData.setUrls(list-of-QUrl) """
        pass

    def text(self):  # real signature unknown; restored from __doc__
        """ QMimeData.text() -> QString """
        return QString

    def urls(self):  # real signature unknown; restored from __doc__
        """ QMimeData.urls() -> list-of-QUrl """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass


class QModelIndex():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QModelIndex()
    QModelIndex(QModelIndex)
    QModelIndex(QPersistentModelIndex)
    """
    # real signature unknown; restored from __doc__

    def child(self, p_int, p_int_1):
        """ QModelIndex.child(int, int) -> QModelIndex """
        return QModelIndex

    def column(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.column() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def data(self, int_role=None):
        """ QModelIndex.data(int role=Qt.DisplayRole) -> QVariant """
        return QVariant

    def flags(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.flags() -> Qt.ItemFlags """
        pass

    def internalId(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.internalId() -> int """
        return 0

    def internalPointer(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.internalPointer() -> object """
        return object()

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.isValid() -> bool """
        return False

    def model(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.model() -> QAbstractItemModel """
        return QAbstractItemModel

    def parent(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.parent() -> QModelIndex """
        return QModelIndex

    def row(self):  # real signature unknown; restored from __doc__
        """ QModelIndex.row() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def sibling(self, p_int, p_int_1):
        """ QModelIndex.sibling(int, int) -> QModelIndex """
        return QModelIndex

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


class QMutex():  # skipped bases: <type 'sip.simplewrapper'>

    """ QMutex(QMutex.RecursionMode mode=QMutex.NonRecursive) """

    def lock(self):  # real signature unknown; restored from __doc__
        """ QMutex.lock() """
        pass

    def RecursionMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def tryLock(self, p_int=None):
        """
        QMutex.tryLock() -> bool
        QMutex.tryLock(int) -> bool
        """
        return False

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QMutex.unlock() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QMutex_RecursionMode_mode=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    NonRecursive = 0
    Recursive = 1


class QMutexLocker():  # skipped bases: <type 'sip.simplewrapper'>

    """ QMutexLocker(QMutex) """

    def mutex(self):  # real signature unknown; restored from __doc__
        """ QMutexLocker.mutex() -> QMutex """
        return QMutex

    def relock(self):  # real signature unknown; restored from __doc__
        """ QMutexLocker.relock() """
        pass

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QMutexLocker.unlock() """
        pass

    def __enter__(self):  # real signature unknown; restored from __doc__
        """ QMutexLocker.__enter__() -> object """
        return object()

    # real signature unknown; restored from __doc__
    def __exit__(self, p_object, p_object_1, p_object_2):
        """ QMutexLocker.__exit__(object, object, object) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QMutex):
        pass

    __weakref__ = property(lambda self: object())  # default


class QObjectCleanupHandler(QObject):

    """ QObjectCleanupHandler() """

    def add(self, QObject):  # real signature unknown; restored from __doc__
        """ QObjectCleanupHandler.add(QObject) -> QObject """
        return QObject

    def clear(self):  # real signature unknown; restored from __doc__
        """ QObjectCleanupHandler.clear() """
        pass

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QObjectCleanupHandler.isEmpty() -> bool """
        return False

    def remove(self, QObject):  # real signature unknown; restored from __doc__
        """ QObjectCleanupHandler.remove(QObject) """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass


class QParallelAnimationGroup(QAnimationGroup):

    """ QParallelAnimationGroup(QObject parent=None) """

    def duration(self):  # real signature unknown; restored from __doc__
        """ QParallelAnimationGroup.duration() -> int """
        return 0

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QParallelAnimationGroup.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def updateCurrentTime(self, p_int):
        """ QParallelAnimationGroup.updateCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateDirection(self, QAbstractAnimation_Direction):
        """ QParallelAnimationGroup.updateDirection(QAbstractAnimation.Direction) """
        pass

    # real signature unknown; restored from __doc__
    def updateState(self, QAbstractAnimation_State, QAbstractAnimation_State_1):
        """ QParallelAnimationGroup.updateState(QAbstractAnimation.State, QAbstractAnimation.State) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QPauseAnimation(QAbstractAnimation):

    """
    QPauseAnimation(QObject parent=None)
    QPauseAnimation(int, QObject parent=None)
    """

    def duration(self):  # real signature unknown; restored from __doc__
        """ QPauseAnimation.duration() -> int """
        return 0

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QPauseAnimation.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setDuration(self, p_int):
        """ QPauseAnimation.setDuration(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateCurrentTime(self, p_int):
        """ QPauseAnimation.updateCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QPersistentModelIndex():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QPersistentModelIndex()
    QPersistentModelIndex(QModelIndex)
    QPersistentModelIndex(QPersistentModelIndex)
    """
    # real signature unknown; restored from __doc__

    def child(self, p_int, p_int_1):
        """ QPersistentModelIndex.child(int, int) -> QModelIndex """
        return QModelIndex

    def column(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.column() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def data(self, int_role=None):
        """ QPersistentModelIndex.data(int role=Qt.DisplayRole) -> QVariant """
        return QVariant

    def flags(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.flags() -> Qt.ItemFlags """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.isValid() -> bool """
        return False

    def model(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.model() -> QAbstractItemModel """
        return QAbstractItemModel

    def parent(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.parent() -> QModelIndex """
        return QModelIndex

    def row(self):  # real signature unknown; restored from __doc__
        """ QPersistentModelIndex.row() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def sibling(self, p_int, p_int_1):
        """ QPersistentModelIndex.sibling(int, int) -> QModelIndex """
        return QModelIndex

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


class QPluginLoader(QObject):

    """
    QPluginLoader(QObject parent=None)
    QPluginLoader(QString, QObject parent=None)
    """

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.errorString() -> QString """
        return QString

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.fileName() -> QString """
        return QString

    def instance(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.instance() -> QObject """
        return QObject

    def isLoaded(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.isLoaded() -> bool """
        return False

    def load(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.load() -> bool """
        return False

    def loadHints(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.loadHints() -> QLibrary.LoadHints """
        pass

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QPluginLoader.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setLoadHints(self, QLibrary_LoadHints):
        """ QPluginLoader.setLoadHints(QLibrary.LoadHints) """
        pass

    def staticInstances(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.staticInstances() -> list-of-QObject """
        pass

    def unload(self):  # real signature unknown; restored from __doc__
        """ QPluginLoader.unload() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QPoint():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QPoint()
    QPoint(int, int)
    QPoint(QPoint)
    """

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QPoint.isNull() -> bool """
        return False

    def manhattanLength(self):  # real signature unknown; restored from __doc__
        """ QPoint.manhattanLength() -> int """
        return 0

    def setX(self, p_int):  # real signature unknown; restored from __doc__
        """ QPoint.setX(int) """
        pass

    def setY(self, p_int):  # real signature unknown; restored from __doc__
        """ QPoint.setY(int) """
        pass

    def x(self):  # real signature unknown; restored from __doc__
        """ QPoint.x() -> int """
        return 0

    def y(self):  # real signature unknown; restored from __doc__
        """ QPoint.y() -> int """
        return 0

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __div__(self, y):  # real signature unknown; restored from __doc__
        """ x.__div__(y) <==> x/y """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+y """
        pass

    def __idiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__idiv__(y) <==> x/y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __isub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__isub__(y) <==> x-y """
        pass

    def __itruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__itruediv__(y) <==> x/y """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mul__(y) <==> x*y """
        pass

    def __neg__(self):  # real signature unknown; restored from __doc__
        """ x.__neg__() <==> -x """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __rdiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdiv__(y) <==> y/x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmul__(y) <==> y*x """
        pass

    def __rsub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rsub__(y) <==> y-x """
        pass

    def __rtruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rtruediv__(y) <==> y/x """
        pass

    def __sub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__sub__(y) <==> x-y """
        pass

    def __truediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__truediv__(y) <==> x/y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QPointF():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QPointF()
    QPointF(float, float)
    QPointF(QPoint)
    QPointF(QPointF)
    """

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QPointF.isNull() -> bool """
        return False

    def manhattanLength(self):  # real signature unknown; restored from __doc__
        """ QPointF.manhattanLength() -> float """
        return 0.0

    def setX(self, p_float):  # real signature unknown; restored from __doc__
        """ QPointF.setX(float) """
        pass

    def setY(self, p_float):  # real signature unknown; restored from __doc__
        """ QPointF.setY(float) """
        pass

    def toPoint(self):  # real signature unknown; restored from __doc__
        """ QPointF.toPoint() -> QPoint """
        return QPoint

    def x(self):  # real signature unknown; restored from __doc__
        """ QPointF.x() -> float """
        return 0.0

    def y(self):  # real signature unknown; restored from __doc__
        """ QPointF.y() -> float """
        return 0.0

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __div__(self, y):  # real signature unknown; restored from __doc__
        """ x.__div__(y) <==> x/y """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+y """
        pass

    def __idiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__idiv__(y) <==> x/y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __isub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__isub__(y) <==> x-y """
        pass

    def __itruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__itruediv__(y) <==> x/y """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mul__(y) <==> x*y """
        pass

    def __neg__(self):  # real signature unknown; restored from __doc__
        """ x.__neg__() <==> -x """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __rdiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdiv__(y) <==> y/x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmul__(y) <==> y*x """
        pass

    def __rsub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rsub__(y) <==> y-x """
        pass

    def __rtruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rtruediv__(y) <==> y/x """
        pass

    def __sub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__sub__(y) <==> x-y """
        pass

    def __truediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__truediv__(y) <==> x/y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QProcess(QIODevice):

    """ QProcess(QObject parent=None) """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QProcess.atEnd() -> bool """
        return False

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QProcess.bytesAvailable() -> int """
        return 0

    def bytesToWrite(self):  # real signature unknown; restored from __doc__
        """ QProcess.bytesToWrite() -> int """
        return 0

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QProcess.canReadLine() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QProcess.close() """
        pass

    # real signature unknown; restored from __doc__
    def closeReadChannel(self, QProcess_ProcessChannel):
        """ QProcess.closeReadChannel(QProcess.ProcessChannel) """
        pass

    # real signature unknown; restored from __doc__
    def closeWriteChannel(self):
        """ QProcess.closeWriteChannel() """
        pass

    def environment(self):  # real signature unknown; restored from __doc__
        """ QProcess.environment() -> QStringList """
        return QStringList

    def error(self):  # real signature unknown; restored from __doc__
        """
        QProcess.error() -> QProcess.ProcessError
        QProcess.error[QProcess.ProcessError] [signal]
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def execute(self, QString, QStringList=None):
        """
        QProcess.execute(QString, QStringList) -> int
        QProcess.execute(QString) -> int
        """
        return 0

    def exitCode(self):  # real signature unknown; restored from __doc__
        """ QProcess.exitCode() -> int """
        return 0

    def ExitStatus(self, *args, **kwargs):  # real signature unknown
        pass

    def exitStatus(self):  # real signature unknown; restored from __doc__
        """ QProcess.exitStatus() -> QProcess.ExitStatus """
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        """
        QProcess.finished[int, QProcess.ExitStatus] [signal]
        QProcess.finished[int] [signal]
        """
        pass

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QProcess.isSequential() -> bool """
        return False

    def kill(self):  # real signature unknown; restored from __doc__
        """ QProcess.kill() """
        pass

    def pid(self):  # real signature unknown; restored from __doc__
        """ QProcess.pid() -> int """
        return 0

    def ProcessChannel(self, *args, **kwargs):  # real signature unknown
        pass

    def ProcessChannelMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def processChannelMode(self):
        """ QProcess.processChannelMode() -> QProcess.ProcessChannelMode """
        pass

    # real signature unknown; restored from __doc__
    def processEnvironment(self):
        """ QProcess.processEnvironment() -> QProcessEnvironment """
        return QProcessEnvironment

    def ProcessError(self, *args, **kwargs):  # real signature unknown
        pass

    def ProcessState(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def readAllStandardError(self):
        """ QProcess.readAllStandardError() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def readAllStandardOutput(self):
        """ QProcess.readAllStandardOutput() -> QByteArray """
        return QByteArray

    def readChannel(self):  # real signature unknown; restored from __doc__
        """ QProcess.readChannel() -> QProcess.ProcessChannel """
        pass

    def readChannelMode(self):  # real signature unknown; restored from __doc__
        """ QProcess.readChannelMode() -> QProcess.ProcessChannelMode """
        pass

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QProcess.readData(int) -> str """
        return ""

    # real signature unknown
    def readyReadStandardError(self, *args, **kwargs):
        """ QProcess.readyReadStandardError[] [signal] """
        pass

    # real signature unknown
    def readyReadStandardOutput(self, *args, **kwargs):
        """ QProcess.readyReadStandardOutput[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setEnvironment(self, QStringList):
        """ QProcess.setEnvironment(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setProcessChannelMode(self, QProcess_ProcessChannelMode):
        """ QProcess.setProcessChannelMode(QProcess.ProcessChannelMode) """
        pass

    # real signature unknown; restored from __doc__
    def setProcessEnvironment(self, QProcessEnvironment):
        """ QProcess.setProcessEnvironment(QProcessEnvironment) """
        pass

    # real signature unknown; restored from __doc__
    def setProcessState(self, QProcess_ProcessState):
        """ QProcess.setProcessState(QProcess.ProcessState) """
        pass

    # real signature unknown; restored from __doc__
    def setReadChannel(self, QProcess_ProcessChannel):
        """ QProcess.setReadChannel(QProcess.ProcessChannel) """
        pass

    # real signature unknown; restored from __doc__
    def setReadChannelMode(self, QProcess_ProcessChannelMode):
        """ QProcess.setReadChannelMode(QProcess.ProcessChannelMode) """
        pass

    # real signature unknown; restored from __doc__
    def setStandardErrorFile(self, QString, QIODevice_OpenMode_mode=None):
        """ QProcess.setStandardErrorFile(QString, QIODevice.OpenMode mode=QIODevice.Truncate) """
        pass

    # real signature unknown; restored from __doc__
    def setStandardInputFile(self, QString):
        """ QProcess.setStandardInputFile(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setStandardOutputFile(self, QString, QIODevice_OpenMode_mode=None):
        """ QProcess.setStandardOutputFile(QString, QIODevice.OpenMode mode=QIODevice.Truncate) """
        pass

    # real signature unknown; restored from __doc__
    def setStandardOutputProcess(self, QProcess):
        """ QProcess.setStandardOutputProcess(QProcess) """
        pass

    # real signature unknown; restored from __doc__
    def setupChildProcess(self):
        """ QProcess.setupChildProcess() """
        pass

    # real signature unknown; restored from __doc__
    def setWorkingDirectory(self, QString):
        """ QProcess.setWorkingDirectory(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def start(self, QString, *__args):
        """
        QProcess.start(QString, QStringList, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        QProcess.start(QString, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def startDetached(self, QString, QStringList=None, QString_1=None):
        """
        QProcess.startDetached(QString, QStringList, QString) -> (bool, int)
        QProcess.startDetached(QString, QStringList) -> bool
        QProcess.startDetached(QString) -> bool
        """
        return False

    def started(self, *args, **kwargs):  # real signature unknown
        """ QProcess.started[] [signal] """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QProcess.state() -> QProcess.ProcessState """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QProcess.stateChanged[QProcess.ProcessState] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def systemEnvironment(self):
        """ QProcess.systemEnvironment() -> QStringList """
        return QStringList

    def terminate(self):  # real signature unknown; restored from __doc__
        """ QProcess.terminate() """
        pass

    # real signature unknown; restored from __doc__
    def waitForBytesWritten(self, int_msecs=30000):
        """ QProcess.waitForBytesWritten(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForFinished(self, int_msecs=30000):
        """ QProcess.waitForFinished(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForReadyRead(self, int_msecs=30000):
        """ QProcess.waitForReadyRead(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForStarted(self, int_msecs=30000):
        """ QProcess.waitForStarted(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def workingDirectory(self):
        """ QProcess.workingDirectory() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QProcess.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Crashed = 1
    CrashExit = 1
    FailedToStart = 0
    ForwardedChannels = 2
    MergedChannels = 1
    NormalExit = 0
    NotRunning = 0
    ReadError = 3
    Running = 2
    SeparateChannels = 0
    StandardError = 1
    StandardOutput = 0
    Starting = 1
    Timedout = 2
    UnknownError = 5
    WriteError = 4


class QProcessEnvironment():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QProcessEnvironment()
    QProcessEnvironment(QProcessEnvironment)
    """

    def clear(self):  # real signature unknown; restored from __doc__
        """ QProcessEnvironment.clear() """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QString):
        """ QProcessEnvironment.contains(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def insert(self, QString, QString_1):
        """ QProcessEnvironment.insert(QString, QString) """
        pass

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QProcessEnvironment.isEmpty() -> bool """
        return False

    def remove(self, QString):  # real signature unknown; restored from __doc__
        """ QProcessEnvironment.remove(QString) """
        pass

    # real signature unknown; restored from __doc__
    def systemEnvironment(self):
        """ QProcessEnvironment.systemEnvironment() -> QProcessEnvironment """
        return QProcessEnvironment

    def toStringList(self):  # real signature unknown; restored from __doc__
        """ QProcessEnvironment.toStringList() -> QStringList """
        return QStringList

    # real signature unknown; NOTE: unreliably restored from __doc__
    def value(self, QString, QString_defaultValue=None, *args, **kwargs):
        """ QProcessEnvironment.value(QString, QString defaultValue=QString()) -> QString """
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

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QProcessEnvironment=None):
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


class QVariantAnimation(QAbstractAnimation):

    """ QVariantAnimation(QObject parent=None) """

    def currentValue(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.currentValue() -> QVariant """
        return QVariant

    def duration(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.duration() -> int """
        return 0

    def easingCurve(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.easingCurve() -> QEasingCurve """
        return QEasingCurve

    def endValue(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.endValue() -> QVariant """
        return QVariant

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def interpolated(self, QVariant, QVariant_1, p_float):
        """ QVariantAnimation.interpolated(QVariant, QVariant, float) -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def keyValueAt(self, p_float):
        """ QVariantAnimation.keyValueAt(float) -> QVariant """
        return QVariant

    def keyValues(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.keyValues() -> list-of-tuple-of-float-QVariant """
        pass

    # real signature unknown; restored from __doc__
    def setDuration(self, p_int):
        """ QVariantAnimation.setDuration(int) """
        pass

    # real signature unknown; restored from __doc__
    def setEasingCurve(self, QEasingCurve):
        """ QVariantAnimation.setEasingCurve(QEasingCurve) """
        pass

    # real signature unknown; restored from __doc__
    def setEndValue(self, QVariant):
        """ QVariantAnimation.setEndValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setKeyValueAt(self, p_float, QVariant):
        """ QVariantAnimation.setKeyValueAt(float, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setKeyValues(self, list_of_tuple_of_float_QVariant):
        """ QVariantAnimation.setKeyValues(list-of-tuple-of-float-QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setStartValue(self, QVariant):
        """ QVariantAnimation.setStartValue(QVariant) """
        pass

    def startValue(self):  # real signature unknown; restored from __doc__
        """ QVariantAnimation.startValue() -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def updateCurrentTime(self, p_int):
        """ QVariantAnimation.updateCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateCurrentValue(self, QVariant):
        """ QVariantAnimation.updateCurrentValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def updateState(self, QAbstractAnimation_State, QAbstractAnimation_State_1):
        """ QVariantAnimation.updateState(QAbstractAnimation.State, QAbstractAnimation.State) """
        pass

    def valueChanged(self, *args, **kwargs):  # real signature unknown
        """ QVariantAnimation.valueChanged[QVariant] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QPropertyAnimation(QVariantAnimation):

    """
    QPropertyAnimation(QObject parent=None)
    QPropertyAnimation(QObject, QByteArray, QObject parent=None)
    """

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QPropertyAnimation.event(QEvent) -> bool """
        return False

    def propertyName(self):  # real signature unknown; restored from __doc__
        """ QPropertyAnimation.propertyName() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def setPropertyName(self, QByteArray):
        """ QPropertyAnimation.setPropertyName(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setTargetObject(self, QObject):
        """ QPropertyAnimation.setTargetObject(QObject) """
        pass

    def targetObject(self):  # real signature unknown; restored from __doc__
        """ QPropertyAnimation.targetObject() -> QObject """
        return QObject

    # real signature unknown; restored from __doc__
    def updateCurrentValue(self, QVariant):
        """ QPropertyAnimation.updateCurrentValue(QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def updateState(self, QAbstractAnimation_State, QAbstractAnimation_State_1):
        """ QPropertyAnimation.updateState(QAbstractAnimation.State, QAbstractAnimation.State) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QReadLocker():  # skipped bases: <type 'sip.simplewrapper'>

    """ QReadLocker(QReadWriteLock) """

    def readWriteLock(self):  # real signature unknown; restored from __doc__
        """ QReadLocker.readWriteLock() -> QReadWriteLock """
        return QReadWriteLock

    def relock(self):  # real signature unknown; restored from __doc__
        """ QReadLocker.relock() """
        pass

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QReadLocker.unlock() """
        pass

    def __enter__(self):  # real signature unknown; restored from __doc__
        """ QReadLocker.__enter__() -> object """
        return object()

    # real signature unknown; restored from __doc__
    def __exit__(self, p_object, p_object_1, p_object_2):
        """ QReadLocker.__exit__(object, object, object) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QReadWriteLock):
        pass

    __weakref__ = property(lambda self: object())  # default


class QReadWriteLock():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QReadWriteLock()
    QReadWriteLock(QReadWriteLock.RecursionMode)
    """

    def lockForRead(self):  # real signature unknown; restored from __doc__
        """ QReadWriteLock.lockForRead() """
        pass

    def lockForWrite(self):  # real signature unknown; restored from __doc__
        """ QReadWriteLock.lockForWrite() """
        pass

    def RecursionMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def tryLockForRead(self, p_int=None):
        """
        QReadWriteLock.tryLockForRead() -> bool
        QReadWriteLock.tryLockForRead(int) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def tryLockForWrite(self, p_int=None):
        """
        QReadWriteLock.tryLockForWrite() -> bool
        QReadWriteLock.tryLockForWrite(int) -> bool
        """
        return False

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QReadWriteLock.unlock() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QReadWriteLock_RecursionMode=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    NonRecursive = 0
    Recursive = 1


class QRect():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QRect()
    QRect(int, int, int, int)
    QRect(QPoint, QPoint)
    QRect(QPoint, QSize)
    QRect(QRect)
    """
    # real signature unknown; restored from __doc__

    def adjust(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QRect.adjust(int, int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def adjusted(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QRect.adjusted(int, int, int, int) -> QRect """
        return QRect

    def bottom(self):  # real signature unknown; restored from __doc__
        """ QRect.bottom() -> int """
        return 0

    def bottomLeft(self):  # real signature unknown; restored from __doc__
        """ QRect.bottomLeft() -> QPoint """
        return QPoint

    def bottomRight(self):  # real signature unknown; restored from __doc__
        """ QRect.bottomRight() -> QPoint """
        return QPoint

    def center(self):  # real signature unknown; restored from __doc__
        """ QRect.center() -> QPoint """
        return QPoint

    # real signature unknown; restored from __doc__ with multiple overloads
    def contains(self, *__args):
        """
        QRect.contains(QPoint, bool proper=False) -> bool
        QRect.contains(QRect, bool proper=False) -> bool
        QRect.contains(int, int, bool) -> bool
        QRect.contains(int, int) -> bool
        """
        return False

    def getCoords(self):  # real signature unknown; restored from __doc__
        """ QRect.getCoords() -> (int, int, int, int) """
        pass

    def getRect(self):  # real signature unknown; restored from __doc__
        """ QRect.getRect() -> (int, int, int, int) """
        pass

    def height(self):  # real signature unknown; restored from __doc__
        """ QRect.height() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def intersect(self, QRect):
        """ QRect.intersect(QRect) -> QRect """
        return QRect

    # real signature unknown; restored from __doc__
    def intersected(self, QRect):
        """ QRect.intersected(QRect) -> QRect """
        return QRect

    # real signature unknown; restored from __doc__
    def intersects(self, QRect):
        """ QRect.intersects(QRect) -> bool """
        return False

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QRect.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QRect.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QRect.isValid() -> bool """
        return False

    def left(self):  # real signature unknown; restored from __doc__
        """ QRect.left() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def moveBottom(self, p_int):
        """ QRect.moveBottom(int) """
        pass

    # real signature unknown; restored from __doc__
    def moveBottomLeft(self, QPoint):
        """ QRect.moveBottomLeft(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def moveBottomRight(self, QPoint):
        """ QRect.moveBottomRight(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def moveCenter(self, QPoint):
        """ QRect.moveCenter(QPoint) """
        pass

    def moveLeft(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.moveLeft(int) """
        pass

    # real signature unknown; restored from __doc__
    def moveRight(self, p_int):
        """ QRect.moveRight(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def moveTo(self, *__args):
        """
        QRect.moveTo(int, int)
        QRect.moveTo(QPoint)
        """
        pass

    def moveTop(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.moveTop(int) """
        pass

    # real signature unknown; restored from __doc__
    def moveTopLeft(self, QPoint):
        """ QRect.moveTopLeft(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def moveTopRight(self, QPoint):
        """ QRect.moveTopRight(QPoint) """
        pass

    def normalized(self):  # real signature unknown; restored from __doc__
        """ QRect.normalized() -> QRect """
        return QRect

    def right(self):  # real signature unknown; restored from __doc__
        """ QRect.right() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setBottom(self, p_int):
        """ QRect.setBottom(int) """
        pass

    # real signature unknown; restored from __doc__
    def setBottomLeft(self, QPoint):
        """ QRect.setBottomLeft(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setBottomRight(self, QPoint):
        """ QRect.setBottomRight(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setCoords(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QRect.setCoords(int, int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setHeight(self, p_int):
        """ QRect.setHeight(int) """
        pass

    def setLeft(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setLeft(int) """
        pass

    # real signature unknown; restored from __doc__
    def setRect(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QRect.setRect(int, int, int, int) """
        pass

    def setRight(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setRight(int) """
        pass

    def setSize(self, QSize):  # real signature unknown; restored from __doc__
        """ QRect.setSize(QSize) """
        pass

    def setTop(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setTop(int) """
        pass

    # real signature unknown; restored from __doc__
    def setTopLeft(self, QPoint):
        """ QRect.setTopLeft(QPoint) """
        pass

    # real signature unknown; restored from __doc__
    def setTopRight(self, QPoint):
        """ QRect.setTopRight(QPoint) """
        pass

    def setWidth(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setWidth(int) """
        pass

    def setX(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setX(int) """
        pass

    def setY(self, p_int):  # real signature unknown; restored from __doc__
        """ QRect.setY(int) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QRect.size() -> QSize """
        return QSize

    def top(self):  # real signature unknown; restored from __doc__
        """ QRect.top() -> int """
        return 0

    def topLeft(self):  # real signature unknown; restored from __doc__
        """ QRect.topLeft() -> QPoint """
        return QPoint

    def topRight(self):  # real signature unknown; restored from __doc__
        """ QRect.topRight() -> QPoint """
        return QPoint

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, *__args):
        """
        QRect.translate(int, int)
        QRect.translate(QPoint)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def translated(self, *__args):
        """
        QRect.translated(int, int) -> QRect
        QRect.translated(QPoint) -> QRect
        """
        return QRect

    def unite(self, QRect):  # real signature unknown; restored from __doc__
        """ QRect.unite(QRect) -> QRect """
        return QRect

    def united(self, QRect):  # real signature unknown; restored from __doc__
        """ QRect.united(QRect) -> QRect """
        return QRect

    def width(self):  # real signature unknown; restored from __doc__
        """ QRect.width() -> int """
        return 0

    def x(self):  # real signature unknown; restored from __doc__
        """ QRect.x() -> int """
        return 0

    def y(self):  # real signature unknown; restored from __doc__
        """ QRect.y() -> int """
        return 0

    def __and__(self, y):  # real signature unknown; restored from __doc__
        """ x.__and__(y) <==> x&y """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
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

    def __iand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iand__(y) <==> x&y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __ior__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ior__(y) <==> x|y """
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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __or__(self, y):  # real signature unknown; restored from __doc__
        """ x.__or__(y) <==> x|y """
        pass

    def __rand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rand__(y) <==> y&x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __ror__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ror__(y) <==> y|x """
        pass

    __weakref__ = property(lambda self: object())  # default


class QRectF():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QRectF()
    QRectF(QPointF, QSizeF)
    QRectF(QPointF, QPointF)
    QRectF(float, float, float, float)
    QRectF(QRect)
    QRectF(QRectF)
    """
    # real signature unknown; restored from __doc__

    def adjust(self, p_float, p_float_1, p_float_2, p_float_3):
        """ QRectF.adjust(float, float, float, float) """
        pass

    # real signature unknown; restored from __doc__
    def adjusted(self, p_float, p_float_1, p_float_2, p_float_3):
        """ QRectF.adjusted(float, float, float, float) -> QRectF """
        return QRectF

    def bottom(self):  # real signature unknown; restored from __doc__
        """ QRectF.bottom() -> float """
        return 0.0

    def bottomLeft(self):  # real signature unknown; restored from __doc__
        """ QRectF.bottomLeft() -> QPointF """
        return QPointF

    def bottomRight(self):  # real signature unknown; restored from __doc__
        """ QRectF.bottomRight() -> QPointF """
        return QPointF

    def center(self):  # real signature unknown; restored from __doc__
        """ QRectF.center() -> QPointF """
        return QPointF

    # real signature unknown; restored from __doc__ with multiple overloads
    def contains(self, *__args):
        """
        QRectF.contains(QPointF) -> bool
        QRectF.contains(QRectF) -> bool
        QRectF.contains(float, float) -> bool
        """
        return False

    def getCoords(self):  # real signature unknown; restored from __doc__
        """ QRectF.getCoords() -> (float, float, float, float) """
        pass

    def getRect(self):  # real signature unknown; restored from __doc__
        """ QRectF.getRect() -> (float, float, float, float) """
        pass

    def height(self):  # real signature unknown; restored from __doc__
        """ QRectF.height() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def intersect(self, QRectF):
        """ QRectF.intersect(QRectF) -> QRectF """
        return QRectF

    # real signature unknown; restored from __doc__
    def intersected(self, QRectF):
        """ QRectF.intersected(QRectF) -> QRectF """
        return QRectF

    # real signature unknown; restored from __doc__
    def intersects(self, QRectF):
        """ QRectF.intersects(QRectF) -> bool """
        return False

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QRectF.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QRectF.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QRectF.isValid() -> bool """
        return False

    def left(self):  # real signature unknown; restored from __doc__
        """ QRectF.left() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def moveBottom(self, p_float):
        """ QRectF.moveBottom(float) """
        pass

    # real signature unknown; restored from __doc__
    def moveBottomLeft(self, QPointF):
        """ QRectF.moveBottomLeft(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def moveBottomRight(self, QPointF):
        """ QRectF.moveBottomRight(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def moveCenter(self, QPointF):
        """ QRectF.moveCenter(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def moveLeft(self, p_float):
        """ QRectF.moveLeft(float) """
        pass

    # real signature unknown; restored from __doc__
    def moveRight(self, p_float):
        """ QRectF.moveRight(float) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def moveTo(self, *__args):
        """
        QRectF.moveTo(float, float)
        QRectF.moveTo(QPointF)
        """
        pass

    # real signature unknown; restored from __doc__
    def moveTop(self, p_float):
        """ QRectF.moveTop(float) """
        pass

    # real signature unknown; restored from __doc__
    def moveTopLeft(self, QPointF):
        """ QRectF.moveTopLeft(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def moveTopRight(self, QPointF):
        """ QRectF.moveTopRight(QPointF) """
        pass

    def normalized(self):  # real signature unknown; restored from __doc__
        """ QRectF.normalized() -> QRectF """
        return QRectF

    def right(self):  # real signature unknown; restored from __doc__
        """ QRectF.right() -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def setBottom(self, p_float):
        """ QRectF.setBottom(float) """
        pass

    # real signature unknown; restored from __doc__
    def setBottomLeft(self, QPointF):
        """ QRectF.setBottomLeft(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def setBottomRight(self, QPointF):
        """ QRectF.setBottomRight(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def setCoords(self, p_float, p_float_1, p_float_2, p_float_3):
        """ QRectF.setCoords(float, float, float, float) """
        pass

    # real signature unknown; restored from __doc__
    def setHeight(self, p_float):
        """ QRectF.setHeight(float) """
        pass

    # real signature unknown; restored from __doc__
    def setLeft(self, p_float):
        """ QRectF.setLeft(float) """
        pass

    # real signature unknown; restored from __doc__
    def setRect(self, p_float, p_float_1, p_float_2, p_float_3):
        """ QRectF.setRect(float, float, float, float) """
        pass

    # real signature unknown; restored from __doc__
    def setRight(self, p_float):
        """ QRectF.setRight(float) """
        pass

    def setSize(self, QSizeF):  # real signature unknown; restored from __doc__
        """ QRectF.setSize(QSizeF) """
        pass

    def setTop(self, p_float):  # real signature unknown; restored from __doc__
        """ QRectF.setTop(float) """
        pass

    # real signature unknown; restored from __doc__
    def setTopLeft(self, QPointF):
        """ QRectF.setTopLeft(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def setTopRight(self, QPointF):
        """ QRectF.setTopRight(QPointF) """
        pass

    # real signature unknown; restored from __doc__
    def setWidth(self, p_float):
        """ QRectF.setWidth(float) """
        pass

    def setX(self, p_float):  # real signature unknown; restored from __doc__
        """ QRectF.setX(float) """
        pass

    def setY(self, p_float):  # real signature unknown; restored from __doc__
        """ QRectF.setY(float) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QRectF.size() -> QSizeF """
        return QSizeF

    def toAlignedRect(self):  # real signature unknown; restored from __doc__
        """ QRectF.toAlignedRect() -> QRect """
        return QRect

    def top(self):  # real signature unknown; restored from __doc__
        """ QRectF.top() -> float """
        return 0.0

    def topLeft(self):  # real signature unknown; restored from __doc__
        """ QRectF.topLeft() -> QPointF """
        return QPointF

    def topRight(self):  # real signature unknown; restored from __doc__
        """ QRectF.topRight() -> QPointF """
        return QPointF

    def toRect(self):  # real signature unknown; restored from __doc__
        """ QRectF.toRect() -> QRect """
        return QRect

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, *__args):
        """
        QRectF.translate(float, float)
        QRectF.translate(QPointF)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def translated(self, *__args):
        """
        QRectF.translated(float, float) -> QRectF
        QRectF.translated(QPointF) -> QRectF
        """
        return QRectF

    def unite(self, QRectF):  # real signature unknown; restored from __doc__
        """ QRectF.unite(QRectF) -> QRectF """
        return QRectF

    def united(self, QRectF):  # real signature unknown; restored from __doc__
        """ QRectF.united(QRectF) -> QRectF """
        return QRectF

    def width(self):  # real signature unknown; restored from __doc__
        """ QRectF.width() -> float """
        return 0.0

    def x(self):  # real signature unknown; restored from __doc__
        """ QRectF.x() -> float """
        return 0.0

    def y(self):  # real signature unknown; restored from __doc__
        """ QRectF.y() -> float """
        return 0.0

    def __and__(self, y):  # real signature unknown; restored from __doc__
        """ x.__and__(y) <==> x&y """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
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

    def __iand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iand__(y) <==> x&y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __ior__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ior__(y) <==> x|y """
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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __or__(self, y):  # real signature unknown; restored from __doc__
        """ x.__or__(y) <==> x|y """
        pass

    def __rand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rand__(y) <==> y&x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __ror__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ror__(y) <==> y|x """
        pass

    __weakref__ = property(lambda self: object())  # default


class QRegExp():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QRegExp()
    QRegExp(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive, QRegExp.PatternSyntax syntax=QRegExp.RegExp)
    QRegExp(QRegExp)
    """

    def cap(self, int_nth=0):  # real signature unknown; restored from __doc__
        """ QRegExp.cap(int nth=0) -> QString """
        return QString

    def captureCount(self):  # real signature unknown; restored from __doc__
        """ QRegExp.captureCount() -> int """
        return 0

    def capturedTexts(self):  # real signature unknown; restored from __doc__
        """ QRegExp.capturedTexts() -> QStringList """
        return QStringList

    def CaretMode(self, *args, **kwargs):  # real signature unknown
        pass

    def caseSensitivity(self):  # real signature unknown; restored from __doc__
        """ QRegExp.caseSensitivity() -> Qt.CaseSensitivity """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QRegExp.errorString() -> QString """
        return QString

    def escape(self, QString):  # real signature unknown; restored from __doc__
        """ QRegExp.escape(QString) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def exactMatch(self, QString):
        """ QRegExp.exactMatch(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indexIn(self, QString, int_offset=0, QRegExp_CaretMode_caretMode=None):
        """ QRegExp.indexIn(QString, int offset=0, QRegExp.CaretMode caretMode=QRegExp.CaretAtZero) -> int """
        return 0

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QRegExp.isEmpty() -> bool """
        return False

    def isMinimal(self):  # real signature unknown; restored from __doc__
        """ QRegExp.isMinimal() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QRegExp.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def lastIndexIn(self, QString, int_offset=-1, QRegExp_CaretMode_caretMode=None):
        """ QRegExp.lastIndexIn(QString, int offset=-1, QRegExp.CaretMode caretMode=QRegExp.CaretAtZero) -> int """
        return 0

    def matchedLength(self):  # real signature unknown; restored from __doc__
        """ QRegExp.matchedLength() -> int """
        return 0

    def numCaptures(self):  # real signature unknown; restored from __doc__
        """ QRegExp.numCaptures() -> int """
        return 0

    def pattern(self):  # real signature unknown; restored from __doc__
        """ QRegExp.pattern() -> QString """
        return QString

    def patternSyntax(self):  # real signature unknown; restored from __doc__
        """ QRegExp.patternSyntax() -> QRegExp.PatternSyntax """
        pass

    def PatternSyntax(self, *args, **kwargs):  # real signature unknown
        pass

    def pos(self, int_nth=0):  # real signature unknown; restored from __doc__
        """ QRegExp.pos(int nth=0) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setCaseSensitivity(self, Qt_CaseSensitivity):
        """ QRegExp.setCaseSensitivity(Qt.CaseSensitivity) """
        pass

    # real signature unknown; restored from __doc__
    def setMinimal(self, bool):
        """ QRegExp.setMinimal(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setPattern(self, QString):
        """ QRegExp.setPattern(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPatternSyntax(self, QRegExp_PatternSyntax):
        """ QRegExp.setPatternSyntax(QRegExp.PatternSyntax) """
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

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    CaretAtOffset = 1
    CaretAtZero = 0
    CaretWontMatch = 2
    FixedString = 2
    RegExp = 0
    RegExp2 = 3
    W3CXmlSchema11 = 5
    Wildcard = 1
    WildcardUnix = 4


class QResource():  # skipped bases: <type 'sip.simplewrapper'>

    """ QResource(QString fileName=QString(), QLocale locale=QLocale()) """

    # real signature unknown; restored from __doc__
    def absoluteFilePath(self):
        """ QResource.absoluteFilePath() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def addSearchPath(self, QString):
        """ QResource.addSearchPath(QString) """
        pass

    def children(self):  # real signature unknown; restored from __doc__
        """ QResource.children() -> QStringList """
        return QStringList

    def data(self):  # real signature unknown; restored from __doc__
        """ QResource.data() -> str """
        return ""

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QResource.fileName() -> QString """
        return QString

    def isCompressed(self):  # real signature unknown; restored from __doc__
        """ QResource.isCompressed() -> bool """
        return False

    def isDir(self):  # real signature unknown; restored from __doc__
        """ QResource.isDir() -> bool """
        return False

    def isFile(self):  # real signature unknown; restored from __doc__
        """ QResource.isFile() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QResource.isValid() -> bool """
        return False

    def locale(self):  # real signature unknown; restored from __doc__
        """ QResource.locale() -> QLocale """
        return QLocale

    # real signature unknown; NOTE: unreliably restored from __doc__
    def registerResource(self, QString, QString_mapRoot=None, *args, **kwargs):
        """ QResource.registerResource(QString, QString mapRoot=QString()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def registerResourceData(self, p_str, QString_mapRoot=None, *args, **kwargs):
        """ QResource.registerResourceData(str, QString mapRoot=QString()) -> bool """
        pass

    def searchPaths(self):  # real signature unknown; restored from __doc__
        """ QResource.searchPaths() -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def setFileName(self, QString):
        """ QResource.setFileName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setLocale(self, QLocale):
        """ QResource.setLocale(QLocale) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QResource.size() -> int """
        return 0

    # real signature unknown; NOTE: unreliably restored from __doc__
    def unregisterResource(self, QString, QString_mapRoot=None, *args, **kwargs):
        """ QResource.unregisterResource(QString, QString mapRoot=QString()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def unregisterResourceData(self, p_str, QString_mapRoot=None, *args, **kwargs):
        """ QResource.unregisterResourceData(str, QString mapRoot=QString()) -> bool """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def __init__(self, QString_fileName=None, *args, **kwargs):
        pass

    __weakref__ = property(lambda self: object())  # default


class QRunnable():  # skipped bases: <type 'sip.wrapper'>

    """
    QRunnable()
    QRunnable(QRunnable)
    """

    def autoDelete(self):  # real signature unknown; restored from __doc__
        """ QRunnable.autoDelete() -> bool """
        return False

    def run(self):  # real signature unknown; restored from __doc__
        """ QRunnable.run() """
        pass

    # real signature unknown; restored from __doc__
    def setAutoDelete(self, bool):
        """ QRunnable.setAutoDelete(bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QRunnable=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QSemaphore():  # skipped bases: <type 'sip.simplewrapper'>

    """ QSemaphore(int n=0) """

    # real signature unknown; restored from __doc__
    def acquire(self, int_n=1):
        """ QSemaphore.acquire(int n=1) """
        pass

    def available(self):  # real signature unknown; restored from __doc__
        """ QSemaphore.available() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def release(self, int_n=1):
        """ QSemaphore.release(int n=1) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def tryAcquire(self, *__args):
        """
        QSemaphore.tryAcquire(int n=1) -> bool
        QSemaphore.tryAcquire(int, int) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, int_n=0):
        pass

    __weakref__ = property(lambda self: object())  # default


class QSequentialAnimationGroup(QAnimationGroup):

    """ QSequentialAnimationGroup(QObject parent=None) """

    def addPause(self, p_int):  # real signature unknown; restored from __doc__
        """ QSequentialAnimationGroup.addPause(int) -> QPauseAnimation """
        return QPauseAnimation

    # real signature unknown; restored from __doc__
    def currentAnimation(self):
        """ QSequentialAnimationGroup.currentAnimation() -> QAbstractAnimation """
        return QAbstractAnimation

    # real signature unknown
    def currentAnimationChanged(self, *args, **kwargs):
        """ QSequentialAnimationGroup.currentAnimationChanged[QAbstractAnimation] [signal] """
        pass

    def duration(self):  # real signature unknown; restored from __doc__
        """ QSequentialAnimationGroup.duration() -> int """
        return 0

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QSequentialAnimationGroup.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def insertPause(self, p_int, p_int_1):
        """ QSequentialAnimationGroup.insertPause(int, int) -> QPauseAnimation """
        return QPauseAnimation

    # real signature unknown; restored from __doc__
    def updateCurrentTime(self, p_int):
        """ QSequentialAnimationGroup.updateCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateDirection(self, QAbstractAnimation_Direction):
        """ QSequentialAnimationGroup.updateDirection(QAbstractAnimation.Direction) """
        pass

    # real signature unknown; restored from __doc__
    def updateState(self, QAbstractAnimation_State, QAbstractAnimation_State_1):
        """ QSequentialAnimationGroup.updateState(QAbstractAnimation.State, QAbstractAnimation.State) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QSettings(QObject):

    """
    QSettings(QString, QString application=QString(), QObject parent=None)
    QSettings(QSettings.Scope, QString, QString application=QString(), QObject parent=None)
    QSettings(QSettings.Format, QSettings.Scope, QString, QString application=QString(), QObject parent=None)
    QSettings(QString, QSettings.Format, QObject parent=None)
    QSettings(QObject parent=None)
    """

    def allKeys(self):  # real signature unknown; restored from __doc__
        """ QSettings.allKeys() -> QStringList """
        return QStringList

    def applicationName(self):  # real signature unknown; restored from __doc__
        """ QSettings.applicationName() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def beginGroup(self, QString):
        """ QSettings.beginGroup(QString) """
        pass

    # real signature unknown; restored from __doc__
    def beginReadArray(self, QString):
        """ QSettings.beginReadArray(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def beginWriteArray(self, QString, int_size=-1):
        """ QSettings.beginWriteArray(QString, int size=-1) """
        pass

    def childGroups(self):  # real signature unknown; restored from __doc__
        """ QSettings.childGroups() -> QStringList """
        return QStringList

    def childKeys(self):  # real signature unknown; restored from __doc__
        """ QSettings.childKeys() -> QStringList """
        return QStringList

    def clear(self):  # real signature unknown; restored from __doc__
        """ QSettings.clear() """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QString):
        """ QSettings.contains(QString) -> bool """
        return False

    def defaultFormat(self):  # real signature unknown; restored from __doc__
        """ QSettings.defaultFormat() -> QSettings.Format """
        pass

    def endArray(self):  # real signature unknown; restored from __doc__
        """ QSettings.endArray() """
        pass

    def endGroup(self):  # real signature unknown; restored from __doc__
        """ QSettings.endGroup() """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QSettings.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def fallbacksEnabled(self):
        """ QSettings.fallbacksEnabled() -> bool """
        return False

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QSettings.fileName() -> QString """
        return QString

    def Format(self, *args, **kwargs):  # real signature unknown
        pass

    def format(self):  # real signature unknown; restored from __doc__
        """ QSettings.format() -> QSettings.Format """
        pass

    def group(self):  # real signature unknown; restored from __doc__
        """ QSettings.group() -> QString """
        return QString

    def iniCodec(self):  # real signature unknown; restored from __doc__
        """ QSettings.iniCodec() -> QTextCodec """
        return QTextCodec

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QSettings.isWritable() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def organizationName(self):
        """ QSettings.organizationName() -> QString """
        return QString

    def remove(self, QString):  # real signature unknown; restored from __doc__
        """ QSettings.remove(QString) """
        pass

    def Scope(self, *args, **kwargs):  # real signature unknown
        pass

    def scope(self):  # real signature unknown; restored from __doc__
        """ QSettings.scope() -> QSettings.Scope """
        pass

    # real signature unknown; restored from __doc__
    def setArrayIndex(self, p_int):
        """ QSettings.setArrayIndex(int) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultFormat(self, QSettings_Format):
        """ QSettings.setDefaultFormat(QSettings.Format) """
        pass

    # real signature unknown; restored from __doc__
    def setFallbacksEnabled(self, bool):
        """ QSettings.setFallbacksEnabled(bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setIniCodec(self, *__args):
        """
        QSettings.setIniCodec(QTextCodec)
        QSettings.setIniCodec(str)
        """
        pass

    # real signature unknown; restored from __doc__
    def setPath(self, QSettings_Format, QSettings_Scope, QString):
        """ QSettings.setPath(QSettings.Format, QSettings.Scope, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setSystemIniPath(self, QString):
        """ QSettings.setSystemIniPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setUserIniPath(self, QString):
        """ QSettings.setUserIniPath(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setValue(self, QString, QVariant):
        """ QSettings.setValue(QString, QVariant) """
        pass

    def Status(self, *args, **kwargs):  # real signature unknown
        pass

    def status(self):  # real signature unknown; restored from __doc__
        """ QSettings.status() -> QSettings.Status """
        pass

    def sync(self):  # real signature unknown; restored from __doc__
        """ QSettings.sync() """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def value(self, QString, QVariant_defaultValue=None, *args, **kwargs):
        """ QSettings.value(QString, QVariant defaultValue=QVariant(), object type=None) -> object """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    AccessError = 1
    FormatError = 2
    IniFormat = 1
    InvalidFormat = 16
    NativeFormat = 0
    NoError = 0
    SystemScope = 1
    UserScope = 0


class QSharedMemory(QObject):

    """
    QSharedMemory(QObject parent=None)
    QSharedMemory(QString, QObject parent=None)
    """

    def AccessMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def attach(self, QSharedMemory_AccessMode_mode=None):
        """ QSharedMemory.attach(QSharedMemory.AccessMode mode=QSharedMemory.ReadWrite) -> bool """
        return False

    def constData(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.constData() -> sip.voidptr """
        pass

    # real signature unknown; restored from __doc__
    def create(self, p_int, QSharedMemory_AccessMode_mode=None):
        """ QSharedMemory.create(int, QSharedMemory.AccessMode mode=QSharedMemory.ReadWrite) -> bool """
        return False

    def data(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.data() -> sip.voidptr """
        pass

    def detach(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.detach() -> bool """
        return False

    def error(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.error() -> QSharedMemory.SharedMemoryError """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.errorString() -> QString """
        return QString

    def isAttached(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.isAttached() -> bool """
        return False

    def key(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.key() -> QString """
        return QString

    def lock(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.lock() -> bool """
        return False

    def setKey(self, QString):  # real signature unknown; restored from __doc__
        """ QSharedMemory.setKey(QString) """
        pass

    def SharedMemoryError(self, *args, **kwargs):  # real signature unknown
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.size() -> int """
        return 0

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QSharedMemory.unlock() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    AlreadyExists = 4
    InvalidSize = 2
    KeyError = 3
    LockError = 6
    NoError = 0
    NotFound = 5
    OutOfResources = 7
    PermissionDenied = 1
    ReadOnly = 0
    ReadWrite = 1
    UnknownError = 8


class QSignalMapper(QObject):

    """ QSignalMapper(QObject parent=None) """
    # real signature unknown; restored from __doc__ with multiple overloads

    def map(self, QObject=None):
        """
        QSignalMapper.map()
        QSignalMapper.map(QObject)
        """
        pass

    def mapped(self, *args, **kwargs):  # real signature unknown
        """
        QSignalMapper.mapped[int] [signal]
        QSignalMapper.mapped[QString] [signal]
        QSignalMapper.mapped[QObject] [signal]
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def mapping(self, *__args):
        """
        QSignalMapper.mapping(int) -> QObject
        QSignalMapper.mapping(QString) -> QObject
        QSignalMapper.mapping(QWidget) -> QObject
        QSignalMapper.mapping(QObject) -> QObject
        """
        return QObject

    # real signature unknown; restored from __doc__
    def removeMappings(self, QObject):
        """ QSignalMapper.removeMappings(QObject) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setMapping(self, QObject, *__args):
        """
        QSignalMapper.setMapping(QObject, int)
        QSignalMapper.setMapping(QObject, QString)
        QSignalMapper.setMapping(QObject, QWidget)
        QSignalMapper.setMapping(QObject, QObject)
        """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QSignalTransition(QAbstractTransition):

    """
    QSignalTransition(QState sourceState=None)
    QSignalTransition(QObject, SIGNAL(), QState sourceState=None)
    QSignalTransition(signal, QState sourceState=None)
    """

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QSignalTransition.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def eventTest(self, QEvent):
        """ QSignalTransition.eventTest(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def onTransition(self, QEvent):
        """ QSignalTransition.onTransition(QEvent) """
        pass

    def senderObject(self):  # real signature unknown; restored from __doc__
        """ QSignalTransition.senderObject() -> QObject """
        return QObject

    # real signature unknown; restored from __doc__
    def setSenderObject(self, QObject):
        """ QSignalTransition.setSenderObject(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setSignal(self, QByteArray):
        """ QSignalTransition.setSignal(QByteArray) """
        pass

    def signal(self):  # real signature unknown; restored from __doc__
        """ QSignalTransition.signal() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QSize():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSize()
    QSize(int, int)
    QSize(QSize)
    """

    # real signature unknown; restored from __doc__
    def boundedTo(self, QSize):
        """ QSize.boundedTo(QSize) -> QSize """
        return QSize

    # real signature unknown; restored from __doc__
    def expandedTo(self, QSize):
        """ QSize.expandedTo(QSize) -> QSize """
        return QSize

    def height(self):  # real signature unknown; restored from __doc__
        """ QSize.height() -> int """
        return 0

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QSize.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSize.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QSize.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def scale(self, *__args):
        """
        QSize.scale(QSize, Qt.AspectRatioMode)
        QSize.scale(int, int, Qt.AspectRatioMode)
        """
        pass

    # real signature unknown; restored from __doc__
    def setHeight(self, p_int):
        """ QSize.setHeight(int) """
        pass

    def setWidth(self, p_int):  # real signature unknown; restored from __doc__
        """ QSize.setWidth(int) """
        pass

    def transpose(self):  # real signature unknown; restored from __doc__
        """ QSize.transpose() """
        pass

    def width(self):  # real signature unknown; restored from __doc__
        """ QSize.width() -> int """
        return 0

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __div__(self, y):  # real signature unknown; restored from __doc__
        """ x.__div__(y) <==> x/y """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+y """
        pass

    def __idiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__idiv__(y) <==> x/y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __isub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__isub__(y) <==> x-y """
        pass

    def __itruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__itruediv__(y) <==> x/y """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mul__(y) <==> x*y """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __rdiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdiv__(y) <==> y/x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmul__(y) <==> y*x """
        pass

    def __rsub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rsub__(y) <==> y-x """
        pass

    def __rtruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rtruediv__(y) <==> y/x """
        pass

    def __sub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__sub__(y) <==> x-y """
        pass

    def __truediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__truediv__(y) <==> x/y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QSizeF():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSizeF()
    QSizeF(QSize)
    QSizeF(float, float)
    QSizeF(QSizeF)
    """
    # real signature unknown; restored from __doc__

    def boundedTo(self, QSizeF):
        """ QSizeF.boundedTo(QSizeF) -> QSizeF """
        return QSizeF

    # real signature unknown; restored from __doc__
    def expandedTo(self, QSizeF):
        """ QSizeF.expandedTo(QSizeF) -> QSizeF """
        return QSizeF

    def height(self):  # real signature unknown; restored from __doc__
        """ QSizeF.height() -> float """
        return 0.0

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QSizeF.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSizeF.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QSizeF.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def scale(self, *__args):
        """
        QSizeF.scale(QSizeF, Qt.AspectRatioMode)
        QSizeF.scale(float, float, Qt.AspectRatioMode)
        """
        pass

    # real signature unknown; restored from __doc__
    def setHeight(self, p_float):
        """ QSizeF.setHeight(float) """
        pass

    # real signature unknown; restored from __doc__
    def setWidth(self, p_float):
        """ QSizeF.setWidth(float) """
        pass

    def toSize(self):  # real signature unknown; restored from __doc__
        """ QSizeF.toSize() -> QSize """
        return QSize

    def transpose(self):  # real signature unknown; restored from __doc__
        """ QSizeF.transpose() """
        pass

    def width(self):  # real signature unknown; restored from __doc__
        """ QSizeF.width() -> float """
        return 0.0

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __div__(self, y):  # real signature unknown; restored from __doc__
        """ x.__div__(y) <==> x/y """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+y """
        pass

    def __idiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__idiv__(y) <==> x/y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __isub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__isub__(y) <==> x-y """
        pass

    def __itruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__itruediv__(y) <==> x/y """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mul__(y) <==> x*y """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __rdiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdiv__(y) <==> y/x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmul__(y) <==> y*x """
        pass

    def __rsub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rsub__(y) <==> y-x """
        pass

    def __rtruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rtruediv__(y) <==> y/x """
        pass

    def __sub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__sub__(y) <==> x-y """
        pass

    def __truediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__truediv__(y) <==> x/y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QSocketNotifier(QObject):

    """ QSocketNotifier(int, QSocketNotifier.Type, QObject parent=None) """

    def activated(self, *args, **kwargs):  # real signature unknown
        """ QSocketNotifier.activated[int] [signal] """
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QSocketNotifier.event(QEvent) -> bool """
        return False

    def isEnabled(self):  # real signature unknown; restored from __doc__
        """ QSocketNotifier.isEnabled() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setEnabled(self, bool):
        """ QSocketNotifier.setEnabled(bool) """
        pass

    def socket(self):  # real signature unknown; restored from __doc__
        """ QSocketNotifier.socket() -> int """
        return 0

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QSocketNotifier.type() -> QSocketNotifier.Type """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, p_int, QSocketNotifier_Type, QObject_parent=None):
        pass

    Exception = 2
    Read = 0
    Write = 1


class QState(QAbstractState):

    """
    QState(QState parent=None)
    QState(QState.ChildMode, QState parent=None)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def addTransition(self, *__args):
        """
        QState.addTransition(QAbstractTransition)
        QState.addTransition(QObject, SIGNAL(), QAbstractState) -> QSignalTransition
        QState.addTransition(signal, QAbstractState) -> QSignalTransition
        QState.addTransition(QAbstractState) -> QAbstractTransition
        """
        return QSignalTransition or QAbstractTransition

    # real signature unknown; restored from __doc__
    def assignProperty(self, QObject, p_str, QVariant):
        """ QState.assignProperty(QObject, str, QVariant) """
        pass

    def ChildMode(self, *args, **kwargs):  # real signature unknown
        pass

    def childMode(self):  # real signature unknown; restored from __doc__
        """ QState.childMode() -> QState.ChildMode """
        pass

    def errorState(self):  # real signature unknown; restored from __doc__
        """ QState.errorState() -> QAbstractState """
        return QAbstractState

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QState.event(QEvent) -> bool """
        return False

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QState.finished[] [signal] """
        pass

    def initialState(self):  # real signature unknown; restored from __doc__
        """ QState.initialState() -> QAbstractState """
        return QAbstractState

    def onEntry(self, QEvent):  # real signature unknown; restored from __doc__
        """ QState.onEntry(QEvent) """
        pass

    def onExit(self, QEvent):  # real signature unknown; restored from __doc__
        """ QState.onExit(QEvent) """
        pass

    def propertiesAssigned(self, *args, **kwargs):  # real signature unknown
        """ QState.propertiesAssigned[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def removeTransition(self, QAbstractTransition):
        """ QState.removeTransition(QAbstractTransition) """
        pass

    # real signature unknown; restored from __doc__
    def setChildMode(self, QState_ChildMode):
        """ QState.setChildMode(QState.ChildMode) """
        pass

    # real signature unknown; restored from __doc__
    def setErrorState(self, QAbstractState):
        """ QState.setErrorState(QAbstractState) """
        pass

    # real signature unknown; restored from __doc__
    def setInitialState(self, QAbstractState):
        """ QState.setInitialState(QAbstractState) """
        pass

    def transitions(self):  # real signature unknown; restored from __doc__
        """ QState.transitions() -> list-of-QAbstractTransition """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    ExclusiveStates = 0
    ParallelStates = 1


class QStateMachine(QState):

    """ QStateMachine(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addDefaultAnimation(self, QAbstractAnimation):
        """ QStateMachine.addDefaultAnimation(QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def addState(self, QAbstractState):
        """ QStateMachine.addState(QAbstractState) """
        pass

    # real signature unknown; restored from __doc__
    def cancelDelayedEvent(self, p_int):
        """ QStateMachine.cancelDelayedEvent(int) -> bool """
        return False

    def clearError(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.clearError() """
        pass

    def configuration(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.configuration() -> list-of-QAbstractState """
        pass

    # real signature unknown; restored from __doc__
    def defaultAnimations(self):
        """ QStateMachine.defaultAnimations() -> list-of-QAbstractAnimation """
        pass

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.error() -> QStateMachine.Error """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.errorString() -> QString """
        return QString

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QStateMachine.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def eventFilter(self, QObject, QEvent):
        """ QStateMachine.eventFilter(QObject, QEvent) -> bool """
        return False

    def EventPriority(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def globalRestorePolicy(self):
        """ QStateMachine.globalRestorePolicy() -> QStateMachine.RestorePolicy """
        pass

    def isAnimated(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.isAnimated() -> bool """
        return False

    def isRunning(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.isRunning() -> bool """
        return False

    def onEntry(self, QEvent):  # real signature unknown; restored from __doc__
        """ QStateMachine.onEntry(QEvent) """
        pass

    def onExit(self, QEvent):  # real signature unknown; restored from __doc__
        """ QStateMachine.onExit(QEvent) """
        pass

    # real signature unknown; restored from __doc__
    def postDelayedEvent(self, QEvent, p_int):
        """ QStateMachine.postDelayedEvent(QEvent, int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def postEvent(self, QEvent, QStateMachine_EventPriority_priority=None):
        """ QStateMachine.postEvent(QEvent, QStateMachine.EventPriority priority=QStateMachine.NormalPriority) """
        pass

    # real signature unknown; restored from __doc__
    def removeDefaultAnimation(self, QAbstractAnimation):
        """ QStateMachine.removeDefaultAnimation(QAbstractAnimation) """
        pass

    # real signature unknown; restored from __doc__
    def removeState(self, QAbstractState):
        """ QStateMachine.removeState(QAbstractState) """
        pass

    def RestorePolicy(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setAnimated(self, bool):
        """ QStateMachine.setAnimated(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setGlobalRestorePolicy(self, QStateMachine_RestorePolicy):
        """ QStateMachine.setGlobalRestorePolicy(QStateMachine.RestorePolicy) """
        pass

    def SignalEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def start(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.start() """
        pass

    def started(self, *args, **kwargs):  # real signature unknown
        """ QStateMachine.started[] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QStateMachine.stop() """
        pass

    def stopped(self, *args, **kwargs):  # real signature unknown
        """ QStateMachine.stopped[] [signal] """
        pass

    def WrappedEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    DontRestoreProperties = 0
    HighPriority = 1
    NoCommonAncestorForTransitionError = 3
    NoDefaultStateInHistoryStateError = 2
    NoError = 0
    NoInitialStateError = 1
    NormalPriority = 0
    RestoreProperties = 1


class QString():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QString()
    QString(int, QChar)
    QString(QString)
    QString(QByteArray)
    QString(QUuid)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def append(self, *__args):
        """
        QString.append(QString) -> QString
        QString.append(QLatin1String) -> QString
        QString.append(QByteArray) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def arg(self, *__args):
        """
        QString.arg(int, int fieldWidth=0, int base=10, QChar fillChar=QLatin1Char(' ')) -> QString
        QString.arg(float, int fieldWidth=0, str format='g', int precision=-1, QChar fillChar=QLatin1Char(' ')) -> QString
        QString.arg(int, int fieldWidth=0, int base=10, QChar fillChar=QLatin1Char(' ')) -> QString
        QString.arg(int, int fieldWidth=0, int base=10, QChar fillChar=QLatin1Char(' ')) -> QString
        QString.arg(QString, int fieldWidth=0, QChar fillChar=QLatin1Char(' ')) -> QString
        QString.arg(QString, QString) -> QString
        QString.arg(QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString, QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString, QString, QString, QString, QString) -> QString
        QString.arg(QString, QString, QString, QString, QString, QString, QString, QString, QString) -> QString
        """
        return QString

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.at(int) -> QChar """
        return QChar

    def capacity(self):  # real signature unknown; restored from __doc__
        """ QString.capacity() -> int """
        return 0

    def chop(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.chop(int) """
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QString.clear() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def compare(self, *__args):
        """
        QString.compare(QString) -> int
        QString.compare(QString, Qt.CaseSensitivity) -> int
        QString.compare(QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.compare(QStringRef, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.compare(QString, QString) -> int
        QString.compare(QString, QString, Qt.CaseSensitivity) -> int
        QString.compare(QString, QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.compare(QLatin1String, QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.compare(QString, QStringRef, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def contains(self, *__args):
        """
        QString.contains(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool
        QString.contains(QRegExp) -> bool
        """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def count(self, *__args):
        """
        QString.count() -> int
        QString.count(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.count(QRegExp) -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def endsWith(self, *__args):
        """
        QString.endsWith(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool
        QString.endsWith(QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def fill(self, QChar, int_size=-1):
        """ QString.fill(QChar, int size=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromAscii(self, p_str, int_size=-1):
        """ QString.fromAscii(str, int size=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromLatin1(self, p_str, int_size=-1):
        """ QString.fromLatin1(str, int size=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromLocal8Bit(self, p_str, int_size=-1):
        """ QString.fromLocal8Bit(str, int size=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromUtf8(self, p_str, int_size=-1):
        """ QString.fromUtf8(str, int size=-1) -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def indexOf(self, *__args):
        """
        QString.indexOf(QString, int from=0, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.indexOf(QLatin1String, int from=0, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.indexOf(QRegExp, int from=0) -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def insert(self, p_int, *__args):
        """
        QString.insert(int, QString) -> QString
        QString.insert(int, QLatin1String) -> QString
        """
        return QString

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QString.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QString.isNull() -> bool """
        return False

    def isRightToLeft(self):  # real signature unknown; restored from __doc__
        """ QString.isRightToLeft() -> bool """
        return False

    def isSimpleText(self):  # real signature unknown; restored from __doc__
        """ QString.isSimpleText() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def lastIndexOf(self, *__args):
        """
        QString.lastIndexOf(QString, int from=-1, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.lastIndexOf(QLatin1String, int from=-1, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QString.lastIndexOf(QRegExp, int from=-1) -> int
        """
        return 0

    def left(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.left(int) -> QString """
        return QString

    # real signature unknown; NOTE: unreliably restored from __doc__
    def leftJustified(self, p_int, QChar_fillChar=None, *args, **kwargs):
        """ QString.leftJustified(int, QChar fillChar=QLatin1Char(' '), bool truncate=False) -> QString """
        pass

    def length(self):  # real signature unknown; restored from __doc__
        """ QString.length() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def localeAwareCompare(self, *__args):
        """
        QString.localeAwareCompare(QString) -> int
        QString.localeAwareCompare(QStringRef) -> int
        QString.localeAwareCompare(QString, QString) -> int
        QString.localeAwareCompare(QString, QStringRef) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def mid(self, p_int, int_n=-1):
        """ QString.mid(int, int n=-1) -> QString """
        return QString

    def NormalizationForm(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def normalized(self, QString_NormalizationForm, QChar_UnicodeVersion=None):
        """
        QString.normalized(QString.NormalizationForm) -> QString
        QString.normalized(QString.NormalizationForm, QChar.UnicodeVersion) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def number(self, *__args):
        """
        QString.number(int, int base=10) -> QString
        QString.number(float, str format='g', int precision=6) -> QString
        QString.number(int, int base=10) -> QString
        QString.number(int, int base=10) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def prepend(self, *__args):
        """
        QString.prepend(QString) -> QString
        QString.prepend(QLatin1String) -> QString
        QString.prepend(QByteArray) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def push_back(self, QString):
        """ QString.push_back(QString) """
        pass

    # real signature unknown; restored from __doc__
    def push_front(self, QString):
        """ QString.push_front(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def remove(self, *__args):
        """
        QString.remove(int, int) -> QString
        QString.remove(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QString
        QString.remove(QRegExp) -> QString
        """
        return QString

    def repeated(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.repeated(int) -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def replace(self, *__args):
        """
        QString.replace(int, int, QString) -> QString
        QString.replace(QString, QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QString
        QString.replace(QRegExp, QString) -> QString
        QString.replace(QLatin1String, QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QString
        QString.replace(QLatin1String, QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QString
        QString.replace(QString, QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QString
        """
        return QString

    def reserve(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.reserve(int) """
        pass

    def resize(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.resize(int) """
        pass

    def right(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.right(int) -> QString """
        return QString

    # real signature unknown; NOTE: unreliably restored from __doc__
    def rightJustified(self, p_int, QChar_fillChar=None, *args, **kwargs):
        """ QString.rightJustified(int, QChar fillChar=QLatin1Char(' '), bool truncate=False) -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def section(self, *__args):
        """
        QString.section(QString, int, int end=-1, QString.SectionFlags flags=QString.SectionDefault) -> QString
        QString.section(QRegExp, int, int end=-1, QString.SectionFlags flags=QString.SectionDefault) -> QString
        """
        return QString

    def SectionFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def SectionFlags(self, *__args):
        """
        QString.SectionFlags(QString.SectionFlags)
        QString.SectionFlags(int)
        QString.SectionFlags()
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setNum(self, *__args):
        """
        QString.setNum(int, int base=10) -> QString
        QString.setNum(float, str format='g', int precision=6) -> QString
        QString.setNum(int, int base=10) -> QString
        QString.setNum(int, int base=10) -> QString
        """
        return QString

    def simplified(self):  # real signature unknown; restored from __doc__
        """ QString.simplified() -> QString """
        return QString

    def size(self):  # real signature unknown; restored from __doc__
        """ QString.size() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def split(self, *__args):
        """
        QString.split(QString, QString.SplitBehavior behavior=QString.KeepEmptyParts, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QStringList
        QString.split(QRegExp, QString.SplitBehavior behavior=QString.KeepEmptyParts) -> QStringList
        """
        return QStringList

    def SplitBehavior(self, *args, **kwargs):  # real signature unknown
        pass

    def squeeze(self):  # real signature unknown; restored from __doc__
        """ QString.squeeze() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def startsWith(self, *__args):
        """
        QString.startsWith(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool
        QString.startsWith(QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool
        """
        return False

    def toAscii(self):  # real signature unknown; restored from __doc__
        """ QString.toAscii() -> QByteArray """
        return QByteArray

    def toCaseFolded(self):  # real signature unknown; restored from __doc__
        """ QString.toCaseFolded() -> QString """
        return QString

    def toDouble(self):  # real signature unknown; restored from __doc__
        """ QString.toDouble() -> (float, bool) """
        pass

    def toFloat(self):  # real signature unknown; restored from __doc__
        """ QString.toFloat() -> (float, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toInt(self, int_base=10):
        """ QString.toInt(int base=10) -> (int, bool) """
        pass

    def toLatin1(self):  # real signature unknown; restored from __doc__
        """ QString.toLatin1() -> QByteArray """
        return QByteArray

    def toLocal8Bit(self):  # real signature unknown; restored from __doc__
        """ QString.toLocal8Bit() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def toLong(self, int_base=10):
        """ QString.toLong(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toLongLong(self, int_base=10):
        """ QString.toLongLong(int base=10) -> (int, bool) """
        pass

    def toLower(self):  # real signature unknown; restored from __doc__
        """ QString.toLower() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def toShort(self, int_base=10):
        """ QString.toShort(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toUInt(self, int_base=10):
        """ QString.toUInt(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toULong(self, int_base=10):
        """ QString.toULong(int base=10) -> (int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def toULongLong(self, int_base=10):
        """ QString.toULongLong(int base=10) -> (int, bool) """
        pass

    def toUpper(self):  # real signature unknown; restored from __doc__
        """ QString.toUpper() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def toUShort(self, int_base=10):
        """ QString.toUShort(int base=10) -> (int, bool) """
        pass

    def toUtf8(self):  # real signature unknown; restored from __doc__
        """ QString.toUtf8() -> QByteArray """
        return QByteArray

    def trimmed(self):  # real signature unknown; restored from __doc__
        """ QString.trimmed() -> QString """
        return QString

    def truncate(self, p_int):  # real signature unknown; restored from __doc__
        """ QString.truncate(int) """
        pass

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
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

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+=y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*=y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__mul__(n) <==> x*n """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__rmul__(n) <==> n*x """
        pass

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    KeepEmptyParts = 0
    NormalizationForm_C = 1
    NormalizationForm_D = 0
    NormalizationForm_KC = 3
    NormalizationForm_KD = 2
    SectionCaseInsensitiveSeps = 8
    SectionDefault = 0
    SectionIncludeLeadingSep = 2
    SectionIncludeTrailingSep = 4
    SectionSkipEmpty = 1
    SkipEmptyParts = 1


class QStringList():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QStringList()
    QStringList(QString)
    QStringList(QStringList)
    """

    def append(self, QString):  # real signature unknown; restored from __doc__
        """ QStringList.append(QString) """
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QStringList.clear() """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QString, Qt_CaseSensitivity_cs=None):
        """ QStringList.contains(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def count(self, QString=None):
        """
        QStringList.count(QString) -> int
        QStringList.count() -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def filter(self, *__args):
        """
        QStringList.filter(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QStringList
        QStringList.filter(QRegExp) -> QStringList
        """
        return QStringList

    def first(self):  # real signature unknown; restored from __doc__
        """ QStringList.first() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def indexOf(self, *__args):
        """
        QStringList.indexOf(QString, int from=0) -> int
        QStringList.indexOf(QRegExp, int from=0) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def insert(self, p_int, QString):
        """ QStringList.insert(int, QString) """
        pass

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QStringList.isEmpty() -> bool """
        return False

    def join(self, QString):  # real signature unknown; restored from __doc__
        """ QStringList.join(QString) -> QString """
        return QString

    def last(self):  # real signature unknown; restored from __doc__
        """ QStringList.last() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def lastIndexOf(self, *__args):
        """
        QStringList.lastIndexOf(QString, int from=-1) -> int
        QStringList.lastIndexOf(QRegExp, int from=-1) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def mid(self, p_int, int_length=-1):
        """ QStringList.mid(int, int length=-1) -> QStringList """
        return QStringList

    # real signature unknown; restored from __doc__
    def move(self, p_int, p_int_1):
        """ QStringList.move(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def prepend(self, QString):
        """ QStringList.prepend(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeAll(self, QString):
        """ QStringList.removeAll(QString) -> int """
        return 0

    def removeAt(self, p_int):  # real signature unknown; restored from __doc__
        """ QStringList.removeAt(int) """
        pass

    # real signature unknown; restored from __doc__
    def removeDuplicates(self):
        """ QStringList.removeDuplicates() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def replace(self, p_int, QString):
        """ QStringList.replace(int, QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def replaceInStrings(self, *__args):
        """
        QStringList.replaceInStrings(QString, QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> QStringList
        QStringList.replaceInStrings(QRegExp, QString) -> QStringList
        """
        return QStringList

    def sort(self):  # real signature unknown; restored from __doc__
        """ QStringList.sort() """
        pass

    # real signature unknown; restored from __doc__
    def swap(self, p_int, p_int_1):
        """ QStringList.swap(int, int) """
        pass

    def takeAt(self, p_int):  # real signature unknown; restored from __doc__
        """ QStringList.takeAt(int) -> QString """
        return QString

    def takeFirst(self):  # real signature unknown; restored from __doc__
        """ QStringList.takeFirst() -> QString """
        return QString

    def takeLast(self):  # real signature unknown; restored from __doc__
        """ QStringList.takeLast() -> QString """
        return QString

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+=y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*=y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lshift__(y) <==> x<<y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__mul__(n) <==> x*n """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __rlshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rlshift__(y) <==> y<<x """
        pass

    def __rmul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__rmul__(n) <==> n*x """
        pass

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    __weakref__ = property(lambda self: object())  # default


class QStringMatcher():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QStringMatcher()
    QStringMatcher(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive)
    QStringMatcher(QStringMatcher)
    """

    def caseSensitivity(self):  # real signature unknown; restored from __doc__
        """ QStringMatcher.caseSensitivity() -> Qt.CaseSensitivity """
        pass

    # real signature unknown; restored from __doc__
    def indexIn(self, QString, int_from=0):
        """ QStringMatcher.indexIn(QString, int from=0) -> int """
        return 0

    def pattern(self):  # real signature unknown; restored from __doc__
        """ QStringMatcher.pattern() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def setCaseSensitivity(self, Qt_CaseSensitivity):
        """ QStringMatcher.setCaseSensitivity(Qt.CaseSensitivity) """
        pass

    # real signature unknown; restored from __doc__
    def setPattern(self, QString):
        """ QStringMatcher.setPattern(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


class QStringRef():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QStringRef()
    QStringRef(QString, int, int)
    QStringRef(QString)
    QStringRef(QStringRef)
    """
    # real signature unknown; restored from __doc__

    def appendTo(self, QString):
        """ QStringRef.appendTo(QString) -> QStringRef """
        return QStringRef

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QStringRef.at(int) -> QChar """
        return QChar

    def clear(self):  # real signature unknown; restored from __doc__
        """ QStringRef.clear() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def compare(self, *__args):
        """
        QStringRef.compare(QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QStringRef.compare(QStringRef, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QStringRef.compare(QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QStringRef.compare(QStringRef, QString, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QStringRef.compare(QStringRef, QStringRef, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        QStringRef.compare(QStringRef, QLatin1String, Qt.CaseSensitivity cs=Qt.CaseSensitive) -> int
        """
        return 0

    def constData(self):  # real signature unknown; restored from __doc__
        """ QStringRef.constData() -> QChar """
        return QChar

    def count(self):  # real signature unknown; restored from __doc__
        """ QStringRef.count() -> int """
        return 0

    def data(self):  # real signature unknown; restored from __doc__
        """ QStringRef.data() -> QChar """
        return QChar

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QStringRef.isEmpty() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QStringRef.isNull() -> bool """
        return False

    def length(self):  # real signature unknown; restored from __doc__
        """ QStringRef.length() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def localeAwareCompare(self, *__args):
        """
        QStringRef.localeAwareCompare(QString) -> int
        QStringRef.localeAwareCompare(QStringRef) -> int
        QStringRef.localeAwareCompare(QStringRef, QString) -> int
        QStringRef.localeAwareCompare(QStringRef, QStringRef) -> int
        """
        return 0

    def position(self):  # real signature unknown; restored from __doc__
        """ QStringRef.position() -> int """
        return 0

    def size(self):  # real signature unknown; restored from __doc__
        """ QStringRef.size() -> int """
        return 0

    def string(self):  # real signature unknown; restored from __doc__
        """ QStringRef.string() -> QString """
        return QString

    def toString(self):  # real signature unknown; restored from __doc__
        """ QStringRef.toString() -> QString """
        return QString

    def unicode(self):  # real signature unknown; restored from __doc__
        """ QStringRef.unicode() -> QChar """
        return QChar

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
    def __init__(self, *__args):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
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

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QSysInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSysInfo()
    QSysInfo(QSysInfo)
    """

    def Endian(self, *args, **kwargs):  # real signature unknown
        pass

    def Sizes(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QSysInfo=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    BigEndian = 0
    ByteOrder = 1
    LittleEndian = 1
    WordSize = 32


class QSystemLocale():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSystemLocale()
    QSystemLocale(QSystemLocale)
    """

    def fallbackLocale(self):  # real signature unknown; restored from __doc__
        """ QSystemLocale.fallbackLocale() -> QLocale """
        return QLocale

    # real signature unknown; restored from __doc__
    def query(self, QSystemLocale_QueryType, QVariant):
        """ QSystemLocale.query(QSystemLocale.QueryType, QVariant) -> QVariant """
        return QVariant

    def QueryType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QSystemLocale=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    AMText = 24
    CountryId = 1
    DateFormatLong = 6
    DateFormatShort = 7
    DateTimeFormatLong = 18
    DateTimeFormatShort = 19
    DateTimeToStringLong = 20
    DateTimeToStringShort = 21
    DateToStringLong = 14
    DateToStringShort = 15
    DayNameLong = 10
    DayNameShort = 11
    DecimalPoint = 2
    GroupSeparator = 3
    LanguageId = 0
    MeasurementSystem = 22
    MonthNameLong = 12
    MonthNameShort = 13
    NegativeSign = 5
    PMText = 25
    PositiveSign = 23
    TimeFormatLong = 8
    TimeFormatShort = 9
    TimeToStringLong = 16
    TimeToStringShort = 17
    ZeroDigit = 4


class QSystemSemaphore():  # skipped bases: <type 'sip.simplewrapper'>

    """ QSystemSemaphore(QString, int initialValue=0, QSystemSemaphore.AccessMode mode=QSystemSemaphore.Open) """

    def AccessMode(self, *args, **kwargs):  # real signature unknown
        pass

    def acquire(self):  # real signature unknown; restored from __doc__
        """ QSystemSemaphore.acquire() -> bool """
        return False

    def error(self):  # real signature unknown; restored from __doc__
        """ QSystemSemaphore.error() -> QSystemSemaphore.SystemSemaphoreError """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QSystemSemaphore.errorString() -> QString """
        return QString

    def key(self):  # real signature unknown; restored from __doc__
        """ QSystemSemaphore.key() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def release(self, int_n=1):
        """ QSystemSemaphore.release(int n=1) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setKey(self, QString, int_initialValue=0, QSystemSemaphore_AccessMode_mode=None):
        """ QSystemSemaphore.setKey(QString, int initialValue=0, QSystemSemaphore.AccessMode mode=QSystemSemaphore.Open) """
        pass

    def SystemSemaphoreError(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QString, int_initialValue=0, QSystemSemaphore_AccessMode_mode=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    AlreadyExists = 3
    Create = 1
    KeyError = 2
    NoError = 0
    NotFound = 4
    Open = 0
    OutOfResources = 5
    PermissionDenied = 1
    UnknownError = 6


class Qt():  # skipped bases: <type 'sip.wrapper'>
    # no doc
    # real signature unknown; restored from __doc__ with multiple overloads

    def Alignment(self, *__args):
        """
        Qt.Alignment(Qt.Alignment)
        Qt.Alignment(int)
        Qt.Alignment()
        """
        pass

    def AlignmentFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def AnchorAttribute(self, *args, **kwargs):  # real signature unknown
        pass

    def AnchorPoint(self, *args, **kwargs):  # real signature unknown
        pass

    def ApplicationAttribute(self, *args, **kwargs):  # real signature unknown
        pass

    def ArrowType(self, *args, **kwargs):  # real signature unknown
        pass

    def AspectRatioMode(self, *args, **kwargs):  # real signature unknown
        pass

    def Axis(self, *args, **kwargs):  # real signature unknown
        pass

    def BGMode(self, *args, **kwargs):  # real signature unknown
        pass

    def BrushStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def CaseSensitivity(self, *args, **kwargs):  # real signature unknown
        pass

    def CheckState(self, *args, **kwargs):  # real signature unknown
        pass

    def ClipOperation(self, *args, **kwargs):  # real signature unknown
        pass

    def ConnectionType(self, *args, **kwargs):  # real signature unknown
        pass

    def ContextMenuPolicy(self, *args, **kwargs):  # real signature unknown
        pass

    def CoordinateSystem(self, *args, **kwargs):  # real signature unknown
        pass

    def Corner(self, *args, **kwargs):  # real signature unknown
        pass

    def CursorShape(self, *args, **kwargs):  # real signature unknown
        pass

    def DateFormat(self, *args, **kwargs):  # real signature unknown
        pass

    def DayOfWeek(self, *args, **kwargs):  # real signature unknown
        pass

    def DockWidgetArea(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def DockWidgetAreas(self, *__args):
        """
        Qt.DockWidgetAreas(Qt.DockWidgetAreas)
        Qt.DockWidgetAreas(int)
        Qt.DockWidgetAreas()
        """
        pass

    def DropAction(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def DropActions(self, *__args):
        """
        Qt.DropActions(Qt.DropActions)
        Qt.DropActions(int)
        Qt.DropActions()
        """
        pass

    def EventPriority(self, *args, **kwargs):  # real signature unknown
        pass

    def FillRule(self, *args, **kwargs):  # real signature unknown
        pass

    def FocusPolicy(self, *args, **kwargs):  # real signature unknown
        pass

    def FocusReason(self, *args, **kwargs):  # real signature unknown
        pass

    def GestureFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def GestureFlags(self, *__args):
        """
        Qt.GestureFlags(Qt.GestureFlags)
        Qt.GestureFlags(int)
        Qt.GestureFlags()
        """
        pass

    def GestureState(self, *args, **kwargs):  # real signature unknown
        pass

    def GestureType(self, *args, **kwargs):  # real signature unknown
        pass

    def GlobalColor(self, *args, **kwargs):  # real signature unknown
        pass

    def ImageConversionFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ImageConversionFlags(self, *__args):
        """
        Qt.ImageConversionFlags(Qt.ImageConversionFlags)
        Qt.ImageConversionFlags(int)
        Qt.ImageConversionFlags()
        """
        pass

    def InputMethodHint(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def InputMethodHints(self, *__args):
        """
        Qt.InputMethodHints(Qt.InputMethodHints)
        Qt.InputMethodHints(int)
        Qt.InputMethodHints()
        """
        pass

    def InputMethodQuery(self, *args, **kwargs):  # real signature unknown
        pass

    def ItemDataRole(self, *args, **kwargs):  # real signature unknown
        pass

    def ItemFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ItemFlags(self, *__args):
        """
        Qt.ItemFlags(Qt.ItemFlags)
        Qt.ItemFlags(int)
        Qt.ItemFlags()
        """
        pass

    def ItemSelectionMode(self, *args, **kwargs):  # real signature unknown
        pass

    def Key(self, *args, **kwargs):  # real signature unknown
        pass

    def KeyboardModifier(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def KeyboardModifiers(self, *__args):
        """
        Qt.KeyboardModifiers(Qt.KeyboardModifiers)
        Qt.KeyboardModifiers(int)
        Qt.KeyboardModifiers()
        """
        pass

    def LayoutDirection(self, *args, **kwargs):  # real signature unknown
        pass

    def MaskMode(self, *args, **kwargs):  # real signature unknown
        pass

    def MatchFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def MatchFlags(self, *__args):
        """
        Qt.MatchFlags(Qt.MatchFlags)
        Qt.MatchFlags(int)
        Qt.MatchFlags()
        """
        pass

    def Modifier(self, *args, **kwargs):  # real signature unknown
        pass

    def MouseButton(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def MouseButtons(self, *__args):
        """
        Qt.MouseButtons(Qt.MouseButtons)
        Qt.MouseButtons(int)
        Qt.MouseButtons()
        """
        pass

    def NavigationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def Orientation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Orientations(self, *__args):
        """
        Qt.Orientations(Qt.Orientations)
        Qt.Orientations(int)
        Qt.Orientations()
        """
        pass

    def PenCapStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def PenJoinStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def PenStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def ScrollBarPolicy(self, *args, **kwargs):  # real signature unknown
        pass

    def ShortcutContext(self, *args, **kwargs):  # real signature unknown
        pass

    def SizeHint(self, *args, **kwargs):  # real signature unknown
        pass

    def SizeMode(self, *args, **kwargs):  # real signature unknown
        pass

    def SortOrder(self, *args, **kwargs):  # real signature unknown
        pass

    def TextElideMode(self, *args, **kwargs):  # real signature unknown
        pass

    def TextFlag(self, *args, **kwargs):  # real signature unknown
        pass

    def TextFormat(self, *args, **kwargs):  # real signature unknown
        pass

    def TextInteractionFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def TextInteractionFlags(self, *__args):
        """
        Qt.TextInteractionFlags(Qt.TextInteractionFlags)
        Qt.TextInteractionFlags(int)
        Qt.TextInteractionFlags()
        """
        pass

    def TileRule(self, *args, **kwargs):  # real signature unknown
        pass

    def TimeSpec(self, *args, **kwargs):  # real signature unknown
        pass

    def ToolBarArea(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ToolBarAreas(self, *__args):
        """
        Qt.ToolBarAreas(Qt.ToolBarAreas)
        Qt.ToolBarAreas(int)
        Qt.ToolBarAreas()
        """
        pass

    def ToolButtonStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def TouchPointState(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def TouchPointStates(self, *__args):
        """
        Qt.TouchPointStates(Qt.TouchPointStates)
        Qt.TouchPointStates(int)
        Qt.TouchPointStates()
        """
        pass

    def TransformationMode(self, *args, **kwargs):  # real signature unknown
        pass

    def UIEffect(self, *args, **kwargs):  # real signature unknown
        pass

    def WidgetAttribute(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def WindowFlags(self, *__args):
        """
        Qt.WindowFlags(Qt.WindowFlags)
        Qt.WindowFlags(int)
        Qt.WindowFlags()
        """
        pass

    def WindowFrameSection(self, *args, **kwargs):  # real signature unknown
        pass

    def WindowModality(self, *args, **kwargs):  # real signature unknown
        pass

    def WindowState(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def WindowStates(self, *__args):
        """
        Qt.WindowStates(Qt.WindowStates)
        Qt.WindowStates(int)
        Qt.WindowStates()
        """
        pass

    def WindowType(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    AA_DontCreateNativeWidgetSiblings = 4
    AA_DontShowIconsInMenus = 2
    AA_DontUseNativeMenuBar = 6
    AA_ImmediateWidgetCreation = 0
    AA_MacDontSwapCtrlAndMeta = 7
    AA_MacPluginApplication = 5
    AA_MSWindowsUseDirect3DByDefault = 1
    AA_NativeWindows = 3
    AA_S60DisablePartialScreenInputMode = 9
    AA_S60DontConstructApplicationPanes = 8
    AbsoluteSize = 0
    AccessibleDescriptionRole = 12
    AccessibleTextRole = 11
    ActionMask = 255
    ActionsContextMenu = 2
    ActiveWindowFocusReason = 3
    AlignAbsolute = 16
    AlignBottom = 64
    AlignCenter = 132
    AlignHCenter = 4
    AlignHorizontal_Mask = 31
    AlignJustify = 8
    AlignLeading = 1
    AlignLeft = 1
    AlignRight = 2
    AlignTop = 32
    AlignTrailing = 2
    AlignVCenter = 128
    AlignVertical_Mask = 224
    AllDockWidgetAreas = 15
    AllToolBarAreas = 15
    AlphaDither_Mask = 12
    ALT = 134217728
    AltModifier = 134217728
    AnchorBottom = 5
    AnchorHorizontalCenter = 1
    AnchorHref = 1
    AnchorLeft = 0
    AnchorName = 0
    AnchorRight = 2
    AnchorTop = 3
    AnchorVerticalCenter = 4
    ApplicationModal = 2
    ApplicationShortcut = 2
    ArrowCursor = 0
    AscendingOrder = 0
    AutoColor = 0
    AutoCompatConnection = 3
    AutoConnection = 0
    AutoDither = 0
    AutoText = 2
    AvoidDither = 128
    BackgroundColorRole = 8
    BackgroundRole = 8
    BacktabFocusReason = 2
    BDiagPattern = 12
    BevelJoin = 64
    BitmapCursor = 24
    black = 2
    BlankCursor = 10
    BlockingQueuedConnection = 4
    blue = 9
    BottomDockWidgetArea = 8
    BottomLeftCorner = 2
    BottomLeftSection = 8
    BottomRightCorner = 3
    BottomRightSection = 6
    BottomSection = 7
    BottomToolBarArea = 8
    BusyCursor = 16
    BypassGraphicsProxyWidget = 536870912
    CaseInsensitive = 0
    CaseSensitive = 1
    Checked = 2
    CheckStateRole = 10
    ClickFocus = 2
    ClosedHandCursor = 18
    color0 = 0
    color1 = 1
    ColorMode_Mask = 3
    ColorOnly = 3
    ConicalGradientPattern = 17
    ContainsItemBoundingRect = 2
    ContainsItemShape = 0
    ControlModifier = 67108864
    CopyAction = 1
    CrossCursor = 2
    CrossPattern = 11
    CTRL = 67108864
    CustomContextMenu = 3
    CustomCursor = 25
    CustomDashLine = 6
    CustomGesture = 256
    CustomizeWindowHint = 33554432
    cyan = 10
    darkBlue = 15
    darkCyan = 16
    darkGray = 4
    darkGreen = 14
    darkMagenta = 17
    darkRed = 13
    darkYellow = 18
    DashDotDotLine = 5
    DashDotLine = 4
    DashLine = 2
    DecorationRole = 1
    DefaultContextMenu = 1
    DefaultLocaleLongDate = 7
    DefaultLocaleShortDate = 6
    Dense1Pattern = 2
    Dense2Pattern = 3
    Dense3Pattern = 4
    Dense4Pattern = 5
    Dense5Pattern = 6
    Dense6Pattern = 7
    Dense7Pattern = 8
    DescendingOrder = 1
    Desktop = 17
    DeviceCoordinates = 0
    DiagCrossPattern = 14
    Dialog = 3
    DiffuseAlphaDither = 8
    DiffuseDither = 0
    DirectConnection = 1
    DisplayRole = 0
    DitherMode_Mask = 192
    Dither_Mask = 48
    DockWidgetArea_Mask = 15
    DontStartGestureOnChildren = 1
    DotLine = 3
    DownArrow = 2
    DragCopyCursor = 19
    DragLinkCursor = 21
    DragMoveCursor = 20
    Drawer = 7
    EditRole = 2
    ElideLeft = 0
    ElideMiddle = 2
    ElideNone = 3
    ElideRight = 1
    FastTransformation = 0
    FDiagPattern = 13
    FlatCap = 0
    FontRole = 6
    ForbiddenCursor = 14
    ForegroundRole = 9
    FramelessWindowHint = 2048
    Friday = 5
    GestureCanceled = 4
    GestureFinished = 3
    GestureStarted = 1
    GestureUpdated = 2
    gray = 5
    green = 8
    GroupSwitchModifier = 1073741824
    HighEventPriority = 1
    Horizontal = 1
    HorPattern = 9
    IBeamCursor = 4
    IgnoreAction = 0
    IgnoreAspectRatio = 0
    IgnoredGesturesPropagateToParent = 4
    ImAnchorPosition = 6
    ImCurrentSelection = 4
    ImCursorPosition = 2
    ImFont = 1
    ImhDialableCharactersOnly = 1048576
    ImhDigitsOnly = 65536
    ImhEmailCharactersOnly = 2097152
    ImhExclusiveInputMask = -65536
    ImhFormattedNumbersOnly = 131072
    ImhHiddenText = 1
    ImhLowercaseOnly = 524288
    ImhNoAutoUppercase = 2
    ImhNone = 0
    ImhNoPredictiveText = 32
    ImhPreferLowercase = 16
    ImhPreferNumbers = 4
    ImhPreferUppercase = 8
    ImhUppercaseOnly = 262144
    ImhUrlCharactersOnly = 4194304
    ImMaximumTextLength = 5
    ImMicroFocus = 0
    ImSurroundingText = 3
    IntersectClip = 2
    IntersectsItemBoundingRect = 3
    IntersectsItemShape = 1
    ISODate = 1
    ItemIsDragEnabled = 4
    ItemIsDropEnabled = 8
    ItemIsEditable = 2
    ItemIsEnabled = 32
    ItemIsSelectable = 1
    ItemIsTristate = 64
    ItemIsUserCheckable = 16
    KeepAspectRatio = 1
    KeepAspectRatioByExpanding = 2
    KeyboardModifierMask = -33554432
    KeypadModifier = 536870912
    Key_0 = 48
    Key_1 = 49
    Key_2 = 50
    Key_3 = 51
    Key_4 = 52
    Key_5 = 53
    Key_6 = 54
    Key_7 = 55
    Key_8 = 56
    Key_9 = 57
    Key_A = 65
    Key_Aacute = 193
    Key_Acircumflex = 194
    Key_acute = 180
    Key_AddFavorite = 16777408
    Key_Adiaeresis = 196
    Key_AE = 198
    Key_Agrave = 192
    Key_Alt = 16777251
    Key_AltGr = 16781571
    Key_Ampersand = 38
    Key_Any = 32
    Key_Apostrophe = 39
    Key_ApplicationLeft = 16777415
    Key_ApplicationRight = 16777416
    Key_Aring = 197
    Key_AsciiCircum = 94
    Key_AsciiTilde = 126
    Key_Asterisk = 42
    Key_At = 64
    Key_Atilde = 195
    Key_AudioCycleTrack = 16777478
    Key_AudioForward = 16777474
    Key_AudioRandomPlay = 16777476
    Key_AudioRepeat = 16777475
    Key_AudioRewind = 16777413
    Key_Away = 16777464
    Key_B = 66
    Key_Back = 16777313
    Key_BackForward = 16777414
    Key_Backslash = 92
    Key_Backspace = 16777219
    Key_Backtab = 16777218
    Key_Bar = 124
    Key_BassBoost = 16777331
    Key_BassDown = 16777333
    Key_BassUp = 16777332
    Key_Battery = 16777470
    Key_Bluetooth = 16777471
    Key_Book = 16777417
    Key_BraceLeft = 123
    Key_BraceRight = 125
    Key_BracketLeft = 91
    Key_BracketRight = 93
    Key_BrightnessAdjust = 16777410
    Key_brokenbar = 166
    Key_C = 67
    Key_Calculator = 16777419
    Key_Calendar = 16777444
    Key_Call = 17825796
    Key_Camera = 17825824
    Key_CameraFocus = 17825825
    Key_Cancel = 16908289
    Key_CapsLock = 16777252
    Key_Ccedilla = 199
    Key_CD = 16777418
    Key_cedilla = 184
    Key_cent = 162
    Key_Clear = 16777227
    Key_ClearGrab = 16777421
    Key_Close = 16777422
    Key_Codeinput = 16781623
    Key_Colon = 58
    Key_Comma = 44
    Key_Community = 16777412
    Key_Context1 = 17825792
    Key_Context2 = 17825793
    Key_Context3 = 17825794
    Key_Context4 = 17825795
    Key_ContrastAdjust = 16777485
    Key_Control = 16777249
    Key_Copy = 16777423
    Key_copyright = 169
    Key_currency = 164
    Key_Cut = 16777424
    Key_D = 68
    Key_Dead_Abovedot = 16781910
    Key_Dead_Abovering = 16781912
    Key_Dead_Acute = 16781905
    Key_Dead_Belowdot = 16781920
    Key_Dead_Breve = 16781909
    Key_Dead_Caron = 16781914
    Key_Dead_Cedilla = 16781915
    Key_Dead_Circumflex = 16781906
    Key_Dead_Diaeresis = 16781911
    Key_Dead_Doubleacute = 16781913
    Key_Dead_Grave = 16781904
    Key_Dead_Hook = 16781921
    Key_Dead_Horn = 16781922
    Key_Dead_Iota = 16781917
    Key_Dead_Macron = 16781908
    Key_Dead_Ogonek = 16781916
    Key_Dead_Semivoiced_Sound = 16781919
    Key_Dead_Tilde = 16781907
    Key_Dead_Voiced_Sound = 16781918
    Key_degree = 176
    Key_Delete = 16777223
    Key_diaeresis = 168
    Key_Direction_L = 16777305
    Key_Direction_R = 16777312
    Key_Display = 16777425
    Key_division = 247
    Key_Documents = 16777427
    Key_Dollar = 36
    Key_DOS = 16777426
    Key_Down = 16777237
    Key_E = 69
    Key_Eacute = 201
    Key_Ecircumflex = 202
    Key_Ediaeresis = 203
    Key_Egrave = 200
    Key_Eisu_Shift = 16781615
    Key_Eisu_toggle = 16781616
    Key_Eject = 16777401
    Key_End = 16777233
    Key_Enter = 16777221
    Key_Equal = 61
    Key_Escape = 16777216
    Key_ETH = 208
    Key_Excel = 16777428
    Key_Exclam = 33
    Key_exclamdown = 161
    Key_Execute = 16908291
    Key_Explorer = 16777429
    Key_F = 70
    Key_F1 = 16777264
    Key_F10 = 16777273
    Key_F11 = 16777274
    Key_F12 = 16777275
    Key_F13 = 16777276
    Key_F14 = 16777277
    Key_F15 = 16777278
    Key_F16 = 16777279
    Key_F17 = 16777280
    Key_F18 = 16777281
    Key_F19 = 16777282
    Key_F2 = 16777265
    Key_F20 = 16777283
    Key_F21 = 16777284
    Key_F22 = 16777285
    Key_F23 = 16777286
    Key_F24 = 16777287
    Key_F25 = 16777288
    Key_F26 = 16777289
    Key_F27 = 16777290
    Key_F28 = 16777291
    Key_F29 = 16777292
    Key_F3 = 16777266
    Key_F30 = 16777293
    Key_F31 = 16777294
    Key_F32 = 16777295
    Key_F33 = 16777296
    Key_F34 = 16777297
    Key_F35 = 16777298
    Key_F4 = 16777267
    Key_F5 = 16777268
    Key_F6 = 16777269
    Key_F7 = 16777270
    Key_F8 = 16777271
    Key_F9 = 16777272
    Key_Favorites = 16777361
    Key_Finance = 16777411
    Key_Flip = 17825798
    Key_Forward = 16777314
    Key_G = 71
    Key_Game = 16777430
    Key_Go = 16777431
    Key_Greater = 62
    Key_guillemotleft = 171
    Key_guillemotright = 187
    Key_H = 72
    Key_Hangul = 16781617
    Key_Hangul_Banja = 16781625
    Key_Hangul_End = 16781619
    Key_Hangul_Hanja = 16781620
    Key_Hangul_Jamo = 16781621
    Key_Hangul_Jeonja = 16781624
    Key_Hangul_PostHanja = 16781627
    Key_Hangul_PreHanja = 16781626
    Key_Hangul_Romaja = 16781622
    Key_Hangul_Special = 16781631
    Key_Hangul_Start = 16781618
    Key_Hangup = 17825797
    Key_Hankaku = 16781609
    Key_Help = 16777304
    Key_Henkan = 16781603
    Key_Hibernate = 16777480
    Key_Hiragana = 16781605
    Key_Hiragana_Katakana = 16781607
    Key_History = 16777407
    Key_Home = 16777232
    Key_HomePage = 16777360
    Key_HotLinks = 16777409
    Key_Hyper_L = 16777302
    Key_Hyper_R = 16777303
    Key_hyphen = 173
    Key_I = 73
    Key_Iacute = 205
    Key_Icircumflex = 206
    Key_Idiaeresis = 207
    Key_Igrave = 204
    Key_Insert = 16777222
    Key_iTouch = 16777432
    Key_J = 74
    Key_K = 75
    Key_Kana_Lock = 16781613
    Key_Kana_Shift = 16781614
    Key_Kanji = 16781601
    Key_Katakana = 16781606
    Key_KeyboardBrightnessDown = 16777398
    Key_KeyboardBrightnessUp = 16777397
    Key_KeyboardLightOnOff = 16777396
    Key_L = 76
    Key_LastNumberRedial = 17825801
    Key_Launch0 = 16777378
    Key_Launch1 = 16777379
    Key_Launch2 = 16777380
    Key_Launch3 = 16777381
    Key_Launch4 = 16777382
    Key_Launch5 = 16777383
    Key_Launch6 = 16777384
    Key_Launch7 = 16777385
    Key_Launch8 = 16777386
    Key_Launch9 = 16777387
    Key_LaunchA = 16777388
    Key_LaunchB = 16777389
    Key_LaunchC = 16777390
    Key_LaunchD = 16777391
    Key_LaunchE = 16777392
    Key_LaunchF = 16777393
    Key_LaunchG = 16777486
    Key_LaunchH = 16777487
    Key_LaunchMail = 16777376
    Key_LaunchMedia = 16777377
    Key_Left = 16777234
    Key_Less = 60
    Key_LightBulb = 16777405
    Key_LogOff = 16777433
    Key_M = 77
    Key_macron = 175
    Key_MailForward = 16777467
    Key_Market = 16777434
    Key_masculine = 186
    Key_Massyo = 16781612
    Key_MediaLast = 16842751
    Key_MediaNext = 16777347
    Key_MediaPause = 16777349
    Key_MediaPlay = 16777344
    Key_MediaPrevious = 16777346
    Key_MediaRecord = 16777348
    Key_MediaStop = 16777345
    Key_MediaTogglePlayPause = 16777350
    Key_Meeting = 16777435
    Key_Memo = 16777404
    Key_Menu = 16777301
    Key_MenuKB = 16777436
    Key_MenuPB = 16777437
    Key_Messenger = 16777465
    Key_Meta = 16777250
    Key_Minus = 45
    Key_Mode_switch = 16781694
    Key_MonBrightnessDown = 16777395
    Key_MonBrightnessUp = 16777394
    Key_mu = 181
    Key_Muhenkan = 16781602
    Key_MultipleCandidate = 16781629
    Key_multiply = 215
    Key_Multi_key = 16781600
    Key_Music = 16777469
    Key_MySites = 16777438
    Key_N = 78
    Key_News = 16777439
    Key_No = 16842754
    Key_nobreakspace = 160
    Key_notsign = 172
    Key_Ntilde = 209
    Key_NumberSign = 35
    Key_NumLock = 16777253
    Key_O = 79
    Key_Oacute = 211
    Key_Ocircumflex = 212
    Key_Odiaeresis = 214
    Key_OfficeHome = 16777440
    Key_Ograve = 210
    Key_onehalf = 189
    Key_onequarter = 188
    Key_onesuperior = 185
    Key_Ooblique = 216
    Key_OpenUrl = 16777364
    Key_Option = 16777441
    Key_ordfeminine = 170
    Key_Otilde = 213
    Key_P = 80
    Key_PageDown = 16777239
    Key_PageUp = 16777238
    Key_paragraph = 182
    Key_ParenLeft = 40
    Key_ParenRight = 41
    Key_Paste = 16777442
    Key_Pause = 16777224
    Key_Percent = 37
    Key_Period = 46
    Key_periodcentered = 183
    Key_Phone = 16777443
    Key_Pictures = 16777468
    Key_Play = 16908293
    Key_Plus = 43
    Key_plusminus = 177
    Key_PowerDown = 16777483
    Key_PowerOff = 16777399
    Key_PreviousCandidate = 16781630
    Key_Print = 16777225
    Key_Printer = 16908290
    Key_Q = 81
    Key_Question = 63
    Key_questiondown = 191
    Key_QuoteDbl = 34
    Key_QuoteLeft = 96
    Key_R = 82
    Key_Refresh = 16777316
    Key_registered = 174
    Key_Reload = 16777446
    Key_Reply = 16777445
    Key_Return = 16777220
    Key_Right = 16777236
    Key_Romaji = 16781604
    Key_RotateWindows = 16777447
    Key_RotationKB = 16777449
    Key_RotationPB = 16777448
    Key_S = 83
    Key_Save = 16777450
    Key_ScreenSaver = 16777402
    Key_ScrollLock = 16777254
    Key_Search = 16777362
    Key_section = 167
    Key_Select = 16842752
    Key_Semicolon = 59
    Key_Send = 16777451
    Key_Shift = 16777248
    Key_Shop = 16777406
    Key_SingleCandidate = 16781628
    Key_Slash = 47
    Key_Sleep = 16908292
    Key_Space = 32
    Key_Spell = 16777452
    Key_SplitScreen = 16777453
    Key_ssharp = 223
    Key_Standby = 16777363
    Key_sterling = 163
    Key_Stop = 16777315
    Key_Subtitle = 16777477
    Key_Super_L = 16777299
    Key_Super_R = 16777300
    Key_Support = 16777454
    Key_Suspend = 16777484
    Key_SysReq = 16777226
    Key_T = 84
    Key_Tab = 16777217
    Key_TaskPane = 16777455
    Key_Terminal = 16777456
    Key_THORN = 222
    Key_threequarters = 190
    Key_threesuperior = 179
    Key_Time = 16777479
    Key_ToDoList = 16777420
    Key_ToggleCallHangup = 17825799
    Key_Tools = 16777457
    Key_TopMenu = 16777482
    Key_Touroku = 16781611
    Key_Travel = 16777458
    Key_TrebleDown = 16777335
    Key_TrebleUp = 16777334
    Key_twosuperior = 178
    Key_U = 85
    Key_Uacute = 218
    Key_Ucircumflex = 219
    Key_Udiaeresis = 220
    Key_Ugrave = 217
    Key_Underscore = 95
    Key_unknown = 33554431
    Key_Up = 16777235
    Key_UWB = 16777473
    Key_V = 86
    Key_Video = 16777459
    Key_View = 16777481
    Key_VoiceDial = 17825800
    Key_VolumeDown = 16777328
    Key_VolumeMute = 16777329
    Key_VolumeUp = 16777330
    Key_W = 87
    Key_WakeUp = 16777400
    Key_WebCam = 16777466
    Key_WLAN = 16777472
    Key_Word = 16777460
    Key_WWW = 16777403
    Key_X = 88
    Key_Xfer = 16777461
    Key_Y = 89
    Key_Yacute = 221
    Key_ydiaeresis = 255
    Key_yen = 165
    Key_Yes = 16842753
    Key_Z = 90
    Key_Zenkaku = 16781608
    Key_Zenkaku_Hankaku = 16781610
    Key_Zoom = 16908294
    Key_ZoomIn = 16777462
    Key_ZoomOut = 16777463
    LastCursor = 21
    LayoutDirectionAuto = 2
    LeftArrow = 3
    LeftButton = 1
    LeftDockWidgetArea = 1
    LeftSection = 1
    LeftToolBarArea = 1
    LeftToRight = 0
    lightGray = 6
    LinearGradientPattern = 15
    LinkAction = 4
    LinksAccessibleByKeyboard = 8
    LinksAccessibleByMouse = 4
    LocalDate = 2
    LocaleDate = 3
    LocalTime = 0
    LogicalCoordinates = 1
    LogText = 3
    LowEventPriority = -1
    MacWindowToolBarButtonHint = 268435456
    magenta = 11
    MaskInColor = 0
    MaskOutColor = 1
    MatchCaseSensitive = 16
    MatchContains = 1
    MatchEndsWith = 3
    MatchExactly = 0
    MatchFixedString = 8
    MatchRecursive = 64
    MatchRegExp = 4
    MatchStartsWith = 2
    MatchWildcard = 5
    MatchWrap = 32
    MaximumSize = 2
    MenuBarFocusReason = 6
    META = 268435456
    MetaModifier = 268435456
    MidButton = 4
    MiddleButton = 4
    MinimumDescent = 3
    MinimumSize = 0
    MiterJoin = 0
    MODIFIER_MASK = -33554432
    Monday = 1
    MonoOnly = 2
    MouseButtonMask = 255
    MouseFocusReason = 0
    MoveAction = 2
    MPenCapStyle = 48
    MPenJoinStyle = 448
    MPenStyle = 15
    MSWindowsFixedSizeDialogHint = 256
    MSWindowsOwnDC = 512
    NavigationModeCursorAuto = 3
    NavigationModeCursorForceVisible = 4
    NavigationModeKeypadDirectional = 2
    NavigationModeKeypadTabOrder = 1
    NavigationModeNone = 0
    NoAlpha = 12
    NoArrow = 0
    NoBrush = 0
    NoButton = 0
    NoClip = 0
    NoContextMenu = 0
    NoDockWidgetArea = 0
    NoFocus = 0
    NoFocusReason = 8
    NoItemFlags = 0
    NoModifier = 0
    NonModal = 0
    NoPen = 0
    NormalEventPriority = 0
    NoSection = 0
    NoTextInteraction = 0
    NoToolBarArea = 0
    OddEvenFill = 0
    OffsetFromUTC = 2
    OpaqueMode = 1
    OpenHandCursor = 17
    OrderedAlphaDither = 4
    OrderedDither = 16
    OtherFocusReason = 7
    PanGesture = 3
    PartiallyChecked = 1
    PinchGesture = 4
    PlainText = 0
    PointingHandCursor = 13
    Popup = 9
    PopupFocusReason = 4
    PreferDither = 64
    PreferredSize = 1
    PreventContextMenu = 4
    QueuedConnection = 2
    RadialGradientPattern = 16
    ReceivePartialGestures = 2
    red = 7
    RelativeSize = 1
    RepeatTile = 1
    ReplaceClip = 1
    RichText = 1
    RightArrow = 4
    RightButton = 2
    RightDockWidgetArea = 2
    RightSection = 5
    RightToLeft = 1
    RightToolBarArea = 2
    RoundCap = 32
    RoundJoin = 128
    RoundTile = 2
    Saturday = 6
    ScrollBarAlwaysOff = 1
    ScrollBarAlwaysOn = 2
    ScrollBarAsNeeded = 0
    Sheet = 5
    SHIFT = 33554432
    ShiftModifier = 33554432
    ShortcutFocusReason = 5
    SizeAllCursor = 9
    SizeBDiagCursor = 7
    SizeFDiagCursor = 8
    SizeHintRole = 13
    SizeHorCursor = 6
    SizeVerCursor = 5
    SmoothTransformation = 1
    SolidLine = 1
    SolidPattern = 1
    SplashScreen = 15
    SplitHCursor = 12
    SplitVCursor = 11
    SquareCap = 16
    StatusTipRole = 4
    StretchTile = 0
    StrongFocus = 11
    SubWindow = 18
    Sunday = 7
    SvgMiterJoin = 256
    SwipeGesture = 5
    SystemLocaleDate = 2
    SystemLocaleLongDate = 5
    SystemLocaleShortDate = 4
    TabFocus = 1
    TabFocusReason = 1
    TapAndHoldGesture = 2
    TapGesture = 1
    TargetMoveAction = 32770
    TextAlignmentRole = 7
    TextBrowserInteraction = 13
    TextColorRole = 9
    TextDate = 0
    TextDontClip = 512
    TextDontPrint = 16384
    TextEditable = 16
    TextEditorInteraction = 19
    TextExpandTabs = 1024
    TextHideMnemonic = 32768
    TextIncludeTrailingSpaces = 134217728
    TextJustificationForced = 65536
    TextSelectableByKeyboard = 2
    TextSelectableByMouse = 1
    TextShowMnemonic = 2048
    TextSingleLine = 256
    TexturePattern = 24
    TextWordWrap = 4096
    TextWrapAnywhere = 8192
    ThresholdAlphaDither = 0
    ThresholdDither = 32
    Thursday = 4
    TitleBarArea = 9
    Tool = 11
    ToolBarArea_Mask = 15
    ToolButtonFollowStyle = 4
    ToolButtonIconOnly = 0
    ToolButtonTextBesideIcon = 2
    ToolButtonTextOnly = 1
    ToolButtonTextUnderIcon = 3
    ToolTip = 13
    ToolTipRole = 3
    TopDockWidgetArea = 4
    TopLeftCorner = 0
    TopLeftSection = 2
    TopRightCorner = 1
    TopRightSection = 4
    TopSection = 3
    TopToolBarArea = 4
    TouchPointMoved = 2
    TouchPointPressed = 1
    TouchPointReleased = 8
    TouchPointStationary = 4
    transparent = 19
    TransparentMode = 0
    Tuesday = 2
    UI_AnimateCombo = 3
    UI_AnimateMenu = 1
    UI_AnimateToolBox = 6
    UI_AnimateTooltip = 4
    UI_FadeMenu = 2
    UI_FadeTooltip = 5
    UI_General = 0
    Unchecked = 0
    UNICODE_ACCEL = 0
    UniqueConnection = 128
    UniteClip = 3
    UpArrow = 1
    UpArrowCursor = 1
    UserRole = 32
    UTC = 1
    VerPattern = 10
    Vertical = 2
    WaitCursor = 3
    WA_AcceptDrops = 78
    WA_AcceptTouchEvents = 121
    WA_AlwaysShowToolTips = 84
    WA_AttributeCount = 133
    WA_AutoOrientation = 130
    WA_CustomWhatsThis = 47
    WA_DeleteOnClose = 55
    WA_Disabled = 0
    WA_DontCreateNativeAncestors = 101
    WA_ForceDisabled = 32
    WA_ForceUpdatesDisabled = 59
    WA_GrabbedShortcut = 50
    WA_GroupLeader = 72
    WA_Hover = 74
    WA_InputMethodEnabled = 14
    WA_InputMethodTransparent = 75
    WA_InvalidSize = 45
    WA_KeyboardFocusChange = 77
    WA_KeyCompression = 33
    WA_LaidOut = 7
    WA_LayoutOnEntireRect = 48
    WA_LayoutUsesWidgetRect = 92
    WA_LockLandscapeOrientation = 129
    WA_LockPortraitOrientation = 128
    WA_MacAlwaysShowToolWindow = 96
    WA_MacBrushedMetal = 46
    WA_MacFrameworkScaled = 117
    WA_MacMetalStyle = 46
    WA_MacMiniSize = 91
    WA_MacNoClickThrough = 12
    WA_MacNormalSize = 89
    WA_MacOpaqueSizeGrip = 85
    WA_MacShowFocusRect = 88
    WA_MacSmallSize = 90
    WA_MacVariableSize = 102
    WA_Mapped = 11
    WA_MergeSoftkeys = 124
    WA_MergeSoftkeysRecursively = 125
    WA_MouseNoMask = 71
    WA_MouseTracking = 2
    WA_Moved = 43
    WA_MSWindowsUseDirect3D = 94
    WA_NativeWindow = 100
    WA_NoChildEventsForParent = 58
    WA_NoChildEventsFromChildren = 39
    WA_NoMousePropagation = 73
    WA_NoMouseReplay = 54
    WA_NoSystemBackground = 9
    WA_NoX11EventCompression = 81
    WA_OpaquePaintEvent = 4
    WA_OutsideWSRange = 49
    WA_PaintOnScreen = 8
    WA_PaintOutsidePaintEvent = 13
    WA_PaintUnclipped = 52
    WA_PendingMoveEvent = 34
    WA_PendingResizeEvent = 35
    WA_PendingUpdate = 44
    WA_QuitOnClose = 76
    WA_Resized = 42
    WA_RightToLeft = 56
    WA_SetCursor = 38
    WA_SetFont = 37
    WA_SetLayoutDirection = 57
    WA_SetLocale = 87
    WA_SetPalette = 36
    WA_SetStyle = 86
    WA_SetWindowIcon = 53
    WA_ShowWithoutActivating = 98
    WA_StaticContents = 5
    WA_StyledBackground = 93
    WA_StyleSheet = 97
    WA_TintedBackground = 82
    WA_TouchPadAcceptSingleTouchEvents = 123
    WA_TranslucentBackground = 120
    WA_TransparentForMouseEvents = 51
    WA_UnderMouse = 1
    WA_UpdatesDisabled = 10
    WA_WindowModified = 41
    WA_WindowPropagation = 80
    WA_WState_CompressKeys = 61
    WA_WState_ConfigPending = 64
    WA_WState_Created = 60
    WA_WState_ExplicitShowHide = 69
    WA_WState_Hidden = 16
    WA_WState_InPaintEvent = 62
    WA_WState_OwnSizePolicy = 68
    WA_WState_Polished = 66
    WA_WState_Reparented = 63
    WA_WState_Visible = 15
    WA_X11DoNotAcceptFocus = 132
    WA_X11NetWmWindowTypeCombo = 115
    WA_X11NetWmWindowTypeDesktop = 104
    WA_X11NetWmWindowTypeDialog = 110
    WA_X11NetWmWindowTypeDND = 116
    WA_X11NetWmWindowTypeDock = 105
    WA_X11NetWmWindowTypeDropDownMenu = 111
    WA_X11NetWmWindowTypeMenu = 107
    WA_X11NetWmWindowTypeNotification = 114
    WA_X11NetWmWindowTypePopupMenu = 112
    WA_X11NetWmWindowTypeSplash = 109
    WA_X11NetWmWindowTypeToolBar = 106
    WA_X11NetWmWindowTypeToolTip = 113
    WA_X11NetWmWindowTypeUtility = 108
    WA_X11OpenGLOverlay = 83
    Wednesday = 3
    WhatsThisCursor = 15
    WhatsThisRole = 5
    WheelFocus = 15
    white = 3
    Widget = 0
    WidgetShortcut = 0
    WidgetWithChildrenShortcut = 3
    WindingFill = 1
    Window = 1
    WindowActive = 8
    WindowCancelButtonHint = 1048576
    WindowCloseButtonHint = 134217728
    WindowContextHelpButtonHint = 65536
    WindowFullScreen = 4
    WindowMaximizeButtonHint = 32768
    WindowMaximized = 2
    WindowMinimizeButtonHint = 16384
    WindowMinimized = 1
    WindowMinMaxButtonsHint = 49152
    WindowModal = 1
    WindowNoState = 0
    WindowOkButtonHint = 524288
    WindowShadeButtonHint = 131072
    WindowShortcut = 1
    WindowSoftkeysRespondHint = -2147483648
    WindowSoftkeysVisibleHint = 1073741824
    WindowStaysOnBottomHint = 67108864
    WindowStaysOnTopHint = 262144
    WindowSystemMenuHint = 8192
    WindowTitleHint = 4096
    WindowType_Mask = 255
    X11BypassWindowManagerHint = 1024
    XAxis = 0
    XButton1 = 8
    XButton2 = 16
    YAxis = 1
    yellow = 12
    ZAxis = 2


class QTemporaryFile(QFile):

    """
    QTemporaryFile()
    QTemporaryFile(QString)
    QTemporaryFile(QObject)
    QTemporaryFile(QString, QObject)
    """

    def autoRemove(self):  # real signature unknown; restored from __doc__
        """ QTemporaryFile.autoRemove() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def createLocalFile(self, *__args):
        """
        QTemporaryFile.createLocalFile(QString) -> QTemporaryFile
        QTemporaryFile.createLocalFile(QFile) -> QTemporaryFile
        """
        return QTemporaryFile

    def fileEngine(self):  # real signature unknown; restored from __doc__
        """ QTemporaryFile.fileEngine() -> QAbstractFileEngine """
        return QAbstractFileEngine

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QTemporaryFile.fileName() -> QString """
        return QString

    def fileTemplate(self):  # real signature unknown; restored from __doc__
        """ QTemporaryFile.fileTemplate() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def open(self, QIODevice_OpenMode=None):
        """
        QTemporaryFile.open() -> bool
        QTemporaryFile.open(QIODevice.OpenMode) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def setAutoRemove(self, bool):
        """ QTemporaryFile.setAutoRemove(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFileTemplate(self, QString):
        """ QTemporaryFile.setFileTemplate(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QTextBoundaryFinder():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QTextBoundaryFinder()
    QTextBoundaryFinder(QTextBoundaryFinder)
    QTextBoundaryFinder(QTextBoundaryFinder.BoundaryType, QString)
    """

    def BoundaryReason(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def BoundaryReasons(self, *__args):
        """
        QTextBoundaryFinder.BoundaryReasons(QTextBoundaryFinder.BoundaryReasons)
        QTextBoundaryFinder.BoundaryReasons(int)
        QTextBoundaryFinder.BoundaryReasons()
        """
        pass

    def boundaryReasons(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.boundaryReasons() -> QTextBoundaryFinder.BoundaryReasons """
        pass

    def BoundaryType(self, *args, **kwargs):  # real signature unknown
        pass

    def isAtBoundary(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.isAtBoundary() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.isValid() -> bool """
        return False

    def position(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.position() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setPosition(self, p_int):
        """ QTextBoundaryFinder.setPosition(int) """
        pass

    def string(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.string() -> QString """
        return QString

    def toEnd(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.toEnd() """
        pass

    def toNextBoundary(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.toNextBoundary() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def toPreviousBoundary(self):
        """ QTextBoundaryFinder.toPreviousBoundary() -> int """
        return 0

    def toStart(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.toStart() """
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QTextBoundaryFinder.type() -> QTextBoundaryFinder.BoundaryType """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    EndWord = 2
    Grapheme = 0
    Line = 2
    NotAtBoundary = 0
    Sentence = 3
    StartWord = 1
    Word = 1


class QTextCodec():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def aliases(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.aliases() -> list-of-QByteArray """
        pass

    def availableCodecs(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.availableCodecs() -> list-of-QByteArray """
        pass

    def availableMibs(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.availableMibs() -> list-of-int """
        pass

    # real signature unknown; restored from __doc__
    def canEncode(self, QString):
        """ QTextCodec.canEncode(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def codecForCStrings(self):
        """ QTextCodec.codecForCStrings() -> QTextCodec """
        return QTextCodec

    # real signature unknown; restored from __doc__ with multiple overloads
    def codecForHtml(self, QByteArray, QTextCodec=None):
        """
        QTextCodec.codecForHtml(QByteArray) -> QTextCodec
        QTextCodec.codecForHtml(QByteArray, QTextCodec) -> QTextCodec
        """
        return QTextCodec

    def codecForLocale(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.codecForLocale() -> QTextCodec """
        return QTextCodec

    # real signature unknown; restored from __doc__
    def codecForMib(self, p_int):
        """ QTextCodec.codecForMib(int) -> QTextCodec """
        return QTextCodec

    # real signature unknown; restored from __doc__ with multiple overloads
    def codecForName(self, *__args):
        """
        QTextCodec.codecForName(QByteArray) -> QTextCodec
        QTextCodec.codecForName(str) -> QTextCodec
        """
        return QTextCodec

    def codecForTr(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.codecForTr() -> QTextCodec """
        return QTextCodec

    # real signature unknown; restored from __doc__ with multiple overloads
    def codecForUtfText(self, QByteArray, QTextCodec=None):
        """
        QTextCodec.codecForUtfText(QByteArray) -> QTextCodec
        QTextCodec.codecForUtfText(QByteArray, QTextCodec) -> QTextCodec
        """
        return QTextCodec

    def ConversionFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ConversionFlags(self, *__args):
        """
        QTextCodec.ConversionFlags(QTextCodec.ConversionFlags)
        QTextCodec.ConversionFlags(int)
        QTextCodec.ConversionFlags()
        """
        pass

    # real signature unknown; restored from __doc__
    def ConverterState(self, QTextCodec_ConversionFlags_flags=None):
        """ QTextCodec.ConverterState(QTextCodec.ConversionFlags flags=QTextCodec.DefaultConversion) """
        pass

    # real signature unknown; restored from __doc__
    def convertToUnicode(self, p_str, QTextCodec_ConverterState):
        """ QTextCodec.convertToUnicode(str, QTextCodec.ConverterState) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromUnicode(self, QString):
        """ QTextCodec.fromUnicode(QString) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def makeDecoder(self, QTextCodec_ConversionFlags=None):
        """
        QTextCodec.makeDecoder() -> QTextDecoder
        QTextCodec.makeDecoder(QTextCodec.ConversionFlags) -> QTextDecoder
        """
        return QTextDecoder

    # real signature unknown; restored from __doc__ with multiple overloads
    def makeEncoder(self, QTextCodec_ConversionFlags=None):
        """
        QTextCodec.makeEncoder() -> QTextEncoder
        QTextCodec.makeEncoder(QTextCodec.ConversionFlags) -> QTextEncoder
        """
        return QTextEncoder

    def mibEnum(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.mibEnum() -> int """
        return 0

    def name(self):  # real signature unknown; restored from __doc__
        """ QTextCodec.name() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def setCodecForCStrings(self, QTextCodec):
        """ QTextCodec.setCodecForCStrings(QTextCodec) """
        pass

    # real signature unknown; restored from __doc__
    def setCodecForLocale(self, QTextCodec):
        """ QTextCodec.setCodecForLocale(QTextCodec) """
        pass

    # real signature unknown; restored from __doc__
    def setCodecForTr(self, QTextCodec):
        """ QTextCodec.setCodecForTr(QTextCodec) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def toUnicode(self, *__args):
        """
        QTextCodec.toUnicode(QByteArray) -> QString
        QTextCodec.toUnicode(str) -> QString
        QTextCodec.toUnicode(str, QTextCodec.ConverterState state=None) -> QString
        """
        return QString

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    ConvertInvalidToNull = -2147483648
    DefaultConversion = 0
    IgnoreHeader = 1


class QTextDecoder():  # skipped bases: <type 'sip.wrapper'>

    """
    QTextDecoder(QTextCodec)
    QTextDecoder(QTextCodec, QTextCodec.ConversionFlags)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def toUnicode(self, *__args):
        """
        QTextDecoder.toUnicode(str) -> QString
        QTextDecoder.toUnicode(QString, str)
        QTextDecoder.toUnicode(QByteArray) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QTextCodec, QTextCodec_ConversionFlags=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QTextEncoder():  # skipped bases: <type 'sip.wrapper'>

    """
    QTextEncoder(QTextCodec)
    QTextEncoder(QTextCodec, QTextCodec.ConversionFlags)
    """
    # real signature unknown; restored from __doc__

    def fromUnicode(self, QString):
        """ QTextEncoder.fromUnicode(QString) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QTextCodec, QTextCodec_ConversionFlags=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QTextStream():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QTextStream()
    QTextStream(QIODevice)
    QTextStream(QString, QIODevice.OpenMode mode=QIODevice.ReadWrite)
    QTextStream(QByteArray, QIODevice.OpenMode mode=QIODevice.ReadWrite)
    """

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QTextStream.atEnd() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoDetectUnicode(self):
        """ QTextStream.autoDetectUnicode() -> bool """
        return False

    def codec(self):  # real signature unknown; restored from __doc__
        """ QTextStream.codec() -> QTextCodec """
        return QTextCodec

    def device(self):  # real signature unknown; restored from __doc__
        """ QTextStream.device() -> QIODevice """
        return QIODevice

    def fieldAlignment(self):  # real signature unknown; restored from __doc__
        """ QTextStream.fieldAlignment() -> QTextStream.FieldAlignment """
        pass

    def FieldAlignment(self, *args, **kwargs):  # real signature unknown
        pass

    def fieldWidth(self):  # real signature unknown; restored from __doc__
        """ QTextStream.fieldWidth() -> int """
        return 0

    def flush(self):  # real signature unknown; restored from __doc__
        """ QTextStream.flush() """
        pass

    # real signature unknown; restored from __doc__
    def generateByteOrderMark(self):
        """ QTextStream.generateByteOrderMark() -> bool """
        return False

    def integerBase(self):  # real signature unknown; restored from __doc__
        """ QTextStream.integerBase() -> int """
        return 0

    def locale(self):  # real signature unknown; restored from __doc__
        """ QTextStream.locale() -> QLocale """
        return QLocale

    def NumberFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def NumberFlags(self, *__args):
        """
        QTextStream.NumberFlags(QTextStream.NumberFlags)
        QTextStream.NumberFlags(int)
        QTextStream.NumberFlags()
        """
        pass

    def numberFlags(self):  # real signature unknown; restored from __doc__
        """ QTextStream.numberFlags() -> QTextStream.NumberFlags """
        pass

    def padChar(self):  # real signature unknown; restored from __doc__
        """ QTextStream.padChar() -> QChar """
        return QChar

    def pos(self):  # real signature unknown; restored from __doc__
        """ QTextStream.pos() -> int """
        return 0

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QTextStream.read(int) -> QString """
        return QString

    def readAll(self):  # real signature unknown; restored from __doc__
        """ QTextStream.readAll() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def readLine(self, int_maxLength=0):
        """ QTextStream.readLine(int maxLength=0) -> QString """
        return QString

    def RealNumberNotation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def realNumberNotation(self):
        """ QTextStream.realNumberNotation() -> QTextStream.RealNumberNotation """
        pass

    # real signature unknown; restored from __doc__
    def realNumberPrecision(self):
        """ QTextStream.realNumberPrecision() -> int """
        return 0

    def reset(self):  # real signature unknown; restored from __doc__
        """ QTextStream.reset() """
        pass

    def resetStatus(self):  # real signature unknown; restored from __doc__
        """ QTextStream.resetStatus() """
        pass

    def seek(self, p_int):  # real signature unknown; restored from __doc__
        """ QTextStream.seek(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setAutoDetectUnicode(self, bool):
        """ QTextStream.setAutoDetectUnicode(bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setCodec(self, *__args):
        """
        QTextStream.setCodec(QTextCodec)
        QTextStream.setCodec(str)
        """
        pass

    # real signature unknown; restored from __doc__
    def setDevice(self, QIODevice):
        """ QTextStream.setDevice(QIODevice) """
        pass

    # real signature unknown; restored from __doc__
    def setFieldAlignment(self, QTextStream_FieldAlignment):
        """ QTextStream.setFieldAlignment(QTextStream.FieldAlignment) """
        pass

    # real signature unknown; restored from __doc__
    def setFieldWidth(self, p_int):
        """ QTextStream.setFieldWidth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setGenerateByteOrderMark(self, bool):
        """ QTextStream.setGenerateByteOrderMark(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setIntegerBase(self, p_int):
        """ QTextStream.setIntegerBase(int) """
        pass

    # real signature unknown; restored from __doc__
    def setLocale(self, QLocale):
        """ QTextStream.setLocale(QLocale) """
        pass

    # real signature unknown; restored from __doc__
    def setNumberFlags(self, QTextStream_NumberFlags):
        """ QTextStream.setNumberFlags(QTextStream.NumberFlags) """
        pass

    # real signature unknown; restored from __doc__
    def setPadChar(self, QChar):
        """ QTextStream.setPadChar(QChar) """
        pass

    # real signature unknown; restored from __doc__
    def setRealNumberNotation(self, QTextStream_RealNumberNotation):
        """ QTextStream.setRealNumberNotation(QTextStream.RealNumberNotation) """
        pass

    # real signature unknown; restored from __doc__
    def setRealNumberPrecision(self, p_int):
        """ QTextStream.setRealNumberPrecision(int) """
        pass

    # real signature unknown; restored from __doc__
    def setStatus(self, QTextStream_Status):
        """ QTextStream.setStatus(QTextStream.Status) """
        pass

    # real signature unknown; restored from __doc__
    def setString(self, QString, QIODevice_OpenMode_mode=None):
        """ QTextStream.setString(QString, QIODevice.OpenMode mode=QIODevice.ReadWrite) """
        pass

    def skipWhiteSpace(self):  # real signature unknown; restored from __doc__
        """ QTextStream.skipWhiteSpace() """
        pass

    def status(self):  # real signature unknown; restored from __doc__
        """ QTextStream.status() -> QTextStream.Status """
        pass

    def Status(self, *args, **kwargs):  # real signature unknown
        pass

    def string(self):  # real signature unknown; restored from __doc__
        """ QTextStream.string() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    def __lshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lshift__(y) <==> x<<y """
        pass

    def __rlshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rlshift__(y) <==> y<<x """
        pass

    def __rrshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rrshift__(y) <==> y>>x """
        pass

    def __rshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rshift__(y) <==> x>>y """
        pass

    __weakref__ = property(lambda self: object())  # default

    AlignAccountingStyle = 3
    AlignCenter = 2
    AlignLeft = 0
    AlignRight = 1
    FixedNotation = 1
    ForcePoint = 2
    ForceSign = 4
    Ok = 0
    ReadCorruptData = 2
    ReadPastEnd = 1
    ScientificNotation = 2
    ShowBase = 1
    SmartNotation = 0
    UppercaseBase = 8
    UppercaseDigits = 16


class QTextStreamManipulator():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QThread(QObject):

    """ QThread(QObject parent=None) """

    def currentThread(self):  # real signature unknown; restored from __doc__
        """ QThread.currentThread() -> QThread """
        return QThread

    def currentThreadId(self):  # real signature unknown; restored from __doc__
        """ QThread.currentThreadId() -> int """
        return 0

    def exec_(self):  # real signature unknown; restored from __doc__
        """ QThread.exec_() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def exit(self, int_returnCode=0):
        """ QThread.exit(int returnCode=0) """
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QThread.finished[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def idealThreadCount(self):
        """ QThread.idealThreadCount() -> int """
        return 0

    def isFinished(self):  # real signature unknown; restored from __doc__
        """ QThread.isFinished() -> bool """
        return False

    def isRunning(self):  # real signature unknown; restored from __doc__
        """ QThread.isRunning() -> bool """
        return False

    def msleep(self, p_int):  # real signature unknown; restored from __doc__
        """ QThread.msleep(int) """
        pass

    def Priority(self, *args, **kwargs):  # real signature unknown
        pass

    def priority(self):  # real signature unknown; restored from __doc__
        """ QThread.priority() -> QThread.Priority """
        pass

    def quit(self):  # real signature unknown; restored from __doc__
        """ QThread.quit() """
        pass

    def run(self):  # real signature unknown; restored from __doc__
        """ QThread.run() """
        pass

    # real signature unknown; restored from __doc__
    def setPriority(self, QThread_Priority):
        """ QThread.setPriority(QThread.Priority) """
        pass

    # real signature unknown; restored from __doc__
    def setStackSize(self, p_int):
        """ QThread.setStackSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setTerminationEnabled(self, bool_enabled=True):
        """ QThread.setTerminationEnabled(bool enabled=True) """
        pass

    def sleep(self, p_int):  # real signature unknown; restored from __doc__
        """ QThread.sleep(int) """
        pass

    def stackSize(self):  # real signature unknown; restored from __doc__
        """ QThread.stackSize() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def start(self, QThread_Priority_priority=None):
        """ QThread.start(QThread.Priority priority=QThread.InheritPriority) """
        pass

    def started(self, *args, **kwargs):  # real signature unknown
        """ QThread.started[] [signal] """
        pass

    def terminate(self):  # real signature unknown; restored from __doc__
        """ QThread.terminate() """
        pass

    def terminated(self, *args, **kwargs):  # real signature unknown
        """ QThread.terminated[] [signal] """
        pass

    def usleep(self, p_int):  # real signature unknown; restored from __doc__
        """ QThread.usleep(int) """
        pass

    # real signature unknown; restored from __doc__
    def wait(self, int_msecs=None):
        """ QThread.wait(int msecs=ULONG_MAX) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def yieldCurrentThread(self):
        """ QThread.yieldCurrentThread() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    HighestPriority = 5
    HighPriority = 4
    IdlePriority = 0
    InheritPriority = 7
    LowestPriority = 1
    LowPriority = 2
    NormalPriority = 3
    TimeCriticalPriority = 6


class QThreadPool(QObject):

    """ QThreadPool(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def activeThreadCount(self):
        """ QThreadPool.activeThreadCount() -> int """
        return 0

    def expiryTimeout(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.expiryTimeout() -> int """
        return 0

    def globalInstance(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.globalInstance() -> QThreadPool """
        return QThreadPool

    def maxThreadCount(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.maxThreadCount() -> int """
        return 0

    def releaseThread(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.releaseThread() """
        pass

    def reserveThread(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.reserveThread() """
        pass

    # real signature unknown; restored from __doc__
    def setExpiryTimeout(self, p_int):
        """ QThreadPool.setExpiryTimeout(int) """
        pass

    # real signature unknown; restored from __doc__
    def setMaxThreadCount(self, p_int):
        """ QThreadPool.setMaxThreadCount(int) """
        pass

    # real signature unknown; restored from __doc__
    def start(self, QRunnable, int_priority=0):
        """ QThreadPool.start(QRunnable, int priority=0) """
        pass

    # real signature unknown; restored from __doc__
    def tryStart(self, QRunnable):
        """ QThreadPool.tryStart(QRunnable) -> bool """
        return False

    def waitForDone(self):  # real signature unknown; restored from __doc__
        """ QThreadPool.waitForDone() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QTime():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QTime()
    QTime(int, int, int second=0, int msec=0)
    QTime(QTime)
    """

    def addMSecs(self, p_int):  # real signature unknown; restored from __doc__
        """ QTime.addMSecs(int) -> QTime """
        return QTime

    def addSecs(self, p_int):  # real signature unknown; restored from __doc__
        """ QTime.addSecs(int) -> QTime """
        return QTime

    def currentTime(self):  # real signature unknown; restored from __doc__
        """ QTime.currentTime() -> QTime """
        return QTime

    def elapsed(self):  # real signature unknown; restored from __doc__
        """ QTime.elapsed() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def fromString(self, QString, *__args):
        """
        QTime.fromString(QString, Qt.DateFormat format=Qt.TextDate) -> QTime
        QTime.fromString(QString, QString) -> QTime
        """
        return QTime

    def hour(self):  # real signature unknown; restored from __doc__
        """ QTime.hour() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QTime.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def isValid(self, p_int=None, p_int_1=None, p_int_2=None, int_msec=0):
        """
        QTime.isValid() -> bool
        QTime.isValid(int, int, int, int msec=0) -> bool
        """
        return False

    def minute(self):  # real signature unknown; restored from __doc__
        """ QTime.minute() -> int """
        return 0

    def msec(self):  # real signature unknown; restored from __doc__
        """ QTime.msec() -> int """
        return 0

    def msecsTo(self, QTime):  # real signature unknown; restored from __doc__
        """ QTime.msecsTo(QTime) -> int """
        return 0

    def restart(self):  # real signature unknown; restored from __doc__
        """ QTime.restart() -> int """
        return 0

    def second(self):  # real signature unknown; restored from __doc__
        """ QTime.second() -> int """
        return 0

    def secsTo(self, QTime):  # real signature unknown; restored from __doc__
        """ QTime.secsTo(QTime) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setHMS(self, p_int, p_int_1, p_int_2, int_msec=0):
        """ QTime.setHMS(int, int, int, int msec=0) -> bool """
        return False

    def start(self):  # real signature unknown; restored from __doc__
        """ QTime.start() """
        pass

    def toPyTime(self):  # real signature unknown; restored from __doc__
        """ QTime.toPyTime() -> datetime.time """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def toString(self, *__args):
        """
        QTime.toString(Qt.DateFormat format=Qt.TextDate) -> QString
        QTime.toString(QString) -> QString
        """
        return QString

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

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default


class QTimeLine(QObject):

    """ QTimeLine(int duration=1000, QObject parent=None) """

    def currentFrame(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.currentFrame() -> int """
        return 0

    def currentTime(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.currentTime() -> int """
        return 0

    def currentValue(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.currentValue() -> float """
        return 0.0

    def CurveShape(self, *args, **kwargs):  # real signature unknown
        pass

    def curveShape(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.curveShape() -> QTimeLine.CurveShape """
        pass

    def Direction(self, *args, **kwargs):  # real signature unknown
        pass

    def direction(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.direction() -> QTimeLine.Direction """
        pass

    def duration(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.duration() -> int """
        return 0

    def easingCurve(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.easingCurve() -> QEasingCurve """
        return QEasingCurve

    def endFrame(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.endFrame() -> int """
        return 0

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QTimeLine.finished[] [signal] """
        pass

    def frameChanged(self, *args, **kwargs):  # real signature unknown
        """ QTimeLine.frameChanged[int] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def frameForTime(self, p_int):
        """ QTimeLine.frameForTime(int) -> int """
        return 0

    def loopCount(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.loopCount() -> int """
        return 0

    def resume(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.resume() """
        pass

    # real signature unknown; restored from __doc__
    def setCurrentTime(self, p_int):
        """ QTimeLine.setCurrentTime(int) """
        pass

    # real signature unknown; restored from __doc__
    def setCurveShape(self, QTimeLine_CurveShape):
        """ QTimeLine.setCurveShape(QTimeLine.CurveShape) """
        pass

    # real signature unknown; restored from __doc__
    def setDirection(self, QTimeLine_Direction):
        """ QTimeLine.setDirection(QTimeLine.Direction) """
        pass

    # real signature unknown; restored from __doc__
    def setDuration(self, p_int):
        """ QTimeLine.setDuration(int) """
        pass

    # real signature unknown; restored from __doc__
    def setEasingCurve(self, QEasingCurve):
        """ QTimeLine.setEasingCurve(QEasingCurve) """
        pass

    # real signature unknown; restored from __doc__
    def setEndFrame(self, p_int):
        """ QTimeLine.setEndFrame(int) """
        pass

    # real signature unknown; restored from __doc__
    def setFrameRange(self, p_int, p_int_1):
        """ QTimeLine.setFrameRange(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setLoopCount(self, p_int):
        """ QTimeLine.setLoopCount(int) """
        pass

    def setPaused(self, bool):  # real signature unknown; restored from __doc__
        """ QTimeLine.setPaused(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setStartFrame(self, p_int):
        """ QTimeLine.setStartFrame(int) """
        pass

    # real signature unknown; restored from __doc__
    def setUpdateInterval(self, p_int):
        """ QTimeLine.setUpdateInterval(int) """
        pass

    def start(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.start() """
        pass

    def startFrame(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.startFrame() -> int """
        return 0

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.state() -> QTimeLine.State """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QTimeLine.stateChanged[QTimeLine.State] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.stop() """
        pass

    # real signature unknown; restored from __doc__
    def timerEvent(self, QTimerEvent):
        """ QTimeLine.timerEvent(QTimerEvent) """
        pass

    def toggleDirection(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.toggleDirection() """
        pass

    def updateInterval(self):  # real signature unknown; restored from __doc__
        """ QTimeLine.updateInterval() -> int """
        return 0

    def valueChanged(self, *args, **kwargs):  # real signature unknown
        """ QTimeLine.valueChanged[float] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def valueForTime(self, p_int):
        """ QTimeLine.valueForTime(int) -> float """
        return 0.0

    # real signature unknown; restored from __doc__
    def __init__(self, int_duration=1000, QObject_parent=None):
        pass

    Backward = 1
    CosineCurve = 5
    EaseInCurve = 0
    EaseInOutCurve = 2
    EaseOutCurve = 1
    Forward = 0
    LinearCurve = 3
    NotRunning = 0
    Paused = 1
    Running = 2
    SineCurve = 4


class QTimer(QObject):

    """ QTimer(QObject parent=None) """

    def interval(self):  # real signature unknown; restored from __doc__
        """ QTimer.interval() -> int """
        return 0

    def isActive(self):  # real signature unknown; restored from __doc__
        """ QTimer.isActive() -> bool """
        return False

    def isSingleShot(self):  # real signature unknown; restored from __doc__
        """ QTimer.isSingleShot() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setInterval(self, p_int):
        """ QTimer.setInterval(int) """
        pass

    # real signature unknown; restored from __doc__
    def setSingleShot(self, bool):
        """ QTimer.setSingleShot(bool) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def singleShot(self, p_int, *__args):
        """
        QTimer.singleShot(int, QObject, SLOT())
        QTimer.singleShot(int, callable)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def start(self, p_int=None):
        """
        QTimer.start(int)
        QTimer.start()
        """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QTimer.stop() """
        pass

    def timeout(self, *args, **kwargs):  # real signature unknown
        """ QTimer.timeout[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def timerEvent(self, QTimerEvent):
        """ QTimer.timerEvent(QTimerEvent) """
        pass

    def timerId(self):  # real signature unknown; restored from __doc__
        """ QTimer.timerId() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QTimerEvent(QEvent):

    """
    QTimerEvent(int)
    QTimerEvent(QTimerEvent)
    """

    def timerId(self):  # real signature unknown; restored from __doc__
        """ QTimerEvent.timerId() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QtMsgType(int):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    __dict__ = None  # (!) real value is ''


class QTranslator(QObject):

    """ QTranslator(QObject parent=None) """

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QTranslator.isEmpty() -> bool """
        return False

    # real signature unknown; NOTE: unreliably restored from __doc__
    def load(self, QString, QString_directory=None, *args, **kwargs):
        """ QTranslator.load(QString, QString directory=QString(), QString searchDelimiters=QString(), QString suffix=QString()) -> bool """
        pass

    # real signature unknown; restored from __doc__
    def loadFromData(self, p_str):
        """ QTranslator.loadFromData(str) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def translate(self, p_str, p_str_1, *__args):
        """
        QTranslator.translate(str, str, str disambiguation=None) -> QString
        QTranslator.translate(str, str, str, int) -> QString
        """
        return QString

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QUrl():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QUrl()
    QUrl(QString)
    QUrl(QUrl)
    QUrl(QString, QUrl.ParsingMode)
    """
    # real signature unknown; restored from __doc__

    def addEncodedQueryItem(self, QByteArray, QByteArray_1):
        """ QUrl.addEncodedQueryItem(QByteArray, QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def addQueryItem(self, QString, QString_1):
        """ QUrl.addQueryItem(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def allEncodedQueryItemValues(self, QByteArray):
        """ QUrl.allEncodedQueryItemValues(QByteArray) -> list-of-QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def allQueryItemValues(self, QString):
        """ QUrl.allQueryItemValues(QString) -> QStringList """
        return QStringList

    def authority(self):  # real signature unknown; restored from __doc__
        """ QUrl.authority() -> QString """
        return QString

    def clear(self):  # real signature unknown; restored from __doc__
        """ QUrl.clear() """
        pass

    def detach(self):  # real signature unknown; restored from __doc__
        """ QUrl.detach() """
        pass

    def encodedFragment(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedFragment() -> QByteArray """
        return QByteArray

    def encodedHost(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedHost() -> QByteArray """
        return QByteArray

    def encodedPassword(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedPassword() -> QByteArray """
        return QByteArray

    def encodedPath(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedPath() -> QByteArray """
        return QByteArray

    def encodedQuery(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedQuery() -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def encodedQueryItems(self):
        """ QUrl.encodedQueryItems() -> list-of-tuple-of-QByteArray-QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def encodedQueryItemValue(self, QByteArray):
        """ QUrl.encodedQueryItemValue(QByteArray) -> QByteArray """
        return QByteArray

    def encodedUserName(self):  # real signature unknown; restored from __doc__
        """ QUrl.encodedUserName() -> QByteArray """
        return QByteArray

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QUrl.errorString() -> QString """
        return QString

    def FormattingOption(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def FormattingOptions(self, *__args):
        """
        QUrl.FormattingOptions(QUrl.FormattingOptions)
        QUrl.FormattingOptions(int)
        QUrl.FormattingOptions()
        """
        pass

    def fragment(self):  # real signature unknown; restored from __doc__
        """ QUrl.fragment() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromAce(self, QByteArray):
        """ QUrl.fromAce(QByteArray) -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def fromEncoded(self, QByteArray, QUrl_ParsingMode=None):
        """
        QUrl.fromEncoded(QByteArray) -> QUrl
        QUrl.fromEncoded(QByteArray, QUrl.ParsingMode) -> QUrl
        """
        return QUrl

    # real signature unknown; restored from __doc__
    def fromLocalFile(self, QString):
        """ QUrl.fromLocalFile(QString) -> QUrl """
        return QUrl

    # real signature unknown; restored from __doc__
    def fromPercentEncoding(self, QByteArray):
        """ QUrl.fromPercentEncoding(QByteArray) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromPunycode(self, QByteArray):
        """ QUrl.fromPunycode(QByteArray) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def fromUserInput(self, QString):
        """ QUrl.fromUserInput(QString) -> QUrl """
        return QUrl

    # real signature unknown; restored from __doc__
    def hasEncodedQueryItem(self, QByteArray):
        """ QUrl.hasEncodedQueryItem(QByteArray) -> bool """
        return False

    def hasFragment(self):  # real signature unknown; restored from __doc__
        """ QUrl.hasFragment() -> bool """
        return False

    def hasQuery(self):  # real signature unknown; restored from __doc__
        """ QUrl.hasQuery() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def hasQueryItem(self, QString):
        """ QUrl.hasQueryItem(QString) -> bool """
        return False

    def host(self):  # real signature unknown; restored from __doc__
        """ QUrl.host() -> QString """
        return QString

    def idnWhitelist(self):  # real signature unknown; restored from __doc__
        """ QUrl.idnWhitelist() -> QStringList """
        return QStringList

    def isDetached(self):  # real signature unknown; restored from __doc__
        """ QUrl.isDetached() -> bool """
        return False

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QUrl.isEmpty() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isParentOf(self, QUrl):
        """ QUrl.isParentOf(QUrl) -> bool """
        return False

    def isRelative(self):  # real signature unknown; restored from __doc__
        """ QUrl.isRelative() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QUrl.isValid() -> bool """
        return False

    def ParsingMode(self, *args, **kwargs):  # real signature unknown
        pass

    def password(self):  # real signature unknown; restored from __doc__
        """ QUrl.password() -> QString """
        return QString

    def path(self):  # real signature unknown; restored from __doc__
        """ QUrl.path() -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def port(self, p_int=None):
        """
        QUrl.port() -> int
        QUrl.port(int) -> int
        """
        return 0

    def queryItems(self):  # real signature unknown; restored from __doc__
        """ QUrl.queryItems() -> list-of-tuple-of-QString-QString """
        pass

    # real signature unknown; restored from __doc__
    def queryItemValue(self, QString):
        """ QUrl.queryItemValue(QString) -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def queryPairDelimiter(self):
        """ QUrl.queryPairDelimiter() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def queryValueDelimiter(self):
        """ QUrl.queryValueDelimiter() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def removeAllEncodedQueryItems(self, QByteArray):
        """ QUrl.removeAllEncodedQueryItems(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def removeAllQueryItems(self, QString):
        """ QUrl.removeAllQueryItems(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeEncodedQueryItem(self, QByteArray):
        """ QUrl.removeEncodedQueryItem(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def removeQueryItem(self, QString):
        """ QUrl.removeQueryItem(QString) """
        pass

    def resolved(self, QUrl):  # real signature unknown; restored from __doc__
        """ QUrl.resolved(QUrl) -> QUrl """
        return QUrl

    def scheme(self):  # real signature unknown; restored from __doc__
        """ QUrl.scheme() -> QString """
        return QString

    # real signature unknown; restored from __doc__
    def setAuthority(self, QString):
        """ QUrl.setAuthority(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedFragment(self, QByteArray):
        """ QUrl.setEncodedFragment(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedHost(self, QByteArray):
        """ QUrl.setEncodedHost(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedPassword(self, QByteArray):
        """ QUrl.setEncodedPassword(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedPath(self, QByteArray):
        """ QUrl.setEncodedPath(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedQuery(self, QByteArray):
        """ QUrl.setEncodedQuery(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedQueryItems(self, list_of_tuple_of_QByteArray_QByteArray):
        """ QUrl.setEncodedQueryItems(list-of-tuple-of-QByteArray-QByteArray) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setEncodedUrl(self, QByteArray, QUrl_ParsingMode=None):
        """
        QUrl.setEncodedUrl(QByteArray)
        QUrl.setEncodedUrl(QByteArray, QUrl.ParsingMode)
        """
        pass

    # real signature unknown; restored from __doc__
    def setEncodedUserName(self, QByteArray):
        """ QUrl.setEncodedUserName(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setFragment(self, QString):
        """ QUrl.setFragment(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setHost(self, QString):
        """ QUrl.setHost(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setIdnWhitelist(self, QStringList):
        """ QUrl.setIdnWhitelist(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setPassword(self, QString):
        """ QUrl.setPassword(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPath(self, QString):
        """ QUrl.setPath(QString) """
        pass

    def setPort(self, p_int):  # real signature unknown; restored from __doc__
        """ QUrl.setPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setQueryDelimiters(self, p_str, p_str_1):
        """ QUrl.setQueryDelimiters(str, str) """
        pass

    # real signature unknown; restored from __doc__
    def setQueryItems(self, list_of_tuple_of_QString_QString):
        """ QUrl.setQueryItems(list-of-tuple-of-QString-QString) """
        pass

    # real signature unknown; restored from __doc__
    def setScheme(self, QString):
        """ QUrl.setScheme(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setUrl(self, QString, QUrl_ParsingMode=None):
        """
        QUrl.setUrl(QString)
        QUrl.setUrl(QString, QUrl.ParsingMode)
        """
        pass

    # real signature unknown; restored from __doc__
    def setUserInfo(self, QString):
        """ QUrl.setUserInfo(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setUserName(self, QString):
        """ QUrl.setUserName(QString) """
        pass

    def toAce(self, QString):  # real signature unknown; restored from __doc__
        """ QUrl.toAce(QString) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def toEncoded(self, QUrl_FormattingOptions_options=None):
        """ QUrl.toEncoded(QUrl.FormattingOptions options=QUrl.None) -> QByteArray """
        return QByteArray

    def toLocalFile(self):  # real signature unknown; restored from __doc__
        """ QUrl.toLocalFile() -> QString """
        return QString

    # real signature unknown; NOTE: unreliably restored from __doc__
    def toPercentEncoding(self, QString, QByteArray_exclude=None, *args, **kwargs):
        """ QUrl.toPercentEncoding(QString, QByteArray exclude=QByteArray(), QByteArray include=QByteArray()) -> QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def toPunycode(self, QString):
        """ QUrl.toPunycode(QString) -> QByteArray """
        return QByteArray

    # real signature unknown; restored from __doc__
    def toString(self, QUrl_FormattingOptions_options=None):
        """ QUrl.toString(QUrl.FormattingOptions options=QUrl.None) -> QString """
        return QString

    def userInfo(self):  # real signature unknown; restored from __doc__
        """ QUrl.userInfo() -> QString """
        return QString

    def userName(self):  # real signature unknown; restored from __doc__
        """ QUrl.userName() -> QString """
        return QString

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

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    None = 0
    RemoveAuthority = 30
    RemoveFragment = 128
    RemovePassword = 2
    RemovePath = 32
    RemovePort = 8
    RemoveQuery = 64
    RemoveScheme = 1
    RemoveUserInfo = 6
    StrictMode = 1
    StripTrailingSlash = 65536
    TolerantMode = 0


class QUuid():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QUuid()
    QUuid(int, int, int, str, str, str, str, str, str, str, str)
    QUuid(QString)
    QUuid(QUuid)
    """

    def createUuid(self):  # real signature unknown; restored from __doc__
        """ QUuid.createUuid() -> QUuid """
        return QUuid

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QUuid.isNull() -> bool """
        return False

    def toString(self):  # real signature unknown; restored from __doc__
        """ QUuid.toString() -> QString """
        return QString

    def variant(self):  # real signature unknown; restored from __doc__
        """ QUuid.variant() -> QUuid.Variant """
        pass

    def Variant(self, *args, **kwargs):  # real signature unknown
        pass

    def version(self):  # real signature unknown; restored from __doc__
        """ QUuid.version() -> QUuid.Version """
        pass

    def Version(self, *args, **kwargs):  # real signature unknown
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

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    __weakref__ = property(lambda self: object())  # default

    DCE = 2
    EmbeddedPOSIX = 2
    Microsoft = 6
    Name = 3
    NCS = 0
    Random = 4
    Reserved = 7
    Time = 1
    VarUnknown = -1
    VerUnknown = -1


class QVariant():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QVariant()
    QVariant(Type)
    QVariant(int, sip.voidptr)
    QVariant(QVariant)
    QVariant(object)
    """

    # real signature unknown; restored from __doc__
    def canConvert(self, Type):
        """ QVariant.canConvert(Type) -> bool """
        return False

    def clear(self):  # real signature unknown; restored from __doc__
        """ QVariant.clear() """
        pass

    def convert(self, Type):  # real signature unknown; restored from __doc__
        """ QVariant.convert(Type) -> bool """
        return False

    def data(self):  # real signature unknown; restored from __doc__
        """ QVariant.data() -> sip.voidptr """
        pass

    def detach(self):  # real signature unknown; restored from __doc__
        """ QVariant.detach() """
        pass

    # real signature unknown; restored from __doc__
    def fromList(self, list_of_QVariant):
        """ QVariant.fromList(list-of-QVariant) -> QVariant """
        return QVariant

    # real signature unknown; restored from __doc__
    def fromMap(self, dict_of_QString_QVariant):
        """ QVariant.fromMap(dict-of-QString-QVariant) -> QVariant """
        return QVariant

    def isDetached(self):  # real signature unknown; restored from __doc__
        """ QVariant.isDetached() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QVariant.isNull() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QVariant.isValid() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def load(self, QDataStream):
        """ QVariant.load(QDataStream) """
        pass

    # real signature unknown; restored from __doc__
    def nameToType(self, p_str):
        """ QVariant.nameToType(str) -> Type """
        pass

    # real signature unknown; restored from __doc__
    def save(self, QDataStream):
        """ QVariant.save(QDataStream) """
        pass

    def toBitArray(self):  # real signature unknown; restored from __doc__
        """ QVariant.toBitArray() -> QBitArray """
        return QBitArray

    def toBool(self):  # real signature unknown; restored from __doc__
        """ QVariant.toBool() -> bool """
        return False

    def toByteArray(self):  # real signature unknown; restored from __doc__
        """ QVariant.toByteArray() -> QByteArray """
        return QByteArray

    def toChar(self):  # real signature unknown; restored from __doc__
        """ QVariant.toChar() -> QChar """
        return QChar

    def toDate(self):  # real signature unknown; restored from __doc__
        """ QVariant.toDate() -> QDate """
        return QDate

    def toDateTime(self):  # real signature unknown; restored from __doc__
        """ QVariant.toDateTime() -> QDateTime """
        return QDateTime

    def toDouble(self):  # real signature unknown; restored from __doc__
        """ QVariant.toDouble() -> (float, bool) """
        pass

    def toEasingCurve(self):  # real signature unknown; restored from __doc__
        """ QVariant.toEasingCurve() -> QEasingCurve """
        return QEasingCurve

    def toFloat(self):  # real signature unknown; restored from __doc__
        """ QVariant.toFloat() -> (float, bool) """
        pass

    def toHash(self):  # real signature unknown; restored from __doc__
        """ QVariant.toHash() -> dict-of-QString-QVariant """
        pass

    def toInt(self):  # real signature unknown; restored from __doc__
        """ QVariant.toInt() -> (int, bool) """
        pass

    def toLine(self):  # real signature unknown; restored from __doc__
        """ QVariant.toLine() -> QLine """
        return QLine

    def toLineF(self):  # real signature unknown; restored from __doc__
        """ QVariant.toLineF() -> QLineF """
        return QLineF

    def toList(self):  # real signature unknown; restored from __doc__
        """ QVariant.toList() -> list-of-QVariant """
        pass

    def toLocale(self):  # real signature unknown; restored from __doc__
        """ QVariant.toLocale() -> QLocale """
        return QLocale

    def toLongLong(self):  # real signature unknown; restored from __doc__
        """ QVariant.toLongLong() -> (int, bool) """
        pass

    def toMap(self):  # real signature unknown; restored from __doc__
        """ QVariant.toMap() -> dict-of-QString-QVariant """
        pass

    def toPoint(self):  # real signature unknown; restored from __doc__
        """ QVariant.toPoint() -> QPoint """
        return QPoint

    def toPointF(self):  # real signature unknown; restored from __doc__
        """ QVariant.toPointF() -> QPointF """
        return QPointF

    def toPyObject(self):  # real signature unknown; restored from __doc__
        """ QVariant.toPyObject() -> object """
        return object()

    def toReal(self):  # real signature unknown; restored from __doc__
        """ QVariant.toReal() -> (float, bool) """
        pass

    def toRect(self):  # real signature unknown; restored from __doc__
        """ QVariant.toRect() -> QRect """
        return QRect

    def toRectF(self):  # real signature unknown; restored from __doc__
        """ QVariant.toRectF() -> QRectF """
        return QRectF

    def toRegExp(self):  # real signature unknown; restored from __doc__
        """ QVariant.toRegExp() -> QRegExp """
        return QRegExp

    def toSize(self):  # real signature unknown; restored from __doc__
        """ QVariant.toSize() -> QSize """
        return QSize

    def toSizeF(self):  # real signature unknown; restored from __doc__
        """ QVariant.toSizeF() -> QSizeF """
        return QSizeF

    def toString(self):  # real signature unknown; restored from __doc__
        """ QVariant.toString() -> QString """
        return QString

    def toStringList(self):  # real signature unknown; restored from __doc__
        """ QVariant.toStringList() -> QStringList """
        return QStringList

    def toTime(self):  # real signature unknown; restored from __doc__
        """ QVariant.toTime() -> QTime """
        return QTime

    def toUInt(self):  # real signature unknown; restored from __doc__
        """ QVariant.toUInt() -> (int, bool) """
        pass

    def toULongLong(self):  # real signature unknown; restored from __doc__
        """ QVariant.toULongLong() -> (int, bool) """
        pass

    def toUrl(self):  # real signature unknown; restored from __doc__
        """ QVariant.toUrl() -> QUrl """
        return QUrl

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QVariant.type() -> Type """
        pass

    def typeName(self):  # real signature unknown; restored from __doc__
        """ QVariant.typeName() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def typeToName(self, Type):
        """ QVariant.typeToName(Type) -> str """
        return ""

    def userType(self):  # real signature unknown; restored from __doc__
        """ QVariant.userType() -> int """
        return 0

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

    BitArray = 13
    Bitmap = 73
    Bool = 1
    Brush = 66
    ByteArray = 12
    Char = 7
    Color = 67
    Cursor = 74
    Date = 14
    DateTime = 16
    Double = 6
    EasingCurve = 29
    Font = 64
    Hash = 28
    Icon = 69
    Image = 70
    Int = 2
    Invalid = 0
    KeySequence = 76
    Line = 23
    LineF = 24
    List = 9
    Locale = 18
    LongLong = 4
    Map = 8
    Matrix = 80
    Matrix4x4 = 82
    Palette = 68
    Pen = 77
    Pixmap = 65
    Point = 25
    PointF = 26
    Polygon = 71
    Quaternion = 86
    Rect = 19
    RectF = 20
    RegExp = 27
    Region = 72
    Size = 21
    SizeF = 22
    SizePolicy = 75
    String = 10
    StringList = 11
    TextFormat = 79
    TextLength = 78
    Time = 15
    Transform = 81
    UInt = 3
    ULongLong = 5
    Url = 17
    UserType = 127
    Vector2D = 83
    Vector3D = 84
    Vector4D = 85


class QWaitCondition():  # skipped bases: <type 'sip.simplewrapper'>

    """ QWaitCondition() """
    # real signature unknown; restored from __doc__ with multiple overloads

    def wait(self, *__args):
        """
        QWaitCondition.wait(QMutex, int msecs=ULONG_MAX) -> bool
        QWaitCondition.wait(QReadWriteLock, int msecs=ULONG_MAX) -> bool
        """
        return False

    def wakeAll(self):  # real signature unknown; restored from __doc__
        """ QWaitCondition.wakeAll() """
        pass

    def wakeOne(self):  # real signature unknown; restored from __doc__
        """ QWaitCondition.wakeOne() """
        pass

    def __init__(self):  # real signature unknown; restored from __doc__
        pass

    __weakref__ = property(lambda self: object())  # default


class QWriteLocker():  # skipped bases: <type 'sip.simplewrapper'>

    """ QWriteLocker(QReadWriteLock) """

    def readWriteLock(self):  # real signature unknown; restored from __doc__
        """ QWriteLocker.readWriteLock() -> QReadWriteLock """
        return QReadWriteLock

    def relock(self):  # real signature unknown; restored from __doc__
        """ QWriteLocker.relock() """
        pass

    def unlock(self):  # real signature unknown; restored from __doc__
        """ QWriteLocker.unlock() """
        pass

    def __enter__(self):  # real signature unknown; restored from __doc__
        """ QWriteLocker.__enter__() -> object """
        return object()

    # real signature unknown; restored from __doc__
    def __exit__(self, p_object, p_object_1, p_object_2):
        """ QWriteLocker.__exit__(object, object, object) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QReadWriteLock):
        pass

    __weakref__ = property(lambda self: object())  # default


class QXmlStreamAttribute():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlStreamAttribute()
    QXmlStreamAttribute(QString, QString)
    QXmlStreamAttribute(QString, QString, QString)
    QXmlStreamAttribute(QXmlStreamAttribute)
    """

    def isDefault(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.isDefault() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.name() -> QStringRef """
        return QStringRef

    def namespaceUri(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.namespaceUri() -> QStringRef """
        return QStringRef

    def prefix(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.prefix() -> QStringRef """
        return QStringRef

    def qualifiedName(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.qualifiedName() -> QStringRef """
        return QStringRef

    def value(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttribute.value() -> QStringRef """
        return QStringRef

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


class QXmlStreamAttributes():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlStreamAttributes()
    QXmlStreamAttributes(QXmlStreamAttributes)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def append(self, *__args):
        """
        QXmlStreamAttributes.append(QString, QString, QString)
        QXmlStreamAttributes.append(QString, QString)
        QXmlStreamAttributes.append(QXmlStreamAttribute)
        """
        pass

    def at(self, p_int):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.at(int) -> QXmlStreamAttribute """
        return QXmlStreamAttribute

    def clear(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.clear() """
        pass

    # real signature unknown; restored from __doc__
    def contains(self, QXmlStreamAttribute):
        """ QXmlStreamAttributes.contains(QXmlStreamAttribute) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def count(self, QXmlStreamAttribute=None):
        """
        QXmlStreamAttributes.count(QXmlStreamAttribute) -> int
        QXmlStreamAttributes.count() -> int
        """
        return 0

    def data(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.data() -> sip.voidptr """
        pass

    # real signature unknown; restored from __doc__
    def fill(self, QXmlStreamAttribute, int_size=-1):
        """ QXmlStreamAttributes.fill(QXmlStreamAttribute, int size=-1) """
        pass

    def first(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.first() -> QXmlStreamAttribute """
        return QXmlStreamAttribute

    # real signature unknown; restored from __doc__ with multiple overloads
    def hasAttribute(self, QString, QString_1=None):
        """
        QXmlStreamAttributes.hasAttribute(QString) -> bool
        QXmlStreamAttributes.hasAttribute(QString, QString) -> bool
        """
        return False

    # real signature unknown; restored from __doc__
    def indexOf(self, QXmlStreamAttribute, int_from=0):
        """ QXmlStreamAttributes.indexOf(QXmlStreamAttribute, int from=0) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def insert(self, p_int, QXmlStreamAttribute):
        """ QXmlStreamAttributes.insert(int, QXmlStreamAttribute) """
        pass

    def isEmpty(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.isEmpty() -> bool """
        return False

    def last(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.last() -> QXmlStreamAttribute """
        return QXmlStreamAttribute

    # real signature unknown; restored from __doc__
    def lastIndexOf(self, QXmlStreamAttribute, int_from=-1):
        """ QXmlStreamAttributes.lastIndexOf(QXmlStreamAttribute, int from=-1) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def prepend(self, QXmlStreamAttribute):
        """ QXmlStreamAttributes.prepend(QXmlStreamAttribute) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def remove(self, p_int, p_int_1=None):
        """
        QXmlStreamAttributes.remove(int)
        QXmlStreamAttributes.remove(int, int)
        """
        pass

    # real signature unknown; restored from __doc__
    def replace(self, p_int, QXmlStreamAttribute):
        """ QXmlStreamAttributes.replace(int, QXmlStreamAttribute) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamAttributes.size() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def value(self, QString, QString_1=None):
        """
        QXmlStreamAttributes.value(QString, QString) -> QStringRef
        QXmlStreamAttributes.value(QString) -> QStringRef
        """
        return QStringRef

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+=y """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QXmlStreamAttributes=None):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
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

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QXmlStreamEntityDeclaration():

    """
    QXmlStreamEntityDeclaration()
    QXmlStreamEntityDeclaration(QXmlStreamEntityDeclaration)
    """

    def name(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamEntityDeclaration.name() -> QStringRef """
        return QStringRef

    def notationName(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamEntityDeclaration.notationName() -> QStringRef """
        return QStringRef

    def publicId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamEntityDeclaration.publicId() -> QStringRef """
        return QStringRef

    def systemId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamEntityDeclaration.systemId() -> QStringRef """
        return QStringRef

    def value(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamEntityDeclaration.value() -> QStringRef """
        return QStringRef

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
    def __init__(self, QXmlStreamEntityDeclaration=None):
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


class QXmlStreamEntityResolver():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlStreamEntityResolver()
    QXmlStreamEntityResolver(QXmlStreamEntityResolver)
    """
    # real signature unknown; restored from __doc__

    def resolveUndeclaredEntity(self, QString):
        """ QXmlStreamEntityResolver.resolveUndeclaredEntity(QString) -> QString """
        return QString

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QXmlStreamEntityResolver=None):
        pass

    __weakref__ = property(lambda self: object())  # default


# skipped bases: <type 'sip.simplewrapper'>
class QXmlStreamNamespaceDeclaration():

    """
    QXmlStreamNamespaceDeclaration()
    QXmlStreamNamespaceDeclaration(QXmlStreamNamespaceDeclaration)
    QXmlStreamNamespaceDeclaration(QString, QString)
    """

    def namespaceUri(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamNamespaceDeclaration.namespaceUri() -> QStringRef """
        return QStringRef

    def prefix(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamNamespaceDeclaration.prefix() -> QStringRef """
        return QStringRef

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


# skipped bases: <type 'sip.simplewrapper'>
class QXmlStreamNotationDeclaration():

    """
    QXmlStreamNotationDeclaration()
    QXmlStreamNotationDeclaration(QXmlStreamNotationDeclaration)
    """

    def name(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamNotationDeclaration.name() -> QStringRef """
        return QStringRef

    def publicId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamNotationDeclaration.publicId() -> QStringRef """
        return QStringRef

    def systemId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamNotationDeclaration.systemId() -> QStringRef """
        return QStringRef

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
    def __init__(self, QXmlStreamNotationDeclaration=None):
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


class QXmlStreamReader():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlStreamReader()
    QXmlStreamReader(QIODevice)
    QXmlStreamReader(QByteArray)
    QXmlStreamReader(QString)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def addData(self, *__args):
        """
        QXmlStreamReader.addData(QByteArray)
        QXmlStreamReader.addData(QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def addExtraNamespaceDeclaration(self, QXmlStreamNamespaceDeclaration):
        """ QXmlStreamReader.addExtraNamespaceDeclaration(QXmlStreamNamespaceDeclaration) """
        pass

    # real signature unknown; restored from __doc__
    def addExtraNamespaceDeclarations(self, list_of_QXmlStreamNamespaceDeclaration):
        """ QXmlStreamReader.addExtraNamespaceDeclarations(list-of-QXmlStreamNamespaceDeclaration) """
        pass

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.atEnd() -> bool """
        return False

    def attributes(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.attributes() -> QXmlStreamAttributes """
        return QXmlStreamAttributes

    def characterOffset(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.characterOffset() -> int """
        return 0

    def clear(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.clear() """
        pass

    def columnNumber(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.columnNumber() -> int """
        return 0

    def device(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.device() -> QIODevice """
        return QIODevice

    # real signature unknown; restored from __doc__
    def documentEncoding(self):
        """ QXmlStreamReader.documentEncoding() -> QStringRef """
        return QStringRef

    def documentVersion(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.documentVersion() -> QStringRef """
        return QStringRef

    def dtdName(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.dtdName() -> QStringRef """
        return QStringRef

    def dtdPublicId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.dtdPublicId() -> QStringRef """
        return QStringRef

    def dtdSystemId(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.dtdSystemId() -> QStringRef """
        return QStringRef

    # real signature unknown; restored from __doc__
    def entityDeclarations(self):
        """ QXmlStreamReader.entityDeclarations() -> list-of-QXmlStreamEntityDeclaration """
        pass

    def entityResolver(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.entityResolver() -> QXmlStreamEntityResolver """
        return QXmlStreamEntityResolver

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.error() -> QXmlStreamReader.Error """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.errorString() -> QString """
        return QString

    def hasError(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.hasError() -> bool """
        return False

    def isCDATA(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isCDATA() -> bool """
        return False

    def isCharacters(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isCharacters() -> bool """
        return False

    def isComment(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isComment() -> bool """
        return False

    def isDTD(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isDTD() -> bool """
        return False

    def isEndDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isEndDocument() -> bool """
        return False

    def isEndElement(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isEndElement() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isEntityReference(self):
        """ QXmlStreamReader.isEntityReference() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isProcessingInstruction(self):
        """ QXmlStreamReader.isProcessingInstruction() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isStandaloneDocument(self):
        """ QXmlStreamReader.isStandaloneDocument() -> bool """
        return False

    def isStartDocument(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isStartDocument() -> bool """
        return False

    def isStartElement(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isStartElement() -> bool """
        return False

    def isWhitespace(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.isWhitespace() -> bool """
        return False

    def lineNumber(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.lineNumber() -> int """
        return 0

    def name(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.name() -> QStringRef """
        return QStringRef

    # real signature unknown; restored from __doc__
    def namespaceDeclarations(self):
        """ QXmlStreamReader.namespaceDeclarations() -> list-of-QXmlStreamNamespaceDeclaration """
        pass

    # real signature unknown; restored from __doc__
    def namespaceProcessing(self):
        """ QXmlStreamReader.namespaceProcessing() -> bool """
        return False

    def namespaceUri(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.namespaceUri() -> QStringRef """
        return QStringRef

    # real signature unknown; restored from __doc__
    def notationDeclarations(self):
        """ QXmlStreamReader.notationDeclarations() -> list-of-QXmlStreamNotationDeclaration """
        pass

    def prefix(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.prefix() -> QStringRef """
        return QStringRef

    # real signature unknown; restored from __doc__
    def processingInstructionData(self):
        """ QXmlStreamReader.processingInstructionData() -> QStringRef """
        return QStringRef

    # real signature unknown; restored from __doc__
    def processingInstructionTarget(self):
        """ QXmlStreamReader.processingInstructionTarget() -> QStringRef """
        return QStringRef

    def qualifiedName(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.qualifiedName() -> QStringRef """
        return QStringRef

    # real signature unknown; NOTE: unreliably restored from __doc__
    def raiseError(self, QString_message=None, *args, **kwargs):
        """ QXmlStreamReader.raiseError(QString message=QString()) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def readElementText(self, QXmlStreamReader_ReadElementTextBehaviour=None):
        """
        QXmlStreamReader.readElementText() -> QString
        QXmlStreamReader.readElementText(QXmlStreamReader.ReadElementTextBehaviour) -> QString
        """
        return QString

    # real signature unknown
    def ReadElementTextBehaviour(self, *args, **kwargs):
        pass

    def readNext(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.readNext() -> QXmlStreamReader.TokenType """
        pass

    # real signature unknown; restored from __doc__
    def readNextStartElement(self):
        """ QXmlStreamReader.readNextStartElement() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setDevice(self, QIODevice):
        """ QXmlStreamReader.setDevice(QIODevice) """
        pass

    # real signature unknown; restored from __doc__
    def setEntityResolver(self, QXmlStreamEntityResolver):
        """ QXmlStreamReader.setEntityResolver(QXmlStreamEntityResolver) """
        pass

    # real signature unknown; restored from __doc__
    def setNamespaceProcessing(self, bool):
        """ QXmlStreamReader.setNamespaceProcessing(bool) """
        pass

    # real signature unknown; restored from __doc__
    def skipCurrentElement(self):
        """ QXmlStreamReader.skipCurrentElement() """
        pass

    def text(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.text() -> QStringRef """
        return QStringRef

    def tokenString(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.tokenString() -> QString """
        return QString

    def tokenType(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamReader.tokenType() -> QXmlStreamReader.TokenType """
        pass

    def TokenType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    Characters = 6
    Comment = 7
    CustomError = 2
    DTD = 8
    EndDocument = 3
    EndElement = 5
    EntityReference = 9
    ErrorOnUnexpectedElement = 0
    IncludeChildElements = 1
    Invalid = 1
    NoError = 0
    NoToken = 0
    NotWellFormedError = 3
    PrematureEndOfDocumentError = 4
    ProcessingInstruction = 10
    SkipChildElements = 2
    StartDocument = 2
    StartElement = 4
    UnexpectedElementError = 1


class QXmlStreamWriter():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QXmlStreamWriter()
    QXmlStreamWriter(QIODevice)
    QXmlStreamWriter(QByteArray)
    QXmlStreamWriter(QString)
    """

    def autoFormatting(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamWriter.autoFormatting() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoFormattingIndent(self):
        """ QXmlStreamWriter.autoFormattingIndent() -> int """
        return 0

    def codec(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamWriter.codec() -> QTextCodec """
        return QTextCodec

    def device(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamWriter.device() -> QIODevice """
        return QIODevice

    # real signature unknown; restored from __doc__
    def setAutoFormatting(self, bool):
        """ QXmlStreamWriter.setAutoFormatting(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoFormattingIndent(self, p_int):
        """ QXmlStreamWriter.setAutoFormattingIndent(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setCodec(self, *__args):
        """
        QXmlStreamWriter.setCodec(QTextCodec)
        QXmlStreamWriter.setCodec(str)
        """
        pass

    # real signature unknown; restored from __doc__
    def setDevice(self, QIODevice):
        """ QXmlStreamWriter.setDevice(QIODevice) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeAttribute(self, *__args):
        """
        QXmlStreamWriter.writeAttribute(QString, QString)
        QXmlStreamWriter.writeAttribute(QString, QString, QString)
        QXmlStreamWriter.writeAttribute(QXmlStreamAttribute)
        """
        pass

    # real signature unknown; restored from __doc__
    def writeAttributes(self, QXmlStreamAttributes):
        """ QXmlStreamWriter.writeAttributes(QXmlStreamAttributes) """
        pass

    # real signature unknown; restored from __doc__
    def writeCDATA(self, QString):
        """ QXmlStreamWriter.writeCDATA(QString) """
        pass

    # real signature unknown; restored from __doc__
    def writeCharacters(self, QString):
        """ QXmlStreamWriter.writeCharacters(QString) """
        pass

    # real signature unknown; restored from __doc__
    def writeComment(self, QString):
        """ QXmlStreamWriter.writeComment(QString) """
        pass

    # real signature unknown; restored from __doc__
    def writeCurrentToken(self, QXmlStreamReader):
        """ QXmlStreamWriter.writeCurrentToken(QXmlStreamReader) """
        pass

    # real signature unknown; restored from __doc__
    def writeDefaultNamespace(self, QString):
        """ QXmlStreamWriter.writeDefaultNamespace(QString) """
        pass

    # real signature unknown; restored from __doc__
    def writeDTD(self, QString):
        """ QXmlStreamWriter.writeDTD(QString) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeEmptyElement(self, QString, QString_1=None):
        """
        QXmlStreamWriter.writeEmptyElement(QString)
        QXmlStreamWriter.writeEmptyElement(QString, QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def writeEndDocument(self):
        """ QXmlStreamWriter.writeEndDocument() """
        pass

    def writeEndElement(self):  # real signature unknown; restored from __doc__
        """ QXmlStreamWriter.writeEndElement() """
        pass

    # real signature unknown; restored from __doc__
    def writeEntityReference(self, QString):
        """ QXmlStreamWriter.writeEntityReference(QString) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def writeNamespace(self, QString, QString_prefix=None, *args, **kwargs):
        """ QXmlStreamWriter.writeNamespace(QString, QString prefix=QString()) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def writeProcessingInstruction(self, QString, QString_data=None, *args, **kwargs):
        """ QXmlStreamWriter.writeProcessingInstruction(QString, QString data=QString()) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeStartDocument(self, QString=None, bool=None):
        """
        QXmlStreamWriter.writeStartDocument()
        QXmlStreamWriter.writeStartDocument(QString)
        QXmlStreamWriter.writeStartDocument(QString, bool)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeStartElement(self, QString, QString_1=None):
        """
        QXmlStreamWriter.writeStartElement(QString)
        QXmlStreamWriter.writeStartElement(QString, QString)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeTextElement(self, QString, QString_1, QString_2=None):
        """
        QXmlStreamWriter.writeTextElement(QString, QString)
        QXmlStreamWriter.writeTextElement(QString, QString, QString)
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


# variables with complex values

__license__ = None  # (!) real value is ''

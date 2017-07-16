# encoding: utf-8
# module PyQt4.QtScript
# from /usr/lib/python2.7/dist-packages/PyQt4/QtScript.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore


# functions

# real signature unknown; NOTE: unreliably restored from __doc__
def qScriptConnect(QObject, SIGNAL, *args, **kwargs):
    """ qScriptConnect(QObject, SIGNAL(), QScriptValue, QScriptValue) -> bool """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def qScriptDisconnect(QObject, SIGNAL, *args, **kwargs):
    """ qScriptDisconnect(QObject, SIGNAL(), QScriptValue, QScriptValue) -> bool """
    pass


# classes

class QScriptClass():  # skipped bases: <type 'sip.simplewrapper'>

    """ QScriptClass(QScriptEngine) """

    def engine(self):  # real signature unknown; restored from __doc__
        """ QScriptClass.engine() -> QScriptEngine """
        return QScriptEngine

    # real signature unknown; NOTE: unreliably restored from __doc__
    def extension(self, QScriptClass_Extension, QVariant_argument=None, *args, **kwargs):
        """ QScriptClass.extension(QScriptClass.Extension, QVariant argument=QVariant()) -> QVariant """
        pass

    def Extension(self, *args, **kwargs):  # real signature unknown
        pass

    def name(self):  # real signature unknown; restored from __doc__
        """ QScriptClass.name() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def newIterator(self, QScriptValue):
        """ QScriptClass.newIterator(QScriptValue) -> QScriptClassPropertyIterator """
        return QScriptClassPropertyIterator

    # real signature unknown; restored from __doc__
    def property(self, QScriptValue, QScriptString, p_int):
        """ QScriptClass.property(QScriptValue, QScriptString, int) -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def propertyFlags(self, QScriptValue, QScriptString, p_int):
        """ QScriptClass.propertyFlags(QScriptValue, QScriptString, int) -> QScriptValue.PropertyFlags """
        pass

    def prototype(self):  # real signature unknown; restored from __doc__
        """ QScriptClass.prototype() -> QScriptValue """
        return QScriptValue

    def QueryFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def QueryFlags(self, *__args):
        """
        QScriptClass.QueryFlags(QScriptClass.QueryFlags)
        QScriptClass.QueryFlags(int)
        QScriptClass.QueryFlags()
        """
        pass

    # real signature unknown; restored from __doc__
    def queryProperty(self, QScriptValue, QScriptString, QScriptClass_QueryFlags):
        """ QScriptClass.queryProperty(QScriptValue, QScriptString, QScriptClass.QueryFlags) -> (QScriptClass.QueryFlags, int) """
        pass

    # real signature unknown; restored from __doc__
    def setProperty(self, QScriptValue, QScriptString, p_int, QScriptValue_1):
        """ QScriptClass.setProperty(QScriptValue, QScriptString, int, QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def supportsExtension(self, QScriptClass_Extension):
        """ QScriptClass.supportsExtension(QScriptClass.Extension) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QScriptEngine):
        pass

    __weakref__ = property(lambda self: object())  # default

    Callable = 0
    HandlesReadAccess = 1
    HandlesWriteAccess = 2
    HasInstance = 1


# skipped bases: <type 'sip.simplewrapper'>
class QScriptClassPropertyIterator():

    """ QScriptClassPropertyIterator(QScriptValue) """

    def flags(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.flags() -> QScriptValue.PropertyFlags """
        pass

    def hasNext(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.hasNext() -> bool """
        return False

    def hasPrevious(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.hasPrevious() -> bool """
        return False

    def id(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.id() -> int """
        return 0

    def name(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.name() -> QScriptString """
        return QScriptString

    def next(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.next() """
        pass

    def object(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.object() -> QScriptValue """
        return QScriptValue

    def previous(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.previous() """
        pass

    def toBack(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.toBack() """
        pass

    def toFront(self):  # real signature unknown; restored from __doc__
        """ QScriptClassPropertyIterator.toFront() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QScriptValue):
        pass

    __weakref__ = property(lambda self: object())  # default


class QScriptContext():  # skipped bases: <type 'sip.simplewrapper'>
    # no doc

    # real signature unknown; restored from __doc__
    def activationObject(self):
        """ QScriptContext.activationObject() -> QScriptValue """
        return QScriptValue

    def argument(self, p_int):  # real signature unknown; restored from __doc__
        """ QScriptContext.argument(int) -> QScriptValue """
        return QScriptValue

    def argumentCount(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.argumentCount() -> int """
        return 0

    def argumentsObject(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.argumentsObject() -> QScriptValue """
        return QScriptValue

    def backtrace(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.backtrace() -> QStringList """
        pass

    def callee(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.callee() -> QScriptValue """
        return QScriptValue

    def engine(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.engine() -> QScriptEngine """
        return QScriptEngine

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def ExecutionState(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def isCalledAsConstructor(self):
        """ QScriptContext.isCalledAsConstructor() -> bool """
        return False

    def parentContext(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.parentContext() -> QScriptContext """
        return QScriptContext

    # real signature unknown; restored from __doc__
    def setActivationObject(self, QScriptValue):
        """ QScriptContext.setActivationObject(QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def setThisObject(self, QScriptValue):
        """ QScriptContext.setThisObject(QScriptValue) """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.state() -> QScriptContext.ExecutionState """
        pass

    def thisObject(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.thisObject() -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def throwError(self, *__args):
        """
        QScriptContext.throwError(QScriptContext.Error, QString) -> QScriptValue
        QScriptContext.throwError(QString) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def throwValue(self, QScriptValue):
        """ QScriptContext.throwValue(QScriptValue) -> QScriptValue """
        return QScriptValue

    def toString(self):  # real signature unknown; restored from __doc__
        """ QScriptContext.toString() -> QString """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    ExceptionState = 1
    NormalState = 0
    RangeError = 4
    ReferenceError = 1
    SyntaxError = 2
    TypeError = 3
    UnknownError = 0
    URIError = 5


class QScriptContextInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QScriptContextInfo(QScriptContext)
    QScriptContextInfo(QScriptContextInfo)
    QScriptContextInfo()
    """

    def columnNumber(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.columnNumber() -> int """
        return 0

    def fileName(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.fileName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def functionEndLineNumber(self):
        """ QScriptContextInfo.functionEndLineNumber() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def functionMetaIndex(self):
        """ QScriptContextInfo.functionMetaIndex() -> int """
        return 0

    def functionName(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.functionName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def functionParameterNames(self):
        """ QScriptContextInfo.functionParameterNames() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def functionStartLineNumber(self):
        """ QScriptContextInfo.functionStartLineNumber() -> int """
        return 0

    def functionType(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.functionType() -> QScriptContextInfo.FunctionType """
        pass

    def FunctionType(self, *args, **kwargs):  # real signature unknown
        pass

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.isNull() -> bool """
        return False

    def lineNumber(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.lineNumber() -> int """
        return 0

    def scriptId(self):  # real signature unknown; restored from __doc__
        """ QScriptContextInfo.scriptId() -> int """
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

    NativeFunction = 3
    QtFunction = 1
    QtPropertyFunction = 2
    ScriptFunction = 0


class QScriptEngine(__PyQt4_QtCore.QObject):

    """
    QScriptEngine()
    QScriptEngine(QObject)
    """
    # real signature unknown; NOTE: unreliably restored from __doc__

    def abortEvaluation(self, QScriptValue_result=None, *args, **kwargs):
        """ QScriptEngine.abortEvaluation(QScriptValue result=QScriptValue()) """
        pass

    def agent(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.agent() -> QScriptEngineAgent """
        return QScriptEngineAgent

    # real signature unknown; restored from __doc__
    def availableExtensions(self):
        """ QScriptEngine.availableExtensions() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def canEvaluate(self, QString):
        """ QScriptEngine.canEvaluate(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def checkSyntax(self, QString):
        """ QScriptEngine.checkSyntax(QString) -> QScriptSyntaxCheckResult """
        return QScriptSyntaxCheckResult

    def clearExceptions(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.clearExceptions() """
        pass

    def collectGarbage(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.collectGarbage() """
        pass

    def currentContext(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.currentContext() -> QScriptContext """
        return QScriptContext

    # real signature unknown; restored from __doc__
    def defaultPrototype(self, p_int):
        """ QScriptEngine.defaultPrototype(int) -> QScriptValue """
        return QScriptValue

    # real signature unknown; NOTE: unreliably restored from __doc__
    def evaluate(self, QString, QString_fileName=None, *args, **kwargs):
        """ QScriptEngine.evaluate(QString, QString fileName=QString(), int lineNumber=1) -> QScriptValue """
        pass

    def globalObject(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.globalObject() -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def hasUncaughtException(self):
        """ QScriptEngine.hasUncaughtException() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def importedExtensions(self):
        """ QScriptEngine.importedExtensions() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def importExtension(self, QString):
        """ QScriptEngine.importExtension(QString) -> QScriptValue """
        return QScriptValue

    # real signature unknown; NOTE: unreliably restored from __doc__
    def installTranslatorFunctions(self, QScriptValue_object=None, *args, **kwargs):
        """ QScriptEngine.installTranslatorFunctions(QScriptValue object=QScriptValue()) """
        pass

    def isEvaluating(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.isEvaluating() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def newArray(self, int_length=0):
        """ QScriptEngine.newArray(int length=0) -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def newDate(self, *__args):
        """
        QScriptEngine.newDate(float) -> QScriptValue
        QScriptEngine.newDate(QDateTime) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def newFunction(self, callable, *__args):
        """
        QScriptEngine.newFunction(callable, int length=0) -> QScriptValue
        QScriptEngine.newFunction(callable, QScriptValue, int length=0) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def newObject(self, QScriptClass=None, QScriptValue_data=None, *args=None, **kwargs=None):
        """
        QScriptEngine.newObject() -> QScriptValue
        QScriptEngine.newObject(QScriptClass, QScriptValue data=QScriptValue()) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; NOTE: unreliably restored from __doc__
    def newQMetaObject(self, QMetaObject, QScriptValue_ctor=None, *args, **kwargs):
        """ QScriptEngine.newQMetaObject(QMetaObject, QScriptValue ctor=QScriptValue()) -> QScriptValue """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def newQObject(self, *__args):
        """
        QScriptEngine.newQObject(QObject, QScriptEngine.ValueOwnership ownership=QScriptEngine.QtOwnership, QScriptEngine.QObjectWrapOptions options=0) -> QScriptValue
        QScriptEngine.newQObject(QScriptValue, QObject, QScriptEngine.ValueOwnership ownership=QScriptEngine.QtOwnership, QScriptEngine.QObjectWrapOptions options=0) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def newRegExp(self, *__args):
        """
        QScriptEngine.newRegExp(QRegExp) -> QScriptValue
        QScriptEngine.newRegExp(QString, QString) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def newVariant(self, *__args):
        """
        QScriptEngine.newVariant(QVariant) -> QScriptValue
        QScriptEngine.newVariant(QScriptValue, QVariant) -> QScriptValue
        """
        return QScriptValue

    def nullValue(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.nullValue() -> QScriptValue """
        return QScriptValue

    def popContext(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.popContext() """
        pass

    # real signature unknown; restored from __doc__
    def processEventsInterval(self):
        """ QScriptEngine.processEventsInterval() -> int """
        return 0

    def pushContext(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.pushContext() -> QScriptContext """
        return QScriptContext

    def QObjectWrapOption(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def QObjectWrapOptions(self, *__args):
        """
        QScriptEngine.QObjectWrapOptions(QScriptEngine.QObjectWrapOptions)
        QScriptEngine.QObjectWrapOptions(int)
        QScriptEngine.QObjectWrapOptions()
        """
        pass

    # real signature unknown; restored from __doc__
    def reportAdditionalMemoryCost(self, p_int):
        """ QScriptEngine.reportAdditionalMemoryCost(int) """
        pass

    # real signature unknown; restored from __doc__
    def setAgent(self, QScriptEngineAgent):
        """ QScriptEngine.setAgent(QScriptEngineAgent) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultPrototype(self, p_int, QScriptValue):
        """ QScriptEngine.setDefaultPrototype(int, QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def setGlobalObject(self, QScriptValue):
        """ QScriptEngine.setGlobalObject(QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def setProcessEventsInterval(self, p_int):
        """ QScriptEngine.setProcessEventsInterval(int) """
        pass

    # real signature unknown
    def signalHandlerException(self, *args, **kwargs):
        """ QScriptEngine.signalHandlerException[QScriptValue] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def toObject(self, QScriptValue):
        """ QScriptEngine.toObject(QScriptValue) -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def toStringHandle(self, QString):
        """ QScriptEngine.toStringHandle(QString) -> QScriptString """
        return QScriptString

    # real signature unknown; restored from __doc__
    def uncaughtException(self):
        """ QScriptEngine.uncaughtException() -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def uncaughtExceptionBacktrace(self):
        """ QScriptEngine.uncaughtExceptionBacktrace() -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def uncaughtExceptionLineNumber(self):
        """ QScriptEngine.uncaughtExceptionLineNumber() -> int """
        return 0

    def undefinedValue(self):  # real signature unknown; restored from __doc__
        """ QScriptEngine.undefinedValue() -> QScriptValue """
        return QScriptValue

    def ValueOwnership(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QObject=None):
        pass

    AutoCreateDynamicProperties = 256
    AutoOwnership = 2
    ExcludeChildObjects = 1
    ExcludeDeleteLater = 16
    ExcludeSlots = 32
    ExcludeSuperClassContents = 6
    ExcludeSuperClassMethods = 2
    ExcludeSuperClassProperties = 4
    PreferExistingWrapperObject = 512
    QtOwnership = 0
    ScriptOwnership = 1
    SkipMethodsInEnumeration = 8


class QScriptEngineAgent():  # skipped bases: <type 'sip.simplewrapper'>

    """ QScriptEngineAgent(QScriptEngine) """

    def contextPop(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineAgent.contextPop() """
        pass

    def contextPush(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineAgent.contextPush() """
        pass

    def engine(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineAgent.engine() -> QScriptEngine """
        return QScriptEngine

    # real signature unknown; restored from __doc__
    def exceptionCatch(self, p_int, QScriptValue):
        """ QScriptEngineAgent.exceptionCatch(int, QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def exceptionThrow(self, p_int, QScriptValue, bool):
        """ QScriptEngineAgent.exceptionThrow(int, QScriptValue, bool) """
        pass

    def Extension(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def extension(self, QScriptEngineAgent_Extension, QVariant_argument=None, *args, **kwargs):
        """ QScriptEngineAgent.extension(QScriptEngineAgent.Extension, QVariant argument=QVariant()) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def functionEntry(self, p_int):
        """ QScriptEngineAgent.functionEntry(int) """
        pass

    # real signature unknown; restored from __doc__
    def functionExit(self, p_int, QScriptValue):
        """ QScriptEngineAgent.functionExit(int, QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def positionChange(self, p_int, p_int_1, p_int_2):
        """ QScriptEngineAgent.positionChange(int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def scriptLoad(self, p_int, QString, QString_1, p_int_1):
        """ QScriptEngineAgent.scriptLoad(int, QString, QString, int) """
        pass

    # real signature unknown; restored from __doc__
    def scriptUnload(self, p_int):
        """ QScriptEngineAgent.scriptUnload(int) """
        pass

    # real signature unknown; restored from __doc__
    def supportsExtension(self, QScriptEngineAgent_Extension):
        """ QScriptEngineAgent.supportsExtension(QScriptEngineAgent.Extension) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QScriptEngine):
        pass

    __weakref__ = property(lambda self: object())  # default

    DebuggerInvocationRequest = 0


class QScriptString():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QScriptString()
    QScriptString(QScriptString)
    """

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QScriptString.isValid() -> bool """
        return False

    def toArrayIndex(self):  # real signature unknown; restored from __doc__
        """ QScriptString.toArrayIndex() -> (int, bool) """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QScriptString.toString() -> QString """
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
    def __init__(self, QScriptString=None):
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


class QScriptSyntaxCheckResult():  # skipped bases: <type 'sip.simplewrapper'>

    """ QScriptSyntaxCheckResult(QScriptSyntaxCheckResult) """
    # real signature unknown; restored from __doc__

    def errorColumnNumber(self):
        """ QScriptSyntaxCheckResult.errorColumnNumber() -> int """
        return 0

    def errorLineNumber(self):  # real signature unknown; restored from __doc__
        """ QScriptSyntaxCheckResult.errorLineNumber() -> int """
        return 0

    def errorMessage(self):  # real signature unknown; restored from __doc__
        """ QScriptSyntaxCheckResult.errorMessage() -> QString """
        pass

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QScriptSyntaxCheckResult.state() -> QScriptSyntaxCheckResult.State """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QScriptSyntaxCheckResult):
        pass

    __weakref__ = property(lambda self: object())  # default

    Error = 0
    Intermediate = 1
    Valid = 2


class QScriptValue():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QScriptValue()
    QScriptValue(QScriptValue)
    QScriptValue(QScriptValue.SpecialValue)
    QScriptValue(QScriptEngine, QScriptValue.SpecialValue)
    QScriptValue(bool)
    QScriptValue(QScriptEngine, bool)
    QScriptValue(int)
    QScriptValue(QScriptEngine, int)
    QScriptValue(float)
    QScriptValue(QScriptEngine, float)
    QScriptValue(QString)
    QScriptValue(QScriptEngine, QString)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def call(self, *__args):
        """
        QScriptValue.call(QScriptValue thisObject=QScriptValue(), list-of-QScriptValue args=QScriptValueList()) -> QScriptValue
        QScriptValue.call(QScriptValue, QScriptValue) -> QScriptValue
        """
        return QScriptValue

    # real signature unknown; restored from __doc__ with multiple overloads
    def construct(self, *__args):
        """
        QScriptValue.construct(list-of-QScriptValue args=QScriptValueList()) -> QScriptValue
        QScriptValue.construct(QScriptValue) -> QScriptValue
        """
        return QScriptValue

    def data(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.data() -> QScriptValue """
        return QScriptValue

    def engine(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.engine() -> QScriptEngine """
        return QScriptEngine

    # real signature unknown; restored from __doc__
    def equals(self, QScriptValue):
        """ QScriptValue.equals(QScriptValue) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def instanceOf(self, QScriptValue):
        """ QScriptValue.instanceOf(QScriptValue) -> bool """
        return False

    def isArray(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isArray() -> bool """
        return False

    def isBool(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isBool() -> bool """
        return False

    def isBoolean(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isBoolean() -> bool """
        return False

    def isDate(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isDate() -> bool """
        return False

    def isError(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isError() -> bool """
        return False

    def isFunction(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isFunction() -> bool """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isNull() -> bool """
        return False

    def isNumber(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isNumber() -> bool """
        return False

    def isObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isObject() -> bool """
        return False

    def isQMetaObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isQMetaObject() -> bool """
        return False

    def isQObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isQObject() -> bool """
        return False

    def isRegExp(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isRegExp() -> bool """
        return False

    def isString(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isString() -> bool """
        return False

    def isUndefined(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isUndefined() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isValid() -> bool """
        return False

    def isVariant(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.isVariant() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def lessThan(self, QScriptValue):
        """ QScriptValue.lessThan(QScriptValue) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def property(self, *__args):
        """
        QScriptValue.property(QString, QScriptValue.ResolveFlags mode=QScriptValue.ResolvePrototype) -> QScriptValue
        QScriptValue.property(QScriptString, QScriptValue.ResolveFlags mode=QScriptValue.ResolvePrototype) -> QScriptValue
        QScriptValue.property(int, QScriptValue.ResolveFlags mode=QScriptValue.ResolvePrototype) -> QScriptValue
        """
        return QScriptValue

    def PropertyFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def PropertyFlags(self, *__args):
        """
        QScriptValue.PropertyFlags(QScriptValue.PropertyFlags)
        QScriptValue.PropertyFlags(int)
        QScriptValue.PropertyFlags()
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def propertyFlags(self, *__args):
        """
        QScriptValue.propertyFlags(QString, QScriptValue.ResolveFlags mode=QScriptValue.ResolvePrototype) -> QScriptValue.PropertyFlags
        QScriptValue.propertyFlags(QScriptString, QScriptValue.ResolveFlags mode=QScriptValue.ResolvePrototype) -> QScriptValue.PropertyFlags
        """
        pass

    def prototype(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.prototype() -> QScriptValue """
        return QScriptValue

    def ResolveFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ResolveFlags(self, *__args):
        """
        QScriptValue.ResolveFlags(QScriptValue.ResolveFlags)
        QScriptValue.ResolveFlags(int)
        QScriptValue.ResolveFlags()
        """
        pass

    def scriptClass(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.scriptClass() -> QScriptClass """
        return QScriptClass

    # real signature unknown; restored from __doc__
    def setData(self, QScriptValue):
        """ QScriptValue.setData(QScriptValue) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setProperty(self, *__args):
        """
        QScriptValue.setProperty(QString, QScriptValue, QScriptValue.PropertyFlags flags=QScriptValue.KeepExistingFlags)
        QScriptValue.setProperty(QScriptString, QScriptValue, QScriptValue.PropertyFlags flags=QScriptValue.KeepExistingFlags)
        QScriptValue.setProperty(int, QScriptValue, QScriptValue.PropertyFlags flags=QScriptValue.KeepExistingFlags)
        """
        pass

    # real signature unknown; restored from __doc__
    def setPrototype(self, QScriptValue):
        """ QScriptValue.setPrototype(QScriptValue) """
        pass

    # real signature unknown; restored from __doc__
    def setScriptClass(self, QScriptClass):
        """ QScriptValue.setScriptClass(QScriptClass) """
        pass

    def SpecialValue(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def strictlyEquals(self, QScriptValue):
        """ QScriptValue.strictlyEquals(QScriptValue) -> bool """
        return False

    def toBool(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toBool() -> bool """
        return False

    def toBoolean(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toBoolean() -> bool """
        return False

    def toDateTime(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toDateTime() -> QDateTime """
        pass

    def toInt32(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toInt32() -> int """
        return 0

    def toInteger(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toInteger() -> float """
        return 0.0

    def toNumber(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toNumber() -> float """
        return 0.0

    def toObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toObject() -> QScriptValue """
        return QScriptValue

    def toQMetaObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toQMetaObject() -> QMetaObject """
        pass

    def toQObject(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toQObject() -> QObject """
        pass

    def toRegExp(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toRegExp() -> QRegExp """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toString() -> QString """
        pass

    def toUInt16(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toUInt16() -> int """
        return 0

    def toUInt32(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toUInt32() -> int """
        return 0

    def toVariant(self):  # real signature unknown; restored from __doc__
        """ QScriptValue.toVariant() -> QVariant """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    KeepExistingFlags = 2048
    NullValue = 0
    PropertyGetter = 8
    PropertySetter = 16
    QObjectMember = 32
    ReadOnly = 1
    ResolveFull = 3
    ResolveLocal = 0
    ResolvePrototype = 1
    ResolveScope = 2
    SkipInEnumeration = 4
    UndefinedValue = 1
    Undeletable = 2
    UserRange = -16777216


class QScriptValueIterator():  # skipped bases: <type 'sip.simplewrapper'>

    """ QScriptValueIterator(QScriptValue) """

    def flags(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.flags() -> QScriptValue.PropertyFlags """
        pass

    def hasNext(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.hasNext() -> bool """
        return False

    def hasPrevious(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.hasPrevious() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.name() -> QString """
        pass

    def next(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.next() """
        pass

    def previous(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.previous() """
        pass

    def remove(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.remove() """
        pass

    def scriptName(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.scriptName() -> QScriptString """
        return QScriptString

    # real signature unknown; restored from __doc__
    def setValue(self, QScriptValue):
        """ QScriptValueIterator.setValue(QScriptValue) """
        pass

    def toBack(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.toBack() """
        pass

    def toFront(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.toFront() """
        pass

    def value(self):  # real signature unknown; restored from __doc__
        """ QScriptValueIterator.value() -> QScriptValue """
        return QScriptValue

    # real signature unknown; restored from __doc__
    def __init__(self, QScriptValue):
        pass

    __weakref__ = property(lambda self: object())  # default

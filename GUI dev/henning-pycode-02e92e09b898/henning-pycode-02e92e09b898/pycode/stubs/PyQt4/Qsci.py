# encoding: utf-8
# module PyQt4.Qsci
# from /usr/lib/python2.7/dist-packages/PyQt4/Qsci.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore
import PyQt4.QtGui as __PyQt4_QtGui


# Variables with simple values

QSCINTILLA_VERSION = 132101

QSCINTILLA_VERSION_STR = '2.4.5'

# no functions
# classes


class QsciAbstractAPIs(__PyQt4_QtCore.QObject):

    """ QsciAbstractAPIs(QsciLexer lexer=None) """
    # real signature unknown; restored from __doc__

    def autoCompletionSelected(self, QString):
        """ QsciAbstractAPIs.autoCompletionSelected(QString) """
        pass

    # real signature unknown; restored from __doc__
    def callTips(self, QStringList, p_int, QsciScintilla_CallTipsStyle, list_of_int):
        """ QsciAbstractAPIs.callTips(QStringList, int, QsciScintilla.CallTipsStyle, list-of-int) -> QStringList """
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciAbstractAPIs.lexer() -> QsciLexer """
        return QsciLexer

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def updateAutoCompletionList(self, QStringList, QStringList_1):
        """ QsciAbstractAPIs.updateAutoCompletionList(QStringList, QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QsciLexer_lexer=None):
        pass


class QsciAPIs(QsciAbstractAPIs):

    """ QsciAPIs(QsciLexer lexer=None) """

    def add(self, QString):  # real signature unknown; restored from __doc__
        """ QsciAPIs.add(QString) """
        pass

    # real signature unknown
    def apiPreparationCancelled(self, *args, **kwargs):
        """ QsciAPIs.apiPreparationCancelled[] [signal] """
        pass

    # real signature unknown
    def apiPreparationFinished(self, *args, **kwargs):
        """ QsciAPIs.apiPreparationFinished[] [signal] """
        pass

    def apiPreparationStarted(self, *args, **kwargs):  # real signature unknown
        """ QsciAPIs.apiPreparationStarted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def autoCompletionSelected(self, QString):
        """ QsciAPIs.autoCompletionSelected(QString) """
        pass

    # real signature unknown; restored from __doc__
    def callTips(self, QStringList, p_int, QsciScintilla_CallTipsStyle, list_of_int):
        """ QsciAPIs.callTips(QStringList, int, QsciScintilla.CallTipsStyle, list-of-int) -> QStringList """
        pass

    # real signature unknown; restored from __doc__
    def cancelPreparation(self):
        """ QsciAPIs.cancelPreparation() """
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QsciAPIs.clear() """
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultPreparedName(self):
        """ QsciAPIs.defaultPreparedName() -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, QEvent):  # real signature unknown; restored from __doc__
        """ QsciAPIs.event(QEvent) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def installedAPIFiles(self):
        """ QsciAPIs.installedAPIFiles() -> QStringList """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def isPrepared(self, QString_fname=None, *args, **kwargs):
        """ QsciAPIs.isPrepared(QString fname=QString()) -> bool """
        pass

    def load(self, QString):  # real signature unknown; restored from __doc__
        """ QsciAPIs.load(QString) -> bool """
        return False

    # real signature unknown; NOTE: unreliably restored from __doc__
    def loadPrepared(self, QString_fname=None, *args, **kwargs):
        """ QsciAPIs.loadPrepared(QString fname=QString()) -> bool """
        pass

    def prepare(self):  # real signature unknown; restored from __doc__
        """ QsciAPIs.prepare() """
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def remove(self, QString):  # real signature unknown; restored from __doc__
        """ QsciAPIs.remove(QString) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def savePrepared(self, QString_fname=None, *args, **kwargs):
        """ QsciAPIs.savePrepared(QString fname=QString()) -> bool """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def updateAutoCompletionList(self, QStringList, QStringList_1):
        """ QsciAPIs.updateAutoCompletionList(QStringList, QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QsciLexer_lexer=None):
        pass


class QsciCommand():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    def alternateKey(self):  # real signature unknown; restored from __doc__
        """ QsciCommand.alternateKey() -> int """
        return 0

    def description(self):  # real signature unknown; restored from __doc__
        """ QsciCommand.description() -> QString """
        pass

    def key(self):  # real signature unknown; restored from __doc__
        """ QsciCommand.key() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setAlternateKey(self, p_int):
        """ QsciCommand.setAlternateKey(int) """
        pass

    def setKey(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciCommand.setKey(int) """
        pass

    def validKey(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciCommand.validKey(int) -> bool """
        return False

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QsciCommandSet():  # skipped bases: <type 'sip.wrapper'>
    # no doc
    # real signature unknown; restored from __doc__

    def clearAlternateKeys(self):
        """ QsciCommandSet.clearAlternateKeys() """
        pass

    def clearKeys(self):  # real signature unknown; restored from __doc__
        """ QsciCommandSet.clearKeys() """
        pass

    def commands(self):  # real signature unknown; restored from __doc__
        """ QsciCommandSet.commands() -> list-of-QsciCommand """
        pass

    # real signature unknown; restored from __doc__
    def readSettings(self, QSettings, str_prefix=None):
        """ QsciCommandSet.readSettings(QSettings, str prefix="/Scintilla") -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeSettings(self, QSettings, str_prefix=None):
        """ QsciCommandSet.writeSettings(QSettings, str prefix="/Scintilla") -> bool """
        return False

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class QsciDocument():  # skipped bases: <type 'sip.wrapper'>

    """
    QsciDocument()
    QsciDocument(QsciDocument)
    """
    # real signature unknown; restored from __doc__ with multiple overloads

    def __init__(self, QsciDocument=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QsciLexer(__PyQt4_QtCore.QObject):

    """ QsciLexer(QObject parent=None) """

    def apis(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.apis() -> QsciAbstractAPIs """
        return QsciAbstractAPIs

    def autoIndentStyle(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.autoIndentStyle() -> int """
        return 0

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def color(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexer.color(int) -> QColor """
        pass

    def colorChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciLexer.colorChanged[QColor, int] [signal] """
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def defaultColor(self, p_int=None):
        """
        QsciLexer.defaultColor() -> QColor
        QsciLexer.defaultColor(int) -> QColor
        """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexer.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def defaultFont(self, p_int=None):
        """
        QsciLexer.defaultFont() -> QFont
        QsciLexer.defaultFont(int) -> QFont
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def defaultPaper(self, p_int=None):
        """
        QsciLexer.defaultPaper() -> QColor
        QsciLexer.defaultPaper(int) -> QColor
        """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexer.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def editor(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.editor() -> QsciScintilla """
        return QsciScintilla

    def eolFill(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexer.eolFill(int) -> bool """
        return False

    def eolFillChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciLexer.eolFillChanged[bool, int] [signal] """
        pass

    def font(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexer.font(int) -> QFont """
        pass

    def fontChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciLexer.fontChanged[QFont, int] [signal] """
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexer.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.lexer() -> str """
        return ""

    def lexerId(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.lexerId() -> int """
        return 0

    def paper(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexer.paper(int) -> QColor """
        pass

    def paperChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciLexer.paperChanged[QColor, int] [signal] """
        pass

    def propertyChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciLexer.propertyChanged[str, str] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexer.readProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def readSettings(self, QSettings, p_str=None):
        """ QsciLexer.readSettings(QSettings, str="/Scintilla") -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexer.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setAPIs(self, QsciAbstractAPIs):
        """ QsciLexer.setAPIs(QsciAbstractAPIs) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoIndentStyle(self, p_int):
        """ QsciLexer.setAutoIndentStyle(int) """
        pass

    # real signature unknown; restored from __doc__
    def setColor(self, QColor, int_style=-1):
        """ QsciLexer.setColor(QColor, int style=-1) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultColor(self, QColor):
        """ QsciLexer.setDefaultColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultFont(self, QFont):
        """ QsciLexer.setDefaultFont(QFont) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultPaper(self, QColor):
        """ QsciLexer.setDefaultPaper(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setEolFill(self, bool, int_style=-1):
        """ QsciLexer.setEolFill(bool, int style=-1) """
        pass

    # real signature unknown; restored from __doc__
    def setFont(self, QFont, int_style=-1):
        """ QsciLexer.setFont(QFont, int style=-1) """
        pass

    # real signature unknown; restored from __doc__
    def setPaper(self, QColor, int_style=-1):
        """ QsciLexer.setPaper(QColor, int style=-1) """
        pass

    def styleBitsNeeded(self):  # real signature unknown; restored from __doc__
        """ QsciLexer.styleBitsNeeded() -> int """
        return 0

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexer.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeSettings(self, QSettings, p_str=None):
        """ QsciLexer.writeSettings(QSettings, str="/Scintilla") -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerBash(QsciLexer):

    """ QsciLexerBash(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerBash.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerBash.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerBash.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerBash.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerBash.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBash.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBash.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerBash.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBash.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBash.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerBash.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerBash.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerBash.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerBash.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerBash.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Backticks = 11
    Comment = 2
    Default = 0
    DoubleQuotedString = 5
    Error = 1
    HereDocumentDelimiter = 12
    Identifier = 8
    Keyword = 4
    Number = 3
    Operator = 7
    ParameterExpansion = 10
    Scalar = 9
    SingleQuotedHereDocument = 13
    SingleQuotedString = 6


class QsciLexerBatch(QsciLexer):

    """ QsciLexerBatch(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerBatch.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerBatch.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerBatch.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerBatch.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerBatch.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerBatch.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBatch.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerBatch.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    Default = 0
    ExternalCommand = 5
    HideCommandChar = 4
    Keyword = 2
    Label = 3
    Operator = 7
    Variable = 6


class QsciLexerCMake(QsciLexer):

    """ QsciLexerCMake(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerCMake.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerCMake.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerCMake.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerCMake.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCMake.foldAtElse() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerCMake.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCMake.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCMake.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerCMake.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerCMake.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerCMake.setFoldAtElse(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerCMake.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    BlockForeach = 10
    BlockIf = 11
    BlockMacro = 12
    BlockWhile = 9
    Comment = 1
    Default = 0
    Function = 5
    KeywordSet3 = 8
    Label = 7
    Number = 14
    String = 2
    StringLeftQuote = 3
    StringRightQuote = 4
    StringVariable = 13
    Variable = 6


class QsciLexerCPP(QsciLexer):

    """ QsciLexerCPP(QObject parent=None, bool caseInsensitiveKeywords=False) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerCPP.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerCPP.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerCPP.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerCPP.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerCPP.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def dollarsAllowed(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.dollarsAllowed() -> bool """
        return False

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.foldAtElse() -> bool """
        return False

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.foldCompact() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldPreprocessor(self):
        """ QsciLexerCPP.foldPreprocessor() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCPP.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerCPP.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerCPP.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setDollarsAllowed(self, bool):
        """ QsciLexerCPP.setDollarsAllowed(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerCPP.setFoldAtElse(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerCPP.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerCPP.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPreprocessor(self, bool):
        """ QsciLexerCPP.setFoldPreprocessor(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setStylePreprocessor(self, bool):
        """ QsciLexerCPP.setStylePreprocessor(bool) """
        pass

    # real signature unknown; restored from __doc__
    def stylePreprocessor(self):
        """ QsciLexerCPP.stylePreprocessor() -> bool """
        return False

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerCPP.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None, bool_caseInsensitiveKeywords=False):
        pass

    Comment = 1
    CommentDoc = 3
    CommentDocKeyword = 17
    CommentDocKeywordError = 18
    CommentLine = 2
    CommentLineDoc = 15
    Default = 0
    DoubleQuotedString = 6
    GlobalClass = 19
    Identifier = 11
    Keyword = 5
    KeywordSet2 = 16
    Number = 4
    Operator = 10
    PreProcessor = 9
    Regex = 14
    SingleQuotedString = 7
    UnclosedString = 12
    UUID = 8
    VerbatimString = 13


class QsciLexerCSharp(QsciLexerCPP):

    """ QsciLexerCSharp(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerCSharp.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerCSharp.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerCSharp.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerCSharp.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerCSharp.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerCSharp.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCSharp.language() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerCSS(QsciLexer):

    """ QsciLexerCSS(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerCSS.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerCSS.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerCSS.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCSS.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCSS.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerCSS.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCSS.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCSS.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerCSS.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerCSS.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerCSS.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerCSS.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerCSS.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    AtRule = 12
    Attribute = 16
    ClassSelector = 2
    Comment = 9
    CSS1Property = 6
    CSS2Property = 15
    CSS3Property = 17
    Default = 0
    DoubleQuotedString = 13
    ExtendedCSSProperty = 19
    ExtendedPseudoClass = 20
    ExtendedPseudoElement = 21
    IDSelector = 10
    Important = 11
    Operator = 5
    PseudoClass = 3
    PseudoElement = 18
    SingleQuotedString = 14
    Tag = 1
    UnknownProperty = 7
    UnknownPseudoClass = 4
    Value = 8


class QsciLexerCustom(QsciLexer):

    """ QsciLexerCustom(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setEditor(self, QsciScintilla):
        """ QsciLexerCustom.setEditor(QsciScintilla) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setStyling(self, p_int, *__args):
        """
        QsciLexerCustom.setStyling(int, int)
        QsciLexerCustom.setStyling(int, QsciStyle)
        """
        pass

    # real signature unknown; restored from __doc__
    def startStyling(self, p_int, int_style_bits=0):
        """ QsciLexerCustom.startStyling(int, int style_bits=0) """
        pass

    def styleBitsNeeded(self):  # real signature unknown; restored from __doc__
        """ QsciLexerCustom.styleBitsNeeded() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def styleText(self, p_int, p_int_1):
        """ QsciLexerCustom.styleText(int, int) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerD(QsciLexer):

    """ QsciLexerD(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerD.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerD.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerD.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerD.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerD.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerD.foldAtElse() -> bool """
        return False

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerD.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerD.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerD.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerD.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerD.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerD.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerD.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerD.setFoldAtElse(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerD.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerD.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerD.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Character = 12
    Comment = 1
    CommentDoc = 3
    CommentDocKeyword = 16
    CommentDocKeywordError = 17
    CommentLine = 2
    CommentLineDoc = 15
    CommentNested = 4
    Default = 0
    Identifier = 14
    Keyword = 6
    KeywordDoc = 8
    KeywordSecondary = 7
    Number = 5
    Operator = 13
    String = 10
    Typedefs = 9
    UnclosedString = 11


class QsciLexerDiff(QsciLexer):

    """ QsciLexerDiff(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerDiff.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerDiff.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerDiff.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerDiff.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Command = 2
    Comment = 1
    Default = 0
    Header = 3
    LineAdded = 6
    LineChanged = 7
    LineRemoved = 5
    Position = 4


class QsciLexerFortran77(QsciLexer):

    """ QsciLexerFortran77(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerFortran77.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerFortran77.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerFortran77.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerFortran77.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerFortran77.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran77.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran77.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran77.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran77.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerFortran77.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerFortran77.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerFortran77.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerFortran77.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    Continuation = 14
    Default = 0
    DottedOperator = 12
    DoubleQuotedString = 4
    ExtendedFunction = 10
    Identifier = 7
    IntrinsicFunction = 9
    Keyword = 8
    Label = 13
    Number = 2
    Operator = 6
    PreProcessor = 11
    SingleQuotedString = 3
    UnclosedString = 5


class QsciLexerFortran(QsciLexerFortran77):

    """ QsciLexerFortran(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerFortran.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerHTML(QsciLexer):

    """ QsciLexerHTML(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def caseSensitiveTags(self):
        """ QsciLexerHTML.caseSensitiveTags() -> bool """
        return False

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerHTML.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerHTML.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerHTML.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerHTML.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerHTML.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerHTML.foldCompact() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldPreprocessor(self):
        """ QsciLexerHTML.foldPreprocessor() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldScriptComments(self):
        """ QsciLexerHTML.foldScriptComments() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldScriptHeredocs(self):
        """ QsciLexerHTML.foldScriptHeredocs() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerHTML.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerHTML.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerHTML.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerHTML.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerHTML.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setCaseSensitiveTags(self, bool):
        """ QsciLexerHTML.setCaseSensitiveTags(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerHTML.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPreprocessor(self, bool):
        """ QsciLexerHTML.setFoldPreprocessor(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldScriptComments(self, bool):
        """ QsciLexerHTML.setFoldScriptComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldScriptHeredocs(self, bool):
        """ QsciLexerHTML.setFoldScriptHeredocs(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerHTML.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    ASPAtStart = 15
    ASPJavaScriptComment = 57
    ASPJavaScriptCommentDoc = 59
    ASPJavaScriptCommentLine = 58
    ASPJavaScriptDefault = 56
    ASPJavaScriptDoubleQuotedString = 63
    ASPJavaScriptKeyword = 62
    ASPJavaScriptNumber = 60
    ASPJavaScriptRegex = 67
    ASPJavaScriptSingleQuotedString = 64
    ASPJavaScriptStart = 55
    ASPJavaScriptSymbol = 65
    ASPJavaScriptUnclosedString = 66
    ASPJavaScriptWord = 61
    ASPPythonClassName = 114
    ASPPythonComment = 107
    ASPPythonDefault = 106
    ASPPythonDoubleQuotedString = 109
    ASPPythonFunctionMethodName = 115
    ASPPythonIdentifier = 117
    ASPPythonKeyword = 111
    ASPPythonNumber = 108
    ASPPythonOperator = 116
    ASPPythonSingleQuotedString = 110
    ASPPythonStart = 105
    ASPPythonTripleDoubleQuotedString = 113
    ASPPythonTripleSingleQuotedString = 112
    ASPStart = 16
    ASPVBScriptComment = 82
    ASPVBScriptDefault = 81
    ASPVBScriptIdentifier = 86
    ASPVBScriptKeyword = 84
    ASPVBScriptNumber = 83
    ASPVBScriptStart = 80
    ASPVBScriptString = 85
    ASPVBScriptUnclosedString = 87
    ASPXCComment = 20
    Attribute = 3
    CDATA = 17
    Default = 0
    Entity = 10
    HTMLComment = 9
    HTMLDoubleQuotedString = 6
    HTMLNumber = 5
    HTMLSingleQuotedString = 7
    HTMLValue = 19
    JavaScriptComment = 42
    JavaScriptCommentDoc = 44
    JavaScriptCommentLine = 43
    JavaScriptDefault = 41
    JavaScriptDoubleQuotedString = 48
    JavaScriptKeyword = 47
    JavaScriptNumber = 45
    JavaScriptRegex = 52
    JavaScriptSingleQuotedString = 49
    JavaScriptStart = 40
    JavaScriptSymbol = 50
    JavaScriptUnclosedString = 51
    JavaScriptWord = 46
    OtherInTag = 8
    PHPComment = 124
    PHPCommentLine = 125
    PHPDefault = 118
    PHPDoubleQuotedString = 119
    PHPDoubleQuotedVariable = 126
    PHPKeyword = 121
    PHPNumber = 122
    PHPOperator = 127
    PHPSingleQuotedString = 120
    PHPStart = 18
    PHPVariable = 123
    PythonClassName = 99
    PythonComment = 92
    PythonDefault = 91
    PythonDoubleQuotedString = 94
    PythonFunctionMethodName = 100
    PythonIdentifier = 102
    PythonKeyword = 96
    PythonNumber = 93
    PythonOperator = 101
    PythonSingleQuotedString = 95
    PythonStart = 90
    PythonTripleDoubleQuotedString = 98
    PythonTripleSingleQuotedString = 97
    Script = 14
    SGMLBlockDefault = 31
    SGMLCommand = 22
    SGMLComment = 29
    SGMLDefault = 21
    SGMLDoubleQuotedString = 24
    SGMLEntity = 28
    SGMLError = 26
    SGMLParameter = 23
    SGMLParameterComment = 30
    SGMLSingleQuotedString = 25
    SGMLSpecial = 27
    Tag = 1
    UnknownAttribute = 4
    UnknownTag = 2
    VBScriptComment = 72
    VBScriptDefault = 71
    VBScriptIdentifier = 76
    VBScriptKeyword = 74
    VBScriptNumber = 73
    VBScriptStart = 70
    VBScriptString = 75
    VBScriptUnclosedString = 77
    XMLEnd = 13
    XMLStart = 12
    XMLTagEnd = 11


class QsciLexerIDL(QsciLexerCPP):

    """ QsciLexerIDL(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerIDL.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerIDL.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerIDL.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerIDL.language() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerJava(QsciLexerCPP):

    """ QsciLexerJava(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerJava.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerJava.language() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerJavaScript(QsciLexerCPP):

    """ QsciLexerJavaScript(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerJavaScript.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerJavaScript.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerJavaScript.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerJavaScript.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerJavaScript.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerJavaScript.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerJavaScript.language() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerLua(QsciLexer):

    """ QsciLexerLua(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerLua.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerLua.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerLua.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerLua.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerLua.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerLua.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerLua.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerLua.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerLua.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerLua.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerLua.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerLua.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerLua.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    BasicFunctions = 13
    Character = 7
    Comment = 1
    CoroutinesIOSystemFacilities = 15
    Default = 0
    Identifier = 11
    Keyword = 5
    LineComment = 2
    LiteralString = 8
    Number = 4
    Operator = 10
    Preprocessor = 9
    String = 6
    StringTableMathsFunctions = 14
    UnclosedString = 12


class QsciLexerMakefile(QsciLexer):

    """ QsciLexerMakefile(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerMakefile.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerMakefile.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerMakefile.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerMakefile.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerMakefile.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerMakefile.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerMakefile.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    Default = 0
    Error = 9
    Operator = 4
    Preprocessor = 2
    Target = 5
    Variable = 3


class QsciLexerPascal(QsciLexer):

    """ QsciLexerPascal(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerPascal.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerPascal.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerPascal.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerPascal.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerPascal.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPascal.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPascal.foldCompact() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldPreprocessor(self):
        """ QsciLexerPascal.foldPreprocessor() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPascal.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPascal.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPascal.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerPascal.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerPascal.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerPascal.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerPascal.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPreprocessor(self, bool):
        """ QsciLexerPascal.setFoldPreprocessor(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setSmartHighlighting(self, bool):
        """ QsciLexerPascal.setSmartHighlighting(bool) """
        pass

    # real signature unknown; restored from __doc__
    def smartHighlighting(self):
        """ QsciLexerPascal.smartHighlighting() -> bool """
        return False

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerPascal.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Asm = 14
    Character = 12
    Comment = 2
    CommentLine = 4
    CommentParenthesis = 3
    Default = 0
    HexNumber = 8
    Identifier = 1
    Keyword = 9
    Number = 7
    Operator = 13
    PreProcessor = 5
    PreProcessorParenthesis = 6
    SingleQuotedString = 10
    UnclosedString = 11


class QsciLexerPerl(QsciLexer):

    """ QsciLexerPerl(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerPerl.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerPerl.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerPerl.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerPerl.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerPerl.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.foldCompact() -> bool """
        return False

    def foldPackages(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.foldPackages() -> bool """
        return False

    def foldPODBlocks(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.foldPODBlocks() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPerl.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerPerl.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerPerl.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerPerl.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerPerl.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPackages(self, bool):
        """ QsciLexerPerl.setFoldPackages(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPODBlocks(self, bool):
        """ QsciLexerPerl.setFoldPODBlocks(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerPerl.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Array = 13
    BacktickHereDocument = 25
    Backticks = 20
    Comment = 2
    DataSection = 21
    Default = 0
    DoubleQuotedHereDocument = 24
    DoubleQuotedString = 6
    Error = 1
    FormatBody = 42
    FormatIdentifier = 41
    Hash = 14
    HereDocumentDelimiter = 22
    Identifier = 11
    Keyword = 5
    Number = 4
    Operator = 10
    POD = 3
    PODVerbatim = 31
    QuotedStringQ = 26
    QuotedStringQQ = 27
    QuotedStringQR = 29
    QuotedStringQW = 30
    QuotedStringQX = 28
    Regex = 17
    Scalar = 12
    SingleQuotedHereDocument = 23
    SingleQuotedString = 7
    SubroutinePrototype = 40
    Substitution = 18
    SymbolTable = 15


class QsciLexerPostScript(QsciLexer):

    """ QsciLexerPostScript(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerPostScript.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerPostScript.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerPostScript.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerPostScript.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.foldAtElse() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.language() -> str """
        return ""

    def level(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.level() -> int """
        return 0

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerPostScript.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerPostScript.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerPostScript.setFoldAtElse(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerPostScript.setFoldCompact(bool) """
        pass

    def setLevel(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.setLevel(int) """
        pass

    # real signature unknown; restored from __doc__
    def setTokenize(self, bool):
        """ QsciLexerPostScript.setTokenize(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tokenize(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPostScript.tokenize() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerPostScript.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    ArrayParenthesis = 9
    BadStringCharacter = 15
    Base85String = 14
    Comment = 1
    Default = 0
    DictionaryParenthesis = 10
    DSCComment = 2
    DSCCommentValue = 3
    HexString = 13
    ImmediateEvalLiteral = 8
    Keyword = 6
    Literal = 7
    Name = 5
    Number = 4
    ProcedureParenthesis = 11
    Text = 12


class QsciLexerPOV(QsciLexer):

    """ QsciLexerPOV(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerPOV.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerPOV.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerPOV.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerPOV.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerPOV.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.foldCompact() -> bool """
        return False

    def foldDirectives(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.foldDirectives() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPOV.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerPOV.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerPOV.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerPOV.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerPOV.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldDirectives(self, bool):
        """ QsciLexerPOV.setFoldDirectives(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerPOV.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    BadDirective = 9
    Comment = 1
    CommentLine = 2
    Default = 0
    Directive = 8
    Identifier = 5
    KeywordSet6 = 14
    KeywordSet7 = 15
    KeywordSet8 = 16
    Number = 3
    ObjectsCSGAppearance = 10
    Operator = 4
    PredefinedFunctions = 13
    PredefinedIdentifiers = 12
    String = 6
    TypesModifiersItems = 11
    UnclosedString = 7


class QsciLexerProperties(QsciLexer):

    """ QsciLexerProperties(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerProperties.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerProperties.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerProperties.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerProperties.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerProperties.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerProperties.foldCompact() -> bool """
        return False

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerProperties.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerProperties.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerProperties.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerProperties.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerProperties.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerProperties.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Assignment = 3
    Comment = 1
    Default = 0
    DefaultValue = 4
    Section = 2


class QsciLexerPython(QsciLexer):

    """ QsciLexerPython(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerPython.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerPython.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerPython.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerPython.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerPython.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.foldComments() -> bool """
        return False

    def foldQuotes(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.foldQuotes() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indentationWarning(self):
        """ QsciLexerPython.indentationWarning() -> QsciLexerPython.IndentationWarning """
        pass

    def IndentationWarning(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerPython.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerPython.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerPython.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldQuotes(self, bool):
        """ QsciLexerPython.setFoldQuotes(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationWarning(self, QsciLexerPython_IndentationWarning):
        """ QsciLexerPython.setIndentationWarning(QsciLexerPython.IndentationWarning) """
        pass

    # real signature unknown; restored from __doc__
    def setV2UnicodeAllowed(self, bool):
        """ QsciLexerPython.setV2UnicodeAllowed(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setV3BinaryOctalAllowed(self, bool):
        """ QsciLexerPython.setV3BinaryOctalAllowed(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setV3BytesAllowed(self, bool):
        """ QsciLexerPython.setV3BytesAllowed(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def v2UnicodeAllowed(self):
        """ QsciLexerPython.v2UnicodeAllowed() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def v3BinaryOctalAllowed(self):
        """ QsciLexerPython.v3BinaryOctalAllowed() -> bool """
        return False

    def v3BytesAllowed(self):  # real signature unknown; restored from __doc__
        """ QsciLexerPython.v3BytesAllowed() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerPython.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    ClassName = 8
    Comment = 1
    CommentBlock = 12
    Decorator = 15
    Default = 0
    DoubleQuotedString = 3
    FunctionMethodName = 9
    HighlightedIdentifier = 14
    Identifier = 11
    Inconsistent = 1
    Keyword = 5
    NoWarning = 0
    Number = 2
    Operator = 10
    SingleQuotedString = 4
    Spaces = 3
    Tabs = 4
    TabsAfterSpaces = 2
    TripleDoubleQuotedString = 7
    TripleSingleQuotedString = 6
    UnclosedString = 13


class QsciLexerRuby(QsciLexer):

    """ QsciLexerRuby(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerRuby.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerRuby.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerRuby.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerRuby.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerRuby.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerRuby.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerRuby.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerRuby.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Backticks = 18
    ClassName = 8
    ClassVariable = 17
    Comment = 2
    DataSection = 19
    Default = 0
    DemotedKeyword = 29
    DoubleQuotedString = 6
    Error = 1
    FunctionMethodName = 9
    Global = 13
    HereDocument = 21
    HereDocumentDelimiter = 20
    Identifier = 11
    InstanceVariable = 16
    Keyword = 5
    ModuleName = 15
    Number = 4
    Operator = 10
    PercentStringq = 24
    PercentStringQ = 25
    PercentStringr = 27
    PercentStringw = 28
    PercentStringx = 26
    POD = 3
    Regex = 12
    SingleQuotedString = 7
    Stderr = 40
    Stdin = 30
    Stdout = 31
    Symbol = 14


class QsciLexerSpice(QsciLexer):

    """ QsciLexerSpice(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerSpice.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerSpice.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerSpice.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerSpice.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSpice.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSpice.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Command = 2
    Comment = 8
    Default = 0
    Delimiter = 6
    Function = 3
    Identifier = 1
    Number = 5
    Parameter = 4
    Value = 7


class QsciLexerSQL(QsciLexer):

    """ QsciLexerSQL(QObject parent=None) """

    # real signature unknown; restored from __doc__
    def backslashEscapes(self):
        """ QsciLexerSQL.backslashEscapes() -> bool """
        return False

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerSQL.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerSQL.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerSQL.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerSQL.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerSQL.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSQL.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSQL.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerSQL.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSQL.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerSQL.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerSQL.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerSQL.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setBackslashEscapes(self, bool):
        """ QsciLexerSQL.setBackslashEscapes(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerSQL.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerSQL.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerSQL.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    CommentDoc = 3
    CommentDocKeyword = 17
    CommentDocKeywordError = 18
    CommentLine = 2
    CommentLineHash = 15
    Default = 0
    DoubleQuotedString = 6
    Identifier = 11
    Keyword = 5
    KeywordSet5 = 19
    KeywordSet6 = 20
    KeywordSet7 = 21
    KeywordSet8 = 22
    Number = 4
    Operator = 10
    PlusComment = 13
    PlusKeyword = 8
    PlusPrompt = 9
    SingleQuotedString = 7


class QsciLexerTCL(QsciLexer):

    """ QsciLexerTCL(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerTCL.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerTCL.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerTCL.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerTCL.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerTCL.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerTCL.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerTCL.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerTCL.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerTCL.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerTCL.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerTCL.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerTCL.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerTCL.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    CommentBlock = 21
    CommentBox = 20
    CommentLine = 2
    Default = 0
    ExpandKeyword = 11
    Identifier = 7
    ITCLKeyword = 14
    KeywordSet6 = 16
    KeywordSet7 = 17
    KeywordSet8 = 18
    KeywordSet9 = 19
    Modifier = 10
    Number = 3
    Operator = 6
    QuotedKeyword = 4
    QuotedString = 5
    Substitution = 8
    SubstitutionBrace = 9
    TCLKeyword = 12
    TkCommand = 15
    TkKeyword = 13


class QsciLexerTeX(QsciLexer):

    """ QsciLexerTeX(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerTeX.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerTeX.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerTeX.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerTeX.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerTeX.lexer() -> str """
        return ""

    def readProperties(self, *args, **kwargs):  # real signature unknown
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def writeProperties(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Command = 4
    Default = 0
    Group = 2
    Special = 1
    Symbol = 3
    Text = 5


class QsciLexerVerilog(QsciLexer):

    """ QsciLexerVerilog(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerVerilog.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerVerilog.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerVerilog.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerVerilog.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerVerilog.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.foldAtElse() -> bool """
        return False

    def foldAtModule(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.foldAtModule() -> bool """
        return False

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.foldCompact() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldPreprocessor(self):
        """ QsciLexerVerilog.foldPreprocessor() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVerilog.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerVerilog.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerVerilog.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerVerilog.setFoldAtElse(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtModule(self, bool):
        """ QsciLexerVerilog.setFoldAtModule(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerVerilog.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerVerilog.setFoldCompact(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldPreprocessor(self, bool):
        """ QsciLexerVerilog.setFoldPreprocessor(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerVerilog.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    CommentBang = 3
    CommentLine = 2
    Default = 0
    Identifier = 11
    Keyword = 5
    KeywordSet2 = 7
    Number = 4
    Operator = 10
    Preprocessor = 9
    String = 6
    SystemTask = 8
    UnclosedString = 12
    UserKeywordSet = 19


class QsciLexerVHDL(QsciLexer):

    """ QsciLexerVHDL(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerVHDL.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerVHDL.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerVHDL.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerVHDL.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerVHDL.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldAtBegin(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.foldAtBegin() -> bool """
        return False

    def foldAtElse(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.foldAtElse() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def foldAtParenthesis(self):
        """ QsciLexerVHDL.foldAtParenthesis() -> bool """
        return False

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.foldComments() -> bool """
        return False

    def foldCompact(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.foldCompact() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerVHDL.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerVHDL.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerVHDL.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtBegin(self, bool):
        """ QsciLexerVHDL.setFoldAtBegin(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtElse(self, bool):
        """ QsciLexerVHDL.setFoldAtElse(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldAtParenthesis(self, bool):
        """ QsciLexerVHDL.setFoldAtParenthesis(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerVHDL.setFoldComments(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldCompact(self, bool):
        """ QsciLexerVHDL.setFoldCompact(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerVHDL.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Attribute = 10
    Comment = 1
    CommentLine = 2
    Default = 0
    Identifier = 6
    Keyword = 8
    KeywordSet7 = 14
    Number = 3
    Operator = 5
    StandardFunction = 11
    StandardOperator = 9
    StandardPackage = 12
    StandardType = 13
    String = 4
    UnclosedString = 7


class QsciLexerXML(QsciLexerHTML):

    """ QsciLexerXML(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerXML.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerXML.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerXML.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerXML.defaultPaper(int) -> QColor """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerXML.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerXML.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerXML.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerXML.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerXML.refreshProperties() """
        pass

    def scriptsStyled(self):  # real signature unknown; restored from __doc__
        """ QsciLexerXML.scriptsStyled() -> bool """
        return False

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setScriptsStyled(self, bool):
        """ QsciLexerXML.setScriptsStyled(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerXML.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QsciLexerYAML(QsciLexer):

    """ QsciLexerYAML(QObject parent=None) """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def defaultColor(self, p_int):
        """ QsciLexerYAML.defaultColor(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def defaultEolFill(self, p_int):
        """ QsciLexerYAML.defaultEolFill(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def defaultFont(self, p_int):
        """ QsciLexerYAML.defaultFont(int) -> QFont """
        pass

    # real signature unknown; restored from __doc__
    def defaultPaper(self, p_int):
        """ QsciLexerYAML.defaultPaper(int) -> QColor """
        pass

    # real signature unknown; restored from __doc__
    def description(self, p_int):
        """ QsciLexerYAML.description(int) -> QString """
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def foldComments(self):  # real signature unknown; restored from __doc__
        """ QsciLexerYAML.foldComments() -> bool """
        return False

    def keywords(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciLexerYAML.keywords(int) -> str """
        return ""

    def language(self):  # real signature unknown; restored from __doc__
        """ QsciLexerYAML.language() -> str """
        return ""

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciLexerYAML.lexer() -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readProperties(self, QSettings, QString):
        """ QsciLexerYAML.readProperties(QSettings, QString) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def refreshProperties(self):
        """ QsciLexerYAML.refreshProperties() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setFoldComments(self, bool):
        """ QsciLexerYAML.setFoldComments(bool) """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def writeProperties(self, QSettings, QString):
        """ QsciLexerYAML.writeProperties(QSettings, QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Comment = 1
    Default = 0
    DocumentDelimiter = 6
    Identifier = 2
    Keyword = 3
    Number = 4
    Operator = 9
    Reference = 5
    SyntaxErrorMarker = 8
    TextBlockMarker = 7


class QsciMacro(__PyQt4_QtCore.QObject):

    """
    QsciMacro(QsciScintilla)
    QsciMacro(QString, QsciScintilla)
    """

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QsciMacro.clear() """
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def endRecording(self):  # real signature unknown; restored from __doc__
        """ QsciMacro.endRecording() """
        pass

    def load(self, QString):  # real signature unknown; restored from __doc__
        """ QsciMacro.load(QString) -> bool """
        return False

    def play(self):  # real signature unknown; restored from __doc__
        """ QsciMacro.play() """
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def save(self):  # real signature unknown; restored from __doc__
        """ QsciMacro.save() -> QString """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    def startRecording(self):  # real signature unknown; restored from __doc__
        """ QsciMacro.startRecording() """
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QsciPrinter(__PyQt4_QtGui.QPrinter):

    """ QsciPrinter(QPrinter.PrinterMode=QPrinter.ScreenResolution) """
    # real signature unknown; restored from __doc__

    def formatPage(self, QPainter, bool, QRect, p_int):
        """ QsciPrinter.formatPage(QPainter, bool, QRect, int) """
        pass

    def magnification(self):  # real signature unknown; restored from __doc__
        """ QsciPrinter.magnification() -> int """
        return 0

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def printRange(self, QsciScintillaBase, int_from=-1, int_to=-1):
        """ QsciPrinter.printRange(QsciScintillaBase, int from=-1, int to=-1) -> int """
        return 0

    def setEngines(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setMagnification(self, p_int):
        """ QsciPrinter.setMagnification(int) """
        pass

    # real signature unknown; restored from __doc__
    def setWrapMode(self, QsciScintilla_WrapMode):
        """ QsciPrinter.setWrapMode(QsciScintilla.WrapMode) """
        pass

    def wrapMode(self):  # real signature unknown; restored from __doc__
        """ QsciPrinter.wrapMode() -> QsciScintilla.WrapMode """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QPrinter_PrinterMode=None):
        pass


class QsciScintillaBase(__PyQt4_QtGui.QAbstractScrollArea):

    """ QsciScintillaBase(QWidget parent=None) """

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def canInsertFromMimeData(self, QMimeData):
        """ QsciScintillaBase.canInsertFromMimeData(QMimeData) -> bool """
        return False

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def contextMenuEvent(self, QContextMenuEvent):
        """ QsciScintillaBase.contextMenuEvent(QContextMenuEvent) """
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def dragEnterEvent(self, QDragEnterEvent):
        """ QsciScintillaBase.dragEnterEvent(QDragEnterEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragLeaveEvent(self, QDragLeaveEvent):
        """ QsciScintillaBase.dragLeaveEvent(QDragLeaveEvent) """
        pass

    # real signature unknown; restored from __doc__
    def dragMoveEvent(self, QDragMoveEvent):
        """ QsciScintillaBase.dragMoveEvent(QDragMoveEvent) """
        pass

    def drawFrame(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def dropEvent(self, QDropEvent):
        """ QsciScintillaBase.dropEvent(QDropEvent) """
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def focusInEvent(self, QFocusEvent):
        """ QsciScintillaBase.focusInEvent(QFocusEvent) """
        pass

    def focusNextChild(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def focusNextPrevChild(self, bool):
        """ QsciScintillaBase.focusNextPrevChild(bool) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def focusOutEvent(self, QFocusEvent):
        """ QsciScintillaBase.focusOutEvent(QFocusEvent) """
        pass

    def focusPreviousChild(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def fromMimeData(self, QMimeData):
        """ QsciScintillaBase.fromMimeData(QMimeData) -> QString """
        pass

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def inputMethodEvent(self, QInputMethodEvent):
        """ QsciScintillaBase.inputMethodEvent(QInputMethodEvent) """
        pass

    # real signature unknown; restored from __doc__
    def keyPressEvent(self, QKeyEvent):
        """ QsciScintillaBase.keyPressEvent(QKeyEvent) """
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def mouseDoubleClickEvent(self, QMouseEvent):
        """ QsciScintillaBase.mouseDoubleClickEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseMoveEvent(self, QMouseEvent):
        """ QsciScintillaBase.mouseMoveEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mousePressEvent(self, QMouseEvent):
        """ QsciScintillaBase.mousePressEvent(QMouseEvent) """
        pass

    # real signature unknown; restored from __doc__
    def mouseReleaseEvent(self, QMouseEvent):
        """ QsciScintillaBase.mouseReleaseEvent(QMouseEvent) """
        pass

    def moveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def paintEvent(self, QPaintEvent):
        """ QsciScintillaBase.paintEvent(QPaintEvent) """
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def pool(self):  # real signature unknown; restored from __doc__
        """ QsciScintillaBase.pool() -> QsciScintillaBase """
        return QsciScintillaBase

    def QSCN_SELCHANGED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.QSCN_SELCHANGED[bool] [signal] """
        pass

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def resizeEvent(self, QResizeEvent):
        """ QsciScintillaBase.resizeEvent(QResizeEvent) """
        pass

    def SCEN_CHANGE(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCEN_CHANGE[] [signal] """
        pass

    def SCN_AUTOCCANCELLED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_AUTOCCANCELLED[] [signal] """
        pass

    def SCN_AUTOCCHARDELETED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_AUTOCCHARDELETED[] [signal] """
        pass

    def SCN_AUTOCSELECTION(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_AUTOCSELECTION[str, int] [signal] """
        pass

    def SCN_CALLTIPCLICK(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_CALLTIPCLICK[int] [signal] """
        pass

    def SCN_CHARADDED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_CHARADDED[int] [signal] """
        pass

    def SCN_DOUBLECLICK(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_DOUBLECLICK[int, int, int] [signal] """
        pass

    def SCN_DWELLEND(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_DWELLEND[int, int, int] [signal] """
        pass

    def SCN_DWELLSTART(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_DWELLSTART[int, int, int] [signal] """
        pass

    def SCN_HOTSPOTCLICK(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_HOTSPOTCLICK[int, int] [signal] """
        pass

    # real signature unknown
    def SCN_HOTSPOTDOUBLECLICK(self, *args, **kwargs):
        """ QsciScintillaBase.SCN_HOTSPOTDOUBLECLICK[int, int] [signal] """
        pass

    def SCN_INDICATORCLICK(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_INDICATORCLICK[int, int] [signal] """
        pass

    def SCN_INDICATORRELEASE(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_INDICATORRELEASE[int, int] [signal] """
        pass

    def SCN_MACRORECORD(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_MACRORECORD[int, int, sip.voidptr] [signal] """
        pass

    def SCN_MARGINCLICK(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_MARGINCLICK[int, int, int] [signal] """
        pass

    def SCN_MODIFIED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_MODIFIED[int, int, str, int, int, int, int, int, int, int] [signal] """
        pass

    def SCN_MODIFYATTEMPTRO(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_MODIFYATTEMPTRO[] [signal] """
        pass

    def SCN_NEEDSHOWN(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_NEEDSHOWN[int, int] [signal] """
        pass

    def SCN_PAINTED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_PAINTED[] [signal] """
        pass

    def SCN_SAVEPOINTLEFT(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_SAVEPOINTLEFT[] [signal] """
        pass

    def SCN_SAVEPOINTREACHED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_SAVEPOINTREACHED[] [signal] """
        pass

    def SCN_STYLENEEDED(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_STYLENEEDED[int] [signal] """
        pass

    def SCN_UPDATEUI(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_UPDATEUI[] [signal] """
        pass

    def SCN_USERLISTSELECTION(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_USERLISTSELECTION[str, int] [signal] """
        pass

    def SCN_ZOOM(self, *args, **kwargs):  # real signature unknown
        """ QsciScintillaBase.SCN_ZOOM[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def scrollContentsBy(self, p_int, p_int_1):
        """ QsciScintillaBase.scrollContentsBy(int, int) """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def SendScintilla(self, p_int, *__args):
        """
        QsciScintillaBase.SendScintilla(int, int wParam=0, int lParam=0) -> int
        QsciScintillaBase.SendScintilla(int, int, sip.voidptr) -> int
        QsciScintillaBase.SendScintilla(int, int, str) -> int
        QsciScintillaBase.SendScintilla(int, str) -> int
        QsciScintillaBase.SendScintilla(int, str, str) -> int
        QsciScintillaBase.SendScintilla(int, int) -> int
        QsciScintillaBase.SendScintilla(int, int, int, str) -> int
        QsciScintillaBase.SendScintilla(int, int, QColor) -> int
        QsciScintillaBase.SendScintilla(int, QColor) -> int
        QsciScintillaBase.SendScintilla(int, int, QPainter, QRect, int, int) -> int
        QsciScintillaBase.SendScintilla(int, int, QPixmap) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def SendScintillaPtrResult(self, p_int):
        """ QsciScintillaBase.SendScintillaPtrResult(int) -> sip.voidptr """
        pass

    def setupViewport(self, *args, **kwargs):  # real signature unknown
        pass

    def setViewportMargins(self, *args, **kwargs):  # real signature unknown
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def toMimeData(self, QString):
        """ QsciScintillaBase.toMimeData(QString) -> QMimeData """
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def viewportEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget_parent=None):
        pass

    ANNOTATION_BOXED = 2
    ANNOTATION_HIDDEN = 0
    ANNOTATION_STANDARD = 1
    CARETSTYLE_BLOCK = 2
    CARETSTYLE_INVISIBLE = 0
    CARETSTYLE_LINE = 1
    CARET_EVEN = 8
    CARET_JUMPS = 16
    CARET_SLOP = 1
    CARET_STRICT = 4
    EDGE_BACKGROUND = 2
    EDGE_LINE = 1
    EDGE_NONE = 0
    INDIC0_MASK = 32
    INDIC1_MASK = 64
    INDIC2_MASK = 128
    INDICS_MASK = 224
    INDIC_BOX = 6
    INDIC_CONTAINER = 8
    INDIC_DIAGONAL = 3
    INDIC_HIDDEN = 5
    INDIC_MAX = 31
    INDIC_PLAIN = 0
    INDIC_ROUNDBOX = 7
    INDIC_SQUIGGLE = 1
    INDIC_STRIKE = 4
    INDIC_TT = 2
    SCFIND_MATCHCASE = 4
    SCFIND_POSIX = 4194304
    SCFIND_REGEXP = 2097152
    SCFIND_WHOLEWORD = 2
    SCFIND_WORDSTART = 1048576
    SCI_ADDREFDOCUMENT = 2376
    SCI_ADDSTYLEDTEXT = 2002
    SCI_ADDTEXT = 2001
    SCI_ADDUNDOACTION = 2560
    SCI_ALLOCATE = 2446
    SCI_ANNOTATIONCLEARALL = 2547
    SCI_ANNOTATIONGETLINES = 2546
    SCI_ANNOTATIONGETSTYLE = 2543
    SCI_ANNOTATIONGETSTYLEOFFSET = 2551
    SCI_ANNOTATIONGETSTYLES = 2545
    SCI_ANNOTATIONGETTEXT = 2541
    SCI_ANNOTATIONGETVISIBLE = 2549
    SCI_ANNOTATIONSETSTYLE = 2542
    SCI_ANNOTATIONSETSTYLEOFFSET = 2550
    SCI_ANNOTATIONSETSTYLES = 2544
    SCI_ANNOTATIONSETTEXT = 2540
    SCI_ANNOTATIONSETVISIBLE = 2548
    SCI_APPENDTEXT = 2282
    SCI_ASSIGNCMDKEY = 2070
    SCI_AUTOCACTIVE = 2102
    SCI_AUTOCCANCEL = 2101
    SCI_AUTOCCOMPLETE = 2104
    SCI_AUTOCGETAUTOHIDE = 2119
    SCI_AUTOCGETCANCELATSTART = 2111
    SCI_AUTOCGETCHOOSESINGLE = 2114
    SCI_AUTOCGETCURRENT = 2445
    SCI_AUTOCGETDROPRESTOFWORD = 2271
    SCI_AUTOCGETIGNORECASE = 2116
    SCI_AUTOCGETMAXHEIGHT = 2211
    SCI_AUTOCGETMAXWIDTH = 2209
    SCI_AUTOCGETSEPARATOR = 2107
    SCI_AUTOCGETTYPESEPARATOR = 2285
    SCI_AUTOCPOSSTART = 2103
    SCI_AUTOCSELECT = 2108
    SCI_AUTOCSETAUTOHIDE = 2118
    SCI_AUTOCSETCANCELATSTART = 2110
    SCI_AUTOCSETCHOOSESINGLE = 2113
    SCI_AUTOCSETDROPRESTOFWORD = 2270
    SCI_AUTOCSETFILLUPS = 2112
    SCI_AUTOCSETIGNORECASE = 2115
    SCI_AUTOCSETMAXHEIGHT = 2210
    SCI_AUTOCSETMAXWIDTH = 2208
    SCI_AUTOCSETSEPARATOR = 2106
    SCI_AUTOCSETTYPESEPARATOR = 2286
    SCI_AUTOCSHOW = 2100
    SCI_AUTOCSTOPS = 2105
    SCI_BACKTAB = 2328
    SCI_BEGINUNDOACTION = 2078
    SCI_BRACEBADLIGHT = 2352
    SCI_BRACEHIGHLIGHT = 2351
    SCI_BRACEMATCH = 2353
    SCI_CALLTIPACTIVE = 2202
    SCI_CALLTIPCANCEL = 2201
    SCI_CALLTIPPOSSTART = 2203
    SCI_CALLTIPSETBACK = 2205
    SCI_CALLTIPSETFORE = 2206
    SCI_CALLTIPSETFOREHLT = 2207
    SCI_CALLTIPSETHLT = 2204
    SCI_CALLTIPSHOW = 2200
    SCI_CALLTIPUSESTYLE = 2212
    SCI_CANCEL = 2325
    SCI_CANPASTE = 2173
    SCI_CANREDO = 2016
    SCI_CANUNDO = 2174
    SCI_CHARLEFT = 2304
    SCI_CHARLEFTEXTEND = 2305
    SCI_CHARLEFTRECTEXTEND = 2428
    SCI_CHARRIGHT = 2306
    SCI_CHARRIGHTEXTEND = 2307
    SCI_CHARRIGHTRECTEXTEND = 2429
    SCI_CHOOSECARETX = 2399
    SCI_CLEAR = 2180
    SCI_CLEARALL = 2004
    SCI_CLEARALLCMDKEYS = 2072
    SCI_CLEARCMDKEY = 2071
    SCI_CLEARDOCUMENTSTYLE = 2005
    SCI_CLEARREGISTEREDIMAGES = 2408
    SCI_COLOURISE = 4003
    SCI_CONVERTEOLS = 2029
    SCI_COPY = 2178
    SCI_COPYALLOWLINE = 2519
    SCI_COPYRANGE = 2419
    SCI_COPYTEXT = 2420
    SCI_CREATEDOCUMENT = 2375
    SCI_CUT = 2177
    SCI_DELETEBACK = 2326
    SCI_DELETEBACKNOTLINE = 2344
    SCI_DELLINELEFT = 2395
    SCI_DELLINERIGHT = 2396
    SCI_DELWORDLEFT = 2335
    SCI_DELWORDRIGHT = 2336
    SCI_DELWORDRIGHTEND = 2518
    SCI_DOCLINEFROMVISIBLE = 2221
    SCI_DOCUMENTEND = 2318
    SCI_DOCUMENTENDEXTEND = 2319
    SCI_DOCUMENTSTART = 2316
    SCI_DOCUMENTSTARTEXTEND = 2317
    SCI_EDITTOGGLEOVERTYPE = 2324
    SCI_EMPTYUNDOBUFFER = 2175
    SCI_ENDUNDOACTION = 2079
    SCI_ENSUREVISIBLE = 2232
    SCI_ENSUREVISIBLEENFORCEPOLICY = 2234
    SCI_FINDCOLUMN = 2456
    SCI_FINDTEXT = 2150
    SCI_FORMATRANGE = 2151
    SCI_FORMFEED = 2330
    SCI_GETANCHOR = 2009
    SCI_GETBACKSPACEUNINDENTS = 2263
    SCI_GETBUFFEREDDRAW = 2034
    SCI_GETCARETFORE = 2138
    SCI_GETCARETLINEBACK = 2097
    SCI_GETCARETLINEBACKALPHA = 2471
    SCI_GETCARETLINEVISIBLE = 2095
    SCI_GETCARETPERIOD = 2075
    SCI_GETCARETSTICKY = 2457
    SCI_GETCARETSTYLE = 2513
    SCI_GETCARETWIDTH = 2189
    SCI_GETCHARACTERPOINTER = 2520
    SCI_GETCHARAT = 2007
    SCI_GETCODEPAGE = 2137
    SCI_GETCOLUMN = 2129
    SCI_GETCONTROLCHARSYMBOL = 2389
    SCI_GETCURLINE = 2027
    SCI_GETCURRENTPOS = 2008
    SCI_GETCURSOR = 2387
    SCI_GETDIRECTFUNCTION = 2184
    SCI_GETDIRECTPOINTER = 2185
    SCI_GETDOCPOINTER = 2357
    SCI_GETEDGECOLOUR = 2364
    SCI_GETEDGECOLUMN = 2360
    SCI_GETEDGEMODE = 2362
    SCI_GETENDATLASTLINE = 2278
    SCI_GETENDSTYLED = 2028
    SCI_GETEOLMODE = 2030
    SCI_GETEXTRAASCENT = 2526
    SCI_GETEXTRADESCENT = 2528
    SCI_GETFIRSTVISIBLELINE = 2152
    SCI_GETFOCUS = 2381
    SCI_GETFOLDEXPANDED = 2230
    SCI_GETFOLDLEVEL = 2223
    SCI_GETFOLDPARENT = 2225
    SCI_GETHIGHLIGHTGUIDE = 2135
    SCI_GETHOTSPOTACTIVEBACK = 2495
    SCI_GETHOTSPOTACTIVEFORE = 2494
    SCI_GETHOTSPOTACTIVEUNDERLINE = 2496
    SCI_GETHOTSPOTSINGLELINE = 2497
    SCI_GETHSCROLLBAR = 2131
    SCI_GETINDENT = 2123
    SCI_GETINDENTATIONGUIDES = 2133
    SCI_GETINDICATORCURRENT = 2501
    SCI_GETINDICATORVALUE = 2503
    SCI_GETKEYSUNICODE = 2522
    SCI_GETLASTCHILD = 2224
    SCI_GETLAYOUTCACHE = 2273
    SCI_GETLENGTH = 2006
    SCI_GETLEXER = 4002
    SCI_GETLINE = 2153
    SCI_GETLINECOUNT = 2154
    SCI_GETLINEENDPOSITION = 2136
    SCI_GETLINEINDENTATION = 2127
    SCI_GETLINEINDENTPOSITION = 2128
    SCI_GETLINESELENDPOSITION = 2425
    SCI_GETLINESELSTARTPOSITION = 2424
    SCI_GETLINESTATE = 2093
    SCI_GETLINEVISIBLE = 2228
    SCI_GETMARGINLEFT = 2156
    SCI_GETMARGINMASKN = 2245
    SCI_GETMARGINRIGHT = 2158
    SCI_GETMARGINSENSITIVEN = 2247
    SCI_GETMARGINTYPEN = 2241
    SCI_GETMARGINWIDTHN = 2243
    SCI_GETMAXLINESTATE = 2094
    SCI_GETMODEVENTMASK = 2378
    SCI_GETMODIFY = 2159
    SCI_GETMOUSEDOWNCAPTURES = 2385
    SCI_GETMOUSEDWELLTIME = 2265
    SCI_GETOVERTYPE = 2187
    SCI_GETPASTECONVERTENDINGS = 2468
    SCI_GETPOSITIONCACHE = 2515
    SCI_GETPRINTCOLOURMODE = 2149
    SCI_GETPRINTMAGNIFICATION = 2147
    SCI_GETPRINTWRAPMODE = 2407
    SCI_GETPROPERTY = 4008
    SCI_GETPROPERTYEXPANDED = 4009
    SCI_GETPROPERTYINT = 4010
    SCI_GETREADONLY = 2140
    SCI_GETSCROLLWIDTH = 2275
    SCI_GETSCROLLWIDTHTRACKING = 2517
    SCI_GETSEARCHFLAGS = 2199
    SCI_GETSELALPHA = 2477
    SCI_GETSELECTIONEND = 2145
    SCI_GETSELECTIONMODE = 2423
    SCI_GETSELECTIONSTART = 2143
    SCI_GETSELEOLFILLED = 2479
    SCI_GETSELTEXT = 2161
    SCI_GETSTATUS = 2383
    SCI_GETSTYLEAT = 2010
    SCI_GETSTYLEBITS = 2091
    SCI_GETSTYLEBITSNEEDED = 4011
    SCI_GETSTYLEDTEXT = 2015
    SCI_GETTABINDENTS = 2261
    SCI_GETTABWIDTH = 2121
    SCI_GETTARGETEND = 2193
    SCI_GETTARGETSTART = 2191
    SCI_GETTEXT = 2182
    SCI_GETTEXTLENGTH = 2183
    SCI_GETTEXTRANGE = 2162
    SCI_GETTWOPHASEDRAW = 2283
    SCI_GETUNDOCOLLECTION = 2019
    SCI_GETUSEPALETTE = 2139
    SCI_GETUSETABS = 2125
    SCI_GETVIEWEOL = 2355
    SCI_GETVIEWWS = 2020
    SCI_GETVSCROLLBAR = 2281
    SCI_GETWRAPMODE = 2269
    SCI_GETWRAPSTARTINDENT = 2465
    SCI_GETWRAPVISUALFLAGS = 2461
    SCI_GETWRAPVISUALFLAGSLOCATION = 2463
    SCI_GETXOFFSET = 2398
    SCI_GETZOOM = 2374
    SCI_GOTOLINE = 2024
    SCI_GOTOPOS = 2025
    SCI_GRABFOCUS = 2400
    SCI_HIDELINES = 2227
    SCI_HIDESELECTION = 2163
    SCI_HOME = 2312
    SCI_HOMEDISPLAY = 2345
    SCI_HOMEDISPLAYEXTEND = 2346
    SCI_HOMEEXTEND = 2313
    SCI_HOMERECTEXTEND = 2430
    SCI_HOMEWRAP = 2349
    SCI_HOMEWRAPEXTEND = 2450
    SCI_INDICATORALLONFOR = 2506
    SCI_INDICATORCLEARRANGE = 2505
    SCI_INDICATOREND = 2509
    SCI_INDICATORFILLRANGE = 2504
    SCI_INDICATORSTART = 2508
    SCI_INDICATORVALUEAT = 2507
    SCI_INDICGETALPHA = 2524
    SCI_INDICGETFORE = 2083
    SCI_INDICGETSTYLE = 2081
    SCI_INDICGETUNDER = 2511
    SCI_INDICSETALPHA = 2523
    SCI_INDICSETFORE = 2082
    SCI_INDICSETSTYLE = 2080
    SCI_INDICSETUNDER = 2510
    SCI_INSERTTEXT = 2003
    SCI_LEXER_START = 4000
    SCI_LINECOPY = 2455
    SCI_LINECUT = 2337
    SCI_LINEDELETE = 2338
    SCI_LINEDOWN = 2300
    SCI_LINEDOWNEXTEND = 2301
    SCI_LINEDOWNRECTEXTEND = 2426
    SCI_LINEDUPLICATE = 2404
    SCI_LINEEND = 2314
    SCI_LINEENDDISPLAY = 2347
    SCI_LINEENDDISPLAYEXTEND = 2348
    SCI_LINEENDEXTEND = 2315
    SCI_LINEENDRECTEXTEND = 2432
    SCI_LINEENDWRAP = 2451
    SCI_LINEENDWRAPEXTEND = 2452
    SCI_LINEFROMPOSITION = 2166
    SCI_LINELENGTH = 2350
    SCI_LINESCROLL = 2168
    SCI_LINESCROLLDOWN = 2342
    SCI_LINESCROLLUP = 2343
    SCI_LINESJOIN = 2288
    SCI_LINESONSCREEN = 2370
    SCI_LINESSPLIT = 2289
    SCI_LINETRANSPOSE = 2339
    SCI_LINEUP = 2302
    SCI_LINEUPEXTEND = 2303
    SCI_LINEUPRECTEXTEND = 2427
    SCI_LOADLEXERLIBRARY = 4007
    SCI_LOWERCASE = 2340
    SCI_MARGINGETSTYLE = 2533
    SCI_MARGINGETSTYLEOFFSET = 2538
    SCI_MARGINGETSTYLES = 2535
    SCI_MARGINGETTEXT = 2531
    SCI_MARGINSETSTYLE = 2532
    SCI_MARGINSETSTYLEOFFSET = 2537
    SCI_MARGINSETSTYLES = 2534
    SCI_MARGINSETTEXT = 2530
    SCI_MARGINTEXTCLEARALL = 2536
    SCI_MARKERADD = 2043
    SCI_MARKERADDSET = 2466
    SCI_MARKERDEFINE = 2040
    SCI_MARKERDEFINEPIXMAP = 2049
    SCI_MARKERDELETE = 2044
    SCI_MARKERDELETEALL = 2045
    SCI_MARKERDELETEHANDLE = 2018
    SCI_MARKERGET = 2046
    SCI_MARKERLINEFROMHANDLE = 2017
    SCI_MARKERNEXT = 2047
    SCI_MARKERPREVIOUS = 2048
    SCI_MARKERSETALPHA = 2476
    SCI_MARKERSETBACK = 2042
    SCI_MARKERSETFORE = 2041
    SCI_MARKERSYMBOLDEFINED = 2529
    SCI_MOVECARETINSIDEVIEW = 2401
    SCI_NEWLINE = 2329
    SCI_NULL = 2172
    SCI_OPTIONAL_START = 3000
    SCI_PAGEDOWN = 2322
    SCI_PAGEDOWNEXTEND = 2323
    SCI_PAGEDOWNRECTEXTEND = 2434
    SCI_PAGEUP = 2320
    SCI_PAGEUPEXTEND = 2321
    SCI_PAGEUPRECTEXTEND = 2433
    SCI_PARADOWN = 2413
    SCI_PARADOWNEXTEND = 2414
    SCI_PARAUP = 2415
    SCI_PARAUPEXTEND = 2416
    SCI_PASTE = 2179
    SCI_POINTXFROMPOSITION = 2164
    SCI_POINTYFROMPOSITION = 2165
    SCI_POSITIONAFTER = 2418
    SCI_POSITIONBEFORE = 2417
    SCI_POSITIONFROMLINE = 2167
    SCI_POSITIONFROMPOINT = 2022
    SCI_POSITIONFROMPOINTCLOSE = 2023
    SCI_REDO = 2011
    SCI_REGISTERIMAGE = 2405
    SCI_RELEASEDOCUMENT = 2377
    SCI_REPLACESEL = 2170
    SCI_REPLACETARGET = 2194
    SCI_REPLACETARGETRE = 2195
    SCI_SCROLLCARET = 2169
    SCI_SEARCHANCHOR = 2366
    SCI_SEARCHINTARGET = 2197
    SCI_SEARCHNEXT = 2367
    SCI_SEARCHPREV = 2368
    SCI_SELECTALL = 2013
    SCI_SELECTIONDUPLICATE = 2469
    SCI_SELECTIONISRECTANGLE = 2372
    SCI_SETANCHOR = 2026
    SCI_SETBACKSPACEUNINDENTS = 2262
    SCI_SETBUFFEREDDRAW = 2035
    SCI_SETCARETFORE = 2069
    SCI_SETCARETLINEBACK = 2098
    SCI_SETCARETLINEBACKALPHA = 2470
    SCI_SETCARETLINEVISIBLE = 2096
    SCI_SETCARETPERIOD = 2076
    SCI_SETCARETSTICKY = 2458
    SCI_SETCARETSTYLE = 2512
    SCI_SETCARETWIDTH = 2188
    SCI_SETCHARSDEFAULT = 2444
    SCI_SETCODEPAGE = 2037
    SCI_SETCONTROLCHARSYMBOL = 2388
    SCI_SETCURRENTPOS = 2141
    SCI_SETCURSOR = 2386
    SCI_SETDOCPOINTER = 2358
    SCI_SETEDGECOLOUR = 2365
    SCI_SETEDGECOLUMN = 2361
    SCI_SETEDGEMODE = 2363
    SCI_SETENDATLASTLINE = 2277
    SCI_SETEOLMODE = 2031
    SCI_SETEXTRAASCENT = 2525
    SCI_SETEXTRADESCENT = 2527
    SCI_SETFOCUS = 2380
    SCI_SETFOLDEXPANDED = 2229
    SCI_SETFOLDFLAGS = 2233
    SCI_SETFOLDLEVEL = 2222
    SCI_SETFOLDMARGINCOLOUR = 2290
    SCI_SETFOLDMARGINHICOLOUR = 2291
    SCI_SETHIGHLIGHTGUIDE = 2134
    SCI_SETHOTSPOTACTIVEBACK = 2411
    SCI_SETHOTSPOTACTIVEFORE = 2410
    SCI_SETHOTSPOTACTIVEUNDERLINE = 2412
    SCI_SETHSCROLLBAR = 2130
    SCI_SETINDENT = 2122
    SCI_SETINDENTATIONGUIDES = 2132
    SCI_SETINDICATORCURRENT = 2500
    SCI_SETINDICATORVALUE = 2502
    SCI_SETKEYSUNICODE = 2521
    SCI_SETKEYWORDS = 4005
    SCI_SETLAYOUTCACHE = 2272
    SCI_SETLEXER = 4001
    SCI_SETLEXERLANGUAGE = 4006
    SCI_SETLINEINDENTATION = 2126
    SCI_SETLINESTATE = 2092
    SCI_SETMARGINLEFT = 2155
    SCI_SETMARGINMASKN = 2244
    SCI_SETMARGINRIGHT = 2157
    SCI_SETMARGINSENSITIVEN = 2246
    SCI_SETMARGINTYPEN = 2240
    SCI_SETMARGINWIDTHN = 2242
    SCI_SETMODEVENTMASK = 2359
    SCI_SETMOUSEDOWNCAPTURES = 2384
    SCI_SETMOUSEDWELLTIME = 2264
    SCI_SETOVERTYPE = 2186
    SCI_SETPASTECONVERTENDINGS = 2467
    SCI_SETPOSITIONCACHE = 2514
    SCI_SETPRINTCOLOURMODE = 2148
    SCI_SETPRINTMAGNIFICATION = 2146
    SCI_SETPRINTWRAPMODE = 2406
    SCI_SETPROPERTY = 4004
    SCI_SETREADONLY = 2171
    SCI_SETSAVEPOINT = 2014
    SCI_SETSCROLLWIDTH = 2274
    SCI_SETSCROLLWIDTHTRACKING = 2516
    SCI_SETSEARCHFLAGS = 2198
    SCI_SETSEL = 2160
    SCI_SETSELALPHA = 2478
    SCI_SETSELBACK = 2068
    SCI_SETSELECTIONEND = 2144
    SCI_SETSELECTIONMODE = 2422
    SCI_SETSELECTIONSTART = 2142
    SCI_SETSELEOLFILLED = 2480
    SCI_SETSELFORE = 2067
    SCI_SETSTATUS = 2382
    SCI_SETSTYLEBITS = 2090
    SCI_SETSTYLING = 2033
    SCI_SETSTYLINGEX = 2073
    SCI_SETTABINDENTS = 2260
    SCI_SETTABWIDTH = 2036
    SCI_SETTARGETEND = 2192
    SCI_SETTARGETSTART = 2190
    SCI_SETTEXT = 2181
    SCI_SETTWOPHASEDRAW = 2284
    SCI_SETUNDOCOLLECTION = 2012
    SCI_SETUSEPALETTE = 2039
    SCI_SETUSETABS = 2124
    SCI_SETVIEWEOL = 2356
    SCI_SETVIEWWS = 2021
    SCI_SETVISIBLEPOLICY = 2394
    SCI_SETVSCROLLBAR = 2280
    SCI_SETWHITESPACEBACK = 2085
    SCI_SETWHITESPACECHARS = 2443
    SCI_SETWHITESPACEFORE = 2084
    SCI_SETWORDCHARS = 2077
    SCI_SETWRAPMODE = 2268
    SCI_SETWRAPSTARTINDENT = 2464
    SCI_SETWRAPVISUALFLAGS = 2460
    SCI_SETWRAPVISUALFLAGSLOCATION = 2462
    SCI_SETXCARETPOLICY = 2402
    SCI_SETXOFFSET = 2397
    SCI_SETYCARETPOLICY = 2403
    SCI_SETZOOM = 2373
    SCI_SHOWLINES = 2226
    SCI_START = 2000
    SCI_STARTRECORD = 3001
    SCI_STARTSTYLING = 2032
    SCI_STOPRECORD = 3002
    SCI_STUTTEREDPAGEDOWN = 2437
    SCI_STUTTEREDPAGEDOWNEXTEND = 2438
    SCI_STUTTEREDPAGEUP = 2435
    SCI_STUTTEREDPAGEUPEXTEND = 2436
    SCI_STYLECLEARALL = 2050
    SCI_STYLEGETBACK = 2482
    SCI_STYLEGETBOLD = 2483
    SCI_STYLEGETCASE = 2489
    SCI_STYLEGETCHANGEABLE = 2492
    SCI_STYLEGETCHARACTERSET = 2490
    SCI_STYLEGETEOLFILLED = 2487
    SCI_STYLEGETFONT = 2486
    SCI_STYLEGETFORE = 2481
    SCI_STYLEGETHOTSPOT = 2493
    SCI_STYLEGETITALIC = 2484
    SCI_STYLEGETSIZE = 2485
    SCI_STYLEGETUNDERLINE = 2488
    SCI_STYLEGETVISIBLE = 2491
    SCI_STYLERESETDEFAULT = 2058
    SCI_STYLESETBACK = 2052
    SCI_STYLESETBOLD = 2053
    SCI_STYLESETCASE = 2060
    SCI_STYLESETCHANGEABLE = 2099
    SCI_STYLESETCHARACTERSET = 2066
    SCI_STYLESETEOLFILLED = 2057
    SCI_STYLESETFONT = 2056
    SCI_STYLESETFORE = 2051
    SCI_STYLESETHOTSPOT = 2409
    SCI_STYLESETITALIC = 2054
    SCI_STYLESETSIZE = 2055
    SCI_STYLESETUNDERLINE = 2059
    SCI_STYLESETVISIBLE = 2074
    SCI_TAB = 2327
    SCI_TARGETFROMSELECTION = 2287
    SCI_TEXTHEIGHT = 2279
    SCI_TEXTWIDTH = 2276
    SCI_TOGGLECARETSTICKY = 2459
    SCI_TOGGLEFOLD = 2231
    SCI_UNDO = 2176
    SCI_UPPERCASE = 2341
    SCI_USEPOPUP = 2371
    SCI_USERLISTSHOW = 2117
    SCI_VCHOME = 2331
    SCI_VCHOMEEXTEND = 2332
    SCI_VCHOMERECTEXTEND = 2431
    SCI_VCHOMEWRAP = 2453
    SCI_VCHOMEWRAPEXTEND = 2454
    SCI_VISIBLEFROMDOCLINE = 2220
    SCI_WORDENDPOSITION = 2267
    SCI_WORDLEFT = 2308
    SCI_WORDLEFTEND = 2439
    SCI_WORDLEFTENDEXTEND = 2440
    SCI_WORDLEFTEXTEND = 2309
    SCI_WORDPARTLEFT = 2390
    SCI_WORDPARTLEFTEXTEND = 2391
    SCI_WORDPARTRIGHT = 2392
    SCI_WORDPARTRIGHTEXTEND = 2393
    SCI_WORDRIGHT = 2310
    SCI_WORDRIGHTEND = 2441
    SCI_WORDRIGHTENDEXTEND = 2442
    SCI_WORDRIGHTEXTEND = 2311
    SCI_WORDSTARTPOSITION = 2266
    SCI_WRAPCOUNT = 2235
    SCI_ZOOMIN = 2333
    SCI_ZOOMOUT = 2334
    SCK_ADD = 310
    SCK_BACK = 8
    SCK_DELETE = 308
    SCK_DIVIDE = 312
    SCK_DOWN = 300
    SCK_END = 305
    SCK_ESCAPE = 7
    SCK_HOME = 304
    SCK_INSERT = 309
    SCK_LEFT = 302
    SCK_MENU = 315
    SCK_NEXT = 307
    SCK_PRIOR = 306
    SCK_RETURN = 13
    SCK_RIGHT = 303
    SCK_RWIN = 314
    SCK_SUBTRACT = 311
    SCK_TAB = 9
    SCK_UP = 301
    SCK_WIN = 313
    SCLEX_ABAQUS = 84
    SCLEX_ADA = 20
    SCLEX_APDL = 61
    SCLEX_ASM = 34
    SCLEX_ASN1 = 63
    SCLEX_ASP = 4
    SCLEX_ASYMPTOTE = 85
    SCLEX_AU3 = 60
    SCLEX_AVE = 19
    SCLEX_BAAN = 31
    SCLEX_BASH = 62
    SCLEX_BATCH = 12
    SCLEX_BLITZBASIC = 66
    SCLEX_BULLANT = 27
    SCLEX_CAML = 65
    SCLEX_CLW = 45
    SCLEX_CLWNOCASE = 46
    SCLEX_CMAKE = 80
    SCLEX_COBOL = 92
    SCLEX_CONF = 17
    SCLEX_CONTAINER = 0
    SCLEX_CPP = 3
    SCLEX_CPPNOCASE = 35
    SCLEX_CSOUND = 74
    SCLEX_CSS = 38
    SCLEX_D = 79
    SCLEX_DIFF = 16
    SCLEX_EIFFEL = 23
    SCLEX_EIFFELKW = 24
    SCLEX_ERLANG = 53
    SCLEX_ERRORLIST = 10
    SCLEX_ESCRIPT = 41
    SCLEX_F77 = 37
    SCLEX_FLAGSHIP = 73
    SCLEX_FORTH = 52
    SCLEX_FORTRAN = 36
    SCLEX_FREEBASIC = 75
    SCLEX_GAP = 81
    SCLEX_GUI4CLI = 58
    SCLEX_HASKELL = 68
    SCLEX_HTML = 4
    SCLEX_INNOSETUP = 76
    SCLEX_KIX = 57
    SCLEX_LATEX = 14
    SCLEX_LISP = 21
    SCLEX_LOT = 47
    SCLEX_LOUT = 40
    SCLEX_LUA = 15
    SCLEX_MAGIK = 87
    SCLEX_MAKEFILE = 11
    SCLEX_MATLAB = 32
    SCLEX_METAPOST = 50
    SCLEX_MMIXAL = 44
    SCLEX_MSSQL = 55
    SCLEX_MYSQL = 89
    SCLEX_NIMROD = 96
    SCLEX_NNCRONTAB = 26
    SCLEX_NSIS = 43
    SCLEX_NULL = 1
    SCLEX_OCTAVE = 54
    SCLEX_OPAL = 77
    SCLEX_PASCAL = 18
    SCLEX_PERL = 6
    SCLEX_PHP = 4
    SCLEX_PHPSCRIPT = 69
    SCLEX_PLM = 82
    SCLEX_PO = 90
    SCLEX_POV = 39
    SCLEX_POWERBASIC = 51
    SCLEX_POWERPRO = 95
    SCLEX_POWERSHELL = 88
    SCLEX_PROGRESS = 83
    SCLEX_PROPERTIES = 9
    SCLEX_PS = 42
    SCLEX_PUREBASIC = 67
    SCLEX_PYTHON = 2
    SCLEX_R = 86
    SCLEX_REBOL = 71
    SCLEX_RUBY = 22
    SCLEX_SCRIPTOL = 33
    SCLEX_SMALLTALK = 72
    SCLEX_SML = 97
    SCLEX_SORCUS = 94
    SCLEX_SPECMAN = 59
    SCLEX_SPICE = 78
    SCLEX_SQL = 7
    SCLEX_TACL = 93
    SCLEX_TADS3 = 70
    SCLEX_TAL = 91
    SCLEX_TCL = 25
    SCLEX_TEX = 49
    SCLEX_VB = 8
    SCLEX_VBSCRIPT = 28
    SCLEX_VERILOG = 56
    SCLEX_VHDL = 64
    SCLEX_XML = 5
    SCLEX_YAML = 48
    SCMOD_ALT = 4
    SCMOD_CTRL = 2
    SCMOD_NORM = 0
    SCMOD_SHIFT = 1
    SCWS_INVISIBLE = 0
    SCWS_VISIBLEAFTERINDENT = 2
    SCWS_VISIBLEALWAYS = 1
    SC_ALPHA_NOALPHA = 256
    SC_ALPHA_OPAQUE = 255
    SC_ALPHA_TRANSPARENT = 0
    SC_CACHE_CARET = 1
    SC_CACHE_DOCUMENT = 3
    SC_CACHE_NONE = 0
    SC_CACHE_PAGE = 2
    SC_CASE_LOWER = 2
    SC_CASE_MIXED = 0
    SC_CASE_UPPER = 1
    SC_CHARSET_8859_15 = 1000
    SC_CHARSET_ANSI = 0
    SC_CHARSET_ARABIC = 178
    SC_CHARSET_BALTIC = 186
    SC_CHARSET_CHINESEBIG5 = 136
    SC_CHARSET_DEFAULT = 1
    SC_CHARSET_EASTEUROPE = 238
    SC_CHARSET_GB2312 = 134
    SC_CHARSET_GREEK = 161
    SC_CHARSET_HANGUL = 129
    SC_CHARSET_HEBREW = 177
    SC_CHARSET_JOHAB = 130
    SC_CHARSET_MAC = 77
    SC_CHARSET_OEM = 255
    SC_CHARSET_RUSSIAN = 204
    SC_CHARSET_SHIFTJIS = 128
    SC_CHARSET_SYMBOL = 2
    SC_CHARSET_THAI = 222
    SC_CHARSET_TURKISH = 162
    SC_CHARSET_VIETNAMESE = 163
    SC_CP_DBCS = 1
    SC_CP_UTF8 = 65001
    SC_CURSORNORMAL = -1
    SC_CURSORWAIT = 4
    SC_EOL_CR = 1
    SC_EOL_CRLF = 0
    SC_EOL_LF = 2
    SC_FOLDFLAG_LEVELNUMBERS = 64
    SC_FOLDFLAG_LINEAFTER_CONTRACTED = 16
    SC_FOLDFLAG_LINEAFTER_EXPANDED = 8
    SC_FOLDFLAG_LINEBEFORE_CONTRACTED = 4
    SC_FOLDFLAG_LINEBEFORE_EXPANDED = 2
    SC_FOLDLEVELBASE = 1024
    SC_FOLDLEVELHEADERFLAG = 8192
    SC_FOLDLEVELNUMBERMASK = 4095
    SC_FOLDLEVELWHITEFLAG = 4096
    SC_IV_LOOKBOTH = 3
    SC_IV_LOOKFORWARD = 2
    SC_IV_NONE = 0
    SC_IV_REAL = 1
    SC_LASTSTEPINUNDOREDO = 256
    SC_MARGIN_BACK = 2
    SC_MARGIN_FORE = 3
    SC_MARGIN_NUMBER = 1
    SC_MARGIN_RTEXT = 5
    SC_MARGIN_SYMBOL = 0
    SC_MARGIN_TEXT = 4
    SC_MARKNUM_FOLDER = 30
    SC_MARKNUM_FOLDEREND = 25
    SC_MARKNUM_FOLDERMIDTAIL = 27
    SC_MARKNUM_FOLDEROPEN = 31
    SC_MARKNUM_FOLDEROPENMID = 26
    SC_MARKNUM_FOLDERSUB = 29
    SC_MARKNUM_FOLDERTAIL = 28
    SC_MARK_ARROW = 2
    SC_MARK_ARROWDOWN = 6
    SC_MARK_ARROWS = 24
    SC_MARK_AVAILABLE = 28
    SC_MARK_BACKGROUND = 22
    SC_MARK_BOXMINUS = 14
    SC_MARK_BOXMINUSCONNECTED = 15
    SC_MARK_BOXPLUS = 12
    SC_MARK_BOXPLUSCONNECTED = 13
    SC_MARK_CHARACTER = 10000
    SC_MARK_CIRCLE = 0
    SC_MARK_CIRCLEMINUS = 20
    SC_MARK_CIRCLEMINUSCONNECTED = 21
    SC_MARK_CIRCLEPLUS = 18
    SC_MARK_CIRCLEPLUSCONNECTED = 19
    SC_MARK_DOTDOTDOT = 23
    SC_MARK_EMPTY = 5
    SC_MARK_FULLRECT = 26
    SC_MARK_LCORNER = 10
    SC_MARK_LCORNERCURVE = 16
    SC_MARK_LEFTRECT = 27
    SC_MARK_MINUS = 7
    SC_MARK_PIXMAP = 25
    SC_MARK_PLUS = 8
    SC_MARK_ROUNDRECT = 1
    SC_MARK_SHORTARROW = 4
    SC_MARK_SMALLRECT = 3
    SC_MARK_TCORNER = 11
    SC_MARK_TCORNERCURVE = 17
    SC_MARK_VLINE = 9
    SC_MASK_FOLDERS = -33554432
    SC_MODEVENTMASKALL = 524287
    SC_MOD_BEFOREDELETE = 2048
    SC_MOD_BEFOREINSERT = 1024
    SC_MOD_CHANGEANNOTATION = 131072
    SC_MOD_CHANGEFOLD = 8
    SC_MOD_CHANGEINDICATOR = 16384
    SC_MOD_CHANGELINESTATE = 32768
    SC_MOD_CHANGEMARGIN = 65536
    SC_MOD_CHANGEMARKER = 512
    SC_MOD_CHANGESTYLE = 4
    SC_MOD_CONTAINER = 262144
    SC_MOD_DELETETEXT = 2
    SC_MOD_INSERTTEXT = 1
    SC_MULTILINEUNDOREDO = 4096
    SC_MULTISTEPUNDOREDO = 128
    SC_PERFORMED_REDO = 64
    SC_PERFORMED_UNDO = 32
    SC_PERFORMED_USER = 16
    SC_PRINT_BLACKONWHITE = 2
    SC_PRINT_COLOURONWHITE = 3
    SC_PRINT_COLOURONWHITEDEFAULTBG = 4
    SC_PRINT_INVERTLIGHT = 1
    SC_PRINT_NORMAL = 0
    SC_SEL_LINES = 2
    SC_SEL_RECTANGLE = 1
    SC_SEL_STREAM = 0
    SC_STARTACTION = 8192
    SC_TIME_FOREVER = 10000000
    SC_WRAPVISUALFLAGLOC_DEFAULT = 0
    SC_WRAPVISUALFLAGLOC_END_BY_TEXT = 1
    SC_WRAPVISUALFLAGLOC_START_BY_TEXT = 2
    SC_WRAPVISUALFLAG_END = 1
    SC_WRAPVISUALFLAG_NONE = 0
    SC_WRAPVISUALFLAG_START = 2
    SC_WRAP_CHAR = 2
    SC_WRAP_NONE = 0
    SC_WRAP_WORD = 1
    STYLE_BRACEBAD = 35
    STYLE_BRACELIGHT = 34
    STYLE_CALLTIP = 38
    STYLE_CONTROLCHAR = 36
    STYLE_DEFAULT = 32
    STYLE_INDENTGUIDE = 37
    STYLE_LASTPREDEFINED = 39
    STYLE_LINENUMBER = 33
    STYLE_MAX = 255
    UNDO_MAY_COALESCE = 1
    VISIBLE_SLOP = 1
    VISIBLE_STRICT = 4


class QsciScintilla(QsciScintillaBase):

    """ QsciScintilla(QWidget parent=None) """

    def actionEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def annotate(self, p_int, *__args):
        """
        QsciScintilla.annotate(int, QString, int)
        QsciScintilla.annotate(int, QString, QsciStyle)
        QsciScintilla.annotate(int, QsciStyledText)
        QsciScintilla.annotate(int, list-of-QsciStyledText)
        """
        pass

    # real signature unknown; restored from __doc__
    def annotation(self, p_int):
        """ QsciScintilla.annotation(int) -> QString """
        pass

    # real signature unknown; restored from __doc__
    def annotationDisplay(self):
        """ QsciScintilla.annotationDisplay() -> QsciScintilla.AnnotationDisplay """
        pass

    def AnnotationDisplay(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def apiContext(self, p_int):
        """ QsciScintilla.apiContext(int) -> (QStringList, int, int) """
        pass

    def append(self, QString):  # real signature unknown; restored from __doc__
        """ QsciScintilla.append(QString) """
        pass

    # real signature unknown; restored from __doc__
    def autoCompleteFromAll(self):
        """ QsciScintilla.autoCompleteFromAll() """
        pass

    # real signature unknown; restored from __doc__
    def autoCompleteFromAPIs(self):
        """ QsciScintilla.autoCompleteFromAPIs() """
        pass

    # real signature unknown; restored from __doc__
    def autoCompleteFromDocument(self):
        """ QsciScintilla.autoCompleteFromDocument() """
        pass

    # real signature unknown; restored from __doc__
    def autoCompletionCaseSensitivity(self):
        """ QsciScintilla.autoCompletionCaseSensitivity() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoCompletionFillupsEnabled(self):
        """ QsciScintilla.autoCompletionFillupsEnabled() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoCompletionReplaceWord(self):
        """ QsciScintilla.autoCompletionReplaceWord() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoCompletionShowSingle(self):
        """ QsciScintilla.autoCompletionShowSingle() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def autoCompletionSource(self):
        """ QsciScintilla.autoCompletionSource() -> QsciScintilla.AutoCompletionSource """
        pass

    def AutoCompletionSource(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def autoCompletionThreshold(self):
        """ QsciScintilla.autoCompletionThreshold() -> int """
        return 0

    def autoIndent(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.autoIndent() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def backspaceUnindents(self):
        """ QsciScintilla.backspaceUnindents() -> bool """
        return False

    def beginUndoAction(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.beginUndoAction() """
        pass

    def BraceMatch(self, *args, **kwargs):  # real signature unknown
        pass

    def braceMatching(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.braceMatching() -> QsciScintilla.BraceMatch """
        pass

    def callTip(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.callTip() """
        pass

    def callTipsStyle(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.callTipsStyle() -> QsciScintilla.CallTipsStyle """
        pass

    def CallTipsStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def callTipsVisible(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.callTipsVisible() -> int """
        return 0

    def cancelList(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.cancelList() """
        pass

    def canInsertFromMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def caseSensitive(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.caseSensitive() -> bool """
        return False

    def changeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def childEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.clear() """
        pass

    # real signature unknown; restored from __doc__
    def clearAnnotations(self, int_line=-1):
        """ QsciScintilla.clearAnnotations(int line=-1) """
        pass

    def clearFolds(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.clearFolds() """
        pass

    # real signature unknown; restored from __doc__
    def clearMarginText(self, int_line=-1):
        """ QsciScintilla.clearMarginText(int line=-1) """
        pass

    # real signature unknown; restored from __doc__
    def clearRegisteredImages(self):
        """ QsciScintilla.clearRegisteredImages() """
        pass

    def closeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def color(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.color() -> QColor """
        pass

    def connectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def contextMenuEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def convertEols(self, QsciScintilla_EolMode):
        """ QsciScintilla.convertEols(QsciScintilla.EolMode) """
        pass

    def copy(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.copy() """
        pass

    def copyAvailable(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.copyAvailable[bool] [signal] """
        pass

    def create(self, *args, **kwargs):  # real signature unknown
        pass

    def cursorPositionChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.cursorPositionChanged[int, int] [signal] """
        pass

    def customEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def cut(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.cut() """
        pass

    def destroy(self, *args, **kwargs):  # real signature unknown
        pass

    def disconnectNotify(self, *args, **kwargs):  # real signature unknown
        pass

    def document(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.document() -> QsciDocument """
        return QsciDocument

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

    def edgeColor(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.edgeColor() -> QColor """
        pass

    def edgeColumn(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.edgeColumn() -> int """
        return 0

    def edgeMode(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.edgeMode() -> QsciScintilla.EdgeMode """
        pass

    def EdgeMode(self, *args, **kwargs):  # real signature unknown
        pass

    def enabledChange(self, *args, **kwargs):  # real signature unknown
        pass

    def endUndoAction(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.endUndoAction() """
        pass

    # real signature unknown; restored from __doc__
    def ensureCursorVisible(self):
        """ QsciScintilla.ensureCursorVisible() """
        pass

    # real signature unknown; restored from __doc__
    def ensureLineVisible(self, p_int):
        """ QsciScintilla.ensureLineVisible(int) """
        pass

    def enterEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def EolMode(self, *args, **kwargs):  # real signature unknown
        pass

    def eolMode(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.eolMode() -> QsciScintilla.EolMode """
        pass

    def eolVisibility(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.eolVisibility() -> bool """
        return False

    def event(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def findFirst(self, QString, bool, bool_1, bool_2, bool_3, bool_forward=True, int_line=-1, int_index=-1, bool_show=True):
        """ QsciScintilla.findFirst(QString, bool, bool, bool, bool, bool forward=True, int line=-1, int index=-1, bool show=True) -> bool """
        return False

    def findNext(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.findNext() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def firstVisibleLine(self):
        """ QsciScintilla.firstVisibleLine() -> int """
        return 0

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

    # real signature unknown; restored from __doc__
    def foldAll(self, bool_children=False):
        """ QsciScintilla.foldAll(bool children=False) """
        pass

    def folding(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.folding() -> QsciScintilla.FoldStyle """
        pass

    def foldLine(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciScintilla.foldLine(int) """
        pass

    def FoldStyle(self, *args, **kwargs):  # real signature unknown
        pass

    def fontChange(self, *args, **kwargs):  # real signature unknown
        pass

    def fromMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def getCursorPosition(self):
        """ QsciScintilla.getCursorPosition() -> (int, int) """
        pass

    def getSelection(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.getSelection() -> (int, int, int, int) """
        pass

    def hasSelectedText(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.hasSelectedText() -> bool """
        return False

    def hideEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def indent(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciScintilla.indent(int) """
        pass

    # real signature unknown; restored from __doc__
    def indentation(self, p_int):
        """ QsciScintilla.indentation(int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def indentationGuides(self):
        """ QsciScintilla.indentationGuides() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indentationsUseTabs(self):
        """ QsciScintilla.indentationsUseTabs() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def indentationWidth(self):
        """ QsciScintilla.indentationWidth() -> int """
        return 0

    def inputMethodEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def insert(self, QString):  # real signature unknown; restored from __doc__
        """ QsciScintilla.insert(QString) """
        pass

    # real signature unknown; restored from __doc__
    def insertAt(self, QString, p_int, p_int_1):
        """ QsciScintilla.insertAt(QString, int, int) """
        pass

    def isCallTipActive(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isCallTipActive() -> bool """
        return False

    def isListActive(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isListActive() -> bool """
        return False

    def isModified(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isModified() -> bool """
        return False

    def isReadOnly(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isReadOnly() -> bool """
        return False

    def isRedoAvailable(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isRedoAvailable() -> bool """
        return False

    def isUndoAvailable(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isUndoAvailable() -> bool """
        return False

    def isUtf8(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.isUtf8() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isWordCharacter(self, p_str):
        """ QsciScintilla.isWordCharacter(str) -> bool """
        return False

    def keyPressEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def keyReleaseEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def languageChange(self, *args, **kwargs):  # real signature unknown
        pass

    def leaveEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def length(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.length() -> int """
        return 0

    def lexer(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.lexer() -> QsciLexer """
        return QsciLexer

    def lineAt(self, QPoint):  # real signature unknown; restored from __doc__
        """ QsciScintilla.lineAt(QPoint) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def lineIndexFromPosition(self, p_int):
        """ QsciScintilla.lineIndexFromPosition(int) -> (int, int) """
        pass

    # real signature unknown; restored from __doc__
    def lineLength(self, p_int):
        """ QsciScintilla.lineLength(int) -> int """
        return 0

    def lines(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.lines() -> int """
        return 0

    def linesChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.linesChanged[] [signal] """
        pass

    def marginClicked(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.marginClicked[int, int, Qt.KeyboardModifiers] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def marginLineNumbers(self, p_int):
        """ QsciScintilla.marginLineNumbers(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def marginMarkerMask(self, p_int):
        """ QsciScintilla.marginMarkerMask(int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def marginSensitivity(self, p_int):
        """ QsciScintilla.marginSensitivity(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def marginType(self, p_int):
        """ QsciScintilla.marginType(int) -> QsciScintilla.MarginType """
        pass

    def MarginType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def marginWidth(self, p_int):
        """ QsciScintilla.marginWidth(int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def markerAdd(self, p_int, p_int_1):
        """ QsciScintilla.markerAdd(int, int) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def markerDefine(self, *__args):
        """
        QsciScintilla.markerDefine(QsciScintilla.MarkerSymbol, int mnr=-1) -> int
        QsciScintilla.markerDefine(str, int mnr=-1) -> int
        QsciScintilla.markerDefine(QPixmap, int mnr=-1) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def markerDelete(self, p_int, int_mnr=-1):
        """ QsciScintilla.markerDelete(int, int mnr=-1) """
        pass

    # real signature unknown; restored from __doc__
    def markerDeleteAll(self, int_mnr=-1):
        """ QsciScintilla.markerDeleteAll(int mnr=-1) """
        pass

    # real signature unknown; restored from __doc__
    def markerDeleteHandle(self, p_int):
        """ QsciScintilla.markerDeleteHandle(int) """
        pass

    # real signature unknown; restored from __doc__
    def markerFindNext(self, p_int, p_int_1):
        """ QsciScintilla.markerFindNext(int, int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def markerFindPrevious(self, p_int, p_int_1):
        """ QsciScintilla.markerFindPrevious(int, int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def markerLine(self, p_int):
        """ QsciScintilla.markerLine(int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def markersAtLine(self, p_int):
        """ QsciScintilla.markersAtLine(int) -> int """
        return 0

    def MarkerSymbol(self, *args, **kwargs):  # real signature unknown
        pass

    def metric(self, *args, **kwargs):  # real signature unknown
        pass

    def modificationAttempted(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.modificationAttempted[] [signal] """
        pass

    def modificationChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.modificationChanged[bool] [signal] """
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

    # real signature unknown; restored from __doc__
    def moveToMatchingBrace(self):
        """ QsciScintilla.moveToMatchingBrace() """
        pass

    def paintEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def paletteChange(self, *args, **kwargs):  # real signature unknown
        pass

    def paper(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.paper() -> QColor """
        pass

    def paste(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.paste() """
        pass

    # real signature unknown; restored from __doc__
    def positionFromLineIndex(self, p_int, p_int_1):
        """ QsciScintilla.positionFromLineIndex(int, int) -> int """
        return 0

    def read(self, QIODevice):  # real signature unknown; restored from __doc__
        """ QsciScintilla.read(QIODevice) -> bool """
        return False

    def receivers(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def recolor(self, int_start=0, int_end=-1):
        """ QsciScintilla.recolor(int start=0, int end=-1) """
        pass

    def redo(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.redo() """
        pass

    # real signature unknown; restored from __doc__
    def registerImage(self, p_int, QPixmap):
        """ QsciScintilla.registerImage(int, QPixmap) """
        pass

    # real signature unknown; restored from __doc__
    def removeSelectedText(self):
        """ QsciScintilla.removeSelectedText() """
        pass

    # real signature unknown; restored from __doc__
    def replace(self, QString):
        """ QsciScintilla.replace(QString) """
        pass

    # real signature unknown; restored from __doc__
    def resetFoldMarginColors(self):
        """ QsciScintilla.resetFoldMarginColors() """
        pass

    def resetInputContext(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def resetSelectionBackgroundColor(self):
        """ QsciScintilla.resetSelectionBackgroundColor() """
        pass

    # real signature unknown; restored from __doc__
    def resetSelectionForegroundColor(self):
        """ QsciScintilla.resetSelectionForegroundColor() """
        pass

    def resizeEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def scrollContentsBy(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def selectAll(self, bool_select=True):
        """ QsciScintilla.selectAll(bool select=True) """
        pass

    def selectedText(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.selectedText() -> QString """
        pass

    def selectionChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.selectionChanged[] [signal] """
        pass

    def selectionToEol(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.selectionToEol() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def selectToMatchingBrace(self):
        """ QsciScintilla.selectToMatchingBrace() """
        pass

    def sender(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setAnnotationDisplay(self, QsciScintilla_AnnotationDisplay):
        """ QsciScintilla.setAnnotationDisplay(QsciScintilla.AnnotationDisplay) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionCaseSensitivity(self, bool):
        """ QsciScintilla.setAutoCompletionCaseSensitivity(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionFillups(self, p_str):
        """ QsciScintilla.setAutoCompletionFillups(str) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionFillupsEnabled(self, bool):
        """ QsciScintilla.setAutoCompletionFillupsEnabled(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionReplaceWord(self, bool):
        """ QsciScintilla.setAutoCompletionReplaceWord(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionShowSingle(self, bool):
        """ QsciScintilla.setAutoCompletionShowSingle(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionSource(self, QsciScintilla_AutoCompletionSource):
        """ QsciScintilla.setAutoCompletionSource(QsciScintilla.AutoCompletionSource) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionThreshold(self, p_int):
        """ QsciScintilla.setAutoCompletionThreshold(int) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoCompletionWordSeparators(self, QStringList):
        """ QsciScintilla.setAutoCompletionWordSeparators(QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def setAutoIndent(self, bool):
        """ QsciScintilla.setAutoIndent(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setBackspaceUnindents(self, bool):
        """ QsciScintilla.setBackspaceUnindents(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setBraceMatching(self, QsciScintilla_BraceMatch):
        """ QsciScintilla.setBraceMatching(QsciScintilla.BraceMatch) """
        pass

    # real signature unknown; restored from __doc__
    def setCallTipsBackgroundColor(self, QColor):
        """ QsciScintilla.setCallTipsBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCallTipsForegroundColor(self, QColor):
        """ QsciScintilla.setCallTipsForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCallTipsHighlightColor(self, QColor):
        """ QsciScintilla.setCallTipsHighlightColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCallTipsStyle(self, QsciScintilla_CallTipsStyle):
        """ QsciScintilla.setCallTipsStyle(QsciScintilla.CallTipsStyle) """
        pass

    # real signature unknown; restored from __doc__
    def setCallTipsVisible(self, p_int):
        """ QsciScintilla.setCallTipsVisible(int) """
        pass

    # real signature unknown; restored from __doc__
    def setCaretForegroundColor(self, QColor):
        """ QsciScintilla.setCaretForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCaretLineBackgroundColor(self, QColor):
        """ QsciScintilla.setCaretLineBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCaretLineVisible(self, bool):
        """ QsciScintilla.setCaretLineVisible(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setCaretWidth(self, p_int):
        """ QsciScintilla.setCaretWidth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setColor(self, QColor):
        """ QsciScintilla.setColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setCursorPosition(self, p_int, p_int_1):
        """ QsciScintilla.setCursorPosition(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setDocument(self, QsciDocument):
        """ QsciScintilla.setDocument(QsciDocument) """
        pass

    # real signature unknown; restored from __doc__
    def setEdgeColor(self, QColor):
        """ QsciScintilla.setEdgeColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setEdgeColumn(self, p_int):
        """ QsciScintilla.setEdgeColumn(int) """
        pass

    # real signature unknown; restored from __doc__
    def setEdgeMode(self, QsciScintilla_EdgeMode):
        """ QsciScintilla.setEdgeMode(QsciScintilla.EdgeMode) """
        pass

    # real signature unknown; restored from __doc__
    def setEolMode(self, QsciScintilla_EolMode):
        """ QsciScintilla.setEolMode(QsciScintilla.EolMode) """
        pass

    # real signature unknown; restored from __doc__
    def setEolVisibility(self, bool):
        """ QsciScintilla.setEolVisibility(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setFolding(self, QsciScintilla_FoldStyle, int_margin=2):
        """ QsciScintilla.setFolding(QsciScintilla.FoldStyle, int margin=2) """
        pass

    # real signature unknown; restored from __doc__
    def setFoldMarginColors(self, QColor, QColor_1):
        """ QsciScintilla.setFoldMarginColors(QColor, QColor) """
        pass

    def setFont(self, QFont):  # real signature unknown; restored from __doc__
        """ QsciScintilla.setFont(QFont) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentation(self, p_int, p_int_1):
        """ QsciScintilla.setIndentation(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationGuides(self, bool):
        """ QsciScintilla.setIndentationGuides(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationGuidesBackgroundColor(self, QColor):
        """ QsciScintilla.setIndentationGuidesBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationGuidesForegroundColor(self, QColor):
        """ QsciScintilla.setIndentationGuidesForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationsUseTabs(self, bool):
        """ QsciScintilla.setIndentationsUseTabs(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setIndentationWidth(self, p_int):
        """ QsciScintilla.setIndentationWidth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setLexer(self, QsciLexer_lexer=None):
        """ QsciScintilla.setLexer(QsciLexer lexer=None) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginLineNumbers(self, p_int, bool):
        """ QsciScintilla.setMarginLineNumbers(int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginMarkerMask(self, p_int, p_int_1):
        """ QsciScintilla.setMarginMarkerMask(int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginsBackgroundColor(self, QColor):
        """ QsciScintilla.setMarginsBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginSensitivity(self, p_int, bool):
        """ QsciScintilla.setMarginSensitivity(int, bool) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginsFont(self, QFont):
        """ QsciScintilla.setMarginsFont(QFont) """
        pass

    # real signature unknown; restored from __doc__
    def setMarginsForegroundColor(self, QColor):
        """ QsciScintilla.setMarginsForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setMarginText(self, p_int, *__args):
        """
        QsciScintilla.setMarginText(int, QString, int)
        QsciScintilla.setMarginText(int, QString, QsciStyle)
        QsciScintilla.setMarginText(int, QsciStyledText)
        QsciScintilla.setMarginText(int, list-of-QsciStyledText)
        """
        pass

    # real signature unknown; restored from __doc__
    def setMarginType(self, p_int, QsciScintilla_MarginType):
        """ QsciScintilla.setMarginType(int, QsciScintilla.MarginType) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setMarginWidth(self, p_int, *__args):
        """
        QsciScintilla.setMarginWidth(int, int)
        QsciScintilla.setMarginWidth(int, QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def setMarkerBackgroundColor(self, QColor, int_mnr=-1):
        """ QsciScintilla.setMarkerBackgroundColor(QColor, int mnr=-1) """
        pass

    # real signature unknown; restored from __doc__
    def setMarkerForegroundColor(self, QColor, int_mnr=-1):
        """ QsciScintilla.setMarkerForegroundColor(QColor, int mnr=-1) """
        pass

    # real signature unknown; restored from __doc__
    def setMatchedBraceBackgroundColor(self, QColor):
        """ QsciScintilla.setMatchedBraceBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setMatchedBraceForegroundColor(self, QColor):
        """ QsciScintilla.setMatchedBraceForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setModified(self, bool):
        """ QsciScintilla.setModified(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setPaper(self, QColor):
        """ QsciScintilla.setPaper(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setReadOnly(self, bool):
        """ QsciScintilla.setReadOnly(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setSelection(self, p_int, p_int_1, p_int_2, p_int_3):
        """ QsciScintilla.setSelection(int, int, int, int) """
        pass

    # real signature unknown; restored from __doc__
    def setSelectionBackgroundColor(self, QColor):
        """ QsciScintilla.setSelectionBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setSelectionForegroundColor(self, QColor):
        """ QsciScintilla.setSelectionForegroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setSelectionToEol(self, bool):
        """ QsciScintilla.setSelectionToEol(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setTabIndents(self, bool):
        """ QsciScintilla.setTabIndents(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setTabWidth(self, p_int):
        """ QsciScintilla.setTabWidth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setText(self, QString):
        """ QsciScintilla.setText(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setUnmatchedBraceBackgroundColor(self, QColor):
        """ QsciScintilla.setUnmatchedBraceBackgroundColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setUnmatchedBraceForegroundColor(self, QColor):
        """ QsciScintilla.setUnmatchedBraceForegroundColor(QColor) """
        pass

    def setupViewport(self, *args, **kwargs):  # real signature unknown
        pass

    def setUtf8(self, bool):  # real signature unknown; restored from __doc__
        """ QsciScintilla.setUtf8(bool) """
        pass

    def setViewportMargins(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setWhitespaceVisibility(self, QsciScintilla_WhitespaceVisibility):
        """ QsciScintilla.setWhitespaceVisibility(QsciScintilla.WhitespaceVisibility) """
        pass

    # real signature unknown; restored from __doc__
    def setWrapMode(self, QsciScintilla_WrapMode):
        """ QsciScintilla.setWrapMode(QsciScintilla.WrapMode) """
        pass

    # real signature unknown; restored from __doc__
    def setWrapVisualFlags(self, QsciScintilla_WrapVisualFlag, QsciScintilla_WrapVisualFlag_sflag=None, int_sindent=0):
        """ QsciScintilla.setWrapVisualFlags(QsciScintilla.WrapVisualFlag, QsciScintilla.WrapVisualFlag sflag=QsciScintilla.WrapFlagNone, int sindent=0) """
        pass

    def showEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def showUserList(self, p_int, QStringList):
        """ QsciScintilla.showUserList(int, QStringList) """
        pass

    # real signature unknown; restored from __doc__
    def standardCommands(self):
        """ QsciScintilla.standardCommands() -> QsciCommandSet """
        return QsciCommandSet

    def tabIndents(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.tabIndents() -> bool """
        return False

    def tabletEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def tabWidth(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.tabWidth() -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def text(self, p_int=None):
        """
        QsciScintilla.text() -> QString
        QsciScintilla.text(int) -> QString
        """
        pass

    def textChanged(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.textChanged[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def textHeight(self, p_int):
        """ QsciScintilla.textHeight(int) -> int """
        return 0

    def timerEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def toMimeData(self, *args, **kwargs):  # real signature unknown
        pass

    def undo(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.undo() """
        pass

    def unindent(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciScintilla.unindent(int) """
        pass

    def updateMicroFocus(self, *args, **kwargs):  # real signature unknown
        pass

    def userListActivated(self, *args, **kwargs):  # real signature unknown
        """ QsciScintilla.userListActivated[int, QString] [signal] """
        pass

    def viewportEvent(self, *args, **kwargs):  # real signature unknown
        pass

    def wheelEvent(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def whitespaceVisibility(self):
        """ QsciScintilla.whitespaceVisibility() -> QsciScintilla.WhitespaceVisibility """
        pass

    def WhitespaceVisibility(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown
    def windowActivationChange(self, *args, **kwargs):
        pass

    # real signature unknown; restored from __doc__
    def wordAtPoint(self, QPoint):
        """ QsciScintilla.wordAtPoint(QPoint) -> QString """
        pass

    def wordCharacters(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.wordCharacters() -> str """
        return ""

    def wrapMode(self):  # real signature unknown; restored from __doc__
        """ QsciScintilla.wrapMode() -> QsciScintilla.WrapMode """
        pass

    def WrapMode(self, *args, **kwargs):  # real signature unknown
        pass

    def WrapVisualFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def write(self, QIODevice):
        """ QsciScintilla.write(QIODevice) -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def zoomIn(self, p_int=None):
        """
        QsciScintilla.zoomIn(int)
        QsciScintilla.zoomIn()
        """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def zoomOut(self, p_int=None):
        """
        QsciScintilla.zoomOut(int)
        QsciScintilla.zoomOut()
        """
        pass

    def zoomTo(self, p_int):  # real signature unknown; restored from __doc__
        """ QsciScintilla.zoomTo(int) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QWidget_parent=None):
        pass

    AcsAll = 1
    AcsAPIs = 3
    AcsDocument = 2
    AcsNone = 0
    AiClosing = 4
    AiMaintain = 1
    AiOpening = 2
    AnnotationBoxed = 2
    AnnotationHidden = 0
    AnnotationStandard = 1
    Background = 22
    BottomLeftCorner = 10
    BoxedFoldStyle = 3
    BoxedMinus = 14
    BoxedMinusConnected = 15
    BoxedPlus = 12
    BoxedPlusConnected = 13
    BoxedTreeFoldStyle = 5
    CallTipsContext = 3
    CallTipsNoAutoCompletionContext = 2
    CallTipsNoContext = 1
    CallTipsNone = 0
    Circle = 0
    CircledFoldStyle = 2
    CircledMinus = 20
    CircledMinusConnected = 21
    CircledPlus = 18
    CircledPlusConnected = 19
    CircledTreeFoldStyle = 4
    DownTriangle = 6
    EdgeBackground = 2
    EdgeLine = 1
    EdgeNone = 0
    EolMac = 1
    EolUnix = 2
    EolWindows = 0
    Invisible = 5
    LeftSideRoundedSplitter = 17
    LeftSideSplitter = 11
    Minus = 7
    NoBraceMatch = 0
    NoFoldStyle = 0
    NumberMargin = 1
    PlainFoldStyle = 1
    Plus = 8
    Rectangle = 1
    RightArrow = 4
    RightTriangle = 2
    RoundedBottomLeftCorner = 16
    SloppyBraceMatch = 2
    SmallRectangle = 3
    StrictBraceMatch = 1
    SymbolMargin = 0
    SymbolMarginDefaultBackgroundColor = 2
    SymbolMarginDefaultForegroundColor = 3
    TextMargin = 4
    TextMarginRightJustified = 5
    ThreeDots = 23
    ThreeRightArrows = 24
    VerticalLine = 9
    WrapCharacter = 2
    WrapFlagByBorder = 2
    WrapFlagByText = 1
    WrapFlagNone = 0
    WrapNone = 0
    WrapWord = 1
    WsInvisible = 0
    WsVisible = 1
    WsVisibleAfterIndent = 2


class QsciStyle():  # skipped bases: <type 'sip.wrapper'>

    """
    QsciStyle(int style=-1)
    QsciStyle(int, QString, QColor, QColor, QFont, bool eol_fill=False)
    QsciStyle(QsciStyle)
    """

    def changeable(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.changeable() -> bool """
        return False

    def color(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.color() -> QColor """
        pass

    def description(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.description() -> QString """
        pass

    def eolFill(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.eolFill() -> bool """
        return False

    def font(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.font() -> QFont """
        pass

    def hotspot(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.hotspot() -> bool """
        return False

    def paper(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.paper() -> QColor """
        pass

    def refresh(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.refresh() """
        pass

    # real signature unknown; restored from __doc__
    def setChangeable(self, bool):
        """ QsciStyle.setChangeable(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setColor(self, QColor):
        """ QsciStyle.setColor(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setDescription(self, QString):
        """ QsciStyle.setDescription(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setEolFill(self, bool):
        """ QsciStyle.setEolFill(bool) """
        pass

    def setFont(self, QFont):  # real signature unknown; restored from __doc__
        """ QsciStyle.setFont(QFont) """
        pass

    # real signature unknown; restored from __doc__
    def setHotspot(self, bool):
        """ QsciStyle.setHotspot(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setPaper(self, QColor):
        """ QsciStyle.setPaper(QColor) """
        pass

    # real signature unknown; restored from __doc__
    def setTextCase(self, QsciStyle_TextCase):
        """ QsciStyle.setTextCase(QsciStyle.TextCase) """
        pass

    # real signature unknown; restored from __doc__
    def setVisible(self, bool):
        """ QsciStyle.setVisible(bool) """
        pass

    def style(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.style() -> int """
        return 0

    def textCase(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.textCase() -> QsciStyle.TextCase """
        pass

    def TextCase(self, *args, **kwargs):  # real signature unknown
        pass

    def visible(self):  # real signature unknown; restored from __doc__
        """ QsciStyle.visible() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    LowerCase = 2
    OriginalCase = 0
    UpperCase = 1


class QsciStyledText():  # skipped bases: <type 'sip.wrapper'>

    """
    QsciStyledText(QString, int)
    QsciStyledText(QString, QsciStyle)
    QsciStyledText(QsciStyledText)
    """

    def style(self):  # real signature unknown; restored from __doc__
        """ QsciStyledText.style() -> int """
        return 0

    def text(self):  # real signature unknown; restored from __doc__
        """ QsciStyledText.text() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

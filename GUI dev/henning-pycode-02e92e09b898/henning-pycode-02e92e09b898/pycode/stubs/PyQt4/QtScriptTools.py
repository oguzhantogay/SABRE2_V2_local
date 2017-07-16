# encoding: utf-8
# module PyQt4.QtScriptTools
# from /usr/lib/python2.7/dist-packages/PyQt4/QtScriptTools.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore


# no functions
# classes

class QScriptEngineDebugger(__PyQt4_QtCore.QObject):

    """ QScriptEngineDebugger(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def action(self, QScriptEngineDebugger_DebuggerAction):
        """ QScriptEngineDebugger.action(QScriptEngineDebugger.DebuggerAction) -> QAction """
        pass

    # real signature unknown; restored from __doc__
    def attachTo(self, QScriptEngine):
        """ QScriptEngineDebugger.attachTo(QScriptEngine) """
        pass

    # real signature unknown; restored from __doc__
    def autoShowStandardWindow(self):
        """ QScriptEngineDebugger.autoShowStandardWindow() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def createStandardMenu(self, QWidget_parent=None):
        """ QScriptEngineDebugger.createStandardMenu(QWidget parent=None) -> QMenu """
        pass

    # real signature unknown; restored from __doc__
    def createStandardToolBar(self, QWidget_parent=None):
        """ QScriptEngineDebugger.createStandardToolBar(QWidget parent=None) -> QToolBar """
        pass

    def DebuggerAction(self, *args, **kwargs):  # real signature unknown
        pass

    def DebuggerState(self, *args, **kwargs):  # real signature unknown
        pass

    def DebuggerWidget(self, *args, **kwargs):  # real signature unknown
        pass

    def detach(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineDebugger.detach() """
        pass

    def evaluationResumed(self, *args, **kwargs):  # real signature unknown
        """ QScriptEngineDebugger.evaluationResumed[] [signal] """
        pass

    def evaluationSuspended(self, *args, **kwargs):  # real signature unknown
        """ QScriptEngineDebugger.evaluationSuspended[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def setAutoShowStandardWindow(self, bool):
        """ QScriptEngineDebugger.setAutoShowStandardWindow(bool) """
        pass

    def standardWindow(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineDebugger.standardWindow() -> QMainWindow """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QScriptEngineDebugger.state() -> QScriptEngineDebugger.DebuggerState """
        pass

    # real signature unknown; restored from __doc__
    def widget(self, QScriptEngineDebugger_DebuggerWidget):
        """ QScriptEngineDebugger.widget(QScriptEngineDebugger.DebuggerWidget) -> QWidget """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    BreakpointsWidget = 6
    ClearConsoleAction = 10
    ClearDebugOutputAction = 8
    ClearErrorLogAction = 9
    CodeFinderWidget = 5
    CodeWidget = 4
    ConsoleWidget = 0
    ContinueAction = 1
    DebugOutputWidget = 7
    ErrorLogWidget = 8
    FindInScriptAction = 11
    FindNextInScriptAction = 12
    FindPreviousInScriptAction = 13
    GoToLineAction = 14
    InterruptAction = 0
    LocalsWidget = 3
    RunningState = 0
    RunToCursorAction = 5
    RunToNewScriptAction = 6
    ScriptsWidget = 2
    StackWidget = 1
    StepIntoAction = 2
    StepOutAction = 4
    StepOverAction = 3
    SuspendedState = 1
    ToggleBreakpointAction = 7

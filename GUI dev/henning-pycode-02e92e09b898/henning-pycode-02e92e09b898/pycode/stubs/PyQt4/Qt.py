# encoding: utf-8
# module PyQt4.Qt
# from /usr/lib/python2.7/dist-packages/PyQt4/Qt.so by generator 1.96
# no doc

# imports
from PyQt4.QtCore import (QAbstractAnimation, QAbstractEventDispatcher,
                          QAbstractFileEngine, QAbstractFileEngineHandler,
                          QAbstractFileEngineIterator, QAbstractItemModel, QAbstractListModel,
                          QAbstractState, QAbstractTableModel, QAbstractTransition, QAnimationGroup,
                          QBasicTimer, QBitArray, QBuffer, QByteArray, QByteArrayMatcher, QChar,
                          QChildEvent, QCoreApplication, QCryptographicHash, QDataStream, QDate,
                          QDateTime, QDir, QDirIterator, QDynamicPropertyChangeEvent, QEasingCurve,
                          QElapsedTimer, QEvent, QEventLoop, QEventTransition, QFSFileEngine, QFile,
                          QFileInfo, QFileSystemWatcher, QFinalState, QGenericArgument,
                          QGenericReturnArgument, QHistoryState, QIODevice, QLatin1Char,
                          QLatin1String, QLibrary, QLibraryInfo, QLine, QLineF, QLocale, QMargins,
                          QMetaClassInfo, QMetaEnum, QMetaMethod, QMetaObject, QMetaProperty,
                          QMetaType, QMimeData, QModelIndex, QMutex, QMutexLocker, QObject,
                          QObjectCleanupHandler, QParallelAnimationGroup, QPauseAnimation,
                          QPersistentModelIndex, QPluginLoader, QPoint, QPointF, QProcess,
                          QProcessEnvironment, QPropertyAnimation, QReadLocker, QReadWriteLock,
                          QRect, QRectF, QRegExp, QResource, QRunnable, QSemaphore,
                          QSequentialAnimationGroup, QSettings, QSharedMemory, QSignalMapper,
                          QSignalTransition, QSize, QSizeF, QSocketNotifier, QState, QStateMachine,
                          QString, QStringList, QStringMatcher, QStringRef, QSysInfo, QSystemLocale,
                          QSystemSemaphore, QT_TRANSLATE_NOOP, QT_TR_NOOP, QT_TR_NOOP_UTF8,
                          QTemporaryFile, QTextBoundaryFinder, QTextCodec, QTextDecoder,
                          QTextEncoder, QTextStream, QTextStreamManipulator, QThread, QThreadPool,
                          QTime, QTimeLine, QTimer, QTimerEvent, QTranslator, QUrl, QUuid, QVariant,
                          QVariantAnimation, QWaitCondition, QWriteLocker, QXmlStreamAttribute,
                          QXmlStreamAttributes, QXmlStreamEntityDeclaration,
                          QXmlStreamEntityResolver, QXmlStreamNamespaceDeclaration,
                          QXmlStreamNotationDeclaration, QXmlStreamReader, QXmlStreamWriter, Q_ARG,
                          Q_ENUMS, Q_FLAGS, Q_RETURN_ARG, Qt, QtCriticalMsg, QtDebugMsg, QtFatalMsg,
                          QtMsgType, QtSystemMsg, QtWarningMsg, SIGNAL, SLOT, bom, center, dec,
                          endl, fixed, flush, forcepoint, forcesign, left, lowercasebase,
                          lowercasedigits, noforcepoint, noforcesign, noshowbase, pyqtProperty,
                          pyqtRemoveInputHook, pyqtRestoreInputHook, pyqtSignal, pyqtSignature,
                          pyqtSlot, pyqtWrapperType, qAbs, qAddPostRoutine, qChecksum, qCompress,
                          qCritical, qDebug, qErrnoWarning, qFatal, qFuzzyCompare, qInf,
                          qInstallMsgHandler, qIsFinite, qIsInf, qIsNaN, qIsNull, qQNaN,
                          qRegisterResourceData, qRemovePostRoutine, qRound, qRound64, qSNaN,
                          qSetFieldWidth, qSetPadChar, qSetRealNumberPrecision, qSharedBuild, qSwap,
                          qUncompress, qUnregisterResourceData, qVersion, qWarning, qrand, qsrand,
                          reset, right, scientific, showbase, uppercasebase, uppercasedigits, ws)

from PyQt4.QtDeclarative import (QDeclarativeComponent, QDeclarativeContext,
                                 QDeclarativeEngine, QDeclarativeError, QDeclarativeExpression,
                                 QDeclarativeExtensionPlugin, QDeclarativeImageProvider, QDeclarativeItem,
                                 QDeclarativeListReference, QDeclarativeNetworkAccessManagerFactory,
                                 QDeclarativeParserStatus, QDeclarativeProperty, QDeclarativePropertyMap,
                                 QDeclarativePropertyValueSource, QDeclarativeScriptString,
                                 QDeclarativeView, QPyDeclarativePropertyValueSource)

from PyQt4.QtGui import (Display, QAbstractButton, QAbstractGraphicsShapeItem,
                         QAbstractItemDelegate, QAbstractItemView, QAbstractPrintDialog,
                         QAbstractProxyModel, QAbstractScrollArea, QAbstractSlider,
                         QAbstractSpinBox, QAbstractTextDocumentLayout, QAction, QActionEvent,
                         QActionGroup, QApplication, QBitmap, QBoxLayout, QBrush, QButtonGroup,
                         QCalendarWidget, QCheckBox, QClipboard, QCloseEvent, QColor, QColorDialog,
                         QColumnView, QComboBox, QCommandLinkButton, QCommonStyle, QCompleter,
                         QConicalGradient, QContextMenuEvent, QCursor, QDataWidgetMapper,
                         QDateEdit, QDateTimeEdit, QDesktopServices, QDesktopWidget, QDial,
                         QDialog, QDialogButtonBox, QDirModel, QDockWidget, QDoubleSpinBox,
                         QDoubleValidator, QDrag, QDragEnterEvent, QDragLeaveEvent, QDragMoveEvent,
                         QDropEvent, QErrorMessage, QFileDialog, QFileIconProvider, QFileOpenEvent,
                         QFileSystemModel, QFocusEvent, QFocusFrame, QFont, QFontComboBox,
                         QFontDatabase, QFontDialog, QFontInfo, QFontMetrics, QFontMetricsF,
                         QFormLayout, QFrame, QGesture, QGestureEvent, QGestureRecognizer,
                         QGradient, QGraphicsAnchor, QGraphicsAnchorLayout, QGraphicsBlurEffect,
                         QGraphicsColorizeEffect, QGraphicsDropShadowEffect, QGraphicsEffect,
                         QGraphicsEllipseItem, QGraphicsGridLayout, QGraphicsItem,
                         QGraphicsItemAnimation, QGraphicsItemGroup, QGraphicsLayout,
                         QGraphicsLayoutItem, QGraphicsLineItem, QGraphicsLinearLayout,
                         QGraphicsObject, QGraphicsOpacityEffect, QGraphicsPathItem,
                         QGraphicsPixmapItem, QGraphicsPolygonItem, QGraphicsProxyWidget,
                         QGraphicsRectItem, QGraphicsRotation, QGraphicsScale, QGraphicsScene,
                         QGraphicsSceneContextMenuEvent, QGraphicsSceneDragDropEvent,
                         QGraphicsSceneEvent, QGraphicsSceneHelpEvent, QGraphicsSceneHoverEvent,
                         QGraphicsSceneMouseEvent, QGraphicsSceneMoveEvent,
                         QGraphicsSceneResizeEvent, QGraphicsSceneWheelEvent,
                         QGraphicsSimpleTextItem, QGraphicsTextItem, QGraphicsTransform,
                         QGraphicsView, QGraphicsWidget, QGridLayout, QGroupBox, QHBoxLayout,
                         QHeaderView, QHelpEvent, QHideEvent, QHoverEvent, QIcon, QIconDragEvent,
                         QIconEngine, QIconEngineV2, QImage, QImageIOHandler, QImageReader,
                         QImageWriter, QInputContext, QInputContextFactory, QInputDialog,
                         QInputEvent, QInputMethodEvent, QIntValidator, QItemDelegate,
                         QItemEditorCreatorBase, QItemEditorFactory, QItemSelection,
                         QItemSelectionModel, QItemSelectionRange, QKeyEvent, QKeyEventTransition,
                         QKeySequence, QLCDNumber, QLabel, QLayout, QLayoutItem, QLineEdit,
                         QLinearGradient, QListView, QListWidget, QListWidgetItem, QMainWindow,
                         QMatrix, QMatrix2x2, QMatrix2x3, QMatrix2x4, QMatrix3x2, QMatrix3x3,
                         QMatrix3x4, QMatrix4x2, QMatrix4x3, QMatrix4x4, QMdiArea, QMdiSubWindow,
                         QMenu, QMenuBar, QMessageBox, QMimeSource, QMouseEvent,
                         QMouseEventTransition, QMoveEvent, QMovie, QPageSetupDialog, QPaintDevice,
                         QPaintEngine, QPaintEngineState, QPaintEvent, QPainter, QPainterPath,
                         QPainterPathStroker, QPalette, QPanGesture, QPen, QPicture, QPictureIO,
                         QPinchGesture, QPixmap, QPixmapCache, QPlainTextDocumentLayout,
                         QPlainTextEdit, QPolygon, QPolygonF, QPrintDialog, QPrintEngine,
                         QPrintPreviewDialog, QPrintPreviewWidget, QPrinter, QPrinterInfo,
                         QProgressBar, QProgressDialog, QProxyModel, QPushButton, QPyTextObject,
                         QQuaternion, QRadialGradient, QRadioButton, QRegExpValidator, QRegion,
                         QResizeEvent, QRubberBand, QScrollArea, QScrollBar, QSessionManager,
                         QShortcut, QShortcutEvent, QShowEvent, QSizeGrip, QSizePolicy, QSlider,
                         QSortFilterProxyModel, QSound, QSpacerItem, QSpinBox, QSplashScreen,
                         QSplitter, QSplitterHandle, QStackedLayout, QStackedWidget, QStandardItem,
                         QStandardItemModel, QStaticText, QStatusBar, QStatusTipEvent,
                         QStringListModel, QStyle, QStyleFactory, QStyleHintReturn,
                         QStyleHintReturnMask, QStyleHintReturnVariant, QStyleOption,
                         QStyleOptionButton, QStyleOptionComboBox, QStyleOptionComplex,
                         QStyleOptionDockWidget, QStyleOptionDockWidgetV2, QStyleOptionFocusRect,
                         QStyleOptionFrame, QStyleOptionFrameV2, QStyleOptionFrameV3,
                         QStyleOptionGraphicsItem, QStyleOptionGroupBox, QStyleOptionHeader,
                         QStyleOptionMenuItem, QStyleOptionProgressBar, QStyleOptionProgressBarV2,
                         QStyleOptionRubberBand, QStyleOptionSizeGrip, QStyleOptionSlider,
                         QStyleOptionSpinBox, QStyleOptionTab, QStyleOptionTabBarBase,
                         QStyleOptionTabBarBaseV2, QStyleOptionTabV2, QStyleOptionTabV3,
                         QStyleOptionTabWidgetFrame, QStyleOptionTabWidgetFrameV2,
                         QStyleOptionTitleBar, QStyleOptionToolBar, QStyleOptionToolBox,
                         QStyleOptionToolBoxV2, QStyleOptionToolButton, QStyleOptionViewItem,
                         QStyleOptionViewItemV2, QStyleOptionViewItemV3, QStyleOptionViewItemV4,
                         QStylePainter, QStyledItemDelegate, QSwipeGesture, QSyntaxHighlighter,
                         QSystemTrayIcon, QTabBar, QTabWidget, QTableView, QTableWidget,
                         QTableWidgetItem, QTableWidgetSelectionRange, QTabletEvent,
                         QTapAndHoldGesture, QTapGesture, QTextBlock, QTextBlockFormat,
                         QTextBlockGroup, QTextBlockUserData, QTextBrowser, QTextCharFormat,
                         QTextCursor, QTextDocument, QTextDocumentFragment, QTextDocumentWriter,
                         QTextEdit, QTextFormat, QTextFragment, QTextFrame, QTextFrameFormat,
                         QTextImageFormat, QTextInlineObject, QTextItem, QTextLayout, QTextLength,
                         QTextLine, QTextList, QTextListFormat, QTextObject, QTextObjectInterface,
                         QTextOption, QTextTable, QTextTableCell, QTextTableCellFormat,
                         QTextTableFormat, QTimeEdit, QToolBar, QToolBox, QToolButton, QToolTip,
                         QTouchEvent, QTransform, QTreeView, QTreeWidget, QTreeWidgetItem,
                         QTreeWidgetItemIterator, QUndoCommand, QUndoGroup, QUndoStack, QUndoView,
                         QVBoxLayout, QValidator, QVector2D, QVector3D, QVector4D, QWhatsThis,
                         QWhatsThisClickedEvent, QWheelEvent, QWidget, QWidgetAction, QWidgetItem,
                         QWindowStateChangeEvent, QWizard, QWizardPage, QWorkspace,
                         QX11EmbedContainer, QX11EmbedWidget, QX11Info, qAlpha, qApp, qBlue,
                         qDrawBorderPixmap, qDrawPlainRect, qDrawShadeLine, qDrawShadePanel,
                         qDrawShadeRect, qDrawWinButton, qDrawWinPanel, qGray, qGreen, qIsGray,
                         qRed, qRgb, qRgba, qt_x11_wait_for_window_manager)

from PyQt4.QtHelp import (QHelpContentItem, QHelpContentModel,
                          QHelpContentWidget, QHelpEngine, QHelpEngineCore, QHelpIndexModel,
                          QHelpIndexWidget, QHelpSearchEngine, QHelpSearchQuery,
                          QHelpSearchQueryWidget, QHelpSearchResultWidget)

from PyQt4.QtNetwork import (QAbstractNetworkCache, QAbstractSocket,
                             QAuthenticator, QFtp, QHostAddress, QHostInfo, QHttp, QHttpHeader,
                             QHttpRequestHeader, QHttpResponseHeader, QLocalServer, QLocalSocket,
                             QNetworkAccessManager, QNetworkAddressEntry, QNetworkCacheMetaData,
                             QNetworkConfiguration, QNetworkConfigurationManager, QNetworkCookie,
                             QNetworkCookieJar, QNetworkDiskCache, QNetworkInterface, QNetworkProxy,
                             QNetworkProxyFactory, QNetworkProxyQuery, QNetworkReply, QNetworkRequest,
                             QNetworkSession, QSsl, QSslCertificate, QSslCipher, QSslConfiguration,
                             QSslError, QSslKey, QSslSocket, QTcpServer, QTcpSocket, QUdpSocket,
                             QUrlInfo)


# Variables with simple values

PYQT_VERSION = 264197

PYQT_VERSION_STR = '4.8.5'

QT_VERSION = 263939

QT_VERSION_STR = '4.7.3'

# functions


def bin(QTextStream):  # real signature unknown; restored from __doc__
    """ bin(QTextStream) -> QTextStream """
    return QTextStream


def hex(QTextStream):  # real signature unknown; restored from __doc__
    """ hex(QTextStream) -> QTextStream """
    return QTextStream


def oct(QTextStream):  # real signature unknown; restored from __doc__
    """ oct(QTextStream) -> QTextStream """
    return QTextStream


# real signature unknown; restored from __doc__
def QPyDeclarativeListProperty(QObject, list_of_QObject):
    """ QPyDeclarativeListProperty(QObject, list-of-QObject) """
    pass


# no classes
# variables with complex values

__license__ = None  # (!) real value is ''

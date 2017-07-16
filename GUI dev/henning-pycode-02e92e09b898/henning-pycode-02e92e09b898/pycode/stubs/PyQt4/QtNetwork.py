# encoding: utf-8
# module PyQt4.QtNetwork
# from /usr/lib/python2.7/dist-packages/PyQt4/QtNetwork.so by generator 1.96
# no doc

# imports
import PyQt4.QtCore as __PyQt4_QtCore


# no functions
# classes

class QAbstractNetworkCache(__PyQt4_QtCore.QObject):

    """ QAbstractNetworkCache(QObject parent=None) """

    def cacheSize(self):  # real signature unknown; restored from __doc__
        """ QAbstractNetworkCache.cacheSize() -> int """
        return 0

    def clear(self):  # real signature unknown; restored from __doc__
        """ QAbstractNetworkCache.clear() """
        pass

    def data(self, QUrl):  # real signature unknown; restored from __doc__
        """ QAbstractNetworkCache.data(QUrl) -> QIODevice """
        pass

    # real signature unknown; restored from __doc__
    def insert(self, QIODevice):
        """ QAbstractNetworkCache.insert(QIODevice) """
        pass

    def metaData(self, QUrl):  # real signature unknown; restored from __doc__
        """ QAbstractNetworkCache.metaData(QUrl) -> QNetworkCacheMetaData """
        return QNetworkCacheMetaData

    # real signature unknown; restored from __doc__
    def prepare(self, QNetworkCacheMetaData):
        """ QAbstractNetworkCache.prepare(QNetworkCacheMetaData) -> QIODevice """
        pass

    def remove(self, QUrl):  # real signature unknown; restored from __doc__
        """ QAbstractNetworkCache.remove(QUrl) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def updateMetaData(self, QNetworkCacheMetaData):
        """ QAbstractNetworkCache.updateMetaData(QNetworkCacheMetaData) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QAbstractSocket(__PyQt4_QtCore.QIODevice):

    """ QAbstractSocket(QAbstractSocket.SocketType, QObject) """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.abort() """
        pass

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.atEnd() -> bool """
        return False

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.bytesAvailable() -> int """
        return 0

    def bytesToWrite(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.bytesToWrite() -> int """
        return 0

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.canReadLine() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.close() """
        pass

    def connected(self, *args, **kwargs):  # real signature unknown
        """ QAbstractSocket.connected[] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def connectToHost(self, *__args):
        """
        QAbstractSocket.connectToHost(QString, int, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        QAbstractSocket.connectToHost(QHostAddress, int, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        """
        pass

    # real signature unknown; restored from __doc__
    def connectToHostImplementation(self, QString, p_int, QIODevice_OpenMode_mode=None):
        """ QAbstractSocket.connectToHostImplementation(QString, int, QIODevice.OpenMode mode=QIODevice.ReadWrite) """
        pass

    def disconnected(self, *args, **kwargs):  # real signature unknown
        """ QAbstractSocket.disconnected[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def disconnectFromHost(self):
        """ QAbstractSocket.disconnectFromHost() """
        pass

    # real signature unknown; restored from __doc__
    def disconnectFromHostImplementation(self):
        """ QAbstractSocket.disconnectFromHostImplementation() """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """
        QAbstractSocket.error() -> QAbstractSocket.SocketError
        QAbstractSocket.error[QAbstractSocket.SocketError] [signal]
        """
        pass

    def flush(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.flush() -> bool """
        return False

    def hostFound(self, *args, **kwargs):  # real signature unknown
        """ QAbstractSocket.hostFound[] [signal] """
        pass

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.isSequential() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.isValid() -> bool """
        return False

    def localAddress(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.localAddress() -> QHostAddress """
        return QHostAddress

    def localPort(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.localPort() -> int """
        return 0

    def NetworkLayerProtocol(self, *args, **kwargs):  # real signature unknown
        pass

    def peerAddress(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.peerAddress() -> QHostAddress """
        return QHostAddress

    def peerName(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.peerName() -> QString """
        pass

    def peerPort(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.peerPort() -> int """
        return 0

    def proxy(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.proxy() -> QNetworkProxy """
        return QNetworkProxy

    # real signature unknown
    def proxyAuthenticationRequired(self, *args, **kwargs):
        """ QAbstractSocket.proxyAuthenticationRequired[QNetworkProxy, QAuthenticator] [signal] """
        pass

    def readBufferSize(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.readBufferSize() -> int """
        return 0

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.readData(int) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def readLineData(self, p_int):
        """ QAbstractSocket.readLineData(int) -> str """
        return ""

    # real signature unknown; restored from __doc__
    def setLocalAddress(self, QHostAddress):
        """ QAbstractSocket.setLocalAddress(QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setLocalPort(self, p_int):
        """ QAbstractSocket.setLocalPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerAddress(self, QHostAddress):
        """ QAbstractSocket.setPeerAddress(QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerName(self, QString):
        """ QAbstractSocket.setPeerName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerPort(self, p_int):
        """ QAbstractSocket.setPeerPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setProxy(self, QNetworkProxy):
        """ QAbstractSocket.setProxy(QNetworkProxy) """
        pass

    # real signature unknown; restored from __doc__
    def setReadBufferSize(self, p_int):
        """ QAbstractSocket.setReadBufferSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketDescriptor(self, p_int, QAbstractSocket_SocketState_state=None, QIODevice_OpenMode_mode=None):
        """ QAbstractSocket.setSocketDescriptor(int, QAbstractSocket.SocketState state=QAbstractSocket.ConnectedState, QIODevice.OpenMode mode=QIODevice.ReadWrite) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setSocketError(self, QAbstractSocket_SocketError):
        """ QAbstractSocket.setSocketError(QAbstractSocket.SocketError) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketOption(self, QAbstractSocket_SocketOption, QVariant):
        """ QAbstractSocket.setSocketOption(QAbstractSocket.SocketOption, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketState(self, QAbstractSocket_SocketState):
        """ QAbstractSocket.setSocketState(QAbstractSocket.SocketState) """
        pass

    # real signature unknown; restored from __doc__
    def socketDescriptor(self):
        """ QAbstractSocket.socketDescriptor() -> int """
        return 0

    def SocketError(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def socketOption(self, QAbstractSocket_SocketOption):
        """ QAbstractSocket.socketOption(QAbstractSocket.SocketOption) -> QVariant """
        pass

    def SocketOption(self, *args, **kwargs):  # real signature unknown
        pass

    def SocketState(self, *args, **kwargs):  # real signature unknown
        pass

    def SocketType(self, *args, **kwargs):  # real signature unknown
        pass

    def socketType(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.socketType() -> QAbstractSocket.SocketType """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QAbstractSocket.state() -> QAbstractSocket.SocketState """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QAbstractSocket.stateChanged[QAbstractSocket.SocketState] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def waitForBytesWritten(self, int_msecs=30000):
        """ QAbstractSocket.waitForBytesWritten(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForConnected(self, int_msecs=30000):
        """ QAbstractSocket.waitForConnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForDisconnected(self, int_msecs=30000):
        """ QAbstractSocket.waitForDisconnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForReadyRead(self, int_msecs=30000):
        """ QAbstractSocket.waitForReadyRead(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QAbstractSocket.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QAbstractSocket_SocketType, QObject):
        pass

    AddressInUseError = 8
    BoundState = 4
    ClosingState = 6
    ConnectedState = 3
    ConnectingState = 2
    ConnectionRefusedError = 0
    DatagramTooLargeError = 6
    HostLookupState = 1
    HostNotFoundError = 2
    IPv4Protocol = 0
    IPv6Protocol = 1
    KeepAliveOption = 1
    ListeningState = 5
    LowDelayOption = 0
    NetworkError = 7
    ProxyAuthenticationRequiredError = 12
    ProxyConnectionClosedError = 15
    ProxyConnectionRefusedError = 14
    ProxyConnectionTimeoutError = 16
    ProxyNotFoundError = 17
    ProxyProtocolError = 18
    RemoteHostClosedError = 1
    SocketAccessError = 3
    SocketAddressNotAvailableError = 9
    SocketResourceError = 4
    SocketTimeoutError = 5
    SslHandshakeFailedError = 13
    TcpSocket = 0
    UdpSocket = 1
    UnconnectedState = 0
    UnfinishedSocketOperationError = 11
    UnknownNetworkLayerProtocol = -1
    UnknownSocketError = -1
    UnknownSocketType = -1
    UnsupportedSocketOperationError = 10


class QAuthenticator():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QAuthenticator()
    QAuthenticator(QAuthenticator)
    """

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QAuthenticator.isNull() -> bool """
        return False

    def option(self, QString):  # real signature unknown; restored from __doc__
        """ QAuthenticator.option(QString) -> QVariant """
        pass

    def options(self):  # real signature unknown; restored from __doc__
        """ QAuthenticator.options() -> dict-of-QString-QVariant """
        pass

    def password(self):  # real signature unknown; restored from __doc__
        """ QAuthenticator.password() -> QString """
        pass

    def realm(self):  # real signature unknown; restored from __doc__
        """ QAuthenticator.realm() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setOption(self, QString, QVariant):
        """ QAuthenticator.setOption(QString, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setPassword(self, QString):
        """ QAuthenticator.setPassword(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setUser(self, QString):
        """ QAuthenticator.setUser(QString) """
        pass

    def user(self):  # real signature unknown; restored from __doc__
        """ QAuthenticator.user() -> QString """
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
    def __init__(self, QAuthenticator=None):
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


class QFtp(__PyQt4_QtCore.QObject):

    """ QFtp(QObject parent=None) """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QFtp.abort() """
        pass

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QFtp.bytesAvailable() -> int """
        return 0

    def cd(self, QString):  # real signature unknown; restored from __doc__
        """ QFtp.cd(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def clearPendingCommands(self):
        """ QFtp.clearPendingCommands() """
        pass

    def close(self):  # real signature unknown; restored from __doc__
        """ QFtp.close() -> int """
        return 0

    def Command(self, *args, **kwargs):  # real signature unknown
        pass

    def commandFinished(self, *args, **kwargs):  # real signature unknown
        """ QFtp.commandFinished[int, bool] [signal] """
        pass

    def commandStarted(self, *args, **kwargs):  # real signature unknown
        """ QFtp.commandStarted[int] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def connectToHost(self, QString, int_port=21):
        """ QFtp.connectToHost(QString, int port=21) -> int """
        return 0

    def currentCommand(self):  # real signature unknown; restored from __doc__
        """ QFtp.currentCommand() -> QFtp.Command """
        pass

    def currentDevice(self):  # real signature unknown; restored from __doc__
        """ QFtp.currentDevice() -> QIODevice """
        pass

    def currentId(self):  # real signature unknown; restored from __doc__
        """ QFtp.currentId() -> int """
        return 0

    def dataTransferProgress(self, *args, **kwargs):  # real signature unknown
        """ QFtp.dataTransferProgress[int, int] [signal] """
        pass

    def done(self, *args, **kwargs):  # real signature unknown
        """ QFtp.done[bool] [signal] """
        pass

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QFtp.error() -> QFtp.Error """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QFtp.errorString() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def get(self, QString, QIODevice_device=None, QFtp_TransferType_type=None):
        """ QFtp.get(QString, QIODevice device=None, QFtp.TransferType type=QFtp.Binary) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def hasPendingCommands(self):
        """ QFtp.hasPendingCommands() -> bool """
        return False

    # real signature unknown; NOTE: unreliably restored from __doc__
    def list(self, QString_directory=None, *args, **kwargs):
        """ QFtp.list(QString directory=QString()) -> int """
        pass

    def listInfo(self, *args, **kwargs):  # real signature unknown
        """ QFtp.listInfo[QUrlInfo] [signal] """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def login(self, QString_user=None, *args, **kwargs):
        """ QFtp.login(QString user=QString(), QString password=QString()) -> int """
        pass

    def mkdir(self, QString):  # real signature unknown; restored from __doc__
        """ QFtp.mkdir(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def put(self, *__args):
        """
        QFtp.put(QByteArray, QString, QFtp.TransferType type=QFtp.Binary) -> int
        QFtp.put(QIODevice, QString, QFtp.TransferType type=QFtp.Binary) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def rawCommand(self, QString):
        """ QFtp.rawCommand(QString) -> int """
        return 0

    def rawCommandReply(self, *args, **kwargs):  # real signature unknown
        """ QFtp.rawCommandReply[int, QString] [signal] """
        pass

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QFtp.read(int) -> str """
        return ""

    def readAll(self):  # real signature unknown; restored from __doc__
        """ QFtp.readAll() -> QByteArray """
        pass

    def readyRead(self, *args, **kwargs):  # real signature unknown
        """ QFtp.readyRead[] [signal] """
        pass

    def remove(self, QString):  # real signature unknown; restored from __doc__
        """ QFtp.remove(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def rename(self, QString, QString_1):
        """ QFtp.rename(QString, QString) -> int """
        return 0

    def rmdir(self, QString):  # real signature unknown; restored from __doc__
        """ QFtp.rmdir(QString) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setProxy(self, QString, p_int):
        """ QFtp.setProxy(QString, int) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setTransferMode(self, QFtp_TransferMode):
        """ QFtp.setTransferMode(QFtp.TransferMode) -> int """
        return 0

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QFtp.state() -> QFtp.State """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QFtp.stateChanged[int] [signal] """
        pass

    def TransferMode(self, *args, **kwargs):  # real signature unknown
        pass

    def TransferType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Active = 0
    Ascii = 1
    Binary = 0
    Cd = 7
    Close = 5
    Closing = 5
    Connected = 3
    Connecting = 2
    ConnectionRefused = 3
    ConnectToHost = 3
    Get = 8
    HostLookup = 1
    HostNotFound = 2
    List = 6
    LoggedIn = 4
    Login = 4
    Mkdir = 11
    NoError = 0
    None = 0
    NotConnected = 4
    Passive = 1
    Put = 9
    RawCommand = 14
    Remove = 10
    Rename = 13
    Rmdir = 12
    SetProxy = 2
    SetTransferMode = 1
    Unconnected = 0
    UnknownError = 1


class QHostAddress():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QHostAddress()
    QHostAddress(QHostAddress.SpecialAddress)
    QHostAddress(int)
    QHostAddress(QString)
    QHostAddress(16-tuple-of-int)
    QHostAddress(QHostAddress)
    """

    def clear(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.clear() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def isInSubnet(self, *__args):
        """
        QHostAddress.isInSubnet(QHostAddress, int) -> bool
        QHostAddress.isInSubnet(tuple-of-QHostAddress-int) -> bool
        """
        return False

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def parseSubnet(self, QString):
        """ QHostAddress.parseSubnet(QString) -> tuple-of-QHostAddress-int """
        pass

    def protocol(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.protocol() -> QAbstractSocket.NetworkLayerProtocol """
        pass

    def scopeId(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.scopeId() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setAddress(self, *__args):
        """
        QHostAddress.setAddress(int)
        QHostAddress.setAddress(QString) -> bool
        QHostAddress.setAddress(16-tuple-of-int)
        """
        return False

    # real signature unknown; restored from __doc__
    def setScopeId(self, QString):
        """ QHostAddress.setScopeId(QString) """
        pass

    def SpecialAddress(self, *args, **kwargs):  # real signature unknown
        pass

    def toIPv4Address(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.toIPv4Address() -> int """
        return 0

    def toIPv6Address(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.toIPv6Address() -> 16-tuple-of-int """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QHostAddress.toString() -> QString """
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

    Any = 4
    AnyIPv6 = 5
    Broadcast = 1
    LocalHost = 2
    LocalHostIPv6 = 3
    Null = 0


class QHostInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QHostInfo(int id=-1)
    QHostInfo(QHostInfo)
    """
    # real signature unknown; restored from __doc__

    def abortHostLookup(self, p_int):
        """ QHostInfo.abortHostLookup(int) """
        pass

    def addresses(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.addresses() -> list-of-QHostAddress """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.error() -> QHostInfo.HostInfoError """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.errorString() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def fromName(self, QString):
        """ QHostInfo.fromName(QString) -> QHostInfo """
        return QHostInfo

    def HostInfoError(self, *args, **kwargs):  # real signature unknown
        pass

    def hostName(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.hostName() -> QString """
        pass

    def localDomainName(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.localDomainName() -> QString """
        pass

    def localHostName(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.localHostName() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def lookupHost(self, QString, *__args):
        """
        QHostInfo.lookupHost(QString, QObject, SLOT()) -> int
        QHostInfo.lookupHost(QString, callable) -> int
        """
        return 0

    def lookupId(self):  # real signature unknown; restored from __doc__
        """ QHostInfo.lookupId() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setAddresses(self, list_of_QHostAddress):
        """ QHostInfo.setAddresses(list-of-QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setError(self, QHostInfo_HostInfoError):
        """ QHostInfo.setError(QHostInfo.HostInfoError) """
        pass

    # real signature unknown; restored from __doc__
    def setErrorString(self, QString):
        """ QHostInfo.setErrorString(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setHostName(self, QString):
        """ QHostInfo.setHostName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setLookupId(self, p_int):
        """ QHostInfo.setLookupId(int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default

    HostNotFound = 1
    NoError = 0
    UnknownError = 2


class QHttp(__PyQt4_QtCore.QObject):

    """
    QHttp(QObject parent=None)
    QHttp(QString, int port=80, QObject parent=None)
    QHttp(QString, QHttp.ConnectionMode, int port=0, QObject parent=None)
    """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QHttp.abort() """
        pass

    # real signature unknown
    def authenticationRequired(self, *args, **kwargs):
        """ QHttp.authenticationRequired[QString, int, QAuthenticator] [signal] """
        pass

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QHttp.bytesAvailable() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def clearPendingRequests(self):
        """ QHttp.clearPendingRequests() """
        pass

    def close(self):  # real signature unknown; restored from __doc__
        """ QHttp.close() -> int """
        return 0

    def ConnectionMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def currentDestinationDevice(self):
        """ QHttp.currentDestinationDevice() -> QIODevice """
        pass

    def currentId(self):  # real signature unknown; restored from __doc__
        """ QHttp.currentId() -> int """
        return 0

    def currentRequest(self):  # real signature unknown; restored from __doc__
        """ QHttp.currentRequest() -> QHttpRequestHeader """
        return QHttpRequestHeader

    # real signature unknown; restored from __doc__
    def currentSourceDevice(self):
        """ QHttp.currentSourceDevice() -> QIODevice """
        pass

    def dataReadProgress(self, *args, **kwargs):  # real signature unknown
        """ QHttp.dataReadProgress[int, int] [signal] """
        pass

    def dataSendProgress(self, *args, **kwargs):  # real signature unknown
        """ QHttp.dataSendProgress[int, int] [signal] """
        pass

    def done(self, *args, **kwargs):  # real signature unknown
        """ QHttp.done[bool] [signal] """
        pass

    def Error(self, *args, **kwargs):  # real signature unknown
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """ QHttp.error() -> QHttp.Error """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QHttp.errorString() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def get(self, QString, QIODevice_to=None):
        """ QHttp.get(QString, QIODevice to=None) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def hasPendingRequests(self):
        """ QHttp.hasPendingRequests() -> bool """
        return False

    def head(self, QString):  # real signature unknown; restored from __doc__
        """ QHttp.head(QString) -> int """
        return 0

    def ignoreSslErrors(self):  # real signature unknown; restored from __doc__
        """ QHttp.ignoreSslErrors() """
        pass

    def lastResponse(self):  # real signature unknown; restored from __doc__
        """ QHttp.lastResponse() -> QHttpResponseHeader """
        return QHttpResponseHeader

    # real signature unknown; restored from __doc__ with multiple overloads
    def post(self, QString, *__args):
        """
        QHttp.post(QString, QIODevice, QIODevice to=None) -> int
        QHttp.post(QString, QByteArray, QIODevice to=None) -> int
        """
        return 0

    # real signature unknown
    def proxyAuthenticationRequired(self, *args, **kwargs):
        """ QHttp.proxyAuthenticationRequired[QNetworkProxy, QAuthenticator] [signal] """
        pass

    def read(self, p_int):  # real signature unknown; restored from __doc__
        """ QHttp.read(int) -> str """
        return ""

    def readAll(self):  # real signature unknown; restored from __doc__
        """ QHttp.readAll() -> QByteArray """
        pass

    def readyRead(self, *args, **kwargs):  # real signature unknown
        """ QHttp.readyRead[QHttpResponseHeader] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def request(self, QHttpRequestHeader, *__args):
        """
        QHttp.request(QHttpRequestHeader, QIODevice data=None, QIODevice to=None) -> int
        QHttp.request(QHttpRequestHeader, QByteArray, QIODevice to=None) -> int
        """
        return 0

    def requestFinished(self, *args, **kwargs):  # real signature unknown
        """ QHttp.requestFinished[int, bool] [signal] """
        pass

    def requestStarted(self, *args, **kwargs):  # real signature unknown
        """ QHttp.requestStarted[int] [signal] """
        pass

    # real signature unknown
    def responseHeaderReceived(self, *args, **kwargs):
        """ QHttp.responseHeaderReceived[QHttpResponseHeader] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setHost(self, QString, *__args):
        """
        QHttp.setHost(QString, int port=80) -> int
        QHttp.setHost(QString, QHttp.ConnectionMode, int port=0) -> int
        """
        return 0

    # real signature unknown; restored from __doc__ with multiple overloads
    def setProxy(self, *__args):
        """
        QHttp.setProxy(QString, int, QString user=QString(), QString password=QString()) -> int
        QHttp.setProxy(QNetworkProxy) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def setSocket(self, QTcpSocket):
        """ QHttp.setSocket(QTcpSocket) -> int """
        return 0

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setUser(self, QString, QString_password=None, *args, **kwargs):
        """ QHttp.setUser(QString, QString password=QString()) -> int """
        pass

    def sslErrors(self, *args, **kwargs):  # real signature unknown
        """ QHttp.sslErrors[list-of-QSslError] [signal] """
        pass

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QHttp.state() -> QHttp.State """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QHttp.stateChanged[int] [signal] """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    Aborted = 7
    AuthenticationRequiredError = 8
    Closing = 6
    Connected = 5
    Connecting = 2
    ConnectionModeHttp = 0
    ConnectionModeHttps = 1
    ConnectionRefused = 3
    HostLookup = 1
    HostNotFound = 2
    InvalidResponseHeader = 5
    NoError = 0
    ProxyAuthenticationRequiredError = 9
    Reading = 4
    Sending = 3
    Unconnected = 0
    UnexpectedClose = 4
    UnknownError = 1
    WrongContentLength = 6


class QHttpHeader():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QHttpHeader()
    QHttpHeader(QHttpHeader)
    QHttpHeader(QString)
    """
    # real signature unknown; restored from __doc__

    def addValue(self, QString, QString_1):
        """ QHttpHeader.addValue(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def allValues(self, QString):
        """ QHttpHeader.allValues(QString) -> QStringList """
        pass

    def contentLength(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.contentLength() -> int """
        return 0

    def contentType(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.contentType() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def hasContentLength(self):
        """ QHttpHeader.hasContentLength() -> bool """
        return False

    def hasContentType(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.hasContentType() -> bool """
        return False

    def hasKey(self, QString):  # real signature unknown; restored from __doc__
        """ QHttpHeader.hasKey(QString) -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.isValid() -> bool """
        return False

    def keys(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.keys() -> QStringList """
        pass

    def majorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.majorVersion() -> int """
        return 0

    def minorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.minorVersion() -> int """
        return 0

    def parse(self, QString):  # real signature unknown; restored from __doc__
        """ QHttpHeader.parse(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def parseLine(self, QString, p_int):
        """ QHttpHeader.parseLine(QString, int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def removeAllValues(self, QString):
        """ QHttpHeader.removeAllValues(QString) """
        pass

    # real signature unknown; restored from __doc__
    def removeValue(self, QString):
        """ QHttpHeader.removeValue(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setContentLength(self, p_int):
        """ QHttpHeader.setContentLength(int) """
        pass

    # real signature unknown; restored from __doc__
    def setContentType(self, QString):
        """ QHttpHeader.setContentType(QString) """
        pass

    def setValid(self, bool):  # real signature unknown; restored from __doc__
        """ QHttpHeader.setValid(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setValue(self, QString, QString_1):
        """ QHttpHeader.setValue(QString, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setValues(self, list_of_tuple_of_QString_QString):
        """ QHttpHeader.setValues(list-of-tuple-of-QString-QString) """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.toString() -> QString """
        pass

    def value(self, QString):  # real signature unknown; restored from __doc__
        """ QHttpHeader.value(QString) -> QString """
        pass

    def values(self):  # real signature unknown; restored from __doc__
        """ QHttpHeader.values() -> list-of-tuple-of-QString-QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass

    __weakref__ = property(lambda self: object())  # default


class QHttpRequestHeader(QHttpHeader):

    """
    QHttpRequestHeader()
    QHttpRequestHeader(QString, QString, int major=1, int minor=1)
    QHttpRequestHeader(QHttpRequestHeader)
    QHttpRequestHeader(QString)
    """

    def majorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpRequestHeader.majorVersion() -> int """
        return 0

    def method(self):  # real signature unknown; restored from __doc__
        """ QHttpRequestHeader.method() -> QString """
        pass

    def minorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpRequestHeader.minorVersion() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def parseLine(self, QString, p_int):
        """ QHttpRequestHeader.parseLine(QString, int) -> bool """
        return False

    def path(self):  # real signature unknown; restored from __doc__
        """ QHttpRequestHeader.path() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setRequest(self, QString, QString_1, int_major=1, int_minor=1):
        """ QHttpRequestHeader.setRequest(QString, QString, int major=1, int minor=1) """
        pass

    def toString(self):  # real signature unknown; restored from __doc__
        """ QHttpRequestHeader.toString() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QHttpResponseHeader(QHttpHeader):

    """
    QHttpResponseHeader()
    QHttpResponseHeader(QHttpResponseHeader)
    QHttpResponseHeader(QString)
    QHttpResponseHeader(int, QString text=QString(), int major=1, int minor=1)
    """

    def majorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpResponseHeader.majorVersion() -> int """
        return 0

    def minorVersion(self):  # real signature unknown; restored from __doc__
        """ QHttpResponseHeader.minorVersion() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def parseLine(self, QString, p_int):
        """ QHttpResponseHeader.parseLine(QString, int) -> bool """
        return False

    def reasonPhrase(self):  # real signature unknown; restored from __doc__
        """ QHttpResponseHeader.reasonPhrase() -> QString """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def setStatusLine(self, p_int, QString_text=None, *args, **kwargs):
        """ QHttpResponseHeader.setStatusLine(int, QString text=QString(), int major=1, int minor=1) """
        pass

    def statusCode(self):  # real signature unknown; restored from __doc__
        """ QHttpResponseHeader.statusCode() -> int """
        return 0

    def toString(self):  # real signature unknown; restored from __doc__
        """ QHttpResponseHeader.toString() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, *__args):
        pass


class QLocalServer(__PyQt4_QtCore.QObject):

    """ QLocalServer(QObject parent=None) """

    def close(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.close() """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.errorString() -> QString """
        pass

    def fullServerName(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.fullServerName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def hasPendingConnections(self):
        """ QLocalServer.hasPendingConnections() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def incomingConnection(self, sip_voidptr):
        """ QLocalServer.incomingConnection(sip.voidptr) """
        pass

    def isListening(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.isListening() -> bool """
        return False

    def listen(self, QString):  # real signature unknown; restored from __doc__
        """ QLocalServer.listen(QString) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def maxPendingConnections(self):
        """ QLocalServer.maxPendingConnections() -> int """
        return 0

    def newConnection(self, *args, **kwargs):  # real signature unknown
        """ QLocalServer.newConnection[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def nextPendingConnection(self):
        """ QLocalServer.nextPendingConnection() -> QLocalSocket """
        return QLocalSocket

    # real signature unknown; restored from __doc__
    def removeServer(self, QString):
        """ QLocalServer.removeServer(QString) -> bool """
        return False

    def serverError(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.serverError() -> QAbstractSocket.SocketError """
        pass

    def serverName(self):  # real signature unknown; restored from __doc__
        """ QLocalServer.serverName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setMaxPendingConnections(self, p_int):
        """ QLocalServer.setMaxPendingConnections(int) """
        pass

    # real signature unknown; restored from __doc__
    def waitForNewConnection(self, int_msecs=0):
        """ QLocalServer.waitForNewConnection(int msecs=0) -> (bool, bool) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QLocalSocket(__PyQt4_QtCore.QIODevice):

    """ QLocalSocket(QObject parent=None) """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.abort() """
        pass

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.bytesAvailable() -> int """
        return 0

    def bytesToWrite(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.bytesToWrite() -> int """
        return 0

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.canReadLine() -> bool """
        return False

    def close(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.close() """
        pass

    def connected(self, *args, **kwargs):  # real signature unknown
        """ QLocalSocket.connected[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def connectToServer(self, QString, QIODevice_OpenMode_mode=None):
        """ QLocalSocket.connectToServer(QString, QIODevice.OpenMode mode=QIODevice.ReadWrite) """
        pass

    def disconnected(self, *args, **kwargs):  # real signature unknown
        """ QLocalSocket.disconnected[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def disconnectFromServer(self):
        """ QLocalSocket.disconnectFromServer() """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """
        QLocalSocket.error() -> QLocalSocket.LocalSocketError
        QLocalSocket.error[QLocalSocket.LocalSocketError] [signal]
        """
        pass

    def flush(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.flush() -> bool """
        return False

    def fullServerName(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.fullServerName() -> QString """
        pass

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.isSequential() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.isValid() -> bool """
        return False

    def LocalSocketError(self, *args, **kwargs):  # real signature unknown
        pass

    def LocalSocketState(self, *args, **kwargs):  # real signature unknown
        pass

    def readBufferSize(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.readBufferSize() -> int """
        return 0

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QLocalSocket.readData(int) -> str """
        return ""

    def serverName(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.serverName() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def setReadBufferSize(self, p_int):
        """ QLocalSocket.setReadBufferSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketDescriptor(self, sip_voidptr, QLocalSocket_LocalSocketState_state=None, QIODevice_OpenMode_mode=None):
        """ QLocalSocket.setSocketDescriptor(sip.voidptr, QLocalSocket.LocalSocketState state=QLocalSocket.ConnectedState, QIODevice.OpenMode mode=QIODevice.ReadWrite) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def socketDescriptor(self):
        """ QLocalSocket.socketDescriptor() -> sip.voidptr """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QLocalSocket.state() -> QLocalSocket.LocalSocketState """
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QLocalSocket.stateChanged[QLocalSocket.LocalSocketState] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def waitForBytesWritten(self, int_msecs=30000):
        """ QLocalSocket.waitForBytesWritten(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForConnected(self, int_msecs=30000):
        """ QLocalSocket.waitForConnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForDisconnected(self, int_msecs=30000):
        """ QLocalSocket.waitForDisconnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForReadyRead(self, int_msecs=30000):
        """ QLocalSocket.waitForReadyRead(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QLocalSocket.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    ClosingState = 6
    ConnectedState = 3
    ConnectingState = 2
    ConnectionError = 7
    ConnectionRefusedError = 0
    DatagramTooLargeError = 6
    PeerClosedError = 1
    ServerNotFoundError = 2
    SocketAccessError = 3
    SocketResourceError = 4
    SocketTimeoutError = 5
    UnconnectedState = 0
    UnknownSocketError = -1
    UnsupportedSocketOperationError = 10


class QNetworkAccessManager(__PyQt4_QtCore.QObject):

    """ QNetworkAccessManager(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def activeConfiguration(self):
        """ QNetworkAccessManager.activeConfiguration() -> QNetworkConfiguration """
        return QNetworkConfiguration

    # real signature unknown
    def authenticationRequired(self, *args, **kwargs):
        """ QNetworkAccessManager.authenticationRequired[QNetworkReply, QAuthenticator] [signal] """
        pass

    def cache(self):  # real signature unknown; restored from __doc__
        """ QNetworkAccessManager.cache() -> QAbstractNetworkCache """
        return QAbstractNetworkCache

    def configuration(self):  # real signature unknown; restored from __doc__
        """ QNetworkAccessManager.configuration() -> QNetworkConfiguration """
        return QNetworkConfiguration

    def cookieJar(self):  # real signature unknown; restored from __doc__
        """ QNetworkAccessManager.cookieJar() -> QNetworkCookieJar """
        return QNetworkCookieJar

    # real signature unknown; restored from __doc__
    def createRequest(self, QNetworkAccessManager_Operation, QNetworkRequest, QIODevice_device=None):
        """ QNetworkAccessManager.createRequest(QNetworkAccessManager.Operation, QNetworkRequest, QIODevice device=None) -> QNetworkReply """
        return QNetworkReply

    # real signature unknown; restored from __doc__
    def deleteResource(self, QNetworkRequest):
        """ QNetworkAccessManager.deleteResource(QNetworkRequest) -> QNetworkReply """
        return QNetworkReply

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QNetworkAccessManager.finished[QNetworkReply] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def get(self, QNetworkRequest):
        """ QNetworkAccessManager.get(QNetworkRequest) -> QNetworkReply """
        return QNetworkReply

    # real signature unknown; restored from __doc__
    def head(self, QNetworkRequest):
        """ QNetworkAccessManager.head(QNetworkRequest) -> QNetworkReply """
        return QNetworkReply

    def NetworkAccessibility(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def networkAccessible(self):
        """ QNetworkAccessManager.networkAccessible() -> QNetworkAccessManager.NetworkAccessibility """
        pass

    # real signature unknown; restored from __doc__
    def networkAccessibleChanged(self, QNetworkAccessManager_NetworkAccessibility):
        """ QNetworkAccessManager.networkAccessibleChanged(QNetworkAccessManager.NetworkAccessibility) """
        pass

    def Operation(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def post(self, QNetworkRequest, *__args):
        """
        QNetworkAccessManager.post(QNetworkRequest, QIODevice) -> QNetworkReply
        QNetworkAccessManager.post(QNetworkRequest, QByteArray) -> QNetworkReply
        """
        return QNetworkReply

    def proxy(self):  # real signature unknown; restored from __doc__
        """ QNetworkAccessManager.proxy() -> QNetworkProxy """
        return QNetworkProxy

    # real signature unknown
    def proxyAuthenticationRequired(self, *args, **kwargs):
        """ QNetworkAccessManager.proxyAuthenticationRequired[QNetworkProxy, QAuthenticator] [signal] """
        pass

    def proxyFactory(self):  # real signature unknown; restored from __doc__
        """ QNetworkAccessManager.proxyFactory() -> QNetworkProxyFactory """
        return QNetworkProxyFactory

    # real signature unknown; restored from __doc__ with multiple overloads
    def put(self, QNetworkRequest, *__args):
        """
        QNetworkAccessManager.put(QNetworkRequest, QIODevice) -> QNetworkReply
        QNetworkAccessManager.put(QNetworkRequest, QByteArray) -> QNetworkReply
        """
        return QNetworkReply

    # real signature unknown; restored from __doc__
    def sendCustomRequest(self, QNetworkRequest, QByteArray, QIODevice_data=None):
        """ QNetworkAccessManager.sendCustomRequest(QNetworkRequest, QByteArray, QIODevice data=None) -> QNetworkReply """
        return QNetworkReply

    # real signature unknown; restored from __doc__
    def setCache(self, QAbstractNetworkCache):
        """ QNetworkAccessManager.setCache(QAbstractNetworkCache) """
        pass

    # real signature unknown; restored from __doc__
    def setConfiguration(self, QNetworkConfiguration):
        """ QNetworkAccessManager.setConfiguration(QNetworkConfiguration) """
        pass

    # real signature unknown; restored from __doc__
    def setCookieJar(self, QNetworkCookieJar):
        """ QNetworkAccessManager.setCookieJar(QNetworkCookieJar) """
        pass

    # real signature unknown; restored from __doc__
    def setNetworkAccessible(self, QNetworkAccessManager_NetworkAccessibility):
        """ QNetworkAccessManager.setNetworkAccessible(QNetworkAccessManager.NetworkAccessibility) """
        pass

    # real signature unknown; restored from __doc__
    def setProxy(self, QNetworkProxy):
        """ QNetworkAccessManager.setProxy(QNetworkProxy) """
        pass

    # real signature unknown; restored from __doc__
    def setProxyFactory(self, QNetworkProxyFactory):
        """ QNetworkAccessManager.setProxyFactory(QNetworkProxyFactory) """
        pass

    def sslErrors(self, *args, **kwargs):  # real signature unknown
        """ QNetworkAccessManager.sslErrors[QNetworkReply, list-of-QSslError] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    Accessible = 1
    CustomOperation = 6
    DeleteOperation = 5
    GetOperation = 2
    HeadOperation = 1
    NotAccessible = 0
    PostOperation = 4
    PutOperation = 3
    UnknownAccessibility = -1


class QNetworkAddressEntry():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkAddressEntry()
    QNetworkAddressEntry(QNetworkAddressEntry)
    """

    def broadcast(self):  # real signature unknown; restored from __doc__
        """ QNetworkAddressEntry.broadcast() -> QHostAddress """
        return QHostAddress

    def ip(self):  # real signature unknown; restored from __doc__
        """ QNetworkAddressEntry.ip() -> QHostAddress """
        return QHostAddress

    def netmask(self):  # real signature unknown; restored from __doc__
        """ QNetworkAddressEntry.netmask() -> QHostAddress """
        return QHostAddress

    def prefixLength(self):  # real signature unknown; restored from __doc__
        """ QNetworkAddressEntry.prefixLength() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setBroadcast(self, QHostAddress):
        """ QNetworkAddressEntry.setBroadcast(QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setIp(self, QHostAddress):
        """ QNetworkAddressEntry.setIp(QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setNetmask(self, QHostAddress):
        """ QNetworkAddressEntry.setNetmask(QHostAddress) """
        pass

    # real signature unknown; restored from __doc__
    def setPrefixLength(self, p_int):
        """ QNetworkAddressEntry.setPrefixLength(int) """
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
    def __init__(self, QNetworkAddressEntry=None):
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


class QNetworkCacheMetaData():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkCacheMetaData()
    QNetworkCacheMetaData(QNetworkCacheMetaData)
    """

    def attributes(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.attributes() -> dict-of-QNetworkRequest.Attribute-QVariant """
        pass

    def expirationDate(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.expirationDate() -> QDateTime """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.isValid() -> bool """
        return False

    def lastModified(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.lastModified() -> QDateTime """
        pass

    def rawHeaders(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.rawHeaders() -> list-of-tuple-of-QByteArray-QByteArray """
        pass

    def saveToDisk(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.saveToDisk() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setAttributes(self, dict_of_QNetworkRequest_Attribute_QVariant):
        """ QNetworkCacheMetaData.setAttributes(dict-of-QNetworkRequest.Attribute-QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setExpirationDate(self, QDateTime):
        """ QNetworkCacheMetaData.setExpirationDate(QDateTime) """
        pass

    # real signature unknown; restored from __doc__
    def setLastModified(self, QDateTime):
        """ QNetworkCacheMetaData.setLastModified(QDateTime) """
        pass

    # real signature unknown; restored from __doc__
    def setRawHeaders(self, list_of_tuple_of_QByteArray_QByteArray):
        """ QNetworkCacheMetaData.setRawHeaders(list-of-tuple-of-QByteArray-QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setSaveToDisk(self, bool):
        """ QNetworkCacheMetaData.setSaveToDisk(bool) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.setUrl(QUrl) """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QNetworkCacheMetaData.url() -> QUrl """
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
    def __init__(self, QNetworkCacheMetaData=None):
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


class QNetworkConfiguration():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkConfiguration()
    QNetworkConfiguration(QNetworkConfiguration)
    """

    def bearerName(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.bearerName() -> QString """
        pass

    def bearerType(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.bearerType() -> QNetworkConfiguration.BearerType """
        pass

    def BearerType(self, *args, **kwargs):  # real signature unknown
        pass

    def bearerTypeName(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.bearerTypeName() -> QString """
        pass

    def children(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.children() -> list-of-QNetworkConfiguration """
        pass

    def identifier(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.identifier() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def isRoamingAvailable(self):
        """ QNetworkConfiguration.isRoamingAvailable() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.isValid() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.name() -> QString """
        pass

    def Purpose(self, *args, **kwargs):  # real signature unknown
        pass

    def purpose(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.purpose() -> QNetworkConfiguration.Purpose """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.state() -> QNetworkConfiguration.StateFlags """
        pass

    def StateFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def StateFlags(self, *__args):
        """
        QNetworkConfiguration.StateFlags(QNetworkConfiguration.StateFlags)
        QNetworkConfiguration.StateFlags(int)
        QNetworkConfiguration.StateFlags()
        """
        pass

    def Type(self, *args, **kwargs):  # real signature unknown
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfiguration.type() -> QNetworkConfiguration.Type """
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
    def __init__(self, QNetworkConfiguration=None):
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

    Active = 14
    Bearer2G = 3
    BearerBluetooth = 7
    BearerCDMA2000 = 4
    BearerEthernet = 1
    BearerHSPA = 6
    BearerUnknown = 0
    BearerWCDMA = 5
    BearerWiMAX = 8
    BearerWLAN = 2
    Defined = 2
    Discovered = 6
    InternetAccessPoint = 0
    Invalid = 3
    PrivatePurpose = 2
    PublicPurpose = 1
    ServiceNetwork = 1
    ServiceSpecificPurpose = 3
    Undefined = 1
    UnknownPurpose = 0
    UserChoice = 2


class QNetworkConfigurationManager(__PyQt4_QtCore.QObject):

    """ QNetworkConfigurationManager(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def allConfigurations(self, QNetworkConfiguration_StateFlags_flags=0):
        """ QNetworkConfigurationManager.allConfigurations(QNetworkConfiguration.StateFlags flags=0) -> list-of-QNetworkConfiguration """
        pass

    def capabilities(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfigurationManager.capabilities() -> QNetworkConfigurationManager.Capabilities """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def Capabilities(self, *__args):
        """
        QNetworkConfigurationManager.Capabilities(QNetworkConfigurationManager.Capabilities)
        QNetworkConfigurationManager.Capabilities(int)
        QNetworkConfigurationManager.Capabilities()
        """
        pass

    def Capability(self, *args, **kwargs):  # real signature unknown
        pass

    def configurationAdded(self, *args, **kwargs):  # real signature unknown
        """ QNetworkConfigurationManager.configurationAdded[QNetworkConfiguration] [signal] """
        pass

    def configurationChanged(self, *args, **kwargs):  # real signature unknown
        """ QNetworkConfigurationManager.configurationChanged[QNetworkConfiguration] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def configurationFromIdentifier(self, QString):
        """ QNetworkConfigurationManager.configurationFromIdentifier(QString) -> QNetworkConfiguration """
        return QNetworkConfiguration

    def configurationRemoved(self, *args, **kwargs):  # real signature unknown
        """ QNetworkConfigurationManager.configurationRemoved[QNetworkConfiguration] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def defaultConfiguration(self):
        """ QNetworkConfigurationManager.defaultConfiguration() -> QNetworkConfiguration """
        return QNetworkConfiguration

    def isOnline(self):  # real signature unknown; restored from __doc__
        """ QNetworkConfigurationManager.isOnline() -> bool """
        return False

    def onlineStateChanged(self, *args, **kwargs):  # real signature unknown
        """ QNetworkConfigurationManager.onlineStateChanged[bool] [signal] """
        pass

    def updateCompleted(self, *args, **kwargs):  # real signature unknown
        """ QNetworkConfigurationManager.updateCompleted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def updateConfigurations(self):
        """ QNetworkConfigurationManager.updateConfigurations() """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    ApplicationLevelRoaming = 8
    CanStartAndStopInterfaces = 1
    DataStatistics = 32
    DirectConnectionRouting = 2
    ForcedRoaming = 16
    NetworkSessionRequired = 64
    SystemSessionSupport = 4


class QNetworkCookie():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkCookie(QByteArray name=QByteArray(), QByteArray value=QByteArray())
    QNetworkCookie(QNetworkCookie)
    """

    def domain(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.domain() -> QString """
        pass

    def expirationDate(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.expirationDate() -> QDateTime """
        pass

    def isHttpOnly(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.isHttpOnly() -> bool """
        return False

    def isSecure(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.isSecure() -> bool """
        return False

    def isSessionCookie(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.isSessionCookie() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.name() -> QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def parseCookies(self, QByteArray):
        """ QNetworkCookie.parseCookies(QByteArray) -> list-of-QNetworkCookie """
        pass

    def path(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.path() -> QString """
        pass

    def RawForm(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setDomain(self, QString):
        """ QNetworkCookie.setDomain(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setExpirationDate(self, QDateTime):
        """ QNetworkCookie.setExpirationDate(QDateTime) """
        pass

    # real signature unknown; restored from __doc__
    def setHttpOnly(self, bool):
        """ QNetworkCookie.setHttpOnly(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setName(self, QByteArray):
        """ QNetworkCookie.setName(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setPath(self, QString):
        """ QNetworkCookie.setPath(QString) """
        pass

    def setSecure(self, bool):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.setSecure(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setValue(self, QByteArray):
        """ QNetworkCookie.setValue(QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def toRawForm(self, QNetworkCookie_RawForm_form=None):
        """ QNetworkCookie.toRawForm(QNetworkCookie.RawForm form=QNetworkCookie.Full) -> QByteArray """
        pass

    def value(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookie.value() -> QByteArray """
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

    __weakref__ = property(lambda self: object())  # default

    Full = 1
    NameAndValueOnly = 0


class QNetworkCookieJar(__PyQt4_QtCore.QObject):

    """ QNetworkCookieJar(QObject parent=None) """

    def allCookies(self):  # real signature unknown; restored from __doc__
        """ QNetworkCookieJar.allCookies() -> list-of-QNetworkCookie """
        pass

    # real signature unknown; restored from __doc__
    def cookiesForUrl(self, QUrl):
        """ QNetworkCookieJar.cookiesForUrl(QUrl) -> list-of-QNetworkCookie """
        pass

    # real signature unknown; restored from __doc__
    def setAllCookies(self, list_of_QNetworkCookie):
        """ QNetworkCookieJar.setAllCookies(list-of-QNetworkCookie) """
        pass

    # real signature unknown; restored from __doc__
    def setCookiesFromUrl(self, list_of_QNetworkCookie, QUrl):
        """ QNetworkCookieJar.setCookiesFromUrl(list-of-QNetworkCookie, QUrl) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QNetworkDiskCache(QAbstractNetworkCache):

    """ QNetworkDiskCache(QObject parent=None) """

    def cacheDirectory(self):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.cacheDirectory() -> QString """
        pass

    def cacheSize(self):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.cacheSize() -> int """
        return 0

    def clear(self):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.clear() """
        pass

    def data(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.data(QUrl) -> QIODevice """
        pass

    def expire(self):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.expire() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def fileMetaData(self, QString):
        """ QNetworkDiskCache.fileMetaData(QString) -> QNetworkCacheMetaData """
        return QNetworkCacheMetaData

    # real signature unknown; restored from __doc__
    def insert(self, QIODevice):
        """ QNetworkDiskCache.insert(QIODevice) """
        pass

    # real signature unknown; restored from __doc__
    def maximumCacheSize(self):
        """ QNetworkDiskCache.maximumCacheSize() -> int """
        return 0

    def metaData(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.metaData(QUrl) -> QNetworkCacheMetaData """
        return QNetworkCacheMetaData

    # real signature unknown; restored from __doc__
    def prepare(self, QNetworkCacheMetaData):
        """ QNetworkDiskCache.prepare(QNetworkCacheMetaData) -> QIODevice """
        pass

    def remove(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkDiskCache.remove(QUrl) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setCacheDirectory(self, QString):
        """ QNetworkDiskCache.setCacheDirectory(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setMaximumCacheSize(self, p_int):
        """ QNetworkDiskCache.setMaximumCacheSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def updateMetaData(self, QNetworkCacheMetaData):
        """ QNetworkDiskCache.updateMetaData(QNetworkCacheMetaData) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QNetworkInterface():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkInterface()
    QNetworkInterface(QNetworkInterface)
    """

    def addressEntries(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.addressEntries() -> list-of-QNetworkAddressEntry """
        pass

    def allAddresses(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.allAddresses() -> list-of-QHostAddress """
        pass

    def allInterfaces(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.allInterfaces() -> list-of-QNetworkInterface """
        pass

    def flags(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.flags() -> QNetworkInterface.InterfaceFlags """
        pass

    def hardwareAddress(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.hardwareAddress() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def humanReadableName(self):
        """ QNetworkInterface.humanReadableName() -> QString """
        pass

    def index(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.index() -> int """
        return 0

    def InterfaceFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def InterfaceFlags(self, *__args):
        """
        QNetworkInterface.InterfaceFlags(QNetworkInterface.InterfaceFlags)
        QNetworkInterface.InterfaceFlags(int)
        QNetworkInterface.InterfaceFlags()
        """
        pass

    # real signature unknown; restored from __doc__
    def interfaceFromIndex(self, p_int):
        """ QNetworkInterface.interfaceFromIndex(int) -> QNetworkInterface """
        return QNetworkInterface

    # real signature unknown; restored from __doc__
    def interfaceFromName(self, QString):
        """ QNetworkInterface.interfaceFromName(QString) -> QNetworkInterface """
        return QNetworkInterface

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.isValid() -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QNetworkInterface.name() -> QString """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QNetworkInterface=None):
        pass

    __weakref__ = property(lambda self: object())  # default

    CanBroadcast = 4
    CanMulticast = 32
    IsLoopBack = 8
    IsPointToPoint = 16
    IsRunning = 2
    IsUp = 1


class QNetworkProxy():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkProxy()
    QNetworkProxy(QNetworkProxy.ProxyType, QString hostName=QString(), int port=0, QString user=QString(), QString password=QString())
    QNetworkProxy(QNetworkProxy)
    """

    # real signature unknown; restored from __doc__
    def applicationProxy(self):
        """ QNetworkProxy.applicationProxy() -> QNetworkProxy """
        return QNetworkProxy

    # real signature unknown; restored from __doc__ with multiple overloads
    def Capabilities(self, *__args):
        """
        QNetworkProxy.Capabilities(QNetworkProxy.Capabilities)
        QNetworkProxy.Capabilities(int)
        QNetworkProxy.Capabilities()
        """
        pass

    def capabilities(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.capabilities() -> QNetworkProxy.Capabilities """
        pass

    def Capability(self, *args, **kwargs):  # real signature unknown
        pass

    def hostName(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.hostName() -> QString """
        pass

    def isCachingProxy(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.isCachingProxy() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def isTransparentProxy(self):
        """ QNetworkProxy.isTransparentProxy() -> bool """
        return False

    def password(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.password() -> QString """
        pass

    def port(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.port() -> int """
        return 0

    def ProxyType(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def setApplicationProxy(self, QNetworkProxy):
        """ QNetworkProxy.setApplicationProxy(QNetworkProxy) """
        pass

    # real signature unknown; restored from __doc__
    def setCapabilities(self, QNetworkProxy_Capabilities):
        """ QNetworkProxy.setCapabilities(QNetworkProxy.Capabilities) """
        pass

    # real signature unknown; restored from __doc__
    def setHostName(self, QString):
        """ QNetworkProxy.setHostName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPassword(self, QString):
        """ QNetworkProxy.setPassword(QString) """
        pass

    def setPort(self, p_int):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.setPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setType(self, QNetworkProxy_ProxyType):
        """ QNetworkProxy.setType(QNetworkProxy.ProxyType) """
        pass

    # real signature unknown; restored from __doc__
    def setUser(self, QString):
        """ QNetworkProxy.setUser(QString) """
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.type() -> QNetworkProxy.ProxyType """
        pass

    def user(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxy.user() -> QString """
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

    __weakref__ = property(lambda self: object())  # default

    CachingCapability = 8
    DefaultProxy = 0
    FtpCachingProxy = 5
    HostNameLookupCapability = 16
    HttpCachingProxy = 4
    HttpProxy = 3
    ListeningCapability = 2
    NoProxy = 2
    Socks5Proxy = 1
    TunnelingCapability = 1
    UdpTunnelingCapability = 4


class QNetworkProxyFactory():  # skipped bases: <type 'sip.wrapper'>

    """
    QNetworkProxyFactory()
    QNetworkProxyFactory(QNetworkProxyFactory)
    """
    # real signature unknown; restored from __doc__

    def proxyForQuery(self, QNetworkProxyQuery):
        """ QNetworkProxyFactory.proxyForQuery(QNetworkProxyQuery) -> list-of-QNetworkProxy """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def queryProxy(self, QNetworkProxyQuery_query=None, *args, **kwargs):
        """ QNetworkProxyFactory.queryProxy(QNetworkProxyQuery query=QNetworkProxyQuery()) -> list-of-QNetworkProxy """
        pass

    # real signature unknown; restored from __doc__
    def setApplicationProxyFactory(self, QNetworkProxyFactory):
        """ QNetworkProxyFactory.setApplicationProxyFactory(QNetworkProxyFactory) """
        pass

    # real signature unknown; restored from __doc__
    def setUseSystemConfiguration(self, bool):
        """ QNetworkProxyFactory.setUseSystemConfiguration(bool) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def systemProxyForQuery(self, QNetworkProxyQuery_query=None, *args, **kwargs):
        """ QNetworkProxyFactory.systemProxyForQuery(QNetworkProxyQuery query=QNetworkProxyQuery()) -> list-of-QNetworkProxy """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def __init__(self, QNetworkProxyFactory=None):
        pass

    __weakref__ = property(lambda self: object())  # default


class QNetworkProxyQuery():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkProxyQuery()
    QNetworkProxyQuery(QUrl, QNetworkProxyQuery.QueryType type=QNetworkProxyQuery.UrlRequest)
    QNetworkProxyQuery(QString, int, QString protocolTag=QString(), QNetworkProxyQuery.QueryType type=QNetworkProxyQuery.TcpSocket)
    QNetworkProxyQuery(int, QString protocolTag=QString(), QNetworkProxyQuery.QueryType type=QNetworkProxyQuery.TcpServer)
    QNetworkProxyQuery(QNetworkProxyQuery)
    """

    def localPort(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.localPort() -> int """
        return 0

    def peerHostName(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.peerHostName() -> QString """
        pass

    def peerPort(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.peerPort() -> int """
        return 0

    def protocolTag(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.protocolTag() -> QString """
        pass

    def QueryType(self, *args, **kwargs):  # real signature unknown
        pass

    def queryType(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.queryType() -> QNetworkProxyQuery.QueryType """
        pass

    # real signature unknown; restored from __doc__
    def setLocalPort(self, p_int):
        """ QNetworkProxyQuery.setLocalPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerHostName(self, QString):
        """ QNetworkProxyQuery.setPeerHostName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerPort(self, p_int):
        """ QNetworkProxyQuery.setPeerPort(int) """
        pass

    # real signature unknown; restored from __doc__
    def setProtocolTag(self, QString):
        """ QNetworkProxyQuery.setProtocolTag(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setQueryType(self, QNetworkProxyQuery_QueryType):
        """ QNetworkProxyQuery.setQueryType(QNetworkProxyQuery.QueryType) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.setUrl(QUrl) """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QNetworkProxyQuery.url() -> QUrl """
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

    __weakref__ = property(lambda self: object())  # default

    TcpServer = 100
    TcpSocket = 0
    UdpSocket = 1
    UrlRequest = 101


class QNetworkReply(__PyQt4_QtCore.QIODevice):

    """ QNetworkReply(QObject parent=None) """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.abort() """
        pass

    # real signature unknown; restored from __doc__
    def attribute(self, QNetworkRequest_Attribute):
        """ QNetworkReply.attribute(QNetworkRequest.Attribute) -> QVariant """
        pass

    def close(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.close() """
        pass

    def downloadProgress(self, *args, **kwargs):  # real signature unknown
        """ QNetworkReply.downloadProgress[int, int] [signal] """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """
        QNetworkReply.error() -> QNetworkReply.NetworkError
        QNetworkReply.error[QNetworkReply.NetworkError] [signal]
        """
        pass

    def finished(self, *args, **kwargs):  # real signature unknown
        """ QNetworkReply.finished[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def hasRawHeader(self, QByteArray):
        """ QNetworkReply.hasRawHeader(QByteArray) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def header(self, QNetworkRequest_KnownHeaders):
        """ QNetworkReply.header(QNetworkRequest.KnownHeaders) -> QVariant """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def ignoreSslErrors(self, list_of_QSslError=None):
        """
        QNetworkReply.ignoreSslErrors()
        QNetworkReply.ignoreSslErrors(list-of-QSslError)
        """
        pass

    def isFinished(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.isFinished() -> bool """
        return False

    def isRunning(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.isRunning() -> bool """
        return False

    def isSequential(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.isSequential() -> bool """
        return False

    def manager(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.manager() -> QNetworkAccessManager """
        return QNetworkAccessManager

    def metaDataChanged(self, *args, **kwargs):  # real signature unknown
        """ QNetworkReply.metaDataChanged[] [signal] """
        pass

    def NetworkError(self, *args, **kwargs):  # real signature unknown
        pass

    def operation(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.operation() -> QNetworkAccessManager.Operation """
        pass

    # real signature unknown; restored from __doc__
    def rawHeader(self, QByteArray):
        """ QNetworkReply.rawHeader(QByteArray) -> QByteArray """
        pass

    def rawHeaderList(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.rawHeaderList() -> list-of-QByteArray """
        pass

    def rawHeaderPairs(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.rawHeaderPairs() -> list-of-tuple-of-QByteArray-QByteArray """
        pass

    def readBufferSize(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.readBufferSize() -> int """
        return 0

    def request(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.request() -> QNetworkRequest """
        return QNetworkRequest

    # real signature unknown; restored from __doc__
    def setAttribute(self, QNetworkRequest_Attribute, QVariant):
        """ QNetworkReply.setAttribute(QNetworkRequest.Attribute, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setError(self, QNetworkReply_NetworkError, QString):
        """ QNetworkReply.setError(QNetworkReply.NetworkError, QString) """
        pass

    # real signature unknown; restored from __doc__
    def setHeader(self, QNetworkRequest_KnownHeaders, QVariant):
        """ QNetworkReply.setHeader(QNetworkRequest.KnownHeaders, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setOperation(self, QNetworkAccessManager_Operation):
        """ QNetworkReply.setOperation(QNetworkAccessManager.Operation) """
        pass

    # real signature unknown; restored from __doc__
    def setRawHeader(self, QByteArray, QByteArray_1):
        """ QNetworkReply.setRawHeader(QByteArray, QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setReadBufferSize(self, p_int):
        """ QNetworkReply.setReadBufferSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setRequest(self, QNetworkRequest):
        """ QNetworkReply.setRequest(QNetworkRequest) """
        pass

    # real signature unknown; restored from __doc__
    def setSslConfiguration(self, QSslConfiguration):
        """ QNetworkReply.setSslConfiguration(QSslConfiguration) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkReply.setUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def sslConfiguration(self):
        """ QNetworkReply.sslConfiguration() -> QSslConfiguration """
        return QSslConfiguration

    def sslErrors(self, *args, **kwargs):  # real signature unknown
        """ QNetworkReply.sslErrors[list-of-QSslError] [signal] """
        pass

    def uploadProgress(self, *args, **kwargs):  # real signature unknown
        """ QNetworkReply.uploadProgress[int, int] [signal] """
        pass

    def url(self):  # real signature unknown; restored from __doc__
        """ QNetworkReply.url() -> QUrl """
        pass

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QNetworkReply.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    AuthenticationRequiredError = 204
    ConnectionRefusedError = 1
    ContentAccessDenied = 201
    ContentNotFoundError = 203
    ContentOperationNotPermittedError = 202
    ContentReSendError = 205
    HostNotFoundError = 3
    NoError = 0
    OperationCanceledError = 5
    ProtocolFailure = 399
    ProtocolInvalidOperationError = 302
    ProtocolUnknownError = 301
    ProxyAuthenticationRequiredError = 105
    ProxyConnectionClosedError = 102
    ProxyConnectionRefusedError = 101
    ProxyNotFoundError = 103
    ProxyTimeoutError = 104
    RemoteHostClosedError = 2
    SslHandshakeFailedError = 6
    TemporaryNetworkFailureError = 7
    TimeoutError = 4
    UnknownContentError = 299
    UnknownNetworkError = 99
    UnknownProxyError = 199


class QNetworkRequest():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QNetworkRequest(QUrl url=QUrl())
    QNetworkRequest(QNetworkRequest)
    """
    # real signature unknown; NOTE: unreliably restored from __doc__

    def attribute(self, QNetworkRequest_Attribute, QVariant_defaultValue=None, *args, **kwargs):
        """ QNetworkRequest.attribute(QNetworkRequest.Attribute, QVariant defaultValue=QVariant()) -> QVariant """
        pass

    def Attribute(self, *args, **kwargs):  # real signature unknown
        pass

    def CacheLoadControl(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def hasRawHeader(self, QByteArray):
        """ QNetworkRequest.hasRawHeader(QByteArray) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def header(self, QNetworkRequest_KnownHeaders):
        """ QNetworkRequest.header(QNetworkRequest.KnownHeaders) -> QVariant """
        pass

    def KnownHeaders(self, *args, **kwargs):  # real signature unknown
        pass

    def LoadControl(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def originatingObject(self):
        """ QNetworkRequest.originatingObject() -> QObject """
        pass

    def Priority(self, *args, **kwargs):  # real signature unknown
        pass

    def priority(self):  # real signature unknown; restored from __doc__
        """ QNetworkRequest.priority() -> QNetworkRequest.Priority """
        pass

    # real signature unknown; restored from __doc__
    def rawHeader(self, QByteArray):
        """ QNetworkRequest.rawHeader(QByteArray) -> QByteArray """
        pass

    def rawHeaderList(self):  # real signature unknown; restored from __doc__
        """ QNetworkRequest.rawHeaderList() -> list-of-QByteArray """
        pass

    # real signature unknown; restored from __doc__
    def setAttribute(self, QNetworkRequest_Attribute, QVariant):
        """ QNetworkRequest.setAttribute(QNetworkRequest.Attribute, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setHeader(self, QNetworkRequest_KnownHeaders, QVariant):
        """ QNetworkRequest.setHeader(QNetworkRequest.KnownHeaders, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setOriginatingObject(self, QObject):
        """ QNetworkRequest.setOriginatingObject(QObject) """
        pass

    # real signature unknown; restored from __doc__
    def setPriority(self, QNetworkRequest_Priority):
        """ QNetworkRequest.setPriority(QNetworkRequest.Priority) """
        pass

    # real signature unknown; restored from __doc__
    def setRawHeader(self, QByteArray, QByteArray_1):
        """ QNetworkRequest.setRawHeader(QByteArray, QByteArray) """
        pass

    # real signature unknown; restored from __doc__
    def setSslConfiguration(self, QSslConfiguration):
        """ QNetworkRequest.setSslConfiguration(QSslConfiguration) """
        pass

    def setUrl(self, QUrl):  # real signature unknown; restored from __doc__
        """ QNetworkRequest.setUrl(QUrl) """
        pass

    # real signature unknown; restored from __doc__
    def sslConfiguration(self):
        """ QNetworkRequest.sslConfiguration() -> QSslConfiguration """
        return QSslConfiguration

    def url(self):  # real signature unknown; restored from __doc__
        """ QNetworkRequest.url() -> QUrl """
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

    __weakref__ = property(lambda self: object())  # default

    AlwaysCache = 3
    AlwaysNetwork = 0
    AuthenticationReuseAttribute = 12
    Automatic = 0
    CacheLoadControlAttribute = 4
    CacheSaveControlAttribute = 5
    ConnectionEncryptedAttribute = 3
    ContentLengthHeader = 1
    ContentTypeHeader = 0
    CookieHeader = 4
    CookieLoadControlAttribute = 11
    CookieSaveControlAttribute = 13
    CustomVerbAttribute = 10
    DoNotBufferUploadDataAttribute = 7
    HighPriority = 1
    HttpPipeliningAllowedAttribute = 8
    HttpPipeliningWasUsedAttribute = 9
    HttpReasonPhraseAttribute = 1
    HttpStatusCodeAttribute = 0
    LastModifiedHeader = 3
    LocationHeader = 2
    LowPriority = 5
    Manual = 1
    NormalPriority = 3
    PreferCache = 2
    PreferNetwork = 1
    RedirectionTargetAttribute = 2
    SetCookieHeader = 5
    SourceIsFromCacheAttribute = 6
    User = 1000
    UserMax = 32767


class QNetworkSession(__PyQt4_QtCore.QObject):

    """ QNetworkSession(QNetworkConfiguration, QObject parent=None) """

    def accept(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.accept() """
        pass

    def activeTime(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.activeTime() -> int """
        return 0

    def bytesReceived(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.bytesReceived() -> int """
        return 0

    def bytesWritten(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.bytesWritten() -> int """
        return 0

    def close(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.close() """
        pass

    def closed(self, *args, **kwargs):  # real signature unknown
        """ QNetworkSession.closed[] [signal] """
        pass

    def configuration(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.configuration() -> QNetworkConfiguration """
        return QNetworkConfiguration

    # real signature unknown; NOTE: unreliably restored from __doc__
    def connectNotify(self, SIGNAL, *args, **kwargs):
        """ QNetworkSession.connectNotify(SIGNAL()) """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def disconnectNotify(self, SIGNAL, *args, **kwargs):
        """ QNetworkSession.disconnectNotify(SIGNAL()) """
        pass

    def error(self):  # real signature unknown; restored from __doc__
        """
        QNetworkSession.error() -> QNetworkSession.SessionError
        QNetworkSession.error[QNetworkSession.SessionError] [signal]
        """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.errorString() -> QString """
        pass

    def ignore(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.ignore() """
        pass

    def interface(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.interface() -> QNetworkInterface """
        return QNetworkInterface

    def isOpen(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.isOpen() -> bool """
        return False

    def migrate(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.migrate() """
        pass

    # real signature unknown
    def newConfigurationActivated(self, *args, **kwargs):
        """ QNetworkSession.newConfigurationActivated[] [signal] """
        pass

    def open(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.open() """
        pass

    def opened(self, *args, **kwargs):  # real signature unknown
        """ QNetworkSession.opened[] [signal] """
        pass

    # real signature unknown
    def preferredConfigurationChanged(self, *args, **kwargs):
        """ QNetworkSession.preferredConfigurationChanged[QNetworkConfiguration, bool] [signal] """
        pass

    def reject(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.reject() """
        pass

    def SessionError(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def sessionProperty(self, QString):
        """ QNetworkSession.sessionProperty(QString) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def setSessionProperty(self, QString, QVariant):
        """ QNetworkSession.setSessionProperty(QString, QVariant) """
        pass

    def state(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.state() -> QNetworkSession.State """
        pass

    def State(self, *args, **kwargs):  # real signature unknown
        pass

    def stateChanged(self, *args, **kwargs):  # real signature unknown
        """ QNetworkSession.stateChanged[QNetworkSession.State] [signal] """
        pass

    def stop(self):  # real signature unknown; restored from __doc__
        """ QNetworkSession.stop() """
        pass

    # real signature unknown; restored from __doc__
    def waitForOpened(self, int_msecs=30000):
        """ QNetworkSession.waitForOpened(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def __init__(self, QNetworkConfiguration, QObject_parent=None):
        pass

    Closing = 4
    Connected = 3
    Connecting = 2
    Disconnected = 5
    Invalid = 0
    InvalidConfigurationError = 4
    NotAvailable = 1
    OperationNotSupportedError = 3
    Roaming = 6
    RoamingError = 2
    SessionAbortedError = 1
    UnknownSessionError = 0


class QSsl():  # skipped bases: <type 'sip.wrapper'>
    # no doc

    # real signature unknown
    def AlternateNameEntryType(self, *args, **kwargs):
        pass

    def EncodingFormat(self, *args, **kwargs):  # real signature unknown
        pass

    def KeyAlgorithm(self, *args, **kwargs):  # real signature unknown
        pass

    def KeyType(self, *args, **kwargs):  # real signature unknown
        pass

    def SslProtocol(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default

    AnyProtocol = 3
    Der = 1
    DnsEntry = 1
    Dsa = 1
    EmailEntry = 0
    Pem = 0
    PrivateKey = 0
    PublicKey = 1
    Rsa = 0
    SslV2 = 1
    SslV3 = 0
    TlsV1 = 2
    UnknownProtocol = -1


class QSslCertificate():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSslCertificate(QIODevice, QSsl.EncodingFormat format=QSsl.Pem)
    QSslCertificate(QByteArray data=QByteArray(), QSsl.EncodingFormat format=QSsl.Pem)
    QSslCertificate(QSslCertificate)
    """
    # real signature unknown; restored from __doc__

    def alternateSubjectNames(self):
        """ QSslCertificate.alternateSubjectNames() -> dict-of-QSsl.AlternateNameEntryType-list-of-QString """
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.clear() """
        pass

    # real signature unknown; restored from __doc__
    def digest(self, QCryptographicHash_Algorithm_algorithm=None):
        """ QSslCertificate.digest(QCryptographicHash.Algorithm algorithm=QCryptographicHash.Md5) -> QByteArray """
        pass

    def effectiveDate(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.effectiveDate() -> QDateTime """
        pass

    def expiryDate(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.expiryDate() -> QDateTime """
        pass

    # real signature unknown; restored from __doc__
    def fromData(self, QByteArray, QSsl_EncodingFormat_format=None):
        """ QSslCertificate.fromData(QByteArray, QSsl.EncodingFormat format=QSsl.Pem) -> list-of-QSslCertificate """
        pass

    # real signature unknown; restored from __doc__
    def fromDevice(self, QIODevice, QSsl_EncodingFormat_format=None):
        """ QSslCertificate.fromDevice(QIODevice, QSsl.EncodingFormat format=QSsl.Pem) -> list-of-QSslCertificate """
        pass

    # real signature unknown; restored from __doc__
    def fromPath(self, QString, QSsl_EncodingFormat_format=None, QRegExp_PatternSyntax_syntax=None):
        """ QSslCertificate.fromPath(QString, QSsl.EncodingFormat format=QSsl.Pem, QRegExp.PatternSyntax syntax=QRegExp.FixedString) -> list-of-QSslCertificate """
        pass

    def handle(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.handle() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def issuerInfo(self, *__args):
        """
        QSslCertificate.issuerInfo(QSslCertificate.SubjectInfo) -> QString
        QSslCertificate.issuerInfo(QByteArray) -> QString
        """
        pass

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.isValid() -> bool """
        return False

    def publicKey(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.publicKey() -> QSslKey """
        return QSslKey

    def serialNumber(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.serialNumber() -> QByteArray """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def subjectInfo(self, *__args):
        """
        QSslCertificate.subjectInfo(QSslCertificate.SubjectInfo) -> QString
        QSslCertificate.subjectInfo(QByteArray) -> QString
        """
        pass

    def SubjectInfo(self, *args, **kwargs):  # real signature unknown
        pass

    def toDer(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.toDer() -> QByteArray """
        pass

    def toPem(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.toPem() -> QByteArray """
        pass

    def version(self):  # real signature unknown; restored from __doc__
        """ QSslCertificate.version() -> QByteArray """
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

    __weakref__ = property(lambda self: object())  # default

    CommonName = 1
    CountryName = 4
    LocalityName = 2
    Organization = 0
    OrganizationalUnitName = 3
    StateOrProvinceName = 5


class QSslCipher():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSslCipher()
    QSslCipher(QString, QSsl.SslProtocol)
    QSslCipher(QSslCipher)
    """
    # real signature unknown; restored from __doc__

    def authenticationMethod(self):
        """ QSslCipher.authenticationMethod() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def encryptionMethod(self):
        """ QSslCipher.encryptionMethod() -> QString """
        pass

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def keyExchangeMethod(self):
        """ QSslCipher.keyExchangeMethod() -> QString """
        pass

    def name(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.name() -> QString """
        pass

    def protocol(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.protocol() -> QSsl.SslProtocol """
        pass

    def protocolString(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.protocolString() -> QString """
        pass

    def supportedBits(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.supportedBits() -> int """
        return 0

    def usedBits(self):  # real signature unknown; restored from __doc__
        """ QSslCipher.usedBits() -> int """
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


class QSslConfiguration():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSslConfiguration()
    QSslConfiguration(QSslConfiguration)
    """

    def caCertificates(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.caCertificates() -> list-of-QSslCertificate """
        pass

    def ciphers(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.ciphers() -> list-of-QSslCipher """
        pass

    # real signature unknown; restored from __doc__
    def defaultConfiguration(self):
        """ QSslConfiguration.defaultConfiguration() -> QSslConfiguration """
        return QSslConfiguration

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.isNull() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def localCertificate(self):
        """ QSslConfiguration.localCertificate() -> QSslCertificate """
        return QSslCertificate

    def peerCertificate(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.peerCertificate() -> QSslCertificate """
        return QSslCertificate

    # real signature unknown; restored from __doc__
    def peerCertificateChain(self):
        """ QSslConfiguration.peerCertificateChain() -> list-of-QSslCertificate """
        pass

    def peerVerifyDepth(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.peerVerifyDepth() -> int """
        return 0

    def peerVerifyMode(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.peerVerifyMode() -> QSslSocket.PeerVerifyMode """
        pass

    def privateKey(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.privateKey() -> QSslKey """
        return QSslKey

    def protocol(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.protocol() -> QSsl.SslProtocol """
        pass

    def sessionCipher(self):  # real signature unknown; restored from __doc__
        """ QSslConfiguration.sessionCipher() -> QSslCipher """
        return QSslCipher

    # real signature unknown; restored from __doc__
    def setCaCertificates(self, list_of_QSslCertificate):
        """ QSslConfiguration.setCaCertificates(list-of-QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__
    def setCiphers(self, list_of_QSslCipher):
        """ QSslConfiguration.setCiphers(list-of-QSslCipher) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultConfiguration(self, QSslConfiguration):
        """ QSslConfiguration.setDefaultConfiguration(QSslConfiguration) """
        pass

    # real signature unknown; restored from __doc__
    def setLocalCertificate(self, QSslCertificate):
        """ QSslConfiguration.setLocalCertificate(QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerVerifyDepth(self, p_int):
        """ QSslConfiguration.setPeerVerifyDepth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerVerifyMode(self, QSslSocket_PeerVerifyMode):
        """ QSslConfiguration.setPeerVerifyMode(QSslSocket.PeerVerifyMode) """
        pass

    # real signature unknown; restored from __doc__
    def setPrivateKey(self, QSslKey):
        """ QSslConfiguration.setPrivateKey(QSslKey) """
        pass

    # real signature unknown; restored from __doc__
    def setProtocol(self, QSsl_SslProtocol):
        """ QSslConfiguration.setProtocol(QSsl.SslProtocol) """
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
    def __init__(self, QSslConfiguration=None):
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


class QSslError():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSslError()
    QSslError(QSslError.SslError)
    QSslError(QSslError.SslError, QSslCertificate)
    QSslError(QSslError)
    """

    def certificate(self):  # real signature unknown; restored from __doc__
        """ QSslError.certificate() -> QSslCertificate """
        return QSslCertificate

    def error(self):  # real signature unknown; restored from __doc__
        """ QSslError.error() -> QSslError.SslError """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QSslError.errorString() -> QString """
        pass

    def SslError(self, *args, **kwargs):  # real signature unknown
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

    __weakref__ = property(lambda self: object())  # default

    AuthorityIssuerSerialNumberMismatch = 20
    CertificateExpired = 6
    CertificateNotYetValid = 5
    CertificateRejected = 18
    CertificateRevoked = 13
    CertificateSignatureFailed = 4
    CertificateUntrusted = 17
    HostNameMismatch = 22
    InvalidCaCertificate = 14
    InvalidNotAfterField = 8
    InvalidNotBeforeField = 7
    InvalidPurpose = 16
    NoError = 0
    NoPeerCertificate = 21
    NoSslSupport = 23
    PathLengthExceeded = 15
    SelfSignedCertificate = 9
    SelfSignedCertificateInChain = 10
    SubjectIssuerMismatch = 19
    UnableToDecodeIssuerPublicKey = 3
    UnableToDecryptCertificateSignature = 2
    UnableToGetIssuerCertificate = 1
    UnableToGetLocalIssuerCertificate = 11
    UnableToVerifyFirstCertificate = 12
    UnspecifiedError = -1


class QSslKey():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QSslKey()
    QSslKey(QByteArray, QSsl.KeyAlgorithm, QSsl.EncodingFormat encoding=QSsl.Pem, QSsl.KeyType type=QSsl.PrivateKey, QByteArray passPhrase=QByteArray())
    QSslKey(QIODevice, QSsl.KeyAlgorithm, QSsl.EncodingFormat encoding=QSsl.Pem, QSsl.KeyType type=QSsl.PrivateKey, QByteArray passPhrase=QByteArray())
    QSslKey(QSslKey)
    """

    def algorithm(self):  # real signature unknown; restored from __doc__
        """ QSslKey.algorithm() -> QSsl.KeyAlgorithm """
        pass

    def clear(self):  # real signature unknown; restored from __doc__
        """ QSslKey.clear() """
        pass

    def handle(self):  # real signature unknown; restored from __doc__
        """ QSslKey.handle() -> int """
        return 0

    def isNull(self):  # real signature unknown; restored from __doc__
        """ QSslKey.isNull() -> bool """
        return False

    def length(self):  # real signature unknown; restored from __doc__
        """ QSslKey.length() -> int """
        return 0

    # real signature unknown; NOTE: unreliably restored from __doc__
    def toDer(self, QByteArray_passPhrase=None, *args, **kwargs):
        """ QSslKey.toDer(QByteArray passPhrase=QByteArray()) -> QByteArray """
        pass

    # real signature unknown; NOTE: unreliably restored from __doc__
    def toPem(self, QByteArray_passPhrase=None, *args, **kwargs):
        """ QSslKey.toPem(QByteArray passPhrase=QByteArray()) -> QByteArray """
        pass

    def type(self):  # real signature unknown; restored from __doc__
        """ QSslKey.type() -> QSsl.KeyType """
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

    __weakref__ = property(lambda self: object())  # default


class QTcpSocket(QAbstractSocket):

    """ QTcpSocket(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def __init__(self, QObject_parent=None):
        pass


class QSslSocket(QTcpSocket):

    """ QSslSocket(QObject parent=None) """

    def abort(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.abort() """
        pass

    # real signature unknown; restored from __doc__
    def addCaCertificate(self, QSslCertificate):
        """ QSslSocket.addCaCertificate(QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def addCaCertificates(self, *__args):
        """
        QSslSocket.addCaCertificates(QString, QSsl.EncodingFormat format=QSsl.Pem, QRegExp.PatternSyntax syntax=QRegExp.FixedString) -> bool
        QSslSocket.addCaCertificates(list-of-QSslCertificate)
        """
        return False

    # real signature unknown; restored from __doc__
    def addDefaultCaCertificate(self, QSslCertificate):
        """ QSslSocket.addDefaultCaCertificate(QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def addDefaultCaCertificates(self, *__args):
        """
        QSslSocket.addDefaultCaCertificates(QString, QSsl.EncodingFormat format=QSsl.Pem, QRegExp.PatternSyntax syntax=QRegExp.FixedString) -> bool
        QSslSocket.addDefaultCaCertificates(list-of-QSslCertificate)
        """
        return False

    def atEnd(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.atEnd() -> bool """
        return False

    def bytesAvailable(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.bytesAvailable() -> int """
        return 0

    def bytesToWrite(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.bytesToWrite() -> int """
        return 0

    def caCertificates(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.caCertificates() -> list-of-QSslCertificate """
        pass

    def canReadLine(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.canReadLine() -> bool """
        return False

    def ciphers(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.ciphers() -> list-of-QSslCipher """
        pass

    def close(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.close() """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def connectToHostEncrypted(self, QString, p_int, *__args):
        """
        QSslSocket.connectToHostEncrypted(QString, int, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        QSslSocket.connectToHostEncrypted(QString, int, QString, QIODevice.OpenMode mode=QIODevice.ReadWrite)
        """
        pass

    # real signature unknown; restored from __doc__
    def connectToHostImplementation(self, QString, p_int, QIODevice_OpenMode):
        """ QSslSocket.connectToHostImplementation(QString, int, QIODevice.OpenMode) """
        pass

    # real signature unknown; restored from __doc__
    def defaultCaCertificates(self):
        """ QSslSocket.defaultCaCertificates() -> list-of-QSslCertificate """
        pass

    def defaultCiphers(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.defaultCiphers() -> list-of-QSslCipher """
        pass

    # real signature unknown; restored from __doc__
    def disconnectFromHostImplementation(self):
        """ QSslSocket.disconnectFromHostImplementation() """
        pass

    def encrypted(self, *args, **kwargs):  # real signature unknown
        """ QSslSocket.encrypted[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def encryptedBytesAvailable(self):
        """ QSslSocket.encryptedBytesAvailable() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def encryptedBytesToWrite(self):
        """ QSslSocket.encryptedBytesToWrite() -> int """
        return 0

    def encryptedBytesWritten(self, *args, **kwargs):  # real signature unknown
        """ QSslSocket.encryptedBytesWritten[int] [signal] """
        pass

    def flush(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.flush() -> bool """
        return False

    # real signature unknown; restored from __doc__ with multiple overloads
    def ignoreSslErrors(self, list_of_QSslError=None):
        """
        QSslSocket.ignoreSslErrors()
        QSslSocket.ignoreSslErrors(list-of-QSslError)
        """
        pass

    def isEncrypted(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.isEncrypted() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def localCertificate(self):
        """ QSslSocket.localCertificate() -> QSslCertificate """
        return QSslCertificate

    def mode(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.mode() -> QSslSocket.SslMode """
        pass

    def modeChanged(self, *args, **kwargs):  # real signature unknown
        """ QSslSocket.modeChanged[QSslSocket.SslMode] [signal] """
        pass

    def peerCertificate(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.peerCertificate() -> QSslCertificate """
        return QSslCertificate

    # real signature unknown; restored from __doc__
    def peerCertificateChain(self):
        """ QSslSocket.peerCertificateChain() -> list-of-QSslCertificate """
        pass

    def peerVerifyDepth(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.peerVerifyDepth() -> int """
        return 0

    def peerVerifyError(self, *args, **kwargs):  # real signature unknown
        """ QSslSocket.peerVerifyError[QSslError] [signal] """
        pass

    def peerVerifyMode(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.peerVerifyMode() -> QSslSocket.PeerVerifyMode """
        pass

    def PeerVerifyMode(self, *args, **kwargs):  # real signature unknown
        pass

    def privateKey(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.privateKey() -> QSslKey """
        return QSslKey

    def protocol(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.protocol() -> QSsl.SslProtocol """
        pass

    def readData(self, p_int):  # real signature unknown; restored from __doc__
        """ QSslSocket.readData(int) -> str """
        return ""

    def sessionCipher(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.sessionCipher() -> QSslCipher """
        return QSslCipher

    # real signature unknown; restored from __doc__
    def setCaCertificates(self, list_of_QSslCertificate):
        """ QSslSocket.setCaCertificates(list-of-QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setCiphers(self, *__args):
        """
        QSslSocket.setCiphers(list-of-QSslCipher)
        QSslSocket.setCiphers(QString)
        """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultCaCertificates(self, list_of_QSslCertificate):
        """ QSslSocket.setDefaultCaCertificates(list-of-QSslCertificate) """
        pass

    # real signature unknown; restored from __doc__
    def setDefaultCiphers(self, list_of_QSslCipher):
        """ QSslSocket.setDefaultCiphers(list-of-QSslCipher) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setLocalCertificate(self, *__args):
        """
        QSslSocket.setLocalCertificate(QSslCertificate)
        QSslSocket.setLocalCertificate(QString, QSsl.EncodingFormat format=QSsl.Pem)
        """
        pass

    # real signature unknown; restored from __doc__
    def setPeerVerifyDepth(self, p_int):
        """ QSslSocket.setPeerVerifyDepth(int) """
        pass

    # real signature unknown; restored from __doc__
    def setPeerVerifyMode(self, QSslSocket_PeerVerifyMode):
        """ QSslSocket.setPeerVerifyMode(QSslSocket.PeerVerifyMode) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def setPrivateKey(self, *__args):
        """
        QSslSocket.setPrivateKey(QSslKey)
        QSslSocket.setPrivateKey(QString, QSsl.KeyAlgorithm algorithm=QSsl.Rsa, QSsl.EncodingFormat format=QSsl.Pem, QByteArray passPhrase=QByteArray())
        """
        pass

    # real signature unknown; restored from __doc__
    def setProtocol(self, QSsl_SslProtocol):
        """ QSslSocket.setProtocol(QSsl.SslProtocol) """
        pass

    # real signature unknown; restored from __doc__
    def setReadBufferSize(self, p_int):
        """ QSslSocket.setReadBufferSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketDescriptor(self, p_int, QAbstractSocket_SocketState_state=None, QIODevice_OpenMode_mode=None):
        """ QSslSocket.setSocketDescriptor(int, QAbstractSocket.SocketState state=QAbstractSocket.ConnectedState, QIODevice.OpenMode mode=QIODevice.ReadWrite) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def setSocketOption(self, QAbstractSocket_SocketOption, QVariant):
        """ QSslSocket.setSocketOption(QAbstractSocket.SocketOption, QVariant) """
        pass

    # real signature unknown; restored from __doc__
    def setSslConfiguration(self, QSslConfiguration):
        """ QSslSocket.setSslConfiguration(QSslConfiguration) """
        pass

    # real signature unknown; restored from __doc__
    def socketOption(self, QAbstractSocket_SocketOption):
        """ QSslSocket.socketOption(QAbstractSocket.SocketOption) -> QVariant """
        pass

    # real signature unknown; restored from __doc__
    def sslConfiguration(self):
        """ QSslSocket.sslConfiguration() -> QSslConfiguration """
        return QSslConfiguration

    def sslErrors(self):  # real signature unknown; restored from __doc__
        """
        QSslSocket.sslErrors() -> list-of-QSslError
        QSslSocket.sslErrors[list-of-QSslError] [signal]
        """
        pass

    def SslMode(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__
    def startClientEncryption(self):
        """ QSslSocket.startClientEncryption() """
        pass

    # real signature unknown; restored from __doc__
    def startServerEncryption(self):
        """ QSslSocket.startServerEncryption() """
        pass

    # real signature unknown; restored from __doc__
    def supportedCiphers(self):
        """ QSslSocket.supportedCiphers() -> list-of-QSslCipher """
        pass

    def supportsSsl(self):  # real signature unknown; restored from __doc__
        """ QSslSocket.supportsSsl() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def systemCaCertificates(self):
        """ QSslSocket.systemCaCertificates() -> list-of-QSslCertificate """
        pass

    # real signature unknown; restored from __doc__
    def waitForBytesWritten(self, int_msecs=30000):
        """ QSslSocket.waitForBytesWritten(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForConnected(self, int_msecs=30000):
        """ QSslSocket.waitForConnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForDisconnected(self, int_msecs=30000):
        """ QSslSocket.waitForDisconnected(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForEncrypted(self, int_msecs=30000):
        """ QSslSocket.waitForEncrypted(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def waitForReadyRead(self, int_msecs=30000):
        """ QSslSocket.waitForReadyRead(int msecs=30000) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def writeData(self, p_str):
        """ QSslSocket.writeData(str) -> int """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    AutoVerifyPeer = 3
    QueryPeer = 1
    SslClientMode = 1
    SslServerMode = 2
    UnencryptedMode = 0
    VerifyNone = 0
    VerifyPeer = 2


class QTcpServer(__PyQt4_QtCore.QObject):

    """ QTcpServer(QObject parent=None) """
    # real signature unknown; restored from __doc__

    def addPendingConnection(self, QTcpSocket):
        """ QTcpServer.addPendingConnection(QTcpSocket) """
        pass

    def close(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.close() """
        pass

    def errorString(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.errorString() -> QString """
        pass

    # real signature unknown; restored from __doc__
    def hasPendingConnections(self):
        """ QTcpServer.hasPendingConnections() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def incomingConnection(self, p_int):
        """ QTcpServer.incomingConnection(int) """
        pass

    def isListening(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.isListening() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def listen(self, QHostAddress_address=None, int_port=0):
        """ QTcpServer.listen(QHostAddress address=QHostAddress.Any, int port=0) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def maxPendingConnections(self):
        """ QTcpServer.maxPendingConnections() -> int """
        return 0

    def newConnection(self, *args, **kwargs):  # real signature unknown
        """ QTcpServer.newConnection[] [signal] """
        pass

    # real signature unknown; restored from __doc__
    def nextPendingConnection(self):
        """ QTcpServer.nextPendingConnection() -> QTcpSocket """
        return QTcpSocket

    def proxy(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.proxy() -> QNetworkProxy """
        return QNetworkProxy

    def serverAddress(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.serverAddress() -> QHostAddress """
        return QHostAddress

    def serverError(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.serverError() -> QAbstractSocket.SocketError """
        pass

    def serverPort(self):  # real signature unknown; restored from __doc__
        """ QTcpServer.serverPort() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def setMaxPendingConnections(self, p_int):
        """ QTcpServer.setMaxPendingConnections(int) """
        pass

    # real signature unknown; restored from __doc__
    def setProxy(self, QNetworkProxy):
        """ QTcpServer.setProxy(QNetworkProxy) """
        pass

    # real signature unknown; restored from __doc__
    def setSocketDescriptor(self, p_int):
        """ QTcpServer.setSocketDescriptor(int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def socketDescriptor(self):
        """ QTcpServer.socketDescriptor() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def waitForNewConnection(self, int_msecs=0):
        """ QTcpServer.waitForNewConnection(int msecs=0) -> (bool, bool) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass


class QUdpSocket(QAbstractSocket):

    """ QUdpSocket(QObject parent=None) """
    # real signature unknown; restored from __doc__ with multiple overloads

    def bind(self, *__args):
        """
        QUdpSocket.bind(QHostAddress, int) -> bool
        QUdpSocket.bind(int port=0) -> bool
        QUdpSocket.bind(QHostAddress, int, QUdpSocket.BindMode) -> bool
        QUdpSocket.bind(int, QUdpSocket.BindMode) -> bool
        """
        return False

    def BindFlag(self, *args, **kwargs):  # real signature unknown
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def BindMode(self, *__args):
        """
        QUdpSocket.BindMode(QUdpSocket.BindMode)
        QUdpSocket.BindMode(int)
        QUdpSocket.BindMode()
        """
        pass

    # real signature unknown; restored from __doc__
    def hasPendingDatagrams(self):
        """ QUdpSocket.hasPendingDatagrams() -> bool """
        return False

    # real signature unknown; restored from __doc__
    def pendingDatagramSize(self):
        """ QUdpSocket.pendingDatagramSize() -> int """
        return 0

    # real signature unknown; restored from __doc__
    def readDatagram(self, p_int):
        """ QUdpSocket.readDatagram(int) -> (str, QHostAddress, int) """
        pass

    # real signature unknown; restored from __doc__ with multiple overloads
    def writeDatagram(self, *__args):
        """
        QUdpSocket.writeDatagram(str, QHostAddress, int) -> int
        QUdpSocket.writeDatagram(QByteArray, QHostAddress, int) -> int
        """
        return 0

    # real signature unknown; restored from __doc__
    def __init__(self, QObject_parent=None):
        pass

    DefaultForPlatform = 0
    DontShareAddress = 2
    ReuseAddressHint = 4
    ShareAddress = 1


class QUrlInfo():  # skipped bases: <type 'sip.simplewrapper'>

    """
    QUrlInfo()
    QUrlInfo(QUrlInfo)
    QUrlInfo(QString, int, QString, QString, int, QDateTime, QDateTime, bool, bool, bool, bool, bool, bool)
    QUrlInfo(QUrl, int, QString, QString, int, QDateTime, QDateTime, bool, bool, bool, bool, bool, bool)
    """
    # real signature unknown; restored from __doc__

    def equal(self, QUrlInfo, QUrlInfo_1, p_int):
        """ QUrlInfo.equal(QUrlInfo, QUrlInfo, int) -> bool """
        return False

    # real signature unknown; restored from __doc__
    def greaterThan(self, QUrlInfo, QUrlInfo_1, p_int):
        """ QUrlInfo.greaterThan(QUrlInfo, QUrlInfo, int) -> bool """
        return False

    def group(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.group() -> QString """
        pass

    def isDir(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isDir() -> bool """
        return False

    def isExecutable(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isExecutable() -> bool """
        return False

    def isFile(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isFile() -> bool """
        return False

    def isReadable(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isReadable() -> bool """
        return False

    def isSymLink(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isSymLink() -> bool """
        return False

    def isValid(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isValid() -> bool """
        return False

    def isWritable(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.isWritable() -> bool """
        return False

    def lastModified(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.lastModified() -> QDateTime """
        pass

    def lastRead(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.lastRead() -> QDateTime """
        pass

    # real signature unknown; restored from __doc__
    def lessThan(self, QUrlInfo, QUrlInfo_1, p_int):
        """ QUrlInfo.lessThan(QUrlInfo, QUrlInfo, int) -> bool """
        return False

    def name(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.name() -> QString """
        pass

    def owner(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.owner() -> QString """
        pass

    def permissions(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.permissions() -> int """
        return 0

    def PermissionSpec(self, *args, **kwargs):  # real signature unknown
        pass

    def setDir(self, bool):  # real signature unknown; restored from __doc__
        """ QUrlInfo.setDir(bool) """
        pass

    def setFile(self, bool):  # real signature unknown; restored from __doc__
        """ QUrlInfo.setFile(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setGroup(self, QString):
        """ QUrlInfo.setGroup(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setLastModified(self, QDateTime):
        """ QUrlInfo.setLastModified(QDateTime) """
        pass

    # real signature unknown; restored from __doc__
    def setLastRead(self, QDateTime):
        """ QUrlInfo.setLastRead(QDateTime) """
        pass

    # real signature unknown; restored from __doc__
    def setName(self, QString):
        """ QUrlInfo.setName(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setOwner(self, QString):
        """ QUrlInfo.setOwner(QString) """
        pass

    # real signature unknown; restored from __doc__
    def setPermissions(self, p_int):
        """ QUrlInfo.setPermissions(int) """
        pass

    # real signature unknown; restored from __doc__
    def setReadable(self, bool):
        """ QUrlInfo.setReadable(bool) """
        pass

    def setSize(self, p_int):  # real signature unknown; restored from __doc__
        """ QUrlInfo.setSize(int) """
        pass

    # real signature unknown; restored from __doc__
    def setSymLink(self, bool):
        """ QUrlInfo.setSymLink(bool) """
        pass

    # real signature unknown; restored from __doc__
    def setWritable(self, bool):
        """ QUrlInfo.setWritable(bool) """
        pass

    def size(self):  # real signature unknown; restored from __doc__
        """ QUrlInfo.size() -> int """
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

    ExeGroup = 8
    ExeOther = 1
    ExeOwner = 64
    ReadGroup = 32
    ReadOther = 4
    ReadOwner = 256
    WriteGroup = 16
    WriteOther = 2
    WriteOwner = 128

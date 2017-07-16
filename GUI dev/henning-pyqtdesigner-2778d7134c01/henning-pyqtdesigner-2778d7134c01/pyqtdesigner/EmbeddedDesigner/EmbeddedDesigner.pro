TARGET    =  EmbeddedDesigner
TEMPLATE  =  lib
CONFIG    += designer plugin
LIBS      += -lQtDesignerComponents -lQtDesigner

DEFINES   += EMBEDEDDESIGNER_LIBRARY


SOURCES   += EmbeddedDesigner.cpp \
             EmbeddedDesignerForm.cpp \
             pyqtwrapper.cpp

HEADERS   += EmbeddedDesigner.h\
             EmbeddedDesigner_global.h \
             EmbeddedDesignerForm.h \
             internals/shared_global_p.h \
             internals/qdesigner_integration_p.h \
             pyqtwrapper.h

FORMS     += EmbeddedDesignerForm.ui

RESOURCES += EmbeddedDesigner.qrc

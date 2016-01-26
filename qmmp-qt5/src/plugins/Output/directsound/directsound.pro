include(../../plugins.pri)

HEADERS += outputdirectsoundfactory.h \
           outputdirectsound.h

SOURCES += outputdirectsoundfactory.cpp \
           outputdirectsound.cpp

HEADERS += ../../../../src/qmmp/output.h


TARGET=$$PLUGINS_PREFIX/Output/directsound

INCLUDEPATH += ../../../
QMAKE_LIBDIR += ../../../../bin

CONFIG += warn_on \
thread \
plugin

TEMPLATE = lib
LIBS += -lqmmp1 -ldxguid -lstrmiids -ldmoguids -lmsdmo -lole32 -loleaut32 -luuid -lgdi32 -ldsound



isEmpty (LIB_DIR){
LIB_DIR = /lib
}

target.path = $$LIB_DIR/qmmp/Output
INSTALLS += target

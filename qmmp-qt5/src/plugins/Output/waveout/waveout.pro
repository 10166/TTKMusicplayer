include(../../plugins.pri)

HEADERS += outputwaveoutfactory.h \
           outputwaveout.h

SOURCES += outputwaveoutfactory.cpp \
           outputwaveout.cpp

HEADERS += ../../../../src/qmmp/output.h
msvc:{
    HEADERS += ../../../../src/qmmp/volume.h \
               ../../../../src/qmmp/visual.h
}

TARGET=$$PLUGINS_PREFIX/Output/waveout

INCLUDEPATH += ../../../
QMAKE_LIBDIR += ../../../../bin

CONFIG += warn_on \
thread \
plugin

TEMPLATE = lib
LIBS += -lqmmp1 -lwinmm



isEmpty (LIB_DIR){
LIB_DIR = /lib
}

target.path = $$LIB_DIR/qmmp/Output
INSTALLS += target

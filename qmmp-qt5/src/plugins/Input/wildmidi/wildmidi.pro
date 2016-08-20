include(../../plugins.pri)

HEADERS += decoderwildmidifactory.h \
    decoder_wildmidi.h \
    wildmidihelper.h

SOURCES += decoder_wildmidi.cpp \
    decoderwildmidifactory.cpp \
    wildmidihelper.cpp

TARGET = $$PLUGINS_PREFIX/Input/wildmidi
QMAKE_CLEAN = $$PLUGINS_PREFIX/Input/libwildmidi.so

INCLUDEPATH += ../../../ \
               $$EXTRA_PREFIX/libwildmidi/include

CONFIG += warn_on \
          plugin

TEMPLATE = lib

isEmpty(LIB_DIR):LIB_DIR = /lib/$$TTKMusicPlayerb
target.path = $$LIB_DIR/qmmp/Input
INSTALLS += target

unix:{
    QMAKE_LIBDIR += ../../../../lib/$$TTKMusicPlayer
    LIBS += -L$$EXTRA_PREFIX/libwildmidi/lib/x86_64-linux-gnu -lWildMidi -lqmmp
}

win32:{
    QMAKE_LIBDIR += ../../../../bin/$$TTKMusicPlayer
    gcc:LIBS += -L$$EXTRA_PREFIX/libwildmidi/lib -lWildMidi.dll -lqmmp1
    msvc:LIBS += -L$$EXTRA_PREFIX/libwildmidi/lib -lWildMidi -lqmmp1
}

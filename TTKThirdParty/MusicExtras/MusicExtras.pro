#-------------------------------------------------
#
# Project created by QtCreator 2014-08-08T23:19:41
#
# =================================================
# * This file is part of the TTK Music Player project
# * Copyright (c) 2014 - 2016 Greedysky Studio
# * All rights reserved!
# * Redistribution and use of the source code or any derivative
# * works are strictly forbiden.
# =================================================

QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TTKMusicPlayer = 2.4.1.0
unix:VERSION += $$TTKMusicPlayer

win32{
    TARGET = ../../../bin/$$TTKMusicPlayer/MusicExtras
    msvc{
        LIBS += -luser32
    }
}
unix:TARGET = ../../lib/$$TTKMusicPlayer/MusicExtras
TEMPLATE = lib

QMAKE_CXXFLAGS += -std=c++11

INCLUDEPATH += ../../

win32{
    LIBS += -L../../bin/$$TTKMusicPlayer -lMusicUi
}
unix:!mac{
    LIBS += -L../../lib/$$TTKMusicPlayer -lMusicUi
}

HEADERS  += \
    musicextrasglobaldefine.h \
    ../../musicglobal.h \
    ../../musicprivate.h

include(hz2py/Hz2Py.pri)
include(kugou/KuGou.pri)
include(qiniu/QiNiu.pri)
include(qjson/QJson.pri)
include(qrencode/QRencode.pri)
include(shortcut/ShortCut.pri)

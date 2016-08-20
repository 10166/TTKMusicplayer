include(../../qmmp.pri)
EXTRA_PREFIX=../../../../../extra/gcc
unix:PLUGINS_PREFIX=../../../../lib/$$TTKMusicPlayer/qmmp
win32:{
    PLUGINS_PREFIX=../../../../../bin/$$TTKMusicPlayer/plugins
    msvc:EXTRA_PREFIX=../../../../../extra/msvc
}
INCLUDEPATH += ../../../qmmp

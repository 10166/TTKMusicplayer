include(../../qmmp.pri)
EXTRA_PREFIX=../../../../../extra/gcc
unix:PLUGINS_PREFIX=../../../../lib/qmmp
win32:{
    PLUGINS_PREFIX=../../../../../bin/plugins
    msvc:EXTRA_PREFIX=../../../../../extra/msvc
}
INCLUDEPATH += ../../../qmmp

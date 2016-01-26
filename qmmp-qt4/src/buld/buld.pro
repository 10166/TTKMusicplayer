#-------------------------------------------------
#
# Project created by QtCreator 2016-01-20T11:12:25
#
#-------------------------------------------------

QT       += core gui

include(../../qmmp.pri)
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ../../../bin/app
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
        musicplaylist.cpp \
        musicplayer.cpp

HEADERS  += mainwindow.h \
        musicplaylist.h \
        musicplayer.h

FORMS    += mainwindow.ui
LIBS += -L../../bin -lqmmp0

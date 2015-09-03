#-------------------------------------------------
#
# Project created by QtCreator 2015-09-03T10:34:57
#
#-------------------------------------------------

QT       += core network

QT       -= gui

TARGET = checker
CONFIG   += console c++11
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    daemon.cpp

HEADERS += \
    daemon.h

TEMPLATE = subdirs

CONFIG += ordered debug_and_release create_prl link_prl

CONFIG += c++11

DESTDIR = ../bin
DLLDESTDIR = ../bin/plugins

SUBDIRS += \
    yasem-core \
    yasem-mag-api \
    yasem-ini-datasource \
    yasem-desktop-gui \
    #yasem-qt-mediaplayer \
    yasem-qtav-mediaplayer \
    yasem-dunehd-api \
    yasem-samsung-smarttv-api \
    yasem-web-server \
    #TrayIcon
    yasem-vlc-mediaplayer

!android-g++: {
    SUBDIRS += yasem-web-browser
    NDK_TOOLCHAIN_PREFIX = x86
}


#CONFIG += mobility
MOBILITY = systeminfo
symbian:TARGET.CAPABILITY = ReadDeviceData

OTHER_FILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

#AvMediaPlayer.depends += QtAV
#QtAV.file = QtAV/QtAV.pro
#QtAV.DESTDIR = ../bin
#include(QtAV/root.pri)

TEMPLATE = subdirs

CONFIG += ordered debug_and_release create_prl link_prl

CONFIG += c++11

DESTDIR = ../bin
DLLDESTDIR = ../bin/plugins

SUBDIRS += \
    yasem-core

PLUGINS = \
    yasem-web-server \
    yasem-vlc-mediaplayer \
    yasem-mag-api \
    yasem-ini-datasource \
    yasem-desktop-gui \
    yasem-qt-mediaplayer \
    yasem-qtav-mediaplayer \
    yasem-dunehd-api \
    yasem-samsung-smarttv-api

for(name, PLUGINS) {
    exists($${name}) {
        message("Found submodule $${name}")
        SUBDIRS += $${name}
    }
}

!android-g++: {
    SUBDIRS += yasem-web-browser
    NDK_TOOLCHAIN_PREFIX = x86
}

MOBILITY = systeminfo
symbian:TARGET.CAPABILITY = ReadDeviceData

OTHER_FILES += \
    android/AndroidManifest.xml \
    LICENSE \
    README.md

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

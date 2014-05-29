TEMPLATE = subdirs

CONFIG += ordered debug_and_release create_prl link_prl

CONFIG += c++11

DESTDIR = ../bin
DLLDESTDIR = ../bin/plugins

if(exists(plugins-exclude.pri)) {
    include(plugins-exclude.pri)
}
else {
    PLUGINS_EXCLUDE_LIST =
}


SUBDIRS =

entries = $$files(yasem-*)
for(name, entries): {
    if(!contains(PLUGINS_EXCLUDE_LIST, $$name)) {
        exists($${name}/$${name}.pro): {
            message("Including $${name}")
            SUBDIRS += $$name
        }
    }
}

message('Subdirs:'  $$SUBDIRS)

!android-g++: {
    NDK_TOOLCHAIN_PREFIX = x86
}

MOBILITY = systeminfo
symbian:TARGET.CAPABILITY = ReadDeviceData

OTHER_FILES += \
    android/AndroidManifest.xml \
    LICENSE \
    README.md

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

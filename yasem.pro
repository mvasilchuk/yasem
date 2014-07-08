include(global.pri)

TEMPLATE = subdirs

CONFIG += debug_and_release

CONFIG += c++11

DESTDIR = ../bin
DLLDESTDIR = ../bin/plugins

if(exists(plugins-exclude.pri)) {
    include(plugins-exclude.pri)
}
else {
    PLUGINS_EXCLUDE_LIST =
}

if(contains(DEFINES, STATIC_BUILD))
{
    LIBS += -Lstatic_plugins
    CONFIG += create_prl link_prl
}

SUBDIRS = yasem-core
CLASSES =

entries = $$files(plugins/yasem-*)
for(item, entries): {
    data = $$split(item, "/")
    name = $$member(data, 1)

    if(!contains(PLUGINS_EXCLUDE_LIST, $$name)) {
        exists(plugins/$${name}/$${name}.pro): {
            message("Including $${name}")
            SUBDIRS += plugins/$$name

            if(contains(DEFINES, STATIC_BUILD))
            {
                LIBS += -lplugins/$$name
            }
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

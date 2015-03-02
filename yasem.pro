include(global.pri)

lessThan(QT_MAJOR_VERSION, 5): error("This app requires Qt 5.2+")
equals(QT_MAJOR_VERSION, 5): lessThan(QT_MINOR_VERSION, 2): error("This app requires Qt 5.2+")

TEMPLATE = subdirs

# This will enable Qml-based GUI for the app. Unstable yet!
#CONFIG += USE_QML_WIDGETS

CONFIG += debug_and_release

CONFIG += c++11

DESTDIR = ../bin
DLLDESTDIR = ../bin/plugins

if(exists(plugins-exclude.pri)) {
    include(plugins-exclude.pri)
}
else {

}

contains(CONFIG, USE_QML_WIDGETS): {
    PLUGINS_EXCLUDE_LIST += yasem-desktop-gui
} else: {
    PLUGINS_EXCLUDE_LIST += yasem-qml-gui
}

message("Plugins exclude list $${PLUGINS_EXCLUDE_LIST}")

if(contains(CONFIG, STATIC_BUILD))
{
    LIBS += -Lstatic_plugins
    CONFIG += create_prl link_prl
}

SUBDIRS = yasem-core
CLASSES =

PLUGINS_EXCLUDE_LIST += yasem-dunehd-api yasem-samsung-smarttv-api

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
    rules.cppcheck \
    README.md \
    bar-descriptor.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android



lessThan(QT_MAJOR_VERSION, 5): error("This app requires Qt 5.2+")
equals(QT_MAJOR_VERSION, 5): lessThan(QT_MINOR_VERSION, 2): error("This app requires Qt 5.2+")

TEMPLATE = subdirs

# This will enable Qml-based GUI for the app. Unstable yet!
#DEFINES += USE_QML_WIDGETS
#DEFINES += USE_REAL_TRANSPARENCY

CONFIG += debug_and_release

CONFIG += c++11 app_bundle
CONFIG += ordered

include(dir_config.pri)
include(configure.pri)

message("Project output directory: $${OUT_DIR}")
message("Plugins subdirectory: $${PLUGINS_OUT_DIR}")
message("Libs subdirectory: $${LIBS_OUT_DIR}")

#if(exists(plugins-exclude.pri)) {
#    include(plugins-exclude.pri)
#}
#else {
#}

#contains(DEFINES, USE_QML_WIDGETS): {
#    PLUGINS_EXCLUDE_LIST += yasem-desktop-gui
#} else: {
#    PLUGINS_EXCLUDE_LIST += yasem-qml-gui
#}

#message("Plugins exclude list $${PLUGINS_EXCLUDE_LIST}")

if(contains(CONFIG, STATIC_BUILD))
{
    LIBS += -Lstatic_plugins
    CONFIG += create_prl link_prl
}


SUBDIRS = \
    yasem-sdk \
    yasem-core \
    plugins/yasem-desktop-gui \
    plugins/yasem-web-browser \
    plugins/yasem-web-gui-plugin \
    plugins/yasem-qt-mediaplayer \
    plugins/yasem-ini-datasource \
    plugins/yasem-mag-api \
    plugins/yasem-dunehd-api \
    plugins/yasem-qtav-mediaplayer \
    plugins/yasem-tray-icon \
    plugins/yasem-web-server \
    plugins/yasem-google-analytics

win32: {
    SUBDIRS += plugins/yasem-windows-integration
} else:unix:!macx: {
    SUBDIRS += plugins/yasem-kde-integration
} macx: {
    SUBDIRS += plugins/yasem-osx-integration
}

#PLUGINS_EXCLUDE_LIST += \
#    yasem-samsung-smarttv-api \
#    yasem-qtav-mediaplayer \
#    # yasem-web-server # Not migrated yet
#    #yasem-dunehd-api \

#entries = $$files(plugins/*)
#for(item, entries): {
#    data = $$split(item, "/")
#    name = $$member(data, 1)
#
#    if(!contains(PLUGINS_EXCLUDE_LIST, $$name)) {
#        exists(plugins/$${name}/$${name}.pro): {
#            message("Including $${name}")
#            SUBDIRS += plugins/$$name

#            if(contains(DEFINES, STATIC_BUILD))
#            {
#                LIBS += -lplugins/$$name
#            }
#        }
#    }
#}

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
    bar-descriptor.xml \
    .qmake.conf \
    common.pri \
    configure.pri

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

CONFIG(release, debug|release) {
    write_file($$PWD/.release_dir, OUT_DIR)
    message('build dir ' $$OUT_DIR)
} else {
    write_file($$PWD/.debug_dir, OUT_DIR)
    message('build dir ' $$OUT_DIR)
}


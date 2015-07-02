
CORE_ROOT_DIR = $$top_srcdir/yasem-core
SDK_DIR=$$top_srcdir/yasem-sdk

QT += testlib
CONFIG += testcase
CONFIG += c++11

DEFINES += DEBUG_ALL

contains(DEFINES, DEBUG_ALL) {
    QMAKE_CXXFLAGS += -pedantic -Wall -Wextra
    linux-gcc: {
        QMAKE_CXXFLAGS += -ldl
    }
}
linux-gcc: {
    QMAKE_CXXFLAGS += -rdynamic
}

CONFIG += debug_and_release

include($$top_srcdir/dir_config.pri)

equals(_PRO_FILE_PWD_, $$SDK_DIR): {
    !build_pass::message('Preparing SDK')
    DESTDIR = $$OUT_DIR
} else {
    DESTDIR = $$OUT_DIR/$$PLUGINS_OUT_DIR
    INCLUDEPATH += $${SDK_DIR}/
    DEPENDPATH += $${SDK_DIR}/

    SOURCES += \
        $${SDK_DIR}/plugin.cpp \
        $${SDK_DIR}/yasemsettings.cpp

    HEADERS += \
        $${SDK_DIR}/abstractpluginobject.h \
        $${SDK_DIR}/plugin.h \
        $${SDK_DIR}/yasemsettings.h \
        $${SDK_DIR}/core.h \
        $${SDK_DIR}/statistics.h \
        $${SDK_DIR}/networkstatistics.h

    LIBS += -L$$OUT_DIR -lyasem-sdk
}


equals(TEMPLATE, app) {
    DESTDIR = $$OUT_DIR
}

TRANSLATIONS += lang/translation_ru.ts \
                lang/translation_uk.ts

VERSTR = '\\"$${VERSION}\\"'
DEFINES += MODULE_VERSION=\"$${VERSTR}\"

exists($$_PRO_FILE_PWD_/.git) {
    GIT_VERSION = $$system(git --git-dir $$_PRO_FILE_PWD_/.git --work-tree $$_PRO_FILE_PWD_ describe --always --tags)
} else {
    !build_pass::message('Not a git repository: ' $$_PRO_FILE_PWD_)
    GIT_VERSION = "-N/A-"
}

DEFINES += GIT_VERSION=\\\"$$GIT_VERSION\\\"

CONFIG(release, debug|release) {
    contains(CONFIG, STRIP) {
        # strip debug info
        # Google Breakpad is useles in this mode
        QMAKE_LFLAGS_RELEASE = -Wl,-s
    } else {
        exists( $${top_srcdir}/third_party/google-breakpad ) {
            include($${top_srcdir}/google-breakpad.pri)
        } else {
            !build_pass:message("Google Breakpad is missing. Skipping...")
        }
        #add debug info
        QMAKE_CXXFLAGS_RELEASE += -g
        QMAKE_CFLAGS_RELEASE += -g
        QMAKE_LFLAGS_RELEASE =
    }
}

include(configure.pri)

macx: {
    !contains(CONFIG, NO_BUNDLE) {
        !build_pass:message($$TARGET "will be packed into a bundle after build")
        DEFINES += USE_OSX_BUNDLE
    }

    contains(CONFIG, USE_SYS_LIBS) {
        !build_pass:message($$TARGET "will use system Qt libs")
        DEFINES += USE_SYS_LIBS
    }
}
#message('revision' $$TARGET $$GIT_VERSION)




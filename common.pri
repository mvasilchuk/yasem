
CORE_ROOT_DIR = $$top_srcdir/yasem-core
SDK_DIR=$$top_srcdir/yasem-sdk

QT += testlib
CONFIG += testcase
CONFIG += c++11

CONFIG += debug_and_release

VERSTR = '\\"$${VERSION}\\"'
DEFINES += MODULE_VERSION=\"$${VERSTR}\"

exists($$_PRO_FILE_PWD_/.git) {
    GIT_VERSION = $$system(git --git-dir $$_PRO_FILE_PWD_/.git --work-tree $$_PRO_FILE_PWD_ describe --always --tags)
} else {
    !build_pass::message('Not a git repository: ' $$_PRO_FILE_PWD_)
    GIT_VERSION = "-N/A-"
}

DEFINES += GIT_VERSION=\\\"$$GIT_VERSION\\\"

include($$top_srcdir/dir_config.pri)

equals(_PRO_FILE_PWD_, $$SDK_DIR): {
    !build_pass::message("Configuring SDK (v. $${VERSION}, rev. $${GIT_VERSION})")
    DESTDIR = $$OUT_DIR/$$SDK_OUT_DIR
} else {
    !build_pass::message("Configuring module $${TARGET} (v. $${VERSION}, rev. $${GIT_VERSION})")
    DESTDIR = $$OUT_DIR/$$PLUGINS_OUT_DIR
    INCLUDEPATH += $${SDK_DIR}/
    DEPENDPATH += $${SDK_DIR}/

    win32 {
        LIBS += -L$$OUT_DIR -lyasem-sdk0
        HEADERS += $${SDK_DIR}/plugin.h \
            $${SDK_DIR}/profilemanager.h

    } else:macx:contains(CONFIG, app_bundle) {
        LIBS += -L$$OUT_DIR/yasem.app/Contents/MacOS -lyasem-sdk
    } else {
        LIBS += -L$$OUT_DIR -lyasem-sdk
    }
}

equals(TEMPLATE, app) {
    DESTDIR = $$OUT_DIR
}

TRANSLATIONS += lang/translation_ru.ts \
                lang/translation_uk.ts

CONFIG(release, debug|release) {
    QMAKE_CXXFLAGS_RELEASE += -pedantic -Wall -Wextra -O3 -Wformat=2 -Wshadow
    !contains(CONFIG, WITH_DEBUG_INFO) {
        # strip debug info
        # Google Breakpad is useles in this mode
        QMAKE_LFLAGS_RELEASE = -Wl,-s
    } else {
        equals(_PRO_FILE_PWD_, $$SDK_DIR): {
            # Only include Google Breakpad into sdk
            exists( $${top_srcdir}/third_party/google-breakpad ) {
                include($${top_srcdir}/google-breakpad.pri)
            } else {
                !build_pass:message("Google Breakpad is missing. Skipping...")
            }
        }
        QMAKE_CXXFLAGS += -D_FORTIFY_SOURCE=2
        #add debug info
        QMAKE_CXXFLAGS_RELEASE += -g
        QMAKE_CFLAGS_RELEASE += -g
        QMAKE_LFLAGS_RELEASE =
    }
} else: {
    !build_pass:message("Building with full debug info")
    QMAKE_CXXFLAGS += -pedantic -Wall -Wextra  -g -Wformat=2 -Wshadow
    QMAKE_CXXFLAGS += -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC

    unix:greaterThan(QT_MAJOR_VERSION, 5):greaterThan(QT_MINOR_VERSION, 4) {
        # If Qt version <= 5.4 sometimes it's not available to load resources
        # from .qrc files if built with these flags.
        # Need more checks.

        ## Clang & GCC 4.8+
        QMAKE_CXXFLAGS += -fsanitize=address -fno-omit-frame-pointer
        QMAKE_CFLAGS += -fsanitize=address -fno-omit-frame-pointer
        QMAKE_LFLAGS += -fsanitize=address
        # Clang & GCC 4.9+
        QMAKE_CXXFLAGS += -fsanitize=undefined
        QMAKE_CFLAGS += -fsanitize=undefined
        QMAKE_LFLAGS += -fsanitize=undefined
    }
    contains(QMAKE_CC, gcc): {
        QMAKE_CXXFLAGS += -Wlogical-op
        # -Wconversion -Wfloat-equal
        unix: {
            QMAKE_CXXFLAGS += -ldl -rdynamic -lmcheck
        }  
    } 
}

include(configure.pri)

macx: {
    contains(CONFIG, app_bundle) {
        !build_pass:message($$TARGET "will be packed into a bundle after build")
        DEFINES += USE_OSX_BUNDLE
    }

    contains(CONFIG, USE_SYS_LIBS) {
        !build_pass:message($$TARGET "will use system Qt libs")
        DEFINES += USE_SYS_LIBS
    }
}
#message('revision' $$TARGET $$GIT_VERSION)



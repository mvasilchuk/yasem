include(global.pri)

QT += testlib
CONFIG += testcase

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

BIN_DIR = bin
DEFAULT_BIN_DIR = $$OUT_PWD/../$$BIN_DIR

contains(DEFINES, STATIC_BUILD) {
    message("Building $$TARGET as static library")
    !equals(TEMPLATE, app) {
        CONFIG += staticlib
        TEMPLATE = lib
    }

    PLUGIN_DIR = static_plugins
    DEFAULT_PLUGIN_DIR = $$OUT_PWD/../../$$BIN_DIR/$$PLUGIN_DIR
} else {
   message("Building $$TARGET as dynamic library")
    !equals(TEMPLATE, app) {
        TEMPLATE = lib
    }

    PLUGIN_DIR = plugins
    DEFAULT_PLUGIN_DIR = $$OUT_PWD/../../$$BIN_DIR/$$PLUGIN_DIR
}

TRANSLATIONS += lang/translation_ru.ts \
                lang/translation_uk.ts

VERSTR = '\\"$${VERSION}\\"'
DEFINES += MODULE_VERSION=\"$${VERSTR}\"


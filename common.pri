include(global.pri)

contains(DEFINES, DEBUG_ALL) {
    QMAKE_CXXFLAGS += -pedantic -Wall -Wextra -ldl
}

linux: {
 QMAKE_CXXFLAGS += -rdynamic
}

CONFIG += debug

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



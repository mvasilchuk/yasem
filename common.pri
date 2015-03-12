include(global.pri)

CORE_ROOT_DIR = $$top_srcdir/yasem-core

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

OUT_DIR = $$top_builddir/bin

if(contains(DEFINES, STATIC_BUILD)): {
    message("Building $$TARGET as static library")
    equals(TEMPLATE, lib) {
        CONFIG += staticlib
        PLUGIN_DIR = static_plugins
    }
} else {
    !build_pass:message("Building $$TARGET as dynamic library")
    equals(TEMPLATE, lib) {
        PLUGIN_DIR = plugins
    }
}

equals(TEMPLATE, lib) {
    DESTDIR = $$OUT_DIR/$$PLUGIN_DIR
    INCLUDEPATH += $${CORE_ROOT_DIR}/
    DEPENDPATH += $${CORE_ROOT_DIR}/

SOURCES += \
    $${CORE_ROOT_DIR}/plugin.cpp

HEADERS += \
    $${CORE_ROOT_DIR}/abstractpluginobject.h \
    $${CORE_ROOT_DIR}/plugin.h \
}

equals(TEMPLATE, app) {
    DESTDIR = $$OUT_DIR
}

TRANSLATIONS += lang/translation_ru.ts \
                lang/translation_uk.ts

VERSTR = '\\"$${VERSION}\\"'
DEFINES += MODULE_VERSION=\"$${VERSTR}\"


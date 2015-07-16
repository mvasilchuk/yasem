 
isEmpty(YASEM_OUTPUT_DIR) {
    OUT_DIR = $$top_builddir/bin
} else {
    OUT_DIR = $$YASEM_OUTPUT_DIR
} 

!macx: CONFIG += NO_BUNDLE
 
#put all plugins in bundle
contains(CONFIG, app_bundle) {
    PLUGINS_OUT_DIR=$${top_target_app}.app/Contents/Plugins
    LIBS_OUT_DIR=$${top_target_app}.app/Contents/Libs
    SDK_OUT_DIR=$${top_target_app}.app/Contents/MacOS # SDK shouldn't be there, but I have not idea how I can make it work in another way:)
} else {

    if(contains(DEFINES, STATIC_BUILD)): {
        #!build_pass:equals(TEMPLATE, lib): message("Building $$TARGET as static library")
        equals(TEMPLATE, lib) {
            CONFIG += staticlib
        }
        PLUGINS_OUT_DIR = static_plugins
    } else {
        #!build_pass:equals(TEMPLATE, lib): message("Building $$TARGET as dynamic library")
        PLUGINS_OUT_DIR = plugins
    }

    SDK_OUT_DIR =
    LIBS_OUT_DIR = libs
}


 
isEmpty(YASEM_OUTPUT_DIR) {
    OUT_DIR = $$top_builddir/bin
} else {
    OUT_DIR = $$YASEM_OUTPUT_DIR
} 

!macx: CONFIG += NO_BUNDLE
 
#put all plugins in bundle
!contains(CONFIG, NO_BUNDLE) {
    PLUGINS_OUT_DIR=$${top_target_app}.app/Contents/Plugins
    LIBS_OUT_DIR=$${top_target_app}.app/Contents/Libs
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

    LIBS_OUT_DIR = libs
}





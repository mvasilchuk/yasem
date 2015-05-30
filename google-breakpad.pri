# ***************************************************************************
# Implemented using http://blog.inventic.eu/2012/08/qt-and-google-breakpad/
# as a the reference.
#
# Get Google Breakpad here: https://code.google.com/p/google-breakpad/
#
# The required breakpad sources have been copied into /src in order to make
# integration with the application smooth and easy.
#
# To use source from Google Breakpad SVN checkout instead, change $$GOOGLE_BREAKPAD_DIR/src
# to path where it was checked out. 
#
# ***************************************************************************

GOOGLE_BREAKPAD_DIR=$${top_srcdir}/third_party/google-breakpad

HEADERS += $${top_srcdir}/yasem-core/crashhandler.h
SOURCES += $${top_srcdir}/yasem-core/crashhandler.cpp

INCLUDEPATH += $$GOOGLE_BREAKPAD_DIR
INCLUDEPATH += $$GOOGLE_BREAKPAD_DIR/src

# Windows
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/windows/string_utils-inl.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/windows/guid_string.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/windows/handler/exception_handler.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/windows/common/ipc_protocol.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/google_breakpad/common/minidump_format.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/google_breakpad/common/breakpad_types.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/windows/crash_generation/crash_generation_client.h
win32:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/scoped_ptr.h
win32:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/windows/handler/exception_handler.cc
win32:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/windows/string_utils.cc
win32:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/windows/guid_string.cc
win32:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/windows/crash_generation/crash_generation_client.cc

# Linux
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/cpu_set.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/proc_cpuinfo_reader.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/handler/exception_handler.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/crash_generation/crash_generation_client.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/handler/minidump_descriptor.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/minidump_writer.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/line_reader.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/linux_dumper.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/linux_ptrace_dumper.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/directory_reader.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/linux/log/log.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/minidump_file_writer-inl.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/client/minidump_file_writer.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/linux_libc_support.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/eintr_wrapper.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/ignore_ret.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/file_id.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/memory_mapped_file.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/safe_readlink.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/guid_creator.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/elfutils.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/elfutils-inl.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/linux/elf_gnu_compat.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/using_std_string.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/memory.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/basictypes.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/memory_range.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/string_conversion.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/convert_UTF.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/google_breakpad/common/minidump_format.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/google_breakpad/common/minidump_size.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/google_breakpad/common/breakpad_types.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/common/scoped_ptr.h
unix:HEADERS += $$GOOGLE_BREAKPAD_DIR/src/third_party/lss/linux_syscall_support.h
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/crash_generation/crash_generation_client.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/handler/exception_handler.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/handler/minidump_descriptor.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/minidump_writer.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/linux_dumper.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/minidump_writer/linux_ptrace_dumper.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/log/log.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/minidump_file_writer.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/linux_libc_support.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/file_id.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/memory_mapped_file.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/safe_readlink.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/guid_creator.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/linux/elfutils.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/string_conversion.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/common/convert_UTF.c

unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/microdump_writer/microdump_writer.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/dump_writer_common/ucontext_reader.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/dump_writer_common/seccomp_unwinder.cc
unix:SOURCES += $$GOOGLE_BREAKPAD_DIR/src/client/linux/dump_writer_common/thread_info.cc
#breakpad app need debug info inside binaries
unix:QMAKE_CXXFLAGS+=-g 

DEFINES += USE_BREAKPAD

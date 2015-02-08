# YASEM

Yasem (Yet Another Stb EMulator) is a IPTV Set-Top-Box emulator for desktop platforms. It may be used to load IPTV portals to watch internet TV or for developing such portals using build-in developer tools from WebKit (like in Chrome/Chromium).

**YASEM is free software licensed under the term of GPL v2. Some of its components may be licensed under different terms.**

#### How to compile
    
    git clone https://github.com/mvasilchuk/yasem.git
    cd yasem
    git submodule update --init --recursive
    git submodule foreach --recursive git submodule update --init 
    qmake
    make

to run

    cd bin
    ./yasem
    
If you cannot build the App, you may try to run the last successful automated debug build for Linux (x86_64; Qt 5.3 is needed) from [archive](http://jenkins.mvas.eu/job/yasem/default/lastBuild/artifact/bin/*zip*/bin.zip).

#### Requirements

* Qt 5 (5.2.1+ is recommended) with Webkit support
* C++11 compatible compiler (tested with GCC and Clang)
* Patched version of [QtAV](https://github.com/wang-bin/QtAV) (included into [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer) submodule). See [QtAV requirements](https://github.com/wang-bin/QtAV#requirements).

##### Optional
* cifs-utils & smbtree - for SAMBA support
* sudo with no-password option for "mount" command - to mount network shares (SAMBA).

_WARNING_: Some functionality may not be available with Qt version less than 5.2

### Installation on different OS

### Ubuntu

    sudo apt-get install libavutil-dev libavformat-dev libavcodec-dev libswscale-dev portaudio19-dev libopenal-dev libavresample-dev

then follow "How to compile" block.

### Arch

    yaourt -S yasem-git

### Windows

1. Download [Qt5](http://www.qt.io/download-open-source) and install Qt, QtCreator and MinGW (for example into C:\Qt).
2. Download [libav binaries](http://builds.libav.org/windows/release-gpl/) and unpack. In this example archive is unpacked into C:\libav-x86_64-w64-mingw32-11.1.
3. Download and install Git if you haven't done this yet.
4. Download yasem sources using Git (for example into C:\yasem).
5. Open QtCreator, open yasem project then open **Projects** page on a sidebar and in **Build** configuration set **Build environment** variables:

    CPLUS\_INCLUDE_PATH = C:\libav-i686-w64-mingw32-11.1\usr\include
    
    C\_INCLUDE_PATH = C:\libav-i686-w64-mingw32-11.1\usr\include
    
    LIBRARY\_PATH = C:\libav-i686-w64-mingw32-11.1\usr\lib

_(change paths to yours)_

Build the project

Now you have either to add paths to your Qt binaries (i.e. C:\Qt\5.4\mingw491\_32\bin ), MinGW binaries (C:\\Qt\\Tools\\MinGW\\bin), libav binaries (C:\\libav\-i686\-w64\-mingw32\-11.1\\usr\\bin) to **PATH** environment variable, or copy required DLLs from that folders (you have to use this method also if you want to distribute the app). The simplest way to do that is to use [Dependency Walker](http://www.dependencywalker.com/). After you build the application in your build folder you'll see bin/ directory with yasem.exe, Qt5AV.dll, Qt5Widgets.dll and folders gui/ and plugins/ inside it. To make it easier to find all dependencies copy all yasem\-\*.dll files from plugins/ into parent folder (bin/) and run Dependency Walker on yasem.exe and DLLs (except the ones you'll copy from another folders). In general you need to copy all DLLs from libav bin/ folder (C:\\libav\-x86\\_64\-w64\-mingw32\-11.1\\usr\\bin),
most of Qt5*.dll from Qt binaries folder (C:\\Qt\\5.4\\mingw49_32\\bin; see if they are debug or release) and some MinGW dependencies.
After you've copied all required dependencies you may remove yasem\-*.dll from yasem bin/ folder, because thay are already in bin/plugins/ folder.

#### Configuration

There is no GUI for application configuring, so, if you need to change settings, go to ~/.config/yasem.

You can use some of command line options:

    --fullscreen - to run App in fullscreen mode
    --developer-tools - to open developer tools on start
    
You also may open developer tools anytime from context menu (keep in mind: in current implementation some of portals may override right button click, so you may need to open tools before such portal loading).

- - -

> Copyright &copy; 2013-2014 Maxim Vasilchuk mvasilchuk@gmail.com


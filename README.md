# YASEM

Yasem (Yet Another Stb EMulator) is an IPTV Set-Top-Box emulator for desktop platforms. It may be used to load IPTV portals to watch internet TV or for developing such portals using build-in developer tools from WebKit (like in Chrome/Chromium).

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

You may also change output directory by passing variable YASEM_OUTPUT_DIR to qmake

    qmake YASEM_OUTPUT_DIR=/destination/directory

#### Requirements

* Qt 5 (5.2.1+ is recommended) with Webkit support;
* C++11 compatible compiler (tested with GCC and Clang);
* Patched version of [QtAV](https://github.com/wang-bin/QtAV) (included into [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer) submodule). See [QtAV requirements](https://github.com/wang-bin/QtAV#requirements).

##### Optional
* cifs-utils & smbtree - for SAMBA support;
* sudo with no-password option for "mount" command - to mount network shares (SAMBA).

_WARNING_: Some functionality may not be available with Qt version less than 5.2

### Installation on different OS

### Ubuntu

    sudo apt-get install libavutil-dev libavformat-dev libavcodec-dev libswscale-dev portaudio19-dev libopenal-dev libavresample-dev libva-dev libxv-dev libass-dev

then follow "How to compile" block.

### Arch

    yaourt -S yasem-git

### Windows

1. Download and install the latest version of [Qt](http://www.qt.io/download-open-source/) and QtCreator.
2. Download yasem from this repository and open it in QtCreator.
3. Download [libav](https://libav.org/download.html) or [ffmpeg](https://www.ffmpeg.org/download.html).
4. Read QtAV's [How to build/Setup The Environment](https://github.com/wang-bin/QtAV/wiki/Build-QtAV#1-setup-the-environment) manual and configure build environment in QtCreator.
5. Build and run yasem.
 
### OS X

1. Make sure you have clang installed.
2. Get and install [Qt 5](https://www.qt.io/download-open-source/).
3. Get yasem sources.
4. 
Since QtAV in OS X is not supported by YASEM yet, you can build YASEM with Qt player only. Create a file plugins-exclude.pri with content:

    PLUGINS\_EXCLUDE\_LIST += yasem-qtav-mediaplayer
    
in sources root then run

    qmake
    make
    
That should be enough. If video can't be played make sure you have all required codecs installed.

By default all app files are packed into a bundle. If you want to get all files separately (like in other OS) add option CONFIG+=NO_BUNDLE to qmake.

#### Configuration

There is a simple configuration dialog, but in most cases you'd better change configuration files in ~/.config/yasem (C:/Users/__User__/AppData/Roaming/yasem on Windows).

#### Portable version

To make YASEM portable just create **config** directory next to yasem's binary. All settings and profiles will be stored there.

#### Command line flags

You can use some of command line options:

    --fullscreen - to run App in fullscreen mode.
    --developer-tools - to open developer tools on start.
    --verbose - Print extra log information in Release mode (only Linux and OS X).
    --log=<file name> - Write log in a file. If you don't see a log file, make sure you have write access to a file and/or directory.
    
You also may open developer tools anytime from a menu.

#### DONATE

**Bitcoin**: 1J1r4Ed5v76ym2o52bfY9MZ9XzTuDn4Yjo

- - -

> Copyright &copy; 2013-2015 Maxim Vasilchuk mvasilchuk@gmail.com


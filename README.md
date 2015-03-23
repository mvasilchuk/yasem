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

#### Configuration

There is no GUI for application configuring, so, if you need to change settings, go to ~/.config/yasem.

You can use some of command line options:

    --fullscreen - to run App in fullscreen mode
    --developer-tools - to open developer tools on start
    
You also may open developer tools anytime from a menu.

- - -

> Copyright &copy; 2013-2015 Maxim Vasilchuk mvasilchuk@gmail.com


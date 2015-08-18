# YASEM

Yasem (Yet Another Stb EMulator) is an IPTV Set-Top-Box emulator for desktop platforms. It may be used to load IPTV portals to watch internet TV or for developing such portals using build-in developer tools from WebKit (like in Chrome/Chromium).

**YASEM is free software licensed under the term of GPL v2. Some of its components may be licensed under different terms.**

## Plugins

Yasem distributed with plugins (by default they all will be downloaded and built):

### Main plugins

* [yasem-core](https://github.com/mvasilchuk/yasem-core) - Core module (executable file).
* [yasem-sdk](https://github.com/mvasilchuk/yasem-sdk) - SDK library. Both core and libraries are statically linked with SDK.
* [yasem-desktop-gui](https://github.com/mvasilchuk/yasem-desktop-gui) - GUI for desktop OS.
* [yasem-web-browser](https://github.com/mvasilchuk/yasem-web-browser) - Web browser component.
* [yasem-ini-datasource](https://github.com/mvasilchuk/yasem-ini-datasource) - A simple datasource plugin that stores data in *ini* files (used only by some plugins).
* [yasem-qt-mediaplayer](https://github.com/mvasilchuk/yasem-qt-mediaplayer) - A QMediaPlayer-based player for Yasem. Used by default.
* [yasem-web-gui-plugin](https://github.com/mvasilchuk/yasem-web-gui-plugin) - A simple html/javascript based UI.
* [yasem-mag-api](https://github.com/mvasilchuk/yasem-mag-api) - Implementation of JavaScript API of MAG-250/AuraHD STBs (and other MAG-XYZ STBs).
* [yasem-dunehd-api](https://github.com/mvasilchuk/yasem-dunehd-api) - Implementation of JavaScript API of DuneHD STBs. Not very useful yet.

### Optional plugins
* [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer) - QtAV-based player.
* [yasem-web-server](https://github.com/mvasilchuk/yasem-web-server) - A simple web server that can be used to load local files via http://. 
* [yasem-tray-icon](https://github.com/mvasilchuk/yasem-tray-icon) - A simple plugin that shows an icon in system tray.
* [yasem-google-analytics](https://github.com/mvasilchuk/yasem-google-analytics) - Google Analytics plugin that reports some information of a system.

## How to compile
    
    git clone --recursive https://github.com/mvasilchuk/yasem.git
    cd yasem
    qmake
    make

to run

    cd bin
    ./yasem

You may also change output directory by passing variable YASEM_OUTPUT_DIR to qmake

    qmake YASEM_OUTPUT_DIR=/destination/directory
    
It may be difficult for some users to build *yasem-qtav-mediaplayer* plugin (especially on Windows), because it requires to get *libav* or *ffmpeg* sources, *QtAV* sources and some work to copy all required libaries into Yasem output folder. In this case you can make yasem without QtAV media player plugin. To do that open yasem.pro, find variable *SUBDIRS* and remove line *plugins/yasem-qtav-mediaplayer* from the list of subprojects.

## Requirements

* Qt 5.2+ (5.5 is recommended) with Webkit support;
* C++11 compatible compiler (tested with GCC and Clang);

### Plugin requirements

* [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer)
  - [QtAV](https://github.com/wang-bin/QtAV) (patched version, included into [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer) submodule). See [QtAV requirements](https://github.com/wang-bin/QtAV#requirements).
* [yasem-mag-api](https://github.com/mvasilchuk/yasem-mag-api)
  - [qca](http://delta.affinix.com/qca/) for qt5 (optional) - software remote controls support (compatible with MAG 250).

### Optional requirements

Linux/*nix only:
* cifs-utils & smbtree - for SAMBA support;
* sudo with no-password option for "mount" command - to mount network shares (SAMBA);

_WARNING_: Some functionality may not be available with Qt version less than 5.5

## Installation on different OS

### Ubuntu

    sudo apt-get install libavutil-dev libavformat-dev libavcodec-dev libswscale-dev portaudio19-dev libopenal-dev libavresample-dev libva-dev libxv-dev libass-dev

then follow "How to compile" block.

### Arch

Install yasem from [AUR](https://aur4.archlinux.org/packages/yasem-git):

    yaourt -S yasem-git

### Windows

1. Download and install the latest version of [Qt](http://www.qt.io/download-open-source/) and QtCreator.
2. Download [yasem](https://github.com/mvasilchuk/yasem.git) from this repository and open it in QtCreator.
3. 
  - If you want to build Yasem with QtAV media player:
    * Download [libav](https://libav.org/download.html) or [ffmpeg](https://www.ffmpeg.org/download.html).
    * Read QtAV's [How to build/Setup The Environment](https://github.com/wang-bin/QtAV/wiki/Build-QtAV#1-setup-the-environment) manual and configure build environment in QtCreator.
  - If not, open yasem.pro, find variable *SUBDIRS* and remove line *plugins/yasem-qtav-mediaplayer* from the list of subprojects.
4. Build and run yasem.
 
### OS X

1. Make sure you have clang installed.
2. Get and install [Qt 5](https://www.qt.io/download-open-source/).
3. Get yasem sources.
4. Since QtAV in OS X is not supported by YASEM yet, you can build YASEM with Qt player only. To do that open yasem.pro, find variable *SUBDIRS* and remove line *plugins/yasem-qtav-mediaplayer* from the list of subprojects.
5. 5. Run:

    qmake
    make
    
That should be enough. If video can't be played make sure you have all required codecs installed.

By default all app files are packed into a bundle. If you want to get all files separately (like in other OS) add option *CONFIG-=app_bundle* to qmake.

## Configuration

There is a simple configuration dialog, but in most cases you'd better change configuration files in ~/.config/yasem (C:/Users/__User__/AppData/Roaming/yasem on Windows).

## Portable version

To make YASEM portable just create **config** directory next to yasem's binary. All settings and profiles will be stored there.

## Command line flags

You can use some of command line options:

    --fullscreen - to run App in fullscreen mode.
    --developer-tools - to open developer tools on start.
    --verbose - Print extra log information in Release mode (only Linux and OS X).
    --log=<file name> - Write log in a file. If you don't see a log file, make sure you have write access to a file and/or directory.
    
You also may open developer tools anytime from yasem's main menu.

## Known issues

## DONATE

**Bitcoin**: 1J1r4Ed5v76ym2o52bfY9MZ9XzTuDn4Yjo

- - -

> Copyright &copy; 2013-2015 Maxim Vasilchuk mvasilchuk@gmail.com


# YASEM

Yasem (Yet Another Stb EMulator) is a IPTV Set-Top-Box emulator for desktop platforms.

**YASEM is free software licensed under the term of LGPL v2.1. Some of its components may be licensed under different terms.**

#### How to compile
    
    git clone git@github.com:mvasilchuk/yasem.git
    cd yasem
    git submodule update --init --recursive
    git submodule foreach --recursive git fetch
    git submodule foreach git merge origin master
    qmake
    make

to run

    cd bin
    ./yasem


#### Requirements

* Qt 5 (5.2.1+ is recommended) with Webkit support
* C++11 compatible compiler (tested with GCC and Clang)
* Patched version of [QtAV](https://github.com/wang-bin/QtAV) (included into [yasem-qtav-mediaplayer](https://github.com/mvasilchuk/yasem-qtav-mediaplayer) submodule). See [QtAV requirements](https://github.com/wang-bin/QtAV#requirements).

_WARNING_: Some functionality may not be available with Qt version less than 5.2

- - -

> Copyright &copy; 2013-2014 Maxim Vasilchuk mvasilchuk@gmail.com


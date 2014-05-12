# YASEM

Yasem (Yet Another Stb EMulator) is a Set-Top-Box emulator for desktop platforms. 

**YASEM is free software licensed under the term of LGPL v2.1. Some of its components may be licensed under different terms.**

#### How to compile
    
    git clone git@github.com:mvasilchuk/yasem.git
    cd yasem
    git submodule update --init --recursive
    git submodule foreach --recursive git fetch
    git submodule foreach git merge origin master


#### Requirements

* Qt 5 (5.2.1+ is recommended)
* C++11 compatible compiler (tested with GCC and Clang)

For using QtAV as a media player see [QtAV requirements](https://github.com/wang-bin/QtAV#requirements).

_WARNING_: Some functionality may not be available with Qt version less than 5.2

- - -

> Copyright &copy; Maxim Vasilchuk mvasilchuk@gmail.com

> 2013-2014




#!/bin/bash

./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make install

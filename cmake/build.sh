#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export CPPFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

./bootstrap --prefix=$PREFIX -- -DCMAKE_USE_OPENSSL=ON
make
make install

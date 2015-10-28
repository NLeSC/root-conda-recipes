#!/bin/bash

set -e

export LDFLAGS="-L${PREFIX}/lib -lncurses"

./configure --prefix=$PREFIX
    make 
    make install

rm -rf $PREFIX/share/man
rm -rf $PREFIX/share/readline

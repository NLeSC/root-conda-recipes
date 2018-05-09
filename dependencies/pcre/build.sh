#!/bin/bash

./configure --enable-utf8 -enable-unicode-properties --prefix=$PREFIX
make
make install

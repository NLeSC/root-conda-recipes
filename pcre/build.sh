#!/bin/bash

./configure --enable-utf8 --prefix=$PREFIX
make
make install

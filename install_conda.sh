#!/bin/bash

if [ ! -f Miniconda-latest-Linux-x86_64.sh ]; then
        wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
fi
bash Miniconda-latest-Linux-x86_64.sh -b -p conda
. conda/bin/activate root
conda update --yes -q conda
conda update --yes --all
conda config --add channels https://conda.binstar.org/NLeSC
conda config --add channels https://conda.binstar.org/auto
conda config --add channels defaults
conda config --set show_channel_urls yes

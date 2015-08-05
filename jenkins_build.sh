#!/bin/bash

if [ ! -f Miniconda-latest-Linux-x86_64.sh ]; then
        wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
fi
bash Miniconda-latest-Linux-x86_64.sh -b -p conda
. conda/bin/activate root
#echo $PATH
conda update --yes -q conda
conda update --yes --all
conda config --add channels https://conda.binstar.org/remenska
conda config --add channels https://conda.binstar.org/auto
#conda config --add channels https://conda.binstar.org/ostrokach #new
#conda config --add channels https://conda.binstar.org/richli
#conda config --add channels https://conda.binstar.org/asmeurer
#conda config --add channels https://conda.binstar.org/mhworth #new 
conda config --add channels defaults
#conda config --add channels https://conda.binstar.org/jsw-fnal
#conda config --add channels https://conda.binstar.org/serge-sans-paille
conda install --yes -q conda-build
conda install --yes jinja2
#conda install --yes glibc=2.19 gcc=4.8.4
conda install --yes conda-server
conda install --yes anaconda-client
#conda install --y serge-sans-paille pythran
# if [ $ROOT = 5 && $PYTHON = 3 ]; then
#    PY=py34
# elif [ $ROOT = 6 && $PYTHON = 3 ]; then
#    PY=py23
# else
#    PY=""
# fi

#conda build --yes -q root$ROOT$PY

CONDA_PY=$CONDA_PY conda build ./root$ROOT || { echo 'Compiling ROOT failed.' ; exit 1;}
binstar upload conda/conda-bld/*/root-$ROOT*.tar.bz2 --force
#binstar -t $BINSTAR_TOKEN upload --force -u omnia -p yank-dev conda/conda-bld/*/root-$ROOT*.tar.bz2
#binstar upload /data/workspace/root-mirror/PYTHON/2/ROOT/5/conda/conda-bld/linux-64/root-5.34.32-py27_gcc4.8.tar.bz2
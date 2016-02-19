#!/bin/sh

ANACONDA_TOKEN=$1

if [ $# -eq 0 ]; then
    echo "No token supplied for Anaconda upload."
else
    cd /code
    CONDA_ENVS_PATH=$PWD/envs CONDA_BLD_PATH=$PWD/conda-bld conda build CONDA_PY=$CONDA_PY ./root$ROOT
    retval=$?
    if [ $retval -eq 0 ]; then
        echo "Uploading to test channel...."
        chown -R $MYUID .
        anaconda -t $ANACONDA_TOKEN upload $PWD/conda-bld/*/root-$ROOT*.tar.bz2 --force --channel test
    else
    echo "Building failed."
    fi
fi

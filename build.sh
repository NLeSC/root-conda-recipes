#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No token supplied for Anaconda upload."
else
    ANACONDA_TOKEN=$1
    cd /code
    CONDA_ENVS_PATH=$PWD/envs CONDA_BLD_PATH=$PWD/conda-bld conda build CONDA_PY=$PY ./root$ROOT
    retval=$?
    if [ $retval -eq 0 ]; then
        echo "Uploading to test channel...."
        chown -R $MYUID .
        anaconda -t $ANACONDA_TOKEN upload $PWD/conda-bld/*/root-$ROOT*.tar.bz2 --force --channel test
    else
    echo "Building failed."
    fi
fi

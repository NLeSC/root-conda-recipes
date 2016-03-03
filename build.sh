#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No token supplied for Anaconda upload."
else
    ANACONDA_TOKEN=$1
    cd /code
    CONDA_ENVS_PATH=$PWD/envs CONDA_BLD_PATH=$PWD/conda-bld CONDA_PY=$PY conda build ./root$ROOT
    retval=$?
    if [ $retval -eq 0 ]; then
        echo "Uploading to Anaconda cloud, test channel...."
        chown -R $MYUID .
        anaconda -v -t $ANACONDA_TOKEN upload $PWD/conda-bld/*/root-$ROOT*.tar.bz2 --force --channel test
    else
        echo "Building failed."
        exit $retval
    fi
fi

#!/bin/sh

cd /code
CONDA_ENVS_PATH=$PWD/envs CONDA_BLD_PATH=$PWD/conda-bld conda build CONDA_PY=$CONDA_PY ./root$ROOT should_upload=$?
chown -R $MYUID .
if [ "$build_result" -eq 0 ]; then
  if [ -n "$1" ]
    then
      echo "Going to upload the binary..."
      anaconda upload $PWD/conda-bld/*/root-$ROOT*.tar.bz2
    else
      echo "Not uploading binary..."
  fi
else
    echo FAIL
fi

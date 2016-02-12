#!/bin/bash
source ${PREFIX}/bin/thisroot.sh
if [ -n "${CONDA_ENV_PATH}" ]; then
     source ${CONDA_ENV_PATH}/bin/thisroot.sh # in case already active in some environment
fi

#echo "Postlink: ROOT has been sourced. Environment settings are ready. "
#echo "ROOTSYS="${ROOTSYS}

if [ -z "${ROOTSYS}" ]; then
     echo "export ROOTSYS=$PREFIX"
     echo "export PYTHONPATH=$PREFIX/lib"
fi

if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi

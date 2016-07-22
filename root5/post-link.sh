#!/bin/bash
source $(which thisroot.sh)
if [ -n "${CONDA_PREFIX}" ]; then
     source ${CONDA_PREFIX}/bin/thisroot.sh # in case already active in some environment
fi

echo "Postlink: ROOT has been sourced. Environment settings are ready. "
echo "ROOTSYS="${ROOTSYS}

if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi

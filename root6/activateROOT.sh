#!/bin/bash
# cd is necessary in zsh
cd ${CONDA_PREFIX}
source ${CONDA_PREFIX}/bin/thisroot.sh
cd -

echo "Activate: ROOT has been sourced. Environment settings are ready. "
echo "ROOTSYS="${ROOTSYS}

if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi



#!/bin/bash
source $PREFIX/bin/thisroot.sh

echo "Postlink: ROOT has been sourced. Environment settings are ready. "
echo "ROOTSYS="${ROOTSYS}

if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi

#!/bin/bash
source $PREFIX/bin/thisroot.sh

#echo "Postlink: ROOT has been sourced. Environment settings are ready. "
#echo "ROOTSYS="${ROOTSYS}
if [ -z "${ROOTSYS}" ]; then
     echo "Please set the following environment variables:"
     echo "export ROOTSYS=$PREFIX"
     echo "export PYTHONPATH=$PREFIX/lib"
fi

if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi

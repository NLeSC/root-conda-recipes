#!/bin/bash
echo "Deactivate:Unsetting ROOT environment variables.."

if [ -n "${ROOTSYS}" ]; then
     unset ROOTSYS
fi

if [ -n "${PYTHONPATH}" ]; then
     unset PYTHONPATH
fi


if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi


#!/bin/bash
set -x

# ROOTSYS=$(root-config --prefix)
# pushd $ROOTSYS
# source bin/thisroot.sh
# popd
# #$PYTHON -c "import ROOT"
# echo $ROOTSYS

$PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.

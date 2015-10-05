#!/bin/bash
source $PREFIX/bin/thisroot.sh

echo "ROOT has been sourced. Environment settings are ready. "
echo "ROOTSYS="${ROOTSYS}

# not needed for conda to work with ROOT
if [ -n "${LD_LIBRARY_PATH}" ]; then
     unset LD_LIBRARY_PATH
fi


if [ -n "${DYLD_LIBRARY_PATH}" ]; then
     unset DYLD_LIBRARY_PATH
fi



#mkdir -p $PREFIX/etc/conda/activate.d
#mkdir -p $PREFIX/etc/conda/deactivate.d

#cp ${RECIPE_DIR}/activateROOT.sh $PREFIX/etc/conda/activate.d
#cp ${RECIPE_DIR}/deactivateROOT.sh $PREFIX/etc/conda/deactivate.d



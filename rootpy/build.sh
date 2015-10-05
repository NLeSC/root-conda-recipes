#!/bin/bash
set -x
echo $PREFIX
export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

ARCH="$(uname 2>/dev/null)"

# ROOTSYS=$(root-config --prefix)
# pushd $ROOTSYS
# source bin/thisroot.sh
# popd
# #$PYTHON -c "import ROOT"
# echo $ROOTSYS

LinuxInstallation() {

  $PYTHON setup.py install || return 1;
  return 0;
  
}

MacInstallation() {
    export CPPFLAGS="-I${PREFIX}/include"
    export CPATH="${PREFIX}/include"
    export LIBPATH="${PREFIX}/lib"
    export CMAKE_OSX_DEPLOYMENT_TARGET=10.8
    export MACOSX_DEPLOYMENT_TARGET=10.8
    export DYLD_FALLBACK_LIBRARY_PATH="${PREFIX}/lib"
    #export CC=clang
    export CFLAGS="${CFLAGS} -D_DARWIN_SOURCE"
    $PYTHON setup.py install || return 1;
    return 0;
}
    
    
case ${ARCH} in
    'Linux')
        LinuxInstallation || exit 1;
        ;;
    'Darwin')
        MacInstallation || exit 1;
        ;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
        ;;
esac




# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.

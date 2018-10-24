#!/bin/bash

mkdir -vp ${PREFIX}/bin;
echo $PREFIX
export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

echo 'gcc info'
gcc -v
which gcc
echo 'python info'
python --version
which python

ARCH="$(uname 2>/dev/null)"

mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d

# Scripts for environment variables
cp ${RECIPE_DIR}/scripts/activateROOT.sh $PREFIX/etc/conda/activate.d/
cp ${RECIPE_DIR}/scripts/deactivateROOT.sh $PREFIX/etc/conda/deactivate.d/


echo "Conda-Travis environment info:"
echo $PKG_NAME
echo $PKG_VERSION
echo $PKG_BUILD_STRING
echo $TRAVIS_OS_NAME
echo $PKG_BUILDNUM


LinuxInstallation() {

    mkdir workdir_$PKG_VERSION
    cd workdir_$PKG_VERSION

    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -Dbuiltin_afterimage=OFF \
        -Dbuiltin_ftgl=OFF \
        -Dbuiltin_fftw3=ON \
        -Dbuiltin_gl2ps=OFF \
        -Dbuiltin_glew=OFF \
        -Dbuiltin_gsl=ON \
        -Dbuiltin_unuran=ON \
        -Dbuiltin_vc=ON \
        -Dbuiltin_vdt=ON \
        -Dbuiltin_veccore=ON \
        -Dbuiltin_xrootd=ON \
        -Dbuiltin_tbb=ON \
        -Dall=ON \
        -Dcxx14=ON \
        -Dfail-on-missing=ON \
        -Dgnuinstall=ON \
        -Drpath=ON \
        -Dopengl=OFF \
        -Dbonjour=OFF \
        -Darrow=OFF \
        -Dcastor=OFF \
        -Dchirp=OFF \
        -Dgeocad=OFF \
        -Dglite=OFF \
        -Dhdfs=OFF \
        -Dmonalisa=OFF \
        -Doracle=OFF \
        -Dpythia6=OFF \
        -Dpythia8=OFF \
        -Drfio=OFF \
        -Dsapdb=OFF \
        -Dmysql=OFF \
        -Dodbc=OFF \
        -Dgfal=OFF \
        -Ddcache=OFF \
        -Dr=OFF \
        -Ddavix=OFF \
        -Dtesting=ON \
        -Dminuit2=ON \
        -Droofit=ON \
    || return 1;
    make -j4 || return 1;
    make install || return 1;

    return 0;
}

MacInstallation() {
    export CPPFLAGS="-I${PREFIX}/include"
    export CPATH="${PREFIX}/include"
    export LIBPATH="${PREFIX}/lib"
    export CMAKE_OSX_DEPLOYMENT_TARGET=10.13
    export MACOSX_DEPLOYMENT_TARGET=10.13
    export DYLD_FALLBACK_LIBRARY_PATH="${PREFIX}/lib"
    chmod +x configure;
    #export CC=clang
    export CFLAGS="${CFLAGS} -D_DARWIN_SOURCE"
    export CC=clang
    export CXX=clang++
    export LD=clang++
    make distclean;

    mkdir workdir
    cd workdir

    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -Dbuiltin_llvm=ON \
    -Dbuiltin_zlib=ON \
    -Dbuiltin-lzma=ON \
    -Dcxx11=ON \
    -Drpath=ON \
    -Droofit=ON \
    -Dopengl=ON \
    -Dgviz=ON \
    -Dasimage=ON \
    -Dbuiltin_afterimage=ON \
    -Dpython=ON \
    || return 1;
    make -j2 || return 1;
    make install || return 1;

    return 0;
}


case ${ARCH} in
    'Linux')
        echo "Building for Linux"
        LinuxInstallation || exit 1;
    ;;
    'Darwin')
        echo "Building for OSX"
        MacInstallation || exit 1;
    ;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
    ;;
esac
#!/bin/bash

mkdir -vp ${PREFIX}/bin;
ln -s $PREFIX/lib $PREFIX/lib64

echo $PREFIX
export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"
# export LDFLAGS="-B${PREFIX}/lib/ -Wl,-rpath-link,${PREFIX}/lib"
echo 'gcc version'
gcc -v
# -Wl,-dynamic-linker,/path/to/alternate/ld-linux.so.2
# LDFLAGS = -B/usr/i386-mylib-linux/lib/ -Wl,-rpath-link,/usr/i386-mylib-linux/lib

ARCH="$(uname 2>/dev/null)"

#export TMPDIR=`conda info --root`/tmpdir

#mkdir -p $PREFIX/etc/conda/activate.d
#mkdir -p $PREFIX/etc/conda/deactivate.d

#cp ${RECIPE_DIR}/activateROOT.sh $PREFIX/etc/conda/activate.d
#cp ${RECIPE_DIR}/deactivateROOT.sh $PREFIX/etc/conda/deactivate.d


LinuxInstallation() {
# Build dependencies:
# - libXpm-devel
# - libX11-devel


#chmod +x configure;

make distclean;

mkdir workdir
cd workdir

cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
|| return 1;


make -j2 || return 1;
make install || return 1;

cp -r $PREFIX/lib64/* $PREFIX/lib
rm $PREFIX/lib64

return 0;
}

MacInstallation() {
export CPPFLAGS="-I${PREFIX}/include"
export CPATH="${PREFIX}/include"
export LIBPATH="${PREFIX}/lib"
export CMAKE_OSX_DEPLOYMENT_TARGET=10.10
export MACOSX_DEPLOYMENT_TARGET=10.10
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
|| return 1;



make -j2 || return 1;
make install || return 1;

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


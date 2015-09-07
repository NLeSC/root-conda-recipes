#!/bin/bash

mkdir -vp ${PREFIX}/bin;
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


LinuxInstallation() {
    # Build dependencies:
    # - libXpm-devel
    # - libX11-devel

    
    chmod +x configure;
    
    make distclean;

  #  ./configure \
  #      ${ARCH,,*}x8664gcc \
  #      --minimal \
  #      --enable-x11 \
  #      --enable-python \
  #      --enable-xml \
  #      --with-python-incdir=`python3.4-config --exec-prefix`/include/python3.4m \
  #      --with-python-libdir=`python3.4-config --exec-prefix`/lib \
  #      --etcdir=${PREFIX}/etc/root \
  #      --prefix=${PREFIX} \
   #      || return 1;
        #--enable-roofit \
        # --enable-x11 \
        #--enable-xml \
        # --prefix=${PREFIX} \
        #--enable-rpath \        
        # --enable-soversion \
        #--enable-qt \
        #--enable-minuit2 \
        #--enable-shared \
        #--enable-sqlite \
        #--enable-ssl \
        #-	-with-qt-incdir=${PREFIX}/include/ \
        #--with-qt-libdir=${PREFIX}/lib/ \
        #--with-ssl-incdir=${PREFIX}/include/openssl/ \
        #--with-ssl-libdir=${PREFIX}/lib/ \
        #--with-ssl-shared=yes \
        #--with-sqlite-incdir=${PREFIX}/include/  \
        #--with-sqlite-libdir=${PREFIX}/lib/  \
        #--with-python-incdir=${PREFIX}/include/python${PY_VER}/ \
        #--with-python-libdir=${PREFIX}/lib/ \
        #--with-x11-libdir=${PREFIX}/lib/ \
        
    mkdir workdir
    cd workdir

    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -Dbuiltin_pcre=ON \
    -Dbuiltin_llvm=ON \
    -Dbuiltin-lzma=ON \
    -Dbuiltin_zlib=ON \
    -Dbuiltin_freetype=ON \
    -Dcxx11=ON \
    -Drpath=ON \
    -Droofit=ON \
    -Dopengl=OFF \
    -Dgviz=OFF \
    || return 1;     
    #-DCMAKE_C_COMPILER=$PREFIX/bin/gcc \
    #-DCMAKE_CXX_COMPILER=$PREFIX/bin/c++ \
   
    
    #-Dbuiltin_gsl=ON \

    make || return 1;
    make install || return 1;

    return 0;
}

MacInstallation() {
    export CPPFLAGS=“-I${PREFIX}/include”
    export CPATH=“${PREFIX}/include”
    export LIBPATH=“${PREFIX}/lib”
    export CMAKE_OSX_DEPLOYMENT_TARGET=
    export MACOSX_DEPLOYMENT_TARGET=
    export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib
    chmod +x configure;
    export CC=clang

    make distclean;

  #  ./configure \
  #      ${ARCH,,*}x8664gcc \
  #      --minimal \
  #      --enable-x11 \
  #      --enable-python \
  #      --enable-xml \
  #      --with-python-incdir=`python3.4-config --exec-prefix`/include/python3.4m \
  #      --with-python-libdir=`python3.4-config --exec-prefix`/lib \
  #      --etcdir=${PREFIX}/etc/root \
  #      --prefix=${PREFIX} \
   #      || return 1;
        #--enable-roofit \
        # --enable-x11 \
        #--enable-xml \
        # --prefix=${PREFIX} \
        #--enable-rpath \        
        # --enable-soversion \
        #--enable-qt \
        #--enable-minuit2 \
        #--enable-shared \
        #--enable-sqlite \
        #--enable-ssl \
        #--with-qt-incdir=${PREFIX}/include/ \
        #--with-qt-libdir=${PREFIX}/lib/ \
        #--with-ssl-incdir=${PREFIX}/include/openssl/ \
        #--with-ssl-libdir=${PREFIX}/lib/ \
        #--with-ssl-shared=yes \
        #--with-sqlite-incdir=${PREFIX}/include/  \
        #--with-sqlite-libdir=${PREFIX}/lib/  \
        #--with-python-incdir=${PREFIX}/include/python${PY_VER}/ \
        #--with-python-libdir=${PREFIX}/lib/ \
        #--with-x11-libdir=${PREFIX}/lib/ \
        
    mkdir workdir
    cd workdir

    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -Dbuiltin_llvm=ON \
    -Dbuiltin_zlib=ON \
    -Dbuiltin_freetype=ON \
    -Dcxx11=ON \
    -Drpath=ON \
    -Droofit=ON \
    -Dopengl=OFF \
    -Dgviz=OFF \
    || return 1;     
    #-DCMAKE_C_COMPILER=/usr/bin/llvm-gcc \
    #-DCMAKE_CXX_COMPILER=/usr/bin/llvm-g++ \
 
   
    
    #-Dbuiltin_gsl=ON \

    make || return 1;
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


#POST_LINK="${PREFIX}/bin/.root-post-link.sh"
#cp -v ${RECIPE_DIR}/post-link.sh ${POST_LINK};
#chmod -v 0755 ${POST_LINK};

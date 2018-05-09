#!/bin/bash

mkdir -vp ${PREFIX}/bin;
ARCH="$(uname 2>/dev/null)"

LinuxInstallation() {
    export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
    export CXXLAGS="${CFLAGS}"
    export CPPFLAGS="-I${PREFIX}/include"
    export LDFLAGS="-L${PREFIX}/lib"
    # Build dependencies:
    # - libXpm-devel
    # - libX11-devel

    chmod +x configure;

    make distclean;

    ./configure \
        ${ARCH,,*}x8664gcc \
        --minimal \
        --enable-qt \
        --enable-x11 \
        --enable-minuit2 \
        --enable-python \
        --enable-rpath \
        --enable-shared \
        --enable-soversion \
        --enable-sqlite \
        --enable-ssl \
        --prefix=${PREFIX} || return 1;
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

    make || return 1;
    make install || return 1;

    return 0;
}

MacInstallation() {
    export MACOSX_DEPLOYMENT_TARGET=10.9
    export CPPFLAGS="-I${PREFIX}/include"
    export LDFLAGS="-L${PREFIX}/lib"
    export CPATH="${PREFIX}/include"
    export LIBPATH="${PREFIX}/lib"

    chmod +x configure;

    ./configure macosx64 --all --enable-builtin-glew --enable-cxx11 --enable-rpath --prefix=${PREFIX} --etcdir=${PREFIX}/etc/root \
        --with-fftw3-incdir=${PREFIX}/include --with-fftw3-libdir=${PREFIX}/lib \
        --with-gviz-incdir=${PREFIX}/include --with-gviz-libdir=${PREFIX}/lib \
        || return 1
        #--with-qt-incdir=${PREFIX}/include --with-qt-libdir=${PREFIX}/lib || return 1
 
    make -j2 || return 1;
    make install || return 1;

    # Make sure root is on the python path
    SITEPACKAGES=$($PYTHON -c "import site; print site.getsitepackages()[0]")
    echo $PREFIX/lib/root > $SITEPACKAGES/cern-root.pth

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

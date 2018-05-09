#!/bin/bash

pwd
ls

mkdir -vp ${PREFIX}/bin;

export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

ARCH="$(uname 2>/dev/null)"

LinuxInstallation() {
    # Build dependencies (fedora/RHEL):
    # - libXpm-devel
    # - libX11-devel

    chmod +x configure;

    make distclean;

    (cd graf2d/asimage/src/libAfterImage; autoheader)

    ./configure \
        --etcdir=${PREFIX}/etc/root \
        --libdir=${PREFIX}/lib \
        --enable-rpath \
        --with-python-incdir=`python-config --exec-prefix`/include/python2.7 \
        --with-python-libdir=`python-config --exec-prefix`/lib \
        --prefix=${PREFIX} \
		|| return 1;

    make -j2 || return 1;
    make install || return 1;

    mv ${PREFIX}/lib/{ROOT.py,libPyROOT.so} ${PREFIX}/lib/python${PY_VER}/site-packages

    return 0;
}

case ${ARCH} in
    'Linux')
        LinuxInstallation || exit 1;
        ;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
        ;;
esac

#POST_LINK="${PREFIX}/bin/.root-post-link.sh"
#cp -v ${RECIPE_DIR}/post-link.sh ${POST_LINK};
#chmod -v 0755 ${POST_LINK};

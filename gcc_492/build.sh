if [ `uname` == Darwin ]; then
    ./configure \
        --prefix=$PREFIX \
        --with-gmp=$PREFIX \
        --with-mpfr=$PREFIX \
        --with-mpc=$PREFIX \
        --with-isl=$PREFIX \
        --with-cloog=$PREFIX \
        --disable-multilib \
	--enable-languages=c,c++
        #--program-suffix=-4.9
else
    ./configure \
        --prefix=$PREFIX \
        --with-gmp=$PREFIX \
        --with-mpfr=$PREFIX \
        --with-mpc=$PREFIX \
        --with-isl=$PREFIX \
        --with-cloog=$PREFIX \
        --disable-multilib \
	--enable-languages=c,c++ 
        #--program-suffix=-4.9
fi
#cp /usr/lib/*.o $PREFIX/lib/

make -j3
make install

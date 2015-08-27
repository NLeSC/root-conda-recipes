ln -s $PREFIX/lib $PREFIX/lib64

if [ `uname` == Darwin ]; then
    ./configure \
        --prefix=$PREFIX \
        --libdir=$PREFIX/lib \
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
        --libdir=$PREFIX/lib \
        --with-gmp=$PREFIX \
        --with-mpfr=$PREFIX \
        --with-mpc=$PREFIX \
        --with-isl=$PREFIX \
        --with-cloog=$PREFIX \
        --enable-checking=release \
        --disable-multilib \
	--enable-languages=c,c++ 
        #--program-suffix=-4.9
fi
#cp /usr/lib/*.o $PREFIX/lib/

make -j4
make install

rm $PREFIX/lib64
#mv $PREFIX/lib64/* $PREFIX/lib/

#(cd "$PREFIX"/bin && ln -s gcc cc)
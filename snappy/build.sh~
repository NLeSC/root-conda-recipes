echo 'gcc version' 
gcc -v

    ./configure \
        --prefix=$PREFIX \
	--libexecdir=$PREFIX/lib \
	--libdir=$PREFIX/lib \
	--includedir=$PREFIX/include \
	|| return 1;



make
make install



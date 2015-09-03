echo 'gcc version' 
gcc -v

<<<<<<< HEAD
export TMPDIR=/media/New/tmpdir


=======
>>>>>>> 833248fe022f4794f838d5f6f396cc1aa1a2af90
    ./configure \
        --prefix=$PREFIX \
	--libexecdir=$PREFIX/lib \
	--libdir=$PREFIX/lib \
	--includedir=$PREFIX/include \
	|| return 1;



make
make install



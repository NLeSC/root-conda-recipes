echo 'gcc version' 
gcc -v

export TMPDIR=/media/New/tmpdir

    ./configure \
        --prefix=$PREFIX 
make
make install



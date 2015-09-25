mkdir build

mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/include/bits
mkdir -p ${PREFIX}/include/gnu


cd build

../configure --prefix=$PREFIX  --build=$MACHTYPE --host=x86_64-linux-gnu --target=x86_64-linux-gnu --disable-multilib libc_cv_forced_unwind=yes

make install-bootstrap-headers=yes install-headers

make -j2 csu/subdir_lib

install csu/crt1.o csu/crti.o csu/crtn.o ${PREFIX}/lib

touch ${PREFIX}/include/bits/stdio_lim.h
touch ${PREFIX}/include/gnu/stubs.h
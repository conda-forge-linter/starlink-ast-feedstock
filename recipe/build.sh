#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux
export CFLAGS="$CFLAGS -g -O3"

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --without-fortran --without-stardocs --without-pthreads --without-topinclude
make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install

#!/bin/bash

set -ex

export CC="zig cc"
export CXX="zig c++"
export INSTALL="install"

PNG2C_BIN=png2c.exe
SOWON_BIN=sowon.exe
SDL2_ROOT=./SDL2/x86_64-w64-mingw32
PREFIX=./dist

COMMON_CFLAGS="-Wall -Wextra -std=c99 -pedantic"
CFLAGS="${CFLAGS} -I${SDL2_ROOT}/include ${COMMON_CFLAGS}"
LIBS="-L${SDL2_ROOT}/lib \
    -lmingw32 \
    -lm \
    -lkernel32 \
    -luser32 \
    -lgdi32 \
    -lwinmm \
    -limm32 \
    -lole32 \
    -loleaut32 \
    -lversion \
    -luuid \
    -ladvapi32 \
    -lsetupapi \
    -lshell32 \
    -ldinput8 \
    ${SDL2_ROOT}/lib/libSDL2.a \
    ${SDL2_ROOT}/lib/libSDL2main.a"

echo build png2c
$CC $COMMON_CFLAGS -o $PNG2C_BIN png2c.c -lm

echo generate digits.h
./$PNG2C_BIN digits.png digits > digits.h

echo generate penger_walk_sheet.h
./$PNG2C_BIN penger_walk_sheet.png penger > penger_walk_sheet.h

echo build sowon
$CC $CFLAGS -o $SOWON_BIN main.c $LIBS -Wl,--subsystem=windows 

echo generate man page
gzip -c docs/sowon.6 > docs/sowon.6.gz

echo install
$INSTALL -d $PREFIX/bin
$INSTALL -C $SOWON_BIN $PREFIX/bin
$INSTALL -d $PREFIX/man/man6
$INSTALL -C docs/sowon.6.gz $PREFIX/man/man6

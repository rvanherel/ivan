#!/bin/bash

set -xue

/usr/lib/mxe/usr/bin/i686-w64-mingw32.static-pkg-config --libs --static sdl2
/usr/lib/mxe/usr/bin/i686-w64-mingw32.static-pkg-config --libs sdl2

MXE_DIR=/usr/lib/mxe

if [ "$IVAN_PLATFORM" = "IvanWin" ]; then
    MXE_TARGET=i686-w64-mingw32.static
    SDL2_PKGCONFIG_CFLAGS=$(/usr/lib/mxe/usr/bin/i686-w64-mingw32.static-pkg-config --cflags sdl2)
    SDL2_PKGCONFIG_LFLAGS=$(/usr/lib/mxe/usr/bin/i686-w64-mingw32.static-pkg-config --libs --static sdl2)
fi

#${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake . -Bbuild-dir -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -DCMAKE_CXX_FLAGS="-Werror -Wno-format-security -Wno-undefined-var-template -Wno-unknown-warning-option $CXXFLAGS"
${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake .. -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -DCMAKE_CXX_FLAGS="-Werror -Wno-format-security -Wno-undefined-var-template -Wno-unknown-warning-option $CXXFLAGS"
#cd build
#cmake --build build-dir --config Release
#cd build-dir
#make -j VERBOSE=1

set +xue

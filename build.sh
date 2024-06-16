#!/bin/bash
git clean -xdf
working_dir=$(dirname $0)

# CHANGEME! #########
WAD_PATH="$1"
BUILD_FOR="Release" # or "Debug"
#####################

# Set SDL2 paths explicitly
SDL2_LIBS=$(sdl2-config --libs)
SDL2_CFLAGS=$(sdl2-config --cflags)

pushd prboom2 || exit 1
    cmake .
    cmake --build .
    tmpdir=$(mktemp -d)
    cp prboom-plus.wad $tmpdir/prboom-plus.wad
    git clean -xdf
    emcmake cmake .          \
        -D BUILD_GL=0        \
        -D WITH_DUMB=0       \
        -D WITH_MAD=0        \
        -D WITH_FLUIDSYNTH=0 \
        -D WITH_VORBISFILE=0 \
        -D WITH_PORTMIDI=0   \
        -D WITH_ALSA=0       \
        -D WITH_PCRE=0       \
        -D WITH_NET=0        \
        -D PRBOOM_WAD="$tmpdir/prboom-plus.wad"               \
        -D PRELOAD_IWAD="../$WAD_PATH"                        \
        -D CMAKE_BUILD_TYPE="$BUILD_FOR"
    emmake cmake --build .
popd || exit 1

rm -Rf $tmpdir
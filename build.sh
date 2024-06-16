#!/bin/bash
git clean -xdf
working_dir=$(dirname $0)

# CHANGEME! #########
WAD_PATH="$working_dir/DOOM.WAD"
#####################

pushd prboom2 || exit 1
    cmake .
    cmake --build .
    tmpdir=$(mktemp -d)
    cp prboom-plus.wad $tmpdir/prboom-plus.wad
    cp prboom-plus.cfg $tmpdir/prboom-plus.cfg
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
        -D PRELOAD_IWAD="$working_dir/DOOM.WAD"               \
        -D PRELOAD_CONFIG="../prboom-plus.cfg"                \
        -D CMAKE_BUILD_TYPE="Release"                         \
    emmake cmake --build .
popd || exit 1aw
#!/bin/sh

set -x

SOURCE_DIR=`pwd`
BUILD_DIR=${BUILD_DIR:-./build}
BINARY_DIR=${BINARY_DIR:-./bin}
mkdir $BUILD_DIR $BINARY_DIR \
    && cd $BUILD_DIR \
    && cmake $SOURCE_DIR \
    && make $*

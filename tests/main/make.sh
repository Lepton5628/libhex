#!/bin/sh

#  make.sh
#  libhex
#
#  Created by Max C on 8/24/15.
#  Copyright (c) 2015 Max C. All rights reserved.

FILE=$1

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

if [[ -e $DIR/src/$FILE.mm ]]; then
    if g++ -g -o $DIR/build/$FILE $DIR/src/$FILE.mm -L$DIR/../../build -lhex -I$DIR/../../include -lobjc; then
        if $DIR/build/$FILE; then
            echo "Ran fine!"
        else
            echo "Failed to run"
        fi
    else
        echo "Failed to build"
    fi
else
    echo "Doesn't exist"
fi
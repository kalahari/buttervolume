#!/bin/bash

if [[ $1 == 'test' ]]; then
    set -e
    set -x
    exec python3 setup.py $@
else
    exec /usr/local/bin/buttervolume $@
fi

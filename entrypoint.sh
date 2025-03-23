#!/bin/bash

if [[ $1 == 'test' ]]; then
    set -e
    set -x
    exec python3 setup.py $@
else
    # /tini -s -- buttervolume $@
    pwd
    ls -alh
    ./buttervolume $@
fi

#!/bin/bash

if [[ $1 == 'test' ]]; then
    set -e
    set -x
    exec python3 setup.py $@
else
    # /tini -s -- buttervolume $@
    pwd
    ls -alh
    ls -alh /usr/
    find /usr -name "*buttervolume*"
    ./buttervolume $@
fi

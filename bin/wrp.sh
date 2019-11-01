#!/bin/bash

if [ $# -lt 2 ]; then echo
    echo "Usage: $0 prefix cmd";
    exit 1
fi

prefix=$1
cmd=$2

if [ ! -e "${HOME}/.wines/${prefix}" ]; then
    echo "${HOME}/.wines/${prefix} does not exit"
    exit 2
fi

WINEPREFIX="${HOME}/.wines/${prefix}" wine ${cmd}

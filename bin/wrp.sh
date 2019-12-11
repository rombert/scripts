#!/bin/bash

if [ $# -lt 2 ]; then echo
    echo "Usage: $0 prefix cmd";
    exit 1
fi

prefix=$1
shift

cmd=$1
shift

if [ ! -e "${HOME}/.wines/${prefix}" ]; then
    echo "${HOME}/.wines/${prefix} does not exit"
    exit 2
fi

case "${cmd}" in
    "wineserver")
        WINEPREFIX="${HOME}/.wines/${prefix}" ${cmd} ${@}
    ;;
    *)
        WINEPREFIX="${HOME}/.wines/${prefix}" wine ${cmd} ${@}
    ;;
esac

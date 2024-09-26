#!/bin/bash -eu

# check that there are between 1 and 2 arguments
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <flatpak_name> [repo_name]"
    exit 1
fi
# first argument is the name of the flatpak
flatpak_name=$1
# second argument is optional and is the repository name; if not set defaults to flathub
if [ "$#" -eq 1 ]; then
    repo_name=flathub
else
    repo_name=$2
fi

# set PAGER to less if not set
if [ -z ${PAGER+x} ]; then
    export PAGER=less
fi

flatpak remote-info --log $repo_name $flatpak_name | $PAGER

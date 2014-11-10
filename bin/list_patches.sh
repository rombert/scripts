#!/bin/sh

patches=$(sudo zypper -n lu -t patch | awk -F '|'  '$2 ~ /openSUSE/ {print $2}' | tr -d '\n')

if [ X$patches = 'X' ]; then
    exit 0;
fi

zypper patch-info $patches | $PAGER

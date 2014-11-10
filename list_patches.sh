#!/bin/sh

zypper patch-info $(sudo zypper -n lu -t patch | awk -F '|'  '$2 ~ /openSUSE/ {print $2}' | tr -d '\n') | $PAGER

#!/bin/sh

if [ $# -eq 1 ]; then
	file=$1
	lines=15
elif [ $# -eq 2 ]; then
	file=$1
	lines=$2
else
	echo "Usage: $0 rpm_package [line_count]";
	exit 1;
fi

rpm -q --changelog $file | head -n $lines

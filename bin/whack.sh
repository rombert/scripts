#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: $0 pid";
	exit 1;
fi

pid=$1


if [ ! -e /proc/$pid ]; then
	echo "No process with pid $pid.";
	exit 2;
fi

kill $pid

let n=0;

while [ -d /proc/$pid ]; do
	echo -n '.'
        sleep 1;
        let n=n+1;

        if [ $n -eq 30 ]; then
        	echo "Waited 30 seconds. Killing with -KILL";
                kill -KILL $pid
        fi
done


#!/bin/sh

if [ $# -ne 1 ]; then
	echo "$0 on|off";
	exit 1;
fi

mode=$1

if [ $mode != 'off' ] && [ $mode != 'on' ] ; then
	echo "$0 on|off";
	exit 1;
fi

function start_service {
	echo -n "Starting $1... " ;
	sudo systemctl start $1.service;
	echo "";
}

function stop_service {
	echo -n "Stopping $1... " ;
	sudo systemctl stop $1.service;
	echo "";
}

sudo -v; # cache password

if [ $mode == 'on' ]; then
	start_service apache2;
	start_service mysql;
else
	stop_service apache2;
	stop_service mysql;
fi

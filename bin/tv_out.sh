#!/bin/sh

function usage {
	echo "Usage $0 on|off"
}

# check arguments
if [ $# -ne 1 ]; then
	usage
	exit 1
fi

case $1 in
	on)
	xrandr --addmode S-video 800x600
	xrandr --output S-video --mode 800x600
	xvattr -a XV_CRTC -v 1
	;;

	off)
	xvattr -a XV_CRTC -v 0
	xrandr --output S-video --off
	;;

	*)
	usage
	exit 1
esac

#!/bin/sh

# courtesy of http://www.commandlinefu.com/commands/view/148/capture-video-of-a-linux-desktop
if [ $# -ne 1 ]; then
	echo "Usage: $0 output-file";
	exit;
fi

ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq $1

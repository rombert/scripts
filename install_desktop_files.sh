#!/bin/sh

for dfile in `ls -1 desktop/*.desktop`; do 
	xdg-desktop-icon install $dfile
done

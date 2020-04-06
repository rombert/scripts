#!/bin/sh
for file in `ls -1 bin/*`; do
	if [ ! -h ~/bin/$(basename $file) ]; then
		ln -s $(pwd)/$file ~/bin/
	fi
done

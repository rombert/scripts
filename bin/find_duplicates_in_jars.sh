#!/bin/bash

# picked up from http://talk-on-tech.blogspot.com/2008/10/spotting-duplicate-classes-in-jar-files.html

if [ $# == 0 ]; then
	dir='.'
elif [ $# == 1 ]; then 
	dir=$1
else
	echo "Usage: $0 [dir]";
	exit 1;
fi

for lib in `find $dir -name '*.jar'`; do
  for class in `unzip -l $lib | egrep -o '[^ ]*.class$'`; do
    class=`echo $class | sed s/\\\\.class// | sed s/[-.\\/$]/_/g`
    existing=$( eval "echo \$CLS_${class}" )
    if [ -n "$existing" ]; then echo "$lib $existing"; fi
    eval CLS_${class}="(\"${lib} ${existing}\")"
  done
done | sort | uniq -c | sort -nr

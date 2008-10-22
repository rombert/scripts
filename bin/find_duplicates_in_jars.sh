#!/bin/bash

# picked up from http://talk-on-tech.blogspot.com/2008/10/spotting-duplicate-classes-in-jar-files.html

for lib in `find . -name '*.jar'`; do
  for class in `unzip -l $lib | egrep -o '[^ ]*.class$'`; do
    class=`echo $class | sed s/\\\\.class// | sed s/[-.\\/$]/_/g`
    existing=$( eval "echo \$CLS_${class}" )
    if [ -n "$existing" ]; then echo "$lib $existing"; fi
    eval CLS_${class}="(\"${lib} ${existing}\")"
  done
done | sort | uniq -c | sort -nr

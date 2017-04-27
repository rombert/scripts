#!/bin/sh

usage() {
    echo "Usage: $0 [new-settings]"

    exit 1
}

if [ $# -eq 0 ]; then
   for file in ~/.m2/settings-*.xml; do
        if [ $file = ~/.m2/settings-security.xml ]; then
            continue;
        fi

        echo -n $file;

        if [ -h ~/.m2/settings.xml ] && [ $file = $(readlink -f ~/.m2/settings.xml) ] ; then
            echo  " [x]";
        else
            echo "";
        fi
    done

elif [ $# -eq 1 ]; then
    if [ $1 = 'security' ]; then
        echo "Invalid choice : $1"
        exit 3
    fi

    if [ -e ~/.m2/settings.xml -a ! -h ~/.m2/settings.xml ]; then
        echo "Unable to manage settings.xml since it's not a symlink"
        exit 4
    fi

    if [ $1 = '-u' ]; then
        rm ~/.m2/settings.xml
        exit 0
    fi

    CFG=~/.m2/settings-$1.xml

    if [ -f $CFG ] ; then
        ln -sf $CFG ~/.m2/settings.xml
    else
        echo "No file $CFG to select"
        exit 2
    fi

else
    usage
fi




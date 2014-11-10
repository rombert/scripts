#!/bin/sh

usage() {
    echo "Usage: $0 ls|current"
    echo "Usage; $0 select name"

    exit 1
}

case "$1" in
    ls)
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
    ;;

    current)

        if [ ! -h ~/.m2/settings.xml ] ; then
            echo "~/.m2/settings.xml is not a symlink"
            exit 4
        fi

        readlink -f ~/.m2/settings.xml
    ;;

    select)

        if [ $# -ne 2 ]; then
            usage
        fi

        if [ $2 = 'security' ]; then
            echo "Invalid choice : $2"
            exit 3
        fi

        if [ ! -h ~/.m2/settings.xml ]; then
            echo "Unable to manage settings.xml since it's not a symlink"
            exit 4
        fi

        CFG=~/.m2/settings-$2.xml

        if [ -f $CFG ] ; then
            ln -sf $CFG ~/.m2/settings.xml
        else
            echo "No file $CFG to select"
            exit 2
        fi
    ;;

    *)
        usage
    ;;
esac

#!/bin/sh -e

SYSTEM_CA_CERTS=/var/lib/ca-certificates/java-cacerts

if [ ! -f $SYSTEM_CA_CERTS ]; then
    echo "System CA certificates not found at $SYSTEM_CA_CERTS, aborting"
    exit 1
fi

for jdk in $(ls -1 /opt | grep 'jdk') ; do
    jdk_cacerts=/opt/$jdk/jre/lib/security/cacerts
    if [ -r $jdk_cacerts ]; then
        #echo "found $jdk with cacerts $jdk_cacerts"

        if [ -L $jdk_cacerts ] && [ $(readlink $jdk_cacerts) = $SYSTEM_CA_CERTS ] ;then
            echo "$jdk_cacerts already set up, skipping"
        else
            mv $jdk_cacerts{,~}
            ln -s $SYSTEM_CA_CERTS $jdk_cacerts
            echo "$jdk_cacerts now points to $SYSTEM_CA_CERTS"
        fi
    fi
done

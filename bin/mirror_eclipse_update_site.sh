#!/bin/sh
eclipse_home=${eclipse_home:-/opt/eclipse}

if [ $# -lt 2 ] ; then
	echo "Usage $0 from to [featureId] [version]"
	exit 1
fi

from=$1
to=$2

cmd="java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar -application org.eclipse.update.core.standaloneUpdate -command mirror -from $from -to $to"

if [ $# -ge 3 ]; then
	cmd="$cmd -featureId $3"
fi

if [ $# -eq 4 ]; then
	cmd="$cmd -version $4"
fi

$cmd

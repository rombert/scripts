#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Usage: $0 from to";
	exit 1;
fi

eclipse_home=${eclipse_home:-/opt/eclipse}

$eclipse_home/eclipse -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source $1 -destination $2
$eclipse_home/eclipse -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source $1 -destination $2

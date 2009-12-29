#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: $0 gateway"
	exit 1;
fi

GATEWAY=$1

# 10 packets transmitted, 0 received, 100% packet loss, time 8999ms
packet_loss=$(ping -q -c 10 $GATEWAY | grep 'packets transmitted' | sed "s/.*,\(.*\)% packet loss,.*/\1/" )

logger -t pm_qos "Packet loss for $GATEWAY is $packet_loss%"

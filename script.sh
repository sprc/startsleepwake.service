#!/bin/bash
i="1"
random="1"
mode=$1
var="0"
max=$2

if [ "$max" = "" ]; then
	max="10"
fi

if [ "$mode " = "start " ]; then
	echo "startsleepwake.service: starting up." > /dev/kmsg
	systemctl start wakescript.service
	exit 0
fi

if [ "$mode " = "sleep " ]; then
	echo "startsleepwake.service: sleeping." > /dev/kmsg
	systemctl stop wakescript.service
	exit 0
fi

while [ $random -lt $max ]
do
	sleep 1
	random=$(/usr/local/bin/rand.sh 1 $max)
	echo "startsleepwake.service: $mode, $i, $random" > /dev/kmsg
	if [ $random = $i ]; then
		var=$[1/0]
	fi
	i=$[$i+1]
done

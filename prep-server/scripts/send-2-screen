#!/usr/bin/env bash

name=$1
CMD=$2

if screen -ls | grep -q "Dead"; then
	screen -wipe
fi

if echo $STY | grep -q $name; then
	sleep 1
fi
if ! screen -ls | grep -q $name; then
	screen -dmS $name
fi

sleep 1
screen -S $name -X stuff "${CMD} $(echo -ne '\015')"


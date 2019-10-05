#!/usr/bin/env bash

dir=$1
sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $dir/Minecraft

sudo docker build -t projectinitiative/apmc $sdir/..

sudo docker create --name=mc --tty -i \
	--restart=always \
	-v $dir/Minecraft:/home/Minecraft \
	-p 25565:25565 \
	-e TZ=America/Chicago \
	projectinitiative/apmc

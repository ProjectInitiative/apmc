#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


cp -R -u -p $sdir/scripts/* /home/Minecraft

/home/Minecraft/start.sh

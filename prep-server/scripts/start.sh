#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -z "$minram" ]; then
    xms="-Xms"$minram
fi
if [ ! -z "$maxram" ]; then
    xmx="-Xmx"$maxram
fi

$sdir/send-2-screen.sh mc "stop"
sleep 5

$sdir/send-2-screen.sh mc "cd /home/Minecraft; java $xmx $xms -jar $sdir/*server.jar nogui"
sleep 5

while ! grep -q "eula=true" /home/Minecraft/eula.txt
do 
    sleep 1
    if [ $EULA = true ]; then
        sed -i 's/eula=false/eula=true/' /home/Minecraft/eula.txt
    fi
done
$sdir/send-2-screen.sh mc "cd /home/Minecraft; java $xmx $xms -jar $sdir/*server.jar nogui"
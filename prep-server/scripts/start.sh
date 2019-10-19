#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -f /home/Minecraft/spigot.jar ]; then
git config --global --unset core.autocrlf
$sdir/send-2-screen.sh mc "cd /home/Minecraft; /home/Minecraft/build-latest-server.sh"
fi

if [ ! -z "$minram" ]; then
    xms="-Xms"$minram
fi
if [ ! -z "$maxram" ]; then
    xmx="-Xmx"$maxram
fi


$sdir/send-2-screen.sh mc "cd /home/Minecraft; java $xmx $xms -jar $sdir/spigot.jar nogui"
sleep 5

if cat /home/Minecraft/eula.txt | grep -q "eula=false"; then
    
    while cat /home/Minecraft/eula.txt | grep -q "eula=false";
    do 
        sleep 1
    done
    
    $sdir/send-2-screen.sh mc "cd /home/Minecraft; java $xmx $xms -jar $sdir/spigot.jar nogui"
fi 
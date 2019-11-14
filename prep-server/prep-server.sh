#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Copies send-2-screen and start.sh to the root Minecraft folder
cp -R -u -p $sdir/scripts/*.sh /home/Minecraft

if [ `echo $server_type | tr [:upper:] [:lower:]` =  `echo spigot | tr [:upper:] [:lower:]` ]; then
	cp -R -u -p $sdir/scripts/spigot/* /home/Minecraft
	find /home/Minecraft/ -type f -iname "*.sh" -or -iname "*.jar" -exec chmod +x {} \;
	if [ ! -f /home/Minecraft/*spigot-server.jar ]; then
		git config --global --unset core.autocrlf
		/home/Minecraft/send-2-screen.sh mc "cd /home/Minecraft; /home/Minecraft/build-latest-server.sh"
	fi

elif [ `echo $server_type | tr [:upper:] [:lower:]` =  `echo paper | tr [:upper:] [:lower:]` ]; then
	cp -R -u -p $sdir/scripts/paper/* /home/Minecraft
	find /home/Minecraft/ -type f -iname "*.sh" -or -iname "*.jar" -exec chmod +x {} \;
	if [ ! -f /home/Minecraft/*paper-server.jar ]; then
		/home/Minecraft/get-latest-paper.sh
	fi

else
	#Default server
	cp -R -u -p $sdir/scripts/spigot/* /home/Minecraft
	find /home/Minecraft/ -type f -iname "*.sh" -or -iname "*.jar" -exec chmod +x {} \;
	if [ ! -f /home/Minecraft/*spigot-server.jar ]; then
		git config --global --unset core.autocrlf
		/home/Minecraft/send-2-screen.sh mc "cd /home/Minecraft; /home/Minecraft/build-latest-server.sh"
	fi
fi




# trap "/home/Minecraft/send-2-screen.sh mc stop" SIGTERM SIGINT
trap touch /home/Minecraft/testing.txt SIGTERM SIGINT
/home/Minecraft/start.sh

while :
do
	sleep 60
done

exit 0

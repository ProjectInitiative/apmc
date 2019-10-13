# apmc
A customized Alpine Linux Docker image to manage a Vanilla Minecraft server running on Spigot.

## GitHub
For more information, and to view all scripts included in the image, check out the [GitHub](https://github.com/ProjectInitiative/apmc) page.

## Dockerfile

```Dockerfile
FROM alpine:3.7

COPY prep-server/ /home/prep-server/

RUN apk update &&\
    apk add bash &&\
    apk add git &&\
    apk add vim &&\ 
    apk add screen &&\
    apk add openjdk8 &&\
    apk upgrade

EXPOSE 25565

ENTRYPOINT /home/prep-server/prep-server.sh && /bin/bash
```

## Usage

To run this server, and manage the server files and properties, please specify a directory on the host to house the Minecraft server files. The following docker command will create a container that will automatically run/build the server when it is started.

> NOTE: On the first run, the server will not fully initialize until the user agrees to the end user licence agreement. After running the commands below, the user needs to edit the `eula.txt` file found in the root server directory on the host machine. The value `eula=false` needs to be changed to `eula=true`. There is no need to restart the server, just save changes.

### Commands for Bash:

```bash
#!/bin/bash

dir="FULL-PATH-TO-STORE-SERVER-ON-HOST" 
mkdir -p $dir/Minecraft

sudo docker pull projectinitiative/apmc:latest

sudo docker create --name=mc --tty -i \
	--restart=always \
	-v $dir/Minecraft:/home/Minecraft \
	-p 25565:25565 \
	projectinitiative/apmc
```

### Commands for PowerShell:

```PowerShell
$dir="FULL-PATH-TO-STORE-SERVER-ON-HOST" 
mkdir -p $dir\Minecraft

docker pull projectinitiatve/apmc:latest

docker create --name=mc --tty -i `
	--restart=always `
	-v $dir/Minecraft:/home/Minecraft `
	-p 25565:25565 `
	projectinitiative/apmc
```

## Environmental Variables

| Variable |              Description              | Value Type Example |
| :------: | :-----------------------------------: | :----------------: |
|    TZ    |               Timezone                |  America/Chicago   |
|  minram  | Minimum RAM to allocate to the server |      1G/512M       |
|  maxram  | Maximum RAM to allocate to the server |      1G/512M       |

> NOTE: Environmental variables do not need to be specified to run the server. Default values will be used. 

### Example Usage

```bash
sudo docker create --name=mc ...
...
...
-p 25565:25565 \
-e TZ=America/Chicago \
-e minram=512M \
-e maxram=4G \
...
```

## Server Management

### Interacting with the Minecraft console

To interact with the command console without being in-game, run the following while the container is running

```bash 
docker exec -it mc screen -r mc 
```

To exit the console safely use `CTRL + A then CTRL + D`

### Upgrading the Spigot Server

To upgrade to the current Spigot server, run the following while the container is running

```bash
docker exec -it mc /bin/bash

screen -r mc 
stop

/home/Minecraft/build-latest-server.sh

/home/Minecraft/start.sh
```

> NOTE: Pre-built Spigot server jar files can be downloaded from the [Spigot](https://getbukkit.org/download/spigot) website. Move the jar file into the root server directory on the host and rename it `spigot.jar` restart server with the following commands
```bash
docker exec -it mc screen -r mc 
restart
```

# License

MIT License

Copyright (c) 2019 Kyle Petryszak

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

### Attributions

[Spigot](https://www.spigotmc.org/wiki/public-license/)
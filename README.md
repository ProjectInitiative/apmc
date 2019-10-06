# apmc
A customized Alpine Linux Docker image to manage a Vanilla Minecraft server running on Spigot.

## Docker Hub
Check out the [Docker](https://hub.docker.com/r/projectinitiative/apmc) hub page.



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
	-e TZ=America/Chicago \
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
	-e TZ=America/Chicago `
	projectinitiative/apmc
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

> NOTE: Pre-built Spigot server jar files can be downloaded from the [Spigot](https://getbukkit.org/download/spigot) website. Move the jar file into the main server folder and rename it `spigot.jar` restart server with the following commands
```bash
docker exec -it mc screen -r mc 
restart
```

## Build from source

### Bash

Creating the container:

```bash
create-mc-container.sh "FULL-PATH-TO-STORE-SERVER-ON-HOST"
```

Starting the container:

```bash
docker start mc
```

Stopping the container:

```bash
docker stop mc
```

Additionally, the server can be stopped, rebuilt, and started again.

```bash
rebuild-mc.sh "FULL-PATH-TO-STORE-SERVER-ON-HOST"
```

### PowerShell

Creating the container:

```PowerShell
create-mc-container.ps1 "FULL-PATH-TO-STORE-SERVER-ON-HOST"
```

Starting the container:

```PowerShell
docker start mc
```

Stopping the container:

```PowerShell
docker stop mc
```

Additionally, the server can be stopped, rebuilt, and started again.

```PowerShell
rebuild-mc.ps1 "FULL-PATH-TO-STORE-SERVER-ON-HOST"
```


## License

[MIT License](./LICENSE)

### Attributions

[Spigot](https://www.spigotmc.org/wiki/public-license/)
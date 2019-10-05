# apmc
A customized Alpine Linux Docker image to manage a Vanilla Minecraft server running on Spigot.

# Docker Hub
Check out the [Docker](https://hub.docker.com/r/projectinitiative/apmc) hub page.



# Usage

To run this server, and manage the server files and properties, please specify a directory on the host to house the Minecraft server files. The following docker command will create a container that will automatically run/build the server when it is started.

## Commands for Bash:

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

## Commands for PowerShell:

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

# Build from source



# License

[MIT License](./LICENSE)

## Attributions

[Spigot](https://www.spigotmc.org/wiki/public-license/)



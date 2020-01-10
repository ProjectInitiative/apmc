# apmc
A customized Alpine Linux Docker image to manage a Vanilla Minecraft server running on Spigot or PaperMC.

## GitHub
For more information, and to view the Dockerfile and all scripts included in the image, check out the [GitHub](https://github.com/ProjectInitiative/apmc) repo.

## Docker Hub
Check out the [Docker](https://hub.docker.com/r/projectinitiative/apmc) hub page.

## Usage

To run this server, and manage the server files and properties, please specify a directory on the host to house the Minecraft server files. The following docker command will create a container that will automatically run/build the server when it is started.

> NOTE: If the `EULA` flag is not added, then on the first run, the server will not fully initialize until the user agrees to the end user licence agreement. After running the commands below, the user needs to edit the `eula.txt` file found in the root server directory on the host machine. The value `eula=false` needs to be changed to `eula=true`. There is no need to restart the server, just save changes and the server will auto-restart.

### Commands for Bash:

```bash
#!/bin/bash

dir="FULL-PATH-TO-STORE-SERVER-ON-HOST" 
mkdir -p $dir/Minecraft

sudo docker create --name=mc --tty -i \
	--restart=always \
	-v $dir/Minecraft:/home/Minecraft \
	-p 25565:25565 \
	-e EULA=true \
	projectinitiative/apmc

sudo docker start mc
```

### Commands for PowerShell:

```PowerShell
$dir="FULL-PATH-TO-STORE-SERVER-ON-HOST" 
mkdir -p $dir\Minecraft

docker create --name=mc --tty -i `
	--restart=always `
	-v $dir/Minecraft:/home/Minecraft `
	-p 25565:25565 `
	-e EULA=true `
	projectinitiative/apmc

docker start mc
```

## Environmental Variables

|   Variable   |                                                   Description                                                   |  Value Type Example  |
| :----------: | :-------------------------------------------------------------------------------------------------------------: | :------------------: |
|      TZ      |                                                    Timezone                                                     |   America/Chicago    |
|    minram    |                                      Minimum RAM to allocate to the server                                      |       1G/512M        |
|    maxram    |                                      Maximum RAM to allocate to the server                                      |       1G/512M        |
| server_type  |                             Specify which type of server to be downloaded/compiled                              |     spigot/paper     |
|     EULA     |                       Automatically accepts the end user license agreement for the server                       |         true         |
| start_script | Path to custom start script (not named start.sh) Usually used for modded server packs with custom start scripts | PATH-TO-START-SCRIPT |

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
-e server_type=paper \
-e EULA=true \
...
...
```

## Server Management

### Interacting with the Minecraft console

To interact with the command console without being in-game, run the following while the container is running

```bash 
docker exec -it mc screen -r mc 
```

To exit the console safely use `CTRL + A then CTRL + D`

### Built-in Server Commands

CMDs that are built in:
  * `start-server`
  * `stop-server`
  * `restart-server`
  * `upgrade-server`

To use the commands listed above, run the following while the container is running

```bash
docker exec -it mc CMD
```

> NOTE: Pre-built Spigot server jar files can be downloaded from the [Spigot](https://getbukkit.org/download/spigot) website. Move the jar file into the root server directory on the host and rename it `spigot-server.jar`. The PaperMC variant can be downloaded from [PaperMC](https://papermc.io/downloads). Move the jar file into the root server directory on the host and rename it `paper-server.jar`


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

[MIT License](https://github.com/ProjectInitiative/apmc/blob/master/LICENSE)

### Attributions

[Spigot](https://www.spigotmc.org/wiki/public-license/)

[PaperMC](https://github.com/PaperMC/Paper/blob/ver/1.14/LICENSE.md)

## Special Thanks
[Andrew Gu](https://github.com/a-gu)
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$dir
) 
mkdir -p $dir\Minecraft

docker build -t projectinitiative/apmc $PSScriptRoot\..

docker create --name=mc --tty -i `
	--restart=always `
	-v $dir/Minecraft:/home/Minecraft `
	-p 25565:25565 `
	-e minram=4G `
	-e maxram=8G `
	-e TZ=America/Chicago `
	projectinitiative/apmc

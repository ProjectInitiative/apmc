
$dir=$args[0]
$dir="C:\Users\KyleP\Desktop\DockerCompile\Docker" 
mkdir -p $dir\Minecraft

docker build -t projectinitiative/apmc $PSScriptRoot\..

docker create --name=mc --tty -i `
	--restart=always `
	-v $dir/Minecraft:/home/Minecraft `
	-p 25565:25565 `
	-e TZ=America/Chicago `
	projectinitiative/apmc

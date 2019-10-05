
$dir=$arg[0]

docker stop mc
docker rm mc
Invoke-Expression $PSScriptRoot\create-mc-container.ps1 $dir
docker start mc

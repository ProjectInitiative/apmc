Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$dir
)

docker stop mc
docker rm mc
Invoke-Expression "$PSScriptRoot\create-mc-container.ps1 $dir"
docker start mc

Param(
    [Parameter(Position=1)]
    [string]$dir
)

if (!$dir) { $dir="$PSScriptRoot\.." }

docker stop mc
docker rm mc
Invoke-Expression "$PSScriptRoot\create-mc-container.ps1 $dir"
docker start mc

docker exec -it mc /bin/bash
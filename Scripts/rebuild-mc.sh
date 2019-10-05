#!/bin/bash

dir=$1
sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo docker stop mc
sudo docker rm mc
sudo $sdir/create-mc-container.sh $dir
sudo docker start mc

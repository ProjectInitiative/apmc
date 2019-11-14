#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

base='https://papermc.io/api/v1/paper'
version=$(curl -s $base | gawk 'match($0, /"versions"\s*:\s*\[\s*"([^"]+)/, a) {print a[1]}')
build=$(curl -s "${base}/${version}/" | awk '{print gensub(/^.+"builds"\s*:\s*{\s*"latest"\s*:\s*"([^"]+)".+$/, "\\1", "g");}')
url="${base}/${version}/${build}/download"
curl -JL $url -o $sdir/$build-$version-paper-server.jar
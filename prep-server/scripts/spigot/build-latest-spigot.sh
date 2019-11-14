#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $sdir/tmp
yes | rm -rf $sdir/tmp/*

cd tmp

wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar

git config --global --unset core.autocrif
git config --global am.keepcr true
java -jar BuildTools.jar --rev latest

mkdir -p ../server-versions
cp spigot*.jar ../server-versions

cp spigot*.jar ../spigot-server.jar

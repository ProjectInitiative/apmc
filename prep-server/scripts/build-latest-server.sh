#!/usr/bin/env bash

sdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $sdir/tmp
yes | rm -rf $sdir/tmp/*

cd tmp

wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar

java -jar BuildTools.jar --rev latest

mkdir -p ../server-versions
cp spigot*.jar ../server-versions

cp spigot*.jar ../spigot.jar

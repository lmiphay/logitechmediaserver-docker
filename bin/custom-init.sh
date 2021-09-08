#!/bin/sh

# see: https://hub.docker.com/r/lmscommunity/logitechmediaserver

if [ ! -f /usr/bin/ffmpeg ] ; then
    apt-get update -qq
    apt-get install --no-install-recommends -qy ffmpeg
fi

exit 0

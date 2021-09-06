#!/bin/sh

# see: https://hub.docker.com/r/lmscommunity/logitechmediaserver

apt-get update -qq
apt-get install --no-install-recommends -qy ffmpeg

exit 0

#!/sbin/openrc-run
# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Lyrionmusicserver in a container"

depend() {
    need net docker
}

start() {
    ebegin "Starting Lyrionmusicserver container"
    /usr/bin/lyrionmusicserver-docker start
    eend $?
}

stop() {
    ebegin "Stopping Lyrionmusicserver container"
    /usr/bin/lyrionmusicserver-docker stop
    eend $?
}

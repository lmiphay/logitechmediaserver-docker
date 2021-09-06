#!/sbin/openrc-run
# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Logitechmediaserver in a container"

depend() {
    need net docker
}

start() {
    ebegin "Starting Logitechmediaserver container"
    /usr/bin/logitechmediaserver-docker start
    eend $?
}

stop() {
    ebegin "Stopping Logitechmediaserver container"
    /usr/bin/logitechmediaserver-docker stop
    eend $?
}

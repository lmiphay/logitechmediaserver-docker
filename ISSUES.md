
# /etc/timezone is a directory

Reported as:

```
# /usr/bin/logitechmediaserver-docker start
Error response from daemon: OCI runtime create failed: container_linux.go:380: starting container process caused: process_linux.go:545: container init caused: rootfs_linux.go:76: mounting "/etc/timezone" to rootfs at "/etc/timezone" caused: mount through procfd: not a directory: unknown: Are you trying to mount a directory onto a file (or vice-versa)? Check if the specified host path exists and is the expected type
Error: failed to start containers: logitechmediaserver
```

In an old container (~3 years):
```
456001a1ff5b /etc # file /etc/timezone 
/etc/timezone: ASCII text
456001a1ff5b /etc # cat /etc/timezone 
UTC
456001a1ff5b /etc #
```

Handbook has: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Base#Timezone

```
root #echo "Europe/Brussels" > /etc/timezone
```

Reference: https://github.com/hickinbottoms/gentoo-squeezebox-overlay/pull/29#issuecomment-933856559

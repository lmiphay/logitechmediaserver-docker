# logitechmediaserver-docker

Logitechmediaserver in a container using the [lmscommunity](https://hub.docker.com/r/lmscommunity/logitechmediaserver)
image.

## Running Docker on gentoo

1. setup Docker on gentoo - see: https://wiki.gentoo.org/wiki/Docker
2. check the new kernel configuration: /usr/share/docker/contrib/check-config.sh /usr/src/linux/.config

## Configuration

Variables in `/etc/logitechmediaserver.conf` (on the host server) allow these settings to be customised:

1. logitechmediaserver image version
2. hostname to be given to the container
2. directories to mount from the host
3. ports

## Quickstart

```
$ logitechmediaserver-docker settings
...
$ logitechmediaserver-docker pull
$ logitechmediaserver-docker create
$ logitechmediaserver-docker start
$ logitechmediaserver-docker logs
...
$ logitechmediaserver-docker stop
...
$ logitechmediaserver-docker delete
```

## Upgrade

1. logitechmediaserver-docker stop
2. logitechmediaserver-docker pull
3. docker rename logitechmediaserver logitechmediaserver-8.2.1 # renames the old container
4. logitechmediaserver-docker create
5. logitechmediaserver-docker start

Optional - to remove an old container and/or image:

6. docker rm logitechmediaserver-8.2.1
7. docker rmi logitechmediaserver/docker:8.2.1

## Favorites

An existing favorites.opml file can be made available in the container by:

```
cp /etc/logitechmediaserver/favorites.opml <lms_config>/prefs/favorites.opml
```

where <lms_config> is the setting from `/etc/logitechmediaserver.conf`.

## OpenRC

To have the container start automatically:

```
rc-config add logitechmediaserver
```

## Logging

The default docker "json-file" logging driver does *not* do log rotation.

To select the "local" driver, with a max file size of 10MB and four files, add this to `/etc/docker/daemon.json`:

```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "4"
  }
}
```

Note that this change *only* effects newly created containers and after docker is restarted.

## References

1. https://wiki.gentoo.org/wiki/Docker
2. https://hub.docker.com/r/lmscommunity/logitechmediaserver
3. https://forums.slimdevices.com/showthread.php?111828-Official-docker-container-for-LMS
4. https://docs.docker.com/config/containers/logging/configure/
5. https://docs.docker.com/config/containers/logging/local/

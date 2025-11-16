# lyrionmusicserver-docker

Lyrionmusicserver in a container using the [lmscommunity](https://hub.docker.com/r/lmscommunity/lyrionmusicserver)
image.

## Running Docker on gentoo

1. setup Docker on gentoo - see: https://wiki.gentoo.org/wiki/Docker
2. check the new kernel configuration: /usr/share/docker/contrib/check-config.sh /usr/src/linux/.config

## Configuration

Variables in `/etc/lyrionmusicserver.conf` (on the host server) allow these settings to be customised:

1. lyrionmusicserver image version
2. hostname to be given to the container
2. directories to mount from the host
3. ports

## Quickstart

```
$ lyrionmusicserver-docker settings
...
$ lyrionmusicserver-docker pull
$ lyrionmusicserver-docker create
$ lyrionmusicserver-docker start
$ lyrionmusicserver-docker logs
...
$ lyrionmusicserver-docker stop
...
$ lyrionmusicserver-docker delete
```

## Upgrade

1. lyrionmusicserver-docker stop
2. lyrionmusicserver-docker pull
3. docker rename lyrionmusicserver lyrionmusicserver-8.2.1 # renames the old container
4. lyrionmusicserver-docker create
5. lyrionmusicserver-docker start

Optional - to remove an old container and/or image:

6. docker rm lyrionmusicserver-8.2.1
7. docker rmi lyrionmusicserver/docker:8.2.1

## Favorites

An existing favorites.opml file can be made available in the container by:

```
cp /etc/lyrionmusicserver/favorites.opml <lms_config>/prefs/favorites.opml
```

where <lms_config> is the setting from `/etc/lyrionmusicserver.conf`.

## OpenRC

To have the container start automatically:

```
rc-config add lyrionmusicserver
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
2. https://hub.docker.com/r/lmscommunity/lyrionmusicserver (was: https://hub.docker.com/r/lmscommunity/logitechmediaserver)
3. https://forums.slimdevices.com/showthread.php?111828-Official-docker-container-for-LMS
4. https://docs.docker.com/config/containers/logging/configure/
5. https://docs.docker.com/config/containers/logging/local/

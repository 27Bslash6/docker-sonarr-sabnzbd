#/bin/bash

# command to start sabnzbdplus if not running via docker-compose
docker run --name funkygibbon_sabnzbd_1 -v /home/fish/projects/docker/sabnzbd/config:/volumes/config/sabnzbd -v /mnt/red/Downloads:/volumes/downloads -p 8080:8080 funkygibbon/sabnzbd

#/bin/bash

# command to start sonarr if not running via docker-compose
docker run --name funkygibbon_sonarr_1 -p 8989:8989 -v /mnt/green/:/volumes/media -v /mnt/red/Downloads/:/volumes/downloads funkygibbon/sonarr
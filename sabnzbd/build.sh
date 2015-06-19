#/bin/bash
UUID=1000

docker build -t sabnzbd .

#docker run -v /config --name sabnzbd_config scratch true &> /dev/null
#docker run -v /data --name media_data scratch true &> /dev/null
#docker run -t --rm --volumes-from media_data --volumes-from sabnzbd_config ubuntu /bin/bash
#docker run -t ubuntu "/bin/bash; chown -R $UUID /config; chown -R $UUID /data"
# About
This image is a simple ubuntu based image running [adb](https://developer.android.com/studio/command-line/adb), it is made to be used with [Home Assistant](https://www.home-assistant.io/), It is based on the official hassio [addon](https://github.com/hassio-addons/addon-adb) by [frenck](https://github.com/frenck)

## Start

```shell
docker run -d \
    --name adb \
    -p 5037:5037 \               
    -e DEVICES=192.168.1.6 \
    -e TIMEOUT=90 \ 
    -v /some/path:/data \  
    peexl/adb
```

## Configuration

- --name adb : Name of the container
- -p 5037:5037 : Port which adb will listen on
- -e DEVICES : List of devices adb will connect, if you want to connect to multiples devices separate them with ";" for example "-e DEVICES=192.168.1.6;192.168.1.7"
- -e TIMEOUT : Time in second that adb will try to reconnect 
- /data : Folder where the adb keys will be stored

## docker-compose

```shell
version: "3"
services:
  adb:
    container_name: adb
    restart: unless-stopped
    image: peexl/adb
    volumes:
      - /some/path:/data
    environment:
      - DEVICES=192.168.1.6
      - TIMEOUT=90
    ports:
      - "5037:5037"

```

#!/bin/bash

# need to use 172.x.x.x on OSX as can't access /etc/hosts
export DOCKER_IP=$(ifconfig | grep 172 | awk '{print $2}')

docker compose down
docker compose up -d

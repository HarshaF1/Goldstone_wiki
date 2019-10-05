#!/bin/sh

set -eux

IMAGE=docker-fpm-frr
docker inspect $IMAGE:latest || docker load < /var/cache/apt/$IMAGE.gz
systemctl enable bgp
rm /var/cache/apt/$IMAGE.gz

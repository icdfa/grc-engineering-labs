#!/bin/bash
#
# GRC Engineering Labs - Docker Shell Access
# Quick access to running container
#
# Maintainer: Aminu Idris, AMCPN
# Organization: ICDFA

if docker ps | grep -q grc-engineering-labs; then
    docker exec -it grc-engineering-labs /bin/bash
else
    echo "Error: GRC Labs container is not running"
    echo "Start it with: ./scripts/docker_start.sh"
    exit 1
fi

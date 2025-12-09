#!/bin/bash
#
# GRC Engineering Labs - Docker Start Script
# Quick start script for Docker environment
#
# Maintainer: Aminu Idris, AMCPN
# Organization: ICDFA

echo "=========================================="
echo "  GRC Engineering Labs - Docker"
echo "=========================================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed"
    echo "Please install Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker compose &> /dev/null; then
    echo "Error: Docker Compose is not installed"
    echo "Please install Docker Compose: https://docs.docker.com/compose/install/"
    exit 1
fi

# Build and start container
echo "Building and starting GRC Labs container..."
docker compose up -d --build

# Check if container is running
if docker ps | grep -q grc-engineering-labs; then
    echo ""
    echo "Container started successfully!"
    echo ""
    echo "To access the lab environment:"
    echo "  docker exec -it grc-engineering-labs /bin/bash"
    echo ""
    echo "Or use the quick access script:"
    echo "  ./scripts/docker_shell.sh"
    echo ""
    echo "To stop the container:"
    echo "  docker compose down"
    echo ""
else
    echo "Error: Container failed to start"
    echo "Check logs: docker compose logs"
    exit 1
fi

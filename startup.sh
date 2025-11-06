#!/bin/bash
echo "Hello, world!"
echo "My first script is running."

# You can take input from arguments passed to the script
echo "The first argument passed was: $1"

ENV=$1
echo "Really want to pass ENV =$1 "


docker-compose up -d

echo "Stopping existing containers..."
docker compose down

echo "Starting containers with new configuration..."
docker compose up -d

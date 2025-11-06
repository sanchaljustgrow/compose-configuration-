#!/bin/bash
echo "Hello, world!"
echo "My first script is running."

echo "Stopping existing containers..."
docker compose down

ENV=$1
echo "Really want to pass ENV =$1 "
CONFIRM=$2

if [ ! -f "$ENV" ]; then
    echo "❌ Error: Configuration file '$CONFIG_FILE' not found!"
    exit 1
    

if [ "$CONFIRM" == "YES" ]; then
    echo "Starting containers with new configuration..."
    docker compose up -d --build \
        --env-file <(echo "ENV=$ENV")
else

 echo "Skipping container startup. Confirmation not YES."
 fi
 




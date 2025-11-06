#!/bin/bash
echo "Hello, world!"
echo "My first script is running."
echo "Stopping existing containers..."
docker compose down


# You can take input from arguments passed to the script
echo "The first argument passed was: $1"

ENV=$1
echo "Really want to pass ENV =$1 "
CONFIRM=$2
if [ "$CONFIRM" == "YES" ]; then
    echo "Starting containers with new configuration..."
    docker compose --env-file "$ENV" up -d
else

 echo "Skipping container startup. Confirmation not YES."
 fi
 




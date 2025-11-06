#!/bin/bash

echo "Hello, world!"
echo "My first script is running."

echo "Stopping existing containers..."
docker compose down

ENV=$1


echo "Really want to pass ENV = $ENV"


# Check if config file exists
if [ ! -f "./config/config.${ENV}.json" ]; then
    echo "Error: Configuration file not found!"
    exit 1
fi

read -p "Do you want to continue and start containers? (yes/no): " CONFIRM

if [ "$CONFIRM" == "yes" ] || [ "$CONFIRM" == "y" ]; then
    echo "Stopping existing containers..."
    docker compose down

    echo "Starting containers with configuration: $CONFIG_FILE"
    export ENV=$ENV
    docker compose up -d 
    echo "Containers started successfully for environment: $ENV"
else
    echo " Operation cancelled."
    exit 0
fi

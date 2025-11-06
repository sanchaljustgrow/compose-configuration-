#!/bin/bash

echo "Hello, world!"
echo "My first script is running."

echo "Stopping existing containers..."
docker compose down

ENV=$1
CONFIRM=$2

echo "Really want to pass ENV = $ENV"
echo "Confirmation = $CONFIRM"

# Check if config file exists
if [ ! -f "./config/config.${ENV}.json" ]; then
    echo "❌ Error: Configuration file './config/config.${ENV}.json' not found!"
    exit 1
fi

if [ "$CONFIRM" == "YES" ]; then
    echo "Starting containers with config.${ENV}.json..."
    docker compose up -d 
else
    echo "Skipping container startup. Confirmation not YES."
fi

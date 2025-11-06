#!/bin/bash

echo "Hello, world!"
echo "My first script is running."



if [ -z "$1" ]; then
    read -p "Enter environment name (local,dev,prod,staging) : " ENV
else
    ENV=$1
fi





# Check if config file exists
if [ ! -f "./config/config.${ENV}.json" ]; then
    echo "Error: Configuration file not found!"
    exit 1
fi

read -p "Do you want to continue ENV = $ENV enter(yes.y /no) : " CONFIRM

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

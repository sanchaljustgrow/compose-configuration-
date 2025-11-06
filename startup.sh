#!/bin/bash

# Get environment argument
ENV=$1

# If not provided as argument, ask for it
if [ -z "$ENV" ]; then
    read -p "Enter environment (e.g. dev, prod, staging): " ENV
fi

echo "You selected ENV = $ENV"

# Check if config file exists
CONFIG_FILE="./config/config.${ENV}.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file not found at $CONFIG_FILE!"
    exit 1
fi

# Ask for confirmation
read -p "Do you want to continue and start containers? (yes/y or no): " CONFIRM

if [[ "$CONFIRM" == "yes" || "$CONFIRM" == "y" ]]; then
    echo "Stopping existing containers..."
    docker compose down

    echo "Starting containers with configuration: $CONFIG_FILE"
    
    # Pass ENV variable dynamically into docker compose
    ENV=$ENV docker compose up -d

    if [ $? -eq 0 ]; then
        echo " Containers started successfully for environment: $ENV"
    else
        echo " Failed to start containers for environment: $ENV"
        exit 1
    fi
else
    echo "Operation cancelled."
    exit 0
fi

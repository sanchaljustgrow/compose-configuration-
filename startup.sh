#!/bin/bash



# --- Environment Selection ---
if [ -z "$1" ]; then
    read -p "Enter environment name (local/dev/prod/staging): " ENV
else
    ENV=$1
fi

# --- Validate Environment ---
if [ -z "$ENV" ]; then
    echo "Error: No environment specified."
    exit 1
fi

CONFIG_FILE="./config/config.${ENV}.json"

# --- Check Config File ---
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# --- Confirmation ---
read -p "Do you want to continue with ENV = $ENV? (yes/y or no): " CONFIRM

if [[ "$CONFIRM" == "yes" || "$CONFIRM" == "y" ]]; then
    echo "Stopping existing containers..."
    docker compose down

    echo "Starting containers with configuration: $ENV"

    
  

    
    docker compose up -d

    if [ $? -eq 0 ]; then
        echo "Containers started successfully for environment: $ENV"
    else
        echo "Error: Failed to start containers."
        exit 1
    fi
else
    echo "Operation cancelled by user."
    exit 0
fi

#!/bin/bash
echo "Hello, world!"
echo "My first script is running."
echo "Stopping existing containers..."
docker compose down


# You can take input from arguments passed to the script
echo "The first argument passed was: $1"

ENV=$1
echo "Really want to pass ENV =$1 "
if ENV == YES 

echo "Starting containers with new configuration..."
docker-compose up -d 



#!/bin/bash
echo "Hello, world!"
echo "My first script is running."

# You can take input from arguments passed to the script
echo "The first argument passed was: $1"

ENV=$1
docker-compose up -d

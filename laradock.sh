#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo "Missing arguments. Please specify 'up' or 'down'.";
    exit 1
fi

if [ "$1" == "up" ] ; then
    echo "Initializing Docker Sync";
    docker-sync start;
    echo "Initializing Docker Compose";
    docker-compose -f docker-compose.yml -f docker-compose.sync.yml $@;
elif [ "$1" == "down" ]; then
    echo "Stopping Docker Compose";
    docker-compose down;
    echo "Stopping Docker Sync";
    docker-sync stop;
else
    echo "Invalid arguments. Use 'up' or 'down'";
fi

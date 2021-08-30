#!/bin/bash

echo "Starting the container..."

DEVCON_SSH_AUTH_KEY=$(cat $(find ~/.ssh/id*.pub))
DEVCON="devcon"
TAG="polarbit/devcon"

# Remove devcon container, if it already exists
if [ "$(docker ps -qaf name=$DEVCON)" ]; then
        docker rm -f $DEVCON
	echo "Removed the previously created $DEVCON container."
fi

docker run -d \
	--name $DEVCON \
	--mount type=bind,source="$(pwd)"/init.vim,target=/home/dev/.config/nvim/init.vim \
	--mount type=bind,source="$(pwd)"/container-entrypoint.sh,target=/home/dev/container-entrypoint.sh \
	-p 22:22 \
	--env DEVCON_SSH_AUTH_KEY="$DEVCON_SSH_AUTH_KEY" \
	$TAG

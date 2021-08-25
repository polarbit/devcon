#!/bin/bash

echo "Starting the container..."

DEVCON_SSH_AUTH_KEY=$(cat $(find ~/.ssh/id*.pub))

docker run -d \
	--name devcon \
	--mount type=bind,source="$(pwd)"/init.vim,target=/home/dev/.config/init.vim \
	--mount type=bind,source="$(pwd)"/container-entrypoint.sh,target=/home/dev/container-entrypoint.sh \
	-p 22:22 \
	--env DEVCON_SSH_AUTH_KEY="$DEVCON_SSH_AUTH_KEY" \
	polarbit/devcon

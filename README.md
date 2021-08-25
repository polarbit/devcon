# devcon

Build **devcon** container
`docker build -t polarbit/devcon .

Start **devcon** container
`./run-container.sh

Stop **devcon** container
`docker rm -f devcon

Connect to **devcon** container
`docker exec -it devcon bash

*Container runs a ssh server. SSH key is retrieved from host file ~/.ssh/id*.pub
*SSH IP address of the container is host IP address, and port 22.


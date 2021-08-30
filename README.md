# devcon: Development Container

### Commands

* Build dev container
`./build-container`

* Start dev container
`./run-container.sh`
Note: This script will remove existing container, even if it is running.

* Stop dev container
`docker rm -f devcon`

* Connect to dev container
`docker exec -it devcon bash`

### Installed Components
- Go
- Node.Js
- NeoVim
- bash-it
- Other tools (tar, ssh, wget, git, net-tools)
- Check Dockerfile to see all installed tools

### Notes
* Container runs a ssh server. SSH key is retrieved from host file ~/.ssh/id*.pub
* When doing ssh, the IP address of the container is host's IP address, and port 22.

### To Do
- Install & configure common neovim plugins
- Install & configure Go neovim plugins
- Install Rust sdk & tools
- Make username and container name parametric
- Use make file

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
* neovim requires init.vim file line endings to be unix style. Fix that before running the container by using this command: `sed -i.bak 's/\r$//' init.vim`
  * See:[this](https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version) and [this](https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version) if u want to check details.


### To Do
- Put script into a foldel
- Install & configure common neovim plugins
- Install & configure Go neovim plugins
- Add ansible - Install tools after start using ansible rather then installing them on build time.
- Install Rust sdk & tools
- Try to support DIND, KIND, k3s/k0s
- Add cloud cli's
- Make username and container name parametric
- Use make file
- ...

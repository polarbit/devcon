FROM debian:buster
LABEL maintainer="Şafak Ulusoy <safakulusoy@gmail.com>"

SHELL ["/bin/bash", "-c"] 

# Install common tools & utilities
RUN apt -y update && apt -y upgrade && apt install -y \
	apt-transport-https \
	software-properties-common \
    	build-essential \
	ca-certificates \
	libssl-dev \
	net-tools \
	openssh-client \
    	lsb-release \
	gnupg2 \
	man-db \
	sudo \
	ssh \
	wget \
	curl \
	git \
	rsync \
	htop \
	less \
	jq

# Create  volume
VOLUME /home/dev
WORKDIR /home/dev

# Install nvm & node.js
ENV	NVM_DIR /usr/local/.nvm
ENV 	NODE_VERSION 16.7.0
ENV 	NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV 	PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN	mkdir $NVM_DIR \
	&& wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
	&& . $NVM_DIR/nvm.sh \
	&& nvm install $NODE_VERSION --latest-npm

# Install Go-lang
ENV 	PATH	/usr/local/go/bin:$PATH
RUN	wget -q https://golang.org/dl/go1.17.linux-amd64.tar.gz \
	&& rm -rf /usr/local/go \
	&& tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz \
	&& rm go1.17.linux-amd64.tar.gz


# Add user and ugroup 'dev' with id 1182
RUN addgroup --gid 1182 dev \
	&& adduser --uid 1182 --gid 1182 --shell /bin/bash --disabled-password dev \
	&& chown -R dev:dev /home/dev/ \
	&& echo 'dev  ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers

# Change to non-root privilage
USER dev

# Install and configure bash-it
RUN	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it \
	&& ~/.bash_it/install.sh --silent

# Install and configure neovim + plugins
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
	&& chmod u+x nvim.appimage \
	&& ./nvim.appimage --appimage-extract \
	&& rm nvim.appimage \
	&& mv squashfs-root .nvim-squashfs-root \
	&& sudo ln -s ~/.nvim-squashfs-root/AppRun /usr/bin/nvim \
	&& mkdir -p /home/dev/.config/nvim 

# Expose SSH port
EXPOSE 22

ENTRYPOINT ["/home/dev/container-entrypoint.sh"]

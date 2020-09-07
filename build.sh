#!/bin/bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

build_packages=(
	apt-transport-https
	lsb-release
)

install_packages=(
	docker-ce
	jq
	make
	sudo
	zip
)

apt-get update

# Install packages required for building the image
apt-get install -y --no-install-recommends ${build_packages[@]}

# Activate docker repo
curl -sSfL https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -sc) stable" >/etc/apt/sources.list.d/docker.list
apt-get update

# Install packages to stay in the image
apt-get install -y --no-install-recommends ${install_packages[@]}

# Allow jenkins to use `sudo` and docker
echo "jenkins ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers.d/jenkins
usermod -a -G docker jenkins

# Install Vault for global usage
VAULT_VERSION=$(curl -sSfL "https://lv.luzifer.io/catalog-api/vault/latest.txt?p=version")
curl -sSfLo vault.zip "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
unzip vault.zip
rm vault.zip
install -Dm0755 -t /usr/local/bin vault

# Cleanup
apt-get purge -y ${build_packages[@]}
apt-get autoremove --purge -y
rm -rf /var/lib/apt/lists/*

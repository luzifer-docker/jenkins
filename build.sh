#!/bin/bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update

# Install helper utils
apt-get install -y --no-install-recommends \
	apt-transport-https \
	lsb-release \
	sudo

# Install docker-ce
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9DC858229FC7DD38854AE2D88D81803C0EBFCD88

echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -sc) stable" >/etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y --no-install-recommends docker-ce

# Allow jenkins to use `sudo` and docker
echo "jenkins ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers.d/jenkins
usermod -a -G docker jenkins

# Cleanup
apt-get purge -y lsb-release
apt-get autoremove --purge -y
rm -rf /var/lib/apt/lists/*

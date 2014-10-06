# luzifer/dockerproxy Dockerfile

This repository contains **Dockerfile** of [Jenkins](http://jenkins-ci.org/) advanced with Docker build support for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/luzifer/jenkins/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

## Base Docker Image

- [jenkins](https://registry.hub.docker.com/_/jenkins/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/luzifer/jenkins/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull luzifer/jenkins`

## Usage

To launch it, just type:

```
docker run -d -p 8080:8080 luzifer/jenkins
```

Or look at the original [Jenkins Readme](https://registry.hub.docker.com/_/jenkins/) for further usages and data preservation.

Easy!

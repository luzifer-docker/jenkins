# luzifer-docker / jenkins

This container contains a Jenkins CI server based on the jenkins:lts version enhanced with Docker support inside the container.

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/jenkins .

## Execute jenkins
$ docker run -d -p 8080:8080 luzifer/jenkins
```

For more documentation see the [README of the upstream Jenkins repository](https://github.com/jenkinsci/docker/blob/master/README.md).

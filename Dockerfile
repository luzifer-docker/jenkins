FROM jenkins/jenkins:2.528.1-lts-jdk21@sha256:8f8bb2eb9c1e8e25abf4d0dbcf5ebc19a2cd12788ad728260c48315fcac2c6a6
USER root

ARG VAULT_VERSION=1.20.4 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

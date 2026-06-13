FROM jenkins/jenkins:2.555.3-lts-jdk21@sha256:e82bbdcffb6361c081ac66bbdcd5802a299b3631c78c3be04a0a91c7f952fff3
USER root

ARG VAULT_VERSION=2.0.2 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

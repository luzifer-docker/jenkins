FROM jenkins/jenkins:2.516.3-lts-jdk21@sha256:ace160331258aeff24581038e63ec5b5e8e969cebc9582a5ac7f0ed9fd20043b
USER root

ARG VAULT_VERSION=1.20.4 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

FROM jenkins/jenkins:2.541.3-lts-jdk21@sha256:c4098086090ca98491d4bf66182f5e3b015a8232f2acf2df209a212a5801aa8e
USER root

ARG VAULT_VERSION=1.21.4 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

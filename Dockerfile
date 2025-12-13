FROM jenkins/jenkins:2.528.3-lts-jdk21@sha256:1e407df1a9bcb122cc4d71d4ce44d2e3b2be31af004c157453a939f13ae691c7
USER root

ARG VAULT_VERSION=1.21.1 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

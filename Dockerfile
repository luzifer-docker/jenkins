FROM jenkins/jenkins:2.516.1-lts-jdk21@sha256:0e66af38c9272490ba18757d5d4d41e4ac2160278ae40b69d6da9b5adbe98794
USER root

ARG VAULT_VERSION=1.20.1 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

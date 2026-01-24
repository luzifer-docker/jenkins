FROM jenkins/jenkins:2.541.1-lts-jdk21@sha256:d1ea795c6facd7f549a21c40e5e43ffcc5fbc5f48683d9b24750f26e8079d772
USER root

ARG VAULT_VERSION=1.21.2 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

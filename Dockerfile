FROM jenkins/jenkins:2.555.1-lts-jdk21@sha256:7004d07dbcdc5439fdad8853acdb029c5e3ab7a3d8190184fbf89bec66786c02
USER root

ARG VAULT_VERSION=2.0.0 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

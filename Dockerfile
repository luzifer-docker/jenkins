FROM jenkins/jenkins:2.516.1-lts-jdk21
USER root

ARG VAULT_VERSION=1.20.0 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

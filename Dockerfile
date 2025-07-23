FROM jenkins/jenkins:2.516.1-lts-jdk21
USER root

ARG VAULT_VERSION=1.19.5 # renovate: packageName=vault

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

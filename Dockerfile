FROM jenkins/jenkins:2.541.2-lts-jdk21@sha256:23b84d1066dbe69f2c17288c83ac071127092d726f14b3b80444d868468619c7
USER root

ARG VAULT_VERSION=1.21.2 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

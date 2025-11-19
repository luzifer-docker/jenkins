FROM jenkins/jenkins:2.528.2-lts-jdk21@sha256:7b1c378278279c8688efd6168c25a1c2723a6bd6f0420beb5ccefabee3cc3bb1
USER root

ARG VAULT_VERSION=1.21.1 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

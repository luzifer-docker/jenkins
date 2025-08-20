FROM jenkins/jenkins:2.516.2-lts-jdk21@sha256:4b4a5eb0f69af5e48c9f55c0aa58da5d098eae1a4156d1e540f2f35c933b8695
USER root

ARG VAULT_VERSION=1.20.2 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

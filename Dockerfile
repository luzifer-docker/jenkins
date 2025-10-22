FROM jenkins/jenkins:2.528.1-lts-jdk21@sha256:f2519b99350faeaaeef30e3b8695cd6261a5d571c859ec37c7ce47e5a241458d
USER root

ARG VAULT_VERSION=1.21.0 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

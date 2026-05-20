FROM jenkins/jenkins:2.555.2-lts-jdk21@sha256:01c992ffef29dcf41c7164e8c16285c657c2368c4943dda8d68c93fdf54447d5
USER root

ARG VAULT_VERSION=2.0.1 # renovate: packageName=vault/latest

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

FROM jenkins/jenkins:2.289.1
USER root

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

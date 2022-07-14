FROM jenkins/jenkins:2.346.2
USER root

COPY build.sh /usr/local/bin/build.sh
RUN /usr/local/bin/build.sh

USER jenkins

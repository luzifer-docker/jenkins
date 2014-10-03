FROM jenkins
USER root
RUN apt-get install -y docker.io
USER jenkins

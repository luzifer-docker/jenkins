#!/bin/bash

set -e
set -o pipefail

HOST_OS=$(uname -s)

### ---- ###

echo "Switch back to master"
git checkout master
git reset --hard origin/master

### ---- ###

if ! [ -e jq ]; then
  echo "Loading local copy of jq-1.5"

  case ${HOST_OS} in
    Linux)
      curl -sSLfo ./jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
      ;;
    Darwin)
      curl -sSLfo ./jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-osx-amd64
      ;;
    *)
      echo "/!\\ Unable to download jq for ${HOST_OS}"
      exit 1
      ;;
  esac

  chmod +x jq
fi

### ---- ###

echo "Fetching latest version..."
LATEST=$(curl -sSLf https://index.docker.io/v1/repositories/jenkins/tags | ./jq -r '.[].name' | grep "^[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?$" | sort -Vr | head -n1)

echo "Found version ${LATEST}, patching..."
sed -i "s/^FROM.*$/FROM jenkins:${LATEST}/" Dockerfile

echo "Checking for changes..."
git diff --exit-code && exit 0

echo "Testing build..."
docker build .

echo "Updating repository..."
git add Dockerfile
git -c user.name='travis' -c user.email='travis' \
  commit -m "Jenkins ${LATEST}"
git tag ${LATEST}

git push -q https://${GH_USER}:${GH_TOKEN}@github.com/Luzifer/docker-jenkins.git master --tags

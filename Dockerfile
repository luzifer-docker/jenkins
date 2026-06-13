FROM jenkins/jenkins:2.555.3-lts@sha256:e82bbdcffb6361c081ac66bbdcd5802a299b3631c78c3be04a0a91c7f952fff3

USER root

ARG VAULT_VERSION=2.0.2 # renovate: packageName=hashicorp/vault datasource=github-releases

RUN <<-EOF
  set -euxo pipefail

  export DEBIAN_FRONTEND=noninteractive

  # Activate docker repo
  curl -sSfL -o /etc/apt/keyrings/docker.asc https://download.docker.com/linux/debian/gpg
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
    install -Dm0644 /dev/stdin /etc/apt/sources.list.d/docker.list
  apt-get update

  # Install packages to stay in the image
  apt-get install -y --no-install-recommends \
    docker-buildx-plugin \
    docker-ce \
    jq \
    locales \
    make \
    sudo \
    zip

  # Install en_US locale
  sed -Ei 's/# (en_US.UTF-8.*)/\1/' /etc/locale.gen
  locale-gen

  # Allow jenkins to use `sudo` and docker
  echo "jenkins ALL=(ALL) NOPASSWD: ALL" |
    install -Dm0644 /dev/stdin /etc/sudoers.d/jenkins
  usermod -a -G docker jenkins

  # Install Vault for global usage
  tmpdir="$(mktemp -d)"
  curl -sSfLo "${tmpdir}/vault.zip" "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
  unzip "${tmpdir}/vault.zip" -d "${tmpdir}"
  install -Dm0755 -t /usr/local/bin "${tmpdir}/vault"
  rm -rf "${tmpdir}"

  # Cleanup
  apt-get autoremove --purge -y
  apt-get clean -y
  rm -rf /var/lib/apt/lists/*
EOF

USER jenkins

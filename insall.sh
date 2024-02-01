#!/bin/bash

set -exuo pipefail

nodejs_version="20.9.0"

# https://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="f0919f092fbf74544438907fa083c21e76b2d7a4bc287f0607ada1553ef16f60"

nodejs_url="https://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

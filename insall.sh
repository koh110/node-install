#!/bin/bash

set -exuo pipefail

nodejs_version="24.5.0"

# https://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="369f2a3668dde7e324697040fafdcf442fd198b8c102317145417b3c83a9794a"

nodejs_url="https://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

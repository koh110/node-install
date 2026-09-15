#!/bin/bash

set -exuo pipefail

nodejs_version="26.8.2"

# https://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="badb3fe6a61b85e1352ca6564dc56b8b7bd5ecd5c474c52acc21dd0cdd586f35"

nodejs_url="https://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

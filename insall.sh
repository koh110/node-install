#!/bin/bash

set -exuo pipefail

nodejs_version="10.9.0"

# http://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="d061760884e4705adfc858eb669c44eb66cd57e8cdf6d5d57a190e76723af416"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

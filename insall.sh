#!/bin/bash

set -exuo pipefail

nodejs_version="12.9.1"

# http://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="5488e9d9e860eb344726aabdc8f90d09e36602da38da3d16a7ee852fd9fbd91f"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

#!/bin/bash

set -exuo pipefail

nodejs_version="18.15.0"

# https://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="b298a73a9fc07badfa9e4a2e86ed48824fc9201327cdc43e3f3f58b273c535e7"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

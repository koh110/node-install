#!/bin/bash

set -exuo pipefail

nodejs_version="14.15.0"

# http://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="085c3b3c262fa58cbaad4f2f62eb6cea943fbbf3492ba457b5efa8f27969e04a"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

#!/bin/bash

set -exuo pipefail

nodejs_version="14.14.0"

# http://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="438cc26853b17f4aad79fb441f6dbcc1128aff9ffcd0c132ae044259f96ff6a8"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

#!/bin/bash

set -exuo pipefail

nodejs_version="26.12.1"

# https://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="0fd1eb7770598f52a21995edf6ed35fc690400fa437c2386af329519e9143132"

nodejs_url="https://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

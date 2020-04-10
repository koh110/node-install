#!/bin/bash

set -exuo pipefail

nodejs_version="12.16.2"

# http://nodejs.org/dist/v${nodejs_version}/SHASUMS256.txt
nodejs_checksum="ffc92b8d9f53a10a2a734c93e78a3be74af7b0034bddd6f034a700c430eb94c1"

nodejs_url="http://nodejs.org/dist/v${nodejs_version}/node-v${nodejs_version}-linux-x64.tar.gz"

curl -Ls "${nodejs_url}" -o "node-v${nodejs_version}-linux-x64.tar.gz"

# checksum
sha256sum -c <<<"${nodejs_checksum} node-v${nodejs_version}-linux-x64.tar.gz" | grep OK

# install
sudo tar -C /usr/local --strip-components 1 -xzf node-v${nodejs_version}-linux-x64.tar.gz

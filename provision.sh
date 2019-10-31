#!/bin/bash
set -e
set -u
set -o pipefail

# this is what runs in ci template once the rhel8-fips-enabled instance is up
mkdir -p go/src/github.com/openshift
cd go/src/github.com/openshift
git clone https://github.com/openshift/origin
cd origin
TIMEOUT=180s make test-unit

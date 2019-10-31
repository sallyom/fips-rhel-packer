#!/bin/bash
set -e
set -u
set -o pipefail

PREFIX=https://lsm5.fedorapeople.org/ci-rpms/
sudo sed -i 's/sslverify=1/sslverify=0/g' /etc/yum.repos.d/*
sudo dnf install -y --allowerasing "${PREFIX}golang-src-1.12.12-4.module+el8.1.0+4559+87297aa9.noarch.rpm" \
                    "${PREFIX}golang-bin-1.12.12-4.module+el8.1.0+4559+87297aa9.x86_64.rpm" \
                    "${PREFIX}golang-1.12.12-4.module+el8.1.0+4559+87297aa9.x86_64.rpm" \
                    "${PREFIX}crypto-policies-20190807-1.git9b1477b.el8.noarch.rpm" \
                    "${PREFIX}openssh-8.0p1-3.el8.x86_64.rpm" \
                    "${PREFIX}openssh-clients-8.0p1-3.el8.x86_64.rpm" \
                    "${PREFIX}openssh-server-8.0p1-3.el8.x86_64.rpm" \
                    "${PREFIX}openssl-1.1.1c-2.el8.x86_64.rpm" \
                    "${PREFIX}openssl-devel-1.1.1c-2.el8.x86_64.rpm" \
                    "${PREFIX}openssl-libs-1.1.1c-2.el8.x86_64.rpm" \
                    "${PREFIX}openssl-pkcs11-0.4.8-2.el8.x86_64.rpm"

sudo dnf install -y make gcc zip mercurial jq git
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export OS_OUTPUT_GOPATH=1
sudo fips-mode-setup --enable
echo "fips-mode-setup --enable completed"

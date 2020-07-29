#!/bin/bash

VMWARE_VERSION=workstation-`vmware -v | cut -d' ' -f3`
TMP_FOLDER=/tmp/vmware-host-modules
rm -fdr $TMP_FOLDER
git clone https://github.com/mkubecek/vmware-host-modules $TMP_FOLDER
cd $TMP_FOLDER
git checkout $VMWARE_VERSION
git fetch
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/vmware/lib/libz.so.1/libz.so.1
rm -fdr $TMP_FOLDER
systemctl restart vmware

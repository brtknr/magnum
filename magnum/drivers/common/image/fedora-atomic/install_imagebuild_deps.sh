#!/bin/bash

# This script installs all needed dependencies to generate
# images using diskimage-builder. Please not it only has been
# tested on Ubuntu Trusty

if [ ${DIB_DEBUG_TRACE:-0} -gt 0 ]; then
    set -x
fi
set -eux
set -o pipefail

sudo apt-get update || true
sudo apt-get install -y \
    debootstrap \
    kpartx \
    qemu-utils \
    python-dev \
    build-essential \
    python-pip \
    python-lzma \
    yum \
    yum-utils \
    python-yaml \
    curl

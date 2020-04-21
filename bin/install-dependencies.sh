#!/bin/bash

set -euo pipefail

apt-get update
apt-get install -y libgit2-dev cmake
rm -rf /var/lib/apt/lists/*

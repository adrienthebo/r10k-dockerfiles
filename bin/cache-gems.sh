#!/bin/bash

set -euo pipefail

cd /cache/
sed -i \
  -e '/require/d' \
  -e 's/R10K::VERSION/"0.0.0"/' \
  -e '/s.files/s/=.*/= []/' \
  r10k.gemspec

bundle install --system
rm -rf /cache

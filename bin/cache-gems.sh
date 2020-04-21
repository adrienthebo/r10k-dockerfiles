#!/bin/bash

BUNDLE="${1:-bundle}"

set -euo pipefail

cd /cache/
sed -i \
  -e '/require/d' \
  -e 's/R10K::VERSION/"0.0.0"/' \
  -e '/s.files/s/=.*/= []/' \
  r10k.gemspec

$BUNDLE install --system
rm -rf /cache

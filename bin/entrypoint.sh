#!/bin/bash

set -x

if [[ -f "/local/Gemfile.lock" ]]; then
  bundle update --bundler --gemfile "/local/Gemfile.lock"
elif [[ -f "/local/Gemfile" ]]; then
  bundle install --gemfile "/local/Gemfile"
fi

exec "$@"

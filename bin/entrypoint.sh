#!/bin/bash

set -x
BUNDLE="${1:-bundle}"

if [[ $1 =~ "jruby" ]]; then
  shift
fi

if [[ -f "/local/Gemfile.lock" ]]; then
  $BUNDLE update --bundler --gemfile "/local/Gemfile"
elif [[ -f "/local/Gemfile" ]]; then
  $BUNDLE install --gemfile "/local/Gemfile"
fi

exec "$@"

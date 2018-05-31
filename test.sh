#!/usr/bin/env sh

if [ "$(uname)" == "Darwin" ]; then
  set -eurx
else
  set -eux
fi

swift test

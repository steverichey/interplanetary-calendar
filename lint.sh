#!/usr/bin/env sh

if [ "$(uname)" = "Darwin" ]; then
  set -eurx
else
  set -eux
fi

if [ "$(uname)" = "Darwin" ]; then
  swiftlint
else
  ./swiftlint
fi

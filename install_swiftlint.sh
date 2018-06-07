#!/usr/bin/env sh

if [ "$(uname)" = "Darwin" ]; then
  set -eurx
else
  set -eux
fi

if [ "$(uname)" = "Darwin" ]; then
  brew install swiftlint
else
  curl -O -J -L \
    https://github.com/realm/SwiftLint/releases/download/0.25.1/portable_swiftlint.zip

  unzip portable_swiftlint.zip
  chmod +x swiftlint
fi

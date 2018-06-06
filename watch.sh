#!/usr/bin/env sh

if [ "$(uname)" = "Darwin" ]; then
  set -eurx
else
  set -eux
fi

while :; do
  clear
  date
  sh -c "$1"
  sleep ${2:-1}
done

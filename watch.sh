#!/usr/bin/env sh

set -eurx

while :; do
  clear
  date
  sh -c "$1"
  sleep ${2:-1}
done

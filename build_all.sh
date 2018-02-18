#!/bin/bash

for i in [0-9]*/; do
  echo "$i"
  ./build_one.sh "$i"
  echo
done

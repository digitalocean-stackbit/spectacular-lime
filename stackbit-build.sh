#!/usr/bin/env bash

set -e
set -o pipefail
set -v

echo "stackbit-build.sh: start build"

# build site
go install --tags extended
hugo

echo "stackbit-build.sh: finished build"

#!/usr/bin/env bash

set -e
set -o pipefail
set -v

echo "stackbit-build.sh: start build"
hugo_versions=(
  "0.80.0"
  "0.48"
)

mkdir -p hugo-bin
cd hugo-bin

for version in ${hugo_versions[@]}; do
    file_name="hugo_extended_${version}_Linux-64bit.tar.gz"
    version_url="https://github.com/gohugoio/hugo/releases/download/v${version}/${file_name}"
    target_dir="v${version}"
    echo "downloading hugo version ${version} from ${version_url} into hugo-bin/${target_dir}"
#    curl -OL $version_url
    wget $version_url --quiet
    mkdir -p $target_dir
    tar -xf $file_name -C $target_dir
    rm $file_name
    echo "finished downloading hugo version ${version}"
done

hugo

echo "stackbit-build.sh: finished build"

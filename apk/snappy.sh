#!/usr/bin/env bash

set -xe

apk add --update

apk add --no-cache --virtual .build-deps \
	git \
	cmake \
	build-base

git clone https://github.com/google/snappy /tmp/snappy

mkdir -p /tmp/snappy/build

cd /tmp/snappy/build

cmake -DCMAKE_BUILD_TYPE=Release ..

cmake --jobs="$(nproc)" --build .

make install

apk del --purge .build-deps

rm -rf /tmp/* /var/cache/apk/*

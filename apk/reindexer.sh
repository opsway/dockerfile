#!/usr/bin/env bash

set -xe

apk add --update

apk add --no-cache --virtual .build-deps \
	g++ \
	snappy-dev \
	libexecinfo-dev \
	make \
	cmake \
	unzip \
	git \
	curl

git clone https://github.com/Restream/reindexer /tmp/reindexer

mkdir -p /tmp/reindexer/build

cd /tmp/reindexer/build

cmake -DCMAKE_BUILD_TYPE=Release ..

make --jobs="$(nproc)" reindexer

make install

apk del --purge .build-deps

rm -rf /tmp/* /var/cache/apk/*

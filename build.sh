#!/bin/sh

mkdir -p build
rm -fr build/*
composer install --prefer-dist --no-dev
cp index.php build
cp -a vendor build
cp -a src build
export VERSION=`git rev-list --tags --max-count=1 | xargs git describe --tags`
7z a -tzip shariff-backend-php-${VERSION}.zip ./build/* && 7z a -ttar shariff-backend-php-${VERSION}.tar ./build/* && 7z a shariff-backend-php-${VERSION}.tar.gz shariff-backend-php-${VERSION}.tar

#!/usr/bin/env bash

set -ex

rm -fr .cache
mkdir -p .cache

curl https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -o .cache/font.zip
unzip .cache/font.zip -d .cache/

mkdir -p "public/Noto Sans CJK JP Bold"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Bold.otf "public/Noto Sans CJK JP Bold"

mkdir -p "public/Noto Sans CJK JP Regular"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Regular.otf "public/Noto Sans CJK JP Regular"

mkdir -p "Noto Sans CJK JP Light"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Light.otf "public/Noto Sans CJK JP Light"

rm -fr "public/Noto Sans Regular" && cp -fr "public/Noto Sans CJK JP Regular" "public/Noto Sans Regular"
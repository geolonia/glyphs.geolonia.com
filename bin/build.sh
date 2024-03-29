#!/usr/bin/env bash

set -ex

rm -fr .cache
mkdir -p .cache

curl https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -o .cache/font.zip
curl -L https://github.com/geolonia/go-noto-universal/releases/download/5.1-geolonia-v1/GoNotoCurrent.ttf -o .cache/GoNotoCurrent.ttf

unzip .cache/font.zip -d .cache/

mkdir -p "public/Noto Sans CJK JP Bold"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Bold.otf "public/Noto Sans CJK JP Bold"

mkdir -p "public/Noto Sans CJK JP Regular"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Regular.otf "public/Noto Sans CJK JP Regular"

mkdir -p "public/Noto Sans CJK JP Light"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Light.otf "public/Noto Sans CJK JP Light"

mkdir -p "public/Noto Sans Universal Regular"
$(npm bin)/build-glyphs .cache/GoNotoCurrent.ttf "public/Noto Sans Universal Regular"

rm -fr "public/Noto Sans Regular" && cp -fr "public/Noto Sans CJK JP Regular" "public/Noto Sans Regular"

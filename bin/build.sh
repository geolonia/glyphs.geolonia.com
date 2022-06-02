#!/usr/bin/env bash

set -ex

rm -fr .cache
mkdir -p .cache

curl https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -o .cache/NotoSansCJKjp.zip
curl -L https://github.com/geolonia/go-noto-universal/releases/download/v5.1-geolonia/GoNotoCurrent.ttf -o .cache/GoNotoCurrent.ttf

unzip .cache/NotoSansCJKjp.zip -d .cache/

mkdir -p "public/Noto Sans CJK JP Bold"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Bold.otf "public/Noto Sans CJK JP Bold"

mkdir -p "public/Noto Sans CJK JP Light"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Light.otf "public/Noto Sans CJK JP Light"

mkdir -p "public/Noto Sans CJK JP Regular"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Regular.otf "public/Noto Sans CJK JP Regular"

mkdir -p "public/Noto Sans Regular"
$(npm bin)/build-glyphs .cache/GoNotoCurrent.ttf "public/Noto Sans Regular"

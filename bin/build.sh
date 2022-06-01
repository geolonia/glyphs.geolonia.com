#!/usr/bin/env bash

set -ex

rm -fr .cache
mkdir -p .cache

curl https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -o .cache/NotoSansCJKjp.zip
curl -L https://github.com/satbyy/go-noto-universal/releases/download/v5.1/GoNotoCurrent.ttf -o .cache/GoNotoCurrent.ttf

unzip .cache/NotoSansCJKjp.zip -d .cache/

mkdir -p "public/Noto Sans CJK JP Bold"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Bold.otf "public/Noto Sans CJK JP Bold"

mkdir -p "public/Noto Sans CJK JP Light"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Light.otf "public/Noto Sans CJK JP Light"

mkdir -p "public/Noto Sans CJK JP Regular"
$(npm bin)/build-glyphs .cache/NotoSansCJKjp-Regular.otf "public/Noto Sans CJK JP Regular"

mkdir -p "public/Noto Sans Regular"
$(npm bin)/build-glyphs .cache/GoNotoCurrent.ttf "public/Noto Sans Regular"

# Add Hangul (U+AC00 to U+D7FF)
hangul_codepoints=(
  "44032-44287"
  "44288-44543"
  "44544-44799"
  "44800-45055"
  "45056-45311"
  "45312-45567"
  "45568-45823"
  "45824-46079"
  "46080-46335"
  "46336-46591"
  "46592-46847"
  "46848-47103"
  "47104-47359"
  "47360-47615"
  "47616-47871"
  "47872-48127"
  "48128-48383"
  "48384-48639"
  "48640-48895"
  "48896-49151"
  "49152-49407"
  "49408-49663"
  "49664-49919"
  "49920-50175"
  "50176-50431"
  "50432-50687"
  "50688-50943"
  "50944-51199"
  "51200-51455"
  "51456-51711"
  "51712-51967"
  "51968-52223"
  "52224-52479"
  "52480-52735"
  "52736-52991"
  "52992-53247"
  "53248-53503"
  "53504-53759"
  "53760-54015"
  "54016-54271"
  "54272-54527"
  "54528-54783"
  "54784-55039"
  "55040-55295"
)

for codepoint in "${hangul_codepoints[@]}"
do
  cp "public/Noto Sans CJK JP Regular/$codepoint.pbf" "public/Noto Sans Regular"
done




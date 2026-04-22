# glyphs.geolonia.com

このサーバーは、 Geolonia Maps または MapLibre GL JS で日本語を表示するためのフォントサーバーです。

`style.json` の `glyphs` の値に以下の URL を指定することで利用可能です。

```
https://glyphs.geolonia.com/{fontstack}/{range}.pbf
```

ドキュメント: [https://maplibre.org/maplibre-gl-js-docs/style-spec/root/#glyphs](https://maplibre.org/maplibre-gl-js-docs/style-spec/root/#glyphs)

## フォントについて

このサーバーでは以下のフォントを提供しています。

* Noto Sans CJK JP Bold
* Noto Sans CJK JP Light
* Noto Sans CJK JP Regular
* Noto Sans Regular
* Noto Sans Universal Regular

`style.json` で `text-font: ['Noto Sans CJK JP Regular']` のようにご利用ください。

* 便宜上の問題により、`Noto Sans Regular` は `Noto Sans CJK JP Regular` のエイリアスで、日本語のフォントも含まれます。
* `Noto Sans Universal Regular` は 各国の文字に対応するために、 [GoNotoCurrent.ttf](https://github.com/satbyy/go-noto-universal/releases/tag/v5.1#:~:text=26%20days%20ago-,GoNotoCurrent.ttf,-14.1%20MB)（詳細については、[go-noto-universal](https://github.com/satbyy/go-noto-universal) を参照ください）と Noto Sans CJK JP Regular の ハングル `U+AC00 to U+D7FF` を使用しており、80種類以上のフォントを含みます。
* 本サーバーはスタティックなホスティングのため `['Noto Sans CJK JP Regular', 'Noto Sans CJK JP Light']` のように複数指定された場合には、404 のエラーを返します。

## MapLibre GL JS における日本語の表示について

現実的には、`maplibregl.Map()` で以下のように指定することで、日本語が含まれないフォントを指定しても日本語が表示されます。

```
const map = new maplibregl.Map({
  container: 'map',
  style: './style.json',
  attributionControl: true,
  hash: true,
  localIdeographFontFamily: ['sans-serif'] // 日本語を表示するための設定
});
```

この方法は、日本語フォントをダウンロードしないため、表示速度がはやくなりますので、この設定を入れておくことをおすすめします。
ただし、[Maputnik](https://maputnik.github.io/) でスタイルのカスタマイズをする際に、Maputnikに上述の設定が入っていないため日本語が表示されません。

したがって、念の為程度にこのサイトで提供している日本語フォントを設定しておくと良いかもしれません。

## カスタマイズ

MapLibre GL / Geolonia Maps で標準ではないフォントを使う場合は、このレポジトリーを複製し、 `build.sh` に下記のような記述を追加してください。

```
mkdir -p "public/XYZ"
$(npm bin)/build-glyphs "XYZへのパス.ttf" "public/XYZ"
```

`XYZ` をフォント名と置き換えてください。このツールは OTF または TTF しか対応していないので、 WOFF などの他のフォーマットを利用する場合は先に変換してください。

`public` に入っているディレクトリをHTTPサーバーにアップロードして [style.json に指定すると使えるようになります](https://maplibre.org/maplibre-gl-js-docs/style-spec/root/#glyphs)。

## ビルド

[`node-fontnik`](https://github.com/mapbox/node-fontnik) を使ってTTF/OTFファイルを変換します。 nodejs v12 をお勧めします。

```
$ npm install
$ npm run build-font # フォントをビルド
$ npm run build-html # HTML ページをビルド
```

プルリクエストや Issue はいつでも歓迎します。

[https://github.com/geolonia/glyphs.geolonia.com](https://github.com/geolonia/glyphs.geolonia.com)

## 免責事項

* 本サーバーは、日本における Mapbox GL JS の開発コミュニティの皆さんのお役に立つために、無償でだれでもご利用可能とさせていただきますが、予告なくサービスを停止させていただくこともございますのであらかじめご了承ください。

## ライセンス

* このリポジトリで使用されているフォントは、Google の [Noto Fonts](https://www.google.com/get/noto/) で、[SIL Open Font License 1.1](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL) によって提供されています。
* フォント以外のソースコードは MIT ライセンスとします。

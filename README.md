# glyphs.tilecloud.io

このサーバーは、Mapbox GL JS で日本語を表示するためのフォントサーバーです。

`style.json` の `glyphs` の値に以下の URL を指定することで利用可能です。

```
https://glyphs.tilecloud.io/{fontstack}/{range}.pbf
```

ドキュメント: https://www.mapbox.com/mapbox-gl-js/style-spec/#root-glyphs

## フォントについて

このサーバーでは以下のフォントを提供しています。

* Noto Sans CJK JP Bold
* Noto Sans CJK JP Light
* Noto Sans CJK JP Regular
* Noto Sans Regular

`style.json` で `text-font: ['Noto Sans CJK JP Regular']` のようにご利用ください。

便宜上の問題により、`Noto Sans Regular` は `Noto Sans CJK JP Regular` のエイリアスで、日本語のフォントも含まれます。

## ビルド

```
$ npm install
$ npm run build
```

プルリクエストや Issue はいつでも歓迎します。

https://github.com/tilecloud/glyphs.tilecloud.io

## 免責事項

* 本サーバーは、日本における Mapbox GL JS の開発コミュニティの皆さんのお役に立つために、無償でだれでもご利用可能とさせていただきますが、予告なくサービスを停止させていただくこともございますのであらかじめご了承ください。

## ライセンス

* このリポジトリで使用されているフォントは、Google の [Noto Fonts](https://www.google.com/get/noto/) で、[SIL Open Font License 1.1](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL) によって提供されています。
* フォント以外のソースコードは MIT ライセンスとします。

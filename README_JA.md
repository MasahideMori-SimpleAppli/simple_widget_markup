# simple_widget_markup

日本語版の解説です。

## 概要
このパッケージはSimple Widget Markup Language(SpWML)の実用的なFlutter(Dart)実装です。  
SpWMLは、Widget（一定の要素のかたまり）を手軽に扱えるようにするためのマークアップ言語です。  
このフォーマットで出力されたファイルは拡張子.spwmlを持ちます。  
この仕様は主にアプリケーション中の新着情報配信時などに、簡単かつ軽量に内容を記述出来ることを目的としています。  
また、習得の容易さにも重点を置いています。  

## 利用方法
### クイックスタート
以下のサイトでどのように動作するのか試すことが出来ます。  
[SpWMLエディター](https://simple-widget-markup-editor.web.app/)

### 記載方法
基本形は
```
(type, パラメータ1:値1, パラメータ2:値2,...)テキスト
```
コメントは
```
// コメントのテキスト
```
という単純な作りになっています。  
typeは必須で、パラメータは省略可能です。  

現在、typeは以下の通りです。  

- コンテナ系（コンテナは要素の入れ物です）
  - 内部が１要素のみ
    - block(基本コンテナ。置き換え用の仮配置にも利用できる)
    - scroll(内部がスクロールできるコンテナ)
  - 内部が複数要素
    - col(内部が行のコンテナ)
    - row(内部が列のコンテナ)
    - span(内部がtextまたはhrefのコンテナ。行内要素にそれぞれ違うパラメータが設定出来る)
    - stack(内部を重ね合わせられるコンテナ)
    - wrap(内部が所謂グリッドビューになるコンテナ)
    - expTile(内部が所謂アコーディオンメニューになるコンテナ)
    - dropdownBtn(内部がドロップダウンメニュー要素のコンテナ。コールバックはプログラムコード側からDropdownBtnElement.setCallbackで設定します)
    - popupMenuBtn(内部がポップアップメニュー要素のコンテナ。コールバックはプログラムコード側からPopupMenuBtnElement.setCallbackで設定します)

- コンテナ内要素
  - text系
    - h1-h6(ヘッダテキスト。h1-h6の６種類)
    - subtitle1
    - subtitle2
    - body1(textと書いても動く。通常テキスト)
    - body2
    - caption
    - overline(線の上に表示するためのテキスト)
    - menu(dropdownBtnおよびpopupMenuBtnのための、マージン等が適用されていないプレーンなテキスト)
  - text以外
    - img(画像。テキスト部分にURLまたはbase64画像を記載する)
    - href(テキスト部分にハイパーリンクを記載する。altパラメータで見た目を変えられる)
    - line(水平区切り)
    - vline(垂直区切り)

現在、パラメータには以下があります。  

- 全てで有効
  - height
  - width
  - bgColor(#AARRGGBB)
  - mLeft(px。マージン)
  - mTop(px)
  - mRight(px)
  - mBottom(px)
  - pLeft(px。パディング)
  - pTop(px)
  - pRight(px)
  - pBottom(px)
  - weight(要素の画面上の比率。col内なら縦方向、row内なら横方向)

- コンテナ系専用（最大の幅などの制約。これらはweightと一緒には使えず、weightが優先されます。）
  - minHeight(px)
  - minWidth(px)
  - maxHeight(px)
  - maxWidth(px)

- block, scroll専用
  - id(Flutter widget連携での、置き換え用ID)
  
- scroll専用
  - isPrimary(スクロールコントローラーを付与するときに、それがプライマリスクロールビューであるかどうかを指定します。)

- col, row, wrap専用
  - hAlign(left(start), center, right(end)。水平方向揃え)
  - vAlign(top(start), center, bottom(end)。垂直方向揃え)

- text系, textField, href, btn専用
  - fontName
  - fontSize(px)
  - fontWeight(normal, regular, bold, thin, light, medium, black, w100-w900)
  - fontStyle(normal, italic)
  - textColor(#AARRGGBB)
  - textDeco(none, underline, overline, lineThrough)
  - textDecoStyle(solid, dotted, dashed, double, wavy)
  - textDecoColor(#AARRGGBB)
  - textDecoThickness(px)
  - letterSpacing(px)
  - wordSpacing(px)
  - textAlign(left, center, right, justify。テキスト揃え)
  - textHeight(テキストサイズの倍率。1.0や1.3など)

- text系, span専用
  - isSelectable(true,false。falseなら選択不可になる。)

- href専用
  - alt(代替テキスト)

- img専用
  - fit(none, contain, cover, fitHeight, fitWidth)
  - repeat(noRepeat, repeat, repeatX, repeatY。リピートが有効な場合は元の画像サイズでリピートされます。)

- line専用
  - thickness(px, 線の太さ)
  - color(#AARRGGBB)

- btn, dropdownBtn, popupMenuBtn 専用
  - iconNum(マテリアルアイコン（https://api.flutter.dev/flutter/material/Icons-class.html#constants）に定義されたアイコン番号.)
  - iconSize(px)
  - iconColor(#AARRGGBB)
  
- btn専用
  - type(text, outlined, elevated, block。ボタンのタイプ)
  - splashRadius(px)
  - outlineColor(#AARRGGBB, 枠線の色, outlinedタイプでのみ有効)
  - borderWidth(px, 枠線の幅, outlinedタイプでのみ有効)
  - borderRadius(px, 枠線の丸み。outlined、elevatedタイプでのみ有効)
  - shape(roundRect, stadium, bevel, circle。ボタンの形状。outlined、elevatedタイプでのみ有効)

### 改行
通常の改行コードで改行します。文末の改行は無視されます。

### 入れ子の構造
先頭に+マークをつけた要素は入れ子要素になります。
どの要素の子要素になるのかは、要素の位置と+マークの個数によって決まります。

### エスケープシーケンス
+記号、括弧、カンマ、バックスラッシュを文中で記載するには、手前にバックスラッシュを１つ記入します。  
注意点として、ファイル読み込みではなくコード内テキストとして直接記入する場合は、バックスラッシュ自体が
Dartのエスケープを受けるため、余分に１つ必要になります。

### サンプルコード
```dart
import 'package:flutter/material.dart';
import 'package:simple_widget_markup/spwml_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpWML Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SpWMLSample(title: 'SpWML Example'),
    );
  }
}

class SpWMLSample extends StatefulWidget {
  const SpWMLSample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SpWMLSample> createState() => _SpWMLSampleState();
}

class _SpWMLSampleState extends State<SpWMLSample> {

  Widget _getSpWMLWidget(BuildContext context){
    return SpWMLBuilder("(h1)テキストの例").build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: _getSpWMLWidget(context)
    );
  }
}
```

### インライン要素を使う場合の例
サンプルコードの_getSpWMLWidgetを以下のように書き替えてください。
```dart
  Widget _getSpWMLWidget(BuildContext context){
    return SpWMLBuilder("(span)\n"
            "+(h1,fontWeight:bold)テキストの\n"
            "+(h1,textColor:#FF0000)例").build(context);
  }
```

### Widgetとの連携
サンプルコードの_getSpWMLWidgetを以下のように書き替えてください。
```dart
  Widget _getSpWMLWidget(BuildContext context) {
  SpWMLBuilder builder = SpWMLBuilder("(h1)この下の要素を置き換えます。\n"
          "(block, id:1)");
  builder.replaceID(
          1,
          OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("ボタンが押されました。"),
                      duration: Duration(seconds: 3),
                    ));
                  },
                  child: const Text("Flutterボタン")));
  return builder.build(context);
}
```

### 基本デザインのカスタマイズ
サンプルコードの_getSpWMLWidgetを以下のように書き替えてください。
```dart
  Widget _getSpWMLWidget(BuildContext context) {
  SpWMLFontStyle fontStyle1 = SpWMLFontStyle();
  SpWMLFontStyle fontStyle2 = SpWMLFontStyleMaterial();
  SpWMLFontStyle userCustomFontStyle = SpWMLFontStyle(h1Size: 48);
  return Column(
    children: [
      SpWMLBuilder("(h1)テキストの例", spWMLStyle: fontStyle1).build(context),
      SpWMLBuilder("(h1)テキストの例", spWMLStyle: fontStyle2).build(context),
      SpWMLBuilder("(h1)テキストの例", spWMLStyle: userCustomFontStyle)
              .build(context),
    ],
  );
}
```
スタイルはJSONファイルとして保存することも出来ます。  
toDictでMapに出来、それをfromDictで復元することができます。  
必要な場合は検討してください。  
```dart
  SpWMLFontStyle test = SpWMLFontStyle.fromDict(fontStyle1.toDict());
```

### 内部要素を変更しない場合
以下のラッパーウィジェットを使ってより簡単に記述出来ます。
サンプルコードの_getSpWMLWidgetを以下のように書き替えてください。
```dart
  Widget _getSpWMLWidget(BuildContext context) {
    return SpWML("(h1)テキストの例");
  }
```

## サポート
もし何らかの理由で有償のサポートが必要な場合は私の会社に問い合わせてください。  
このパッケージは私が個人で開発していますが、会社経由でサポートできる場合があります。  
[合同会社シンプルアプリ](https://simpleappli.com/index.html)

## フォーマット名
Simple Widget Markup Language

## 拡張子
.spwml

## MIME Type ( 仮 )
text/x.spwml

## このオブジェクトが有用なもの
アプリの新着情報など、高頻度で作成する必要があり、かつレイアウトがそれほど複雑では無いものに向いています。

## このオブジェクトが有用でないもの
複雑なアプリのレイアウトを直接組み立てる用途には向いていません。ただし、置き換え前提の骨組みは作成可能です。

## バージョン管理について
それぞれ、Cの部分が変更されます。
- 変数の追加など、以前のファイルの読み込み時に問題が起こったり、ファイルの構造が変わるような変更
  - C.X.X
- メソッドの追加など
  - X.C.X
- 軽微な変更やバグ修正
  - X.X.C

## ライセンス
このソフトウェアはMITライセンスの元配布されます。LICENSEファイルの内容をご覧ください。

## 著作権表示
The “Dart” name and “Flutter” name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.
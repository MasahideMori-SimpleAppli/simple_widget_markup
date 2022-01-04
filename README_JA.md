# simple_widget_markup

日本語版の解説です。

## 概要
このパッケージはSimple Widget Markup Language(SpWML)の実用的なFlutter(Dart)実装です。  
SpWMLは、Widget（一定の要素のかたまり）を手軽に扱えるようにするためのマークアップ言語です。  
このフォーマットで出力されたファイルは拡張子.spwmlを持ちます。  
この仕様は主にアプリケーション中の新着情報配信時などに、簡単かつ軽量に内容を記述出来ることを目的としています。  
また、習得の容易さにも重点を置いています。  
この言語の必須要件は、普通の事務員にA4紙２枚以内で使い方を不足なく説明できることです。

## 利用方法
### クイックスタート
サンプルサイトを準備中です。暫くお待ちください。

### 記載方法
基本形は
```
(type, パラメータ1:値1, パラメータ2:値2,...)テキスト
```
という単純な作りになっています。  
typeは必須で、パラメータは省略可能です。

現在、typeは以下の通りです。
・コンテナ系（コンテナは要素の入れ物です）
- block(基本コンテナ。置き換え用の仮配置にも利用できる)
- col(内部が行のコンテナ)
- row(内部が列のコンテナ)
- span(内部がtextまたはhrefのコンテナ。行内要素にそれぞれ違うパラメータが設定出来る)
  ・コンテナ内要素
- text系
  - h1-h6(ヘッダテキスト。h1-h6の６種類)
  - subtitle1
  - subtitle2
  - body1(textと書いても動く。通常テキスト)
  - body2
  - caption
  - overline(線の上に表示するためのテキスト)
- text以外
  - img(画像。テキスト部分にURLまたはbase64画像を記載する)
  - href(テキスト部分にハイパーリンクを記載する。altパラメータで見た目を変えられる)
  - line(水平区切り)

現在、パラメータには以下があります。
・全てで有効
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

・block専用
- id(Flutter widget連携での、置き換え用ID)

・col, row専用
- hAlign(left, center, right。水平方向揃え)
- vAlign(top, center, bottom。垂直方向揃え)

・text系,href専用
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

・text系, span専用
- isSelectable(true,false。falseなら選択不可になる。)

・href専用
- alt(代替テキスト)

・img専用
- fit(none, contain, cover, fitHeight, fitWidth)
- repeat(noRepeat, repeat, repeatX, repeatY。リピートが有効な場合は元の画像サイズでリピートされます。)

・line専用
- chickness(px, 線の太さ)
- color(#AARRGGBB)
- lineStyle(現在は利用できません。今後、複数のスタイルが追加される可能性があります。)


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
//準備中
```

### インライン要素を使う場合の例
```dart
//準備中
```

### Widgetとの連携
```dart
//準備中
```

### 基本デザインのカスタマイズ
```dart
//準備中
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
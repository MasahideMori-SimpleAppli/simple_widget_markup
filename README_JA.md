# simple_widget_markup

日本語版の解説です。

## 概要
このパッケージは、Simple Widget Markup Language (SpWML) の実用的な Flutter (Dart) 実装です。
SpWMLを使用すると、ユーザーは静的にFlutterのレイアウトを作成できます。
また、必要なコードの量が減り、多くの場合コンパイルが高速化されます。
SpWMLで出力したファイルの拡張子は簡単のために .spwml を使用してください。

## 利用方法
### クイックスタート
以下に詳細なドキュメントがあります。
[SpWMLの日本語ドキュメント](https://masahidemori-simpleappli.github.io/spwml_docs_jp/index.html)

以下のサイトでどのように動作するのか試すことが出来ます。  
[SpWMLエディター](https://simple-widget-markup-editor-jp.web.app/)

### サンプルコード
```dart
import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

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
          "(block, sid:ボタン名)");
  builder.replace(
          "ボタン名",
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
    SpWMLFontStyle fontStyle2 = fontStyle1.deepCopy();
    fontStyle2.styleMap[EnumSpWMLElementType.h1]!.fontWeight =
    EnumFontWeight.light;
    return Column(
      children: [
        SpWMLBuilder("(h1)テキストの例１", spWMLStyle: fontStyle1).build(context),
        SpWMLBuilder("(h1)テキストの例２", spWMLStyle: fontStyle2).build(context),
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
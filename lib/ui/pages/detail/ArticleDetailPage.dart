import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailPage extends StatefulWidget {

  //标题
  String title;
  //链接
  String url;

  ArticleDetailPage({this.title, this.url});

  @override
  State<StatefulWidget> createState() {
    return ArticleDetailPageState();
  }
}

class ArticleDetailPageState extends State<ArticleDetailPage> {

  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text(widget.title),),
      url: widget.url,
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}

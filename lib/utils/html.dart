import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatelessWidget {
  WebPage({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: data['url'],
      appBar: new AppBar(
        title: new Text(data['title']),
      ),
    );
  }
}

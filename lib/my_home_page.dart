import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final String url;

  const MyHomePage({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FlutterWebviewPlugin webviewPlugin;
  bool showBackButton = false;

  @override
  void initState() {
    super.initState();
    webviewPlugin = FlutterWebviewPlugin();
    webviewPlugin.onUrlChanged.listen((newUrl) {
      if (newUrl == widget.url) {
        if (showBackButton) {
          setState(() {
            showBackButton = false;
          });
        }
      } else {
        if (!showBackButton) {
          setState(() {
            showBackButton = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        leading: showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  webviewPlugin.reloadUrl(widget.url);
                  setState(() {
                    showBackButton = false;
                  });
                },
              )
            : null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    webviewPlugin.dispose();
    super.dispose();
  }
}

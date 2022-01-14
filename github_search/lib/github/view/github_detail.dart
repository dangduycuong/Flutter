import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class DetailGithub extends StatefulWidget {
  const DetailGithub({Key? key}) : super(key: key);

  @override
  _DetailGithubState createState() => _DetailGithubState();
}

class _DetailGithubState extends State<DetailGithub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
      ),
      body: const WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

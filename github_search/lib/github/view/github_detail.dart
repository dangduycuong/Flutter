import 'package:flutter/cupertino.dart';
import 'package:github_search/github/models/search_result_item.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class DetailGithub extends StatefulWidget {
  const DetailGithub({Key? key}) : super(key: key);

  static const routeName = 'DetailGithub';

  @override
  _DetailGithubState createState() => _DetailGithubState();
}

// class _DetailGithubState extends State<DetailGithub> {
//   @override
//   Widget build(BuildContext context) {
//     SearchResultItem item =
//         ModalRoute.of(context)!.settings.arguments as SearchResultItem;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${item.fullName}'),
//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: item.htmlUrl,
//
//             javascriptMode: JavascriptMode.unrestricted,
//           ),
//           Center(
//             child: Container(
//               child: Text("Loading"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class _DetailGithubState extends State<DetailGithub> {
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    SearchResultItem item =
        ModalRoute.of(context)!.settings.arguments as SearchResultItem;
    return Scaffold(
      appBar: AppBar(
          title: Text('${item.fullName}',
              style: const TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: item.htmlUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? const Center(
                  // child: CircularProgressIndicator(),
            child: CupertinoActivityIndicator(),
                )

              : Stack(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:github_search/github/view/github_detail.dart';
import 'package:github_search/home/view/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      routes: {
        DetailGithub.routeName: (context) => const DetailGithub(),
      },
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const HomePage(),
    );
  }
}

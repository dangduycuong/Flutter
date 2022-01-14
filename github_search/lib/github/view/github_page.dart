import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/github/bloc/github_search_bloc.dart';
import 'package:github_search/github/view/search_body_github.dart';
import 'package:github_search/github/view/searchbar_github.dart';

class GitHubPage extends StatelessWidget {
  const GitHubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GithubSearchBloc(),
      child: BlocConsumer<GithubSearchBloc, GithubSearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Github'),
            ),
            body: Column(
              children: [
                SearchBar(),
                SearchBody(),
              ],
            ),
          );
        },
        listener: (context, state) {
          print('cdd ${state.toString()}');
          //to do something
        },
      ),
    );
  }
}

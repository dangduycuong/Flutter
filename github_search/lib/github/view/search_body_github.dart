import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/github/bloc/github_search_bloc.dart';
import 'package:github_search/github/models/search_result_item.dart';
import 'package:github_search/github/view/github_detail.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        if (state is SearchStateViewDetail) {

        }
        if (state is SearchStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchStateError) {
          return Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.error),
              ),
            ),
          );
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? const Text('No Results')
              : Expanded(child: _SearchResults(items: state.items));
        }
        return const Text('Please enter a term to begin');
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items}) : super(key: key);

  final List<SearchResultItem> items;

  Widget _buildCellForRowAt(BuildContext context, SearchResultItem item) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network('${item.owner?.avatarUrl}'),
      ),
      title: Text('fullName ${item.fullName}'),
      onTap: () async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailGithub()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCellForRowAt(context, items[index]);
      },
    );
  }
}

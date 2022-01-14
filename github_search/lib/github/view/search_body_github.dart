import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/github/bloc/github_search_bloc.dart';
import 'package:github_search/github/models/search_result_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return Expanded(
            child: (Platform.isIOS)
                ? const Center(child: CupertinoActivityIndicator())
                : const Center(child: CircularProgressIndicator()),
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

        if (state is SearchStateViewDetail) {
          return Expanded(
              child: _SearchResults(
                  items: context.read<GithubSearchBloc>().repositories));
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
        context.read<GithubSearchBloc>().add(GithubViewDetailEvent(item: item));
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

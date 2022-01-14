part of 'github_search_bloc.dart';

@immutable
abstract class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends GithubSearchState {}

class SearchStateLoading extends GithubSearchState {}

class SearchStateSuccess extends GithubSearchState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends GithubSearchState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class SearchStateViewDetail extends GithubSearchState {
  const SearchStateViewDetail(this.htmlUrl);

  final String htmlUrl;

  @override
  List<Object> get props => [htmlUrl];
}

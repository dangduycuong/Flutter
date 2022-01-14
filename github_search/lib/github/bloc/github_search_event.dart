part of 'github_search_bloc.dart';

@immutable
abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();
}

class GithubSearchFirstTimeEvent extends GithubSearchEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TextChanged extends GithubSearchEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}

class GithubViewDetailEvent extends GithubSearchEvent {
  const GithubViewDetailEvent({required this.item});

  final SearchResultItem item;

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'TextChanged { text: ${item.htmlUrl} }';
}

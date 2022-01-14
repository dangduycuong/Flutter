import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:github_search/github/models/search_result.dart';
import 'package:github_search/github/models/search_result_item.dart';
import 'package:github_search/github/services/github_search_api.dart';

import 'package:meta/meta.dart';
import 'package:stream_transform/src/rate_limit.dart';
import 'package:stream_transform/src/switch.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  List<SearchResultItem> repositories = [];

  GithubSearchBloc() : super(SearchStateEmpty()) {
    on<GithubSearchFirstTimeEvent>(_fetchGitHubDataDefault,
        transformer: debounce(_duration));
    on<TextChanged>(_fetchContentGitHub, transformer: debounce(_duration));
    on<GithubViewDetailEvent>(_selectedItem);
  }

  void _selectedItem(
      GithubViewDetailEvent event, Emitter<GithubSearchState> emit) {
    emit(SearchStateViewDetail(event.item));
  }

  void _fetchContentGitHub(
      TextChanged event, Emitter<GithubSearchState> emit) async {
    if (event.text == '') {
      emit(SearchStateEmpty());
      return;
    }
    emit(SearchStateLoading());

    final client =
        GitHubSearchClient(Dio(BaseOptions(contentType: "application/json")));

    try {
      SearchResult result = await client.getDataGithub(event.text);

      if (result.items!.isEmpty) {
        emit(SearchStateEmpty());
      } else {

        repositories = result.items!;
        emit(SearchStateSuccess(repositories));
      }
    } catch (exception) {
      emit(SearchStateError(exception.toString()));
    }
  }

  void _fetchGitHubDataDefault(
      GithubSearchFirstTimeEvent event, Emitter<GithubSearchState> emit) async {
    emit(SearchStateLoading());

    final client =
        GitHubSearchClient(Dio(BaseOptions(contentType: "application/json")));

    try {
      SearchResult result = await client.getDataGithub('apple');

      if (result.items!.isEmpty) {
        emit(SearchStateEmpty());
      } else {
        if (result.items != null && result.items!.length > 10) {
          for (int i = 0; i < 10; i++) {
            repositories.add(result.items![i]);
          }

          // result.items!.map((e) => repositories.add(e));
          emit(SearchStateSuccess(repositories));
        }
      }
    } catch (exception) {
      emit(SearchStateError(exception.toString()));
    }
  }
}

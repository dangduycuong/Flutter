import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:github_search/github/models/search_result.dart';
import 'package:github_search/github/models/search_result_item.dart';
import 'package:github_search/github/services/github_search_api.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/src/rate_limit.dart';
import 'package:stream_transform/src/switch.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc() : super(SearchStateEmpty()) {
    on<TextChanged>(_fetchContentGitHub, transformer: debounce(_duration));
  }

  void _fetchContentGitHub(
      TextChanged event, Emitter<GithubSearchState> emit) async {
    var logger = Logger(
      printer: PrettyPrinter(),
    );
    if (event.text == '') {
      emit(SearchStateEmpty());
      return;
    }
    emit(SearchStateLoading());
    print('cdd co thuc hien o duoi return khong');
    final client =
        GitHubSearchClient(Dio(BaseOptions(contentType: "application/json")));

    try {
      SearchResult result = await client.getDataGithub(event.text);

      await Future.delayed(const Duration(milliseconds: 500));

      if (result.items!.isEmpty) {
        emit(SearchStateEmpty());
      } else {
        final List<SearchResultItem>? items = result.items;
        emit(SearchStateSuccess(items!));
      }
    } catch (exception) {
      logger.i('========== $exception');

      emit(SearchStateError(exception.toString()));
    }
  }
}

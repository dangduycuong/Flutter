// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_search_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GitHubSearchClient implements GitHubSearchClient {
  _GitHubSearchClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.github.com/search/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SearchResult> getDataGithub(q) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': q};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchResult>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/repositories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

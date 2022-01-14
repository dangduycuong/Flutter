import 'package:dio/dio.dart';
import 'package:github_search/github/models/search_result.dart';
import 'package:github_search/github/models/search_result_item.dart';

import 'package:retrofit/retrofit.dart';

part 'github_search_api.g.dart';

@RestApi(baseUrl: "https://api.github.com/search/")
abstract class GitHubSearchClient {
  factory GitHubSearchClient(Dio dio) = _GitHubSearchClient;

  @GET("/repositories")
  Future<SearchResult> getDataGithub(
    @Query("q") String q,
  );
}

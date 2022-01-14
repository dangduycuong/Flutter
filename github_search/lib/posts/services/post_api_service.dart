import 'package:dio/dio.dart';
import 'package:github_search/posts/models/post_model.dart';

import 'package:retrofit/retrofit.dart';

part 'post_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/posts")
  Future<List<PostModel>> getTasks(
    @Query("_start") int _start,
    @Query("_limit") int _limit,
  );
}

import 'package:dio/dio.dart';
import 'package:github_search/meal/models/meals_model.dart';

import 'package:retrofit/retrofit.dart';

part 'meal_search_api.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class MealsSearchClient {
  factory MealsSearchClient(Dio dio) = _MealsSearchClient;

  @GET("/search.php")
  Future<MealsModel> getMeals(
    @Query("s") String s,
  );
}

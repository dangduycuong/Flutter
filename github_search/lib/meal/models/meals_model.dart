import 'package:github_search/github/models/search_result_item.dart';
import 'package:github_search/meal/models/meal_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_model.g.dart';

@JsonSerializable()
class MealsModel {
  final List<MealItem>? meals;


  MealsModel({this.meals});

  factory MealsModel.fromJson(Map<String, dynamic> json) =>
      _$MealsModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MealsModelToJson(this);
}

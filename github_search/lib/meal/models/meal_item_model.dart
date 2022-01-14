import 'package:github_search/github/models/github_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MealItem {
  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;

  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;

  MealItem({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,

    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,

    this.strYoutube,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) =>
      _$MealItemFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MealItemToJson(this);
}

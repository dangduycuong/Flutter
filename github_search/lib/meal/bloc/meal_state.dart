part of 'meal_bloc.dart';

@immutable
abstract class MealState {}

class MealStartSearchState extends MealState {}

class MealSearchingState extends MealState {}

class MealSuccessSearchState extends MealState {
  final List<MealItem> meals;

  MealSuccessSearchState(this.meals);
}

class MealErrorSearchState extends MealState {}

class MealDetailSearchState extends MealState {
  final MealItem meal;

  MealDetailSearchState(this.meal);
}

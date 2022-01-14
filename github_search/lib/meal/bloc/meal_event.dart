part of 'meal_bloc.dart';

@immutable
abstract class MealEvent {}

class MealEventTextChange extends MealEvent {
  MealEventTextChange({required this.text});

  final String text;

  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}

class MealEventViewDetail extends MealEvent {
  MealEventViewDetail({required this.meal});

  final MealItem meal;

  List<Object> get props => [meal];
}

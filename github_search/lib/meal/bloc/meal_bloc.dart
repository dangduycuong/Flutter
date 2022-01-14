import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_search/meal/models/meal_item_model.dart';
import 'package:github_search/meal/models/meals_model.dart';
import 'package:github_search/meal/services/meal_search_api.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:github_search/github/models/search_result.dart';
import 'package:github_search/github/models/search_result_item.dart';
import 'package:github_search/github/services/github_search_api.dart';

import 'package:stream_transform/src/rate_limit.dart';
import 'package:stream_transform/src/switch.dart';

part 'meal_event.dart';

part 'meal_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MealBloc extends Bloc<MealEvent, MealState> {
  List<MealItem> meals = [];

  MealBloc() : super(MealStartSearchState()) {
    on<MealEventTextChange>(_fetchMeals, transformer: debounce(_duration));
    on<MealEventViewDetail>(_selectedItem);
  }

  void _selectedItem(MealEventViewDetail event, Emitter<MealState> emit) {
    emit(MealDetailSearchState(event.meal));
  }

  void _fetchMeals(MealEventTextChange event, Emitter<MealState> emit) async {
    if (event.text == '') {
      return;
    }

    emit(MealSearchingState());

    final client =
        MealsSearchClient(Dio(BaseOptions(contentType: "application/json")));

    try {
      MealsModel result = await client.getMeals(event.text);

      if (result.meals!.isEmpty) {
      } else {
        meals = result.meals!;
        emit(MealSuccessSearchState(meals));
      }
    } catch (exception) {
      emit(MealErrorSearchState());
    }
  }
}

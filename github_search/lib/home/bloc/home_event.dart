part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectTabEvent extends HomeEvent {
  const SelectTabEvent(this.selectedTab);

  final int selectedTab;
}

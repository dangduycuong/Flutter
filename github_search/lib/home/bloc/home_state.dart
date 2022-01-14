part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int selectedTab;

  const HomeState(this.selectedTab);

  @override
  List<Object> get props => [selectedTab];
}

class HomeInitial extends HomeState {
  const HomeInitial(int selectedTab) : super(selectedTab);

  @override
  String toString() => 'Value add { name: $selectedTab }';
}

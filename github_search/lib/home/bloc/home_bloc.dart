import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int selectedTab = 0;

  HomeBloc() : super(const HomeInitial(0)) {
    on<SelectTabEvent>(_selectedTab);
  }

  void _selectedTab(SelectTabEvent event, Emitter<HomeState> emit) {
    selectedTab = event.selectedTab;
    emit(HomeInitial(selectedTab));
  }
}

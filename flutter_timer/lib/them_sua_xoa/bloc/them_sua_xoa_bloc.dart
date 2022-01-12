import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'them_sua_xoa_event.dart';
part 'them_sua_xoa_state.dart';

class ThemSuaXoaBloc extends Bloc<ThemSuaXoaEvent, ThemSuaXoaState> {

  ThemSuaXoaBloc() : super(SuaStateValue(1)) {
    on<ThemSuaXoaEvent>((event, emit) {
      on<ThemData>(_themData);
      on<SuaData>(_modifyData);
      on<XoaData>(_deleteData);
    });
  }

  void _themData(ThemData event, Emitter<ThemSuaXoaState> emit) {
    emit(ThemStateValue(1));
  }

  void _modifyData(SuaData event, Emitter<ThemSuaXoaState> emit) {
    emit(SuaStateValue(2));
  }

  void _deleteData(XoaData event, Emitter<ThemSuaXoaState> emit) {
    emit(XoaStateValue(3));
  }
}

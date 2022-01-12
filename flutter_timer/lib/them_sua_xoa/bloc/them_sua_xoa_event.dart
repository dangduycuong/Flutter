part of 'them_sua_xoa_bloc.dart';

@immutable
abstract class ThemSuaXoaEvent {
  const ThemSuaXoaEvent();

  @override
  List<Object> get props => [];
}

class ThemData extends ThemSuaXoaEvent {
  const ThemData({required this.duration});

  final int duration;
}

class SuaData extends ThemSuaXoaEvent {
  const SuaData({required this.duration});

  final int duration;
}

class XoaData extends ThemSuaXoaEvent {
  const XoaData({required this.duration});

  final int duration;
}

part of 'them_sua_xoa_bloc.dart';

@immutable
abstract class ThemSuaXoaState extends Equatable {
  final int number;

  const ThemSuaXoaState(this.number);

  @override
  List<Object> get props => [number];
}

class ThemStateValue extends ThemSuaXoaState {
  const ThemStateValue(int number) : super(number);

  @override
  String toString() => 'Value change { duration: $number }';
}

class SuaStateValue extends ThemSuaXoaState {
  const SuaStateValue(int number) : super(number);

  @override
  String toString() => 'Value change { duration: $number }';
}

class XoaStateValue extends ThemSuaXoaState {
  const XoaStateValue(int number) : super(number);

  @override
  String toString() => 'Value change { duration: $number }';
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/them_sua_xoa/bloc/them_sua_xoa_bloc.dart';

class ThemSuaXoaPage extends StatelessWidget {
  const ThemSuaXoaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemSuaXoaBloc(),
      child: const ThemSuaXoaView(),
    );
  }
}

class ThemSuaXoaView extends StatelessWidget {
  const ThemSuaXoaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemSuaXoaView'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Wrap(children: [
            ElevatedButton(
              onPressed: () {
                context.read<ThemSuaXoaBloc>().add(const ThemData(duration: 125));
                // .add(TimerStarted(duration: state.duration)),
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemSuaXoaBloc>().add(const SuaData(duration: 125));
                // .add(TimerStarted(duration: state.duration)),
              },
              child: const Text('Modify'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemSuaXoaBloc>().add(const XoaData(duration: 125));
                // .add(TimerStarted(duration: state.duration)),
              },
              child: const Text('Delete'),
            ),
          ],),

          BlocBuilder<ThemSuaXoaBloc, ThemSuaXoaState>(
            builder: (context, state) {
              if (state is SuaData) {
                return Text('them data');
              } else {
                return Text('$state');
              }
            },
          ),
        ],
      )),
    );
  }
}

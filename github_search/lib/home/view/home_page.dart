import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/github/view/github_page.dart';
import 'package:github_search/home/bloc/home_bloc.dart';
import 'package:github_search/meal/view/meal_page.dart';
import 'package:github_search/posts/view/posts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeBloc cubit) => cubit.state.selectedTab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: const [PostsPage(), GitHubPage(), MealPage()],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _HomeTabButton(
              index: 0,
              icon: Icon(Icons.post_add),
            ),
            _HomeTabButton(
              index: 1,
              icon: Icon(Icons.device_hub),
            ),
            _HomeTabButton(
              index: 2,
              icon: Icon(Icons.set_meal),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);
  final int index;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeBloc>().add(SelectTabEvent(index)),
      iconSize: 32,
      color: Theme.of(context).colorScheme.secondary,
      //context.read<HomeBloc>().selectedTab == 0
      //           ? Theme.of(context).colorScheme.onPrimary
      icon: icon,
    );
  }
}

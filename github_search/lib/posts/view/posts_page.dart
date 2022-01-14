import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/posts/bloc/post_bloc.dart';
import 'package:github_search/posts/models/post_model.dart';
import 'package:logger/logger.dart';
import 'dart:io';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc()..add(PostFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<PostBloc>().add(PostFetched());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const PostView(),
      ),
    );
  }
}

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostView extends StatelessWidget {
  Widget _buildListView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => _buildCellForRowAt(posts[index], index),
    );
  }

  Widget _buildCellForRowAt(PostModel post, int index) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: Text('${post.title}'),
      subtitle: Text('${post.body}'),
    );
  }

  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostLoadSuccessState) {}
        switch (state.runtimeType) {
          case PostStartLoadState:
            break;
        }
      },
      builder: (context, state) {
        if (state is PostStartLoadState) {
          // context.read<PostBloc>().add(PostFetched());
          if (Platform.isIOS) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostLoadSuccessState) {
          return _buildListView(state.posts!);
        }
        if (state is PostLoadErrorState) {
          return Center(
              child: Column(
            children: [
              const Text('An error has occurred'),
              ElevatedButton(
                onPressed: () {
                  context.read<PostBloc>().add(PostFetched());
                },
                child: const Text('Try again'),
              ),
            ],
          ));
        }
        return ElevatedButton(
            onPressed: () {
              context.read<PostBloc>().add(PostFetched());
            },
            child: const Text('call'));
      },
    );
  }
}

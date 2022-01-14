part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  final List<PostModel>? posts;

  const PostState(this.posts);

  @override
  List<Object> get props => [
        {posts}
      ];
}

class PostStartLoadState extends PostState {
  const PostStartLoadState(List<PostModel>? posts) : super(posts);
}

class PostLoadMoreState extends PostState {
  const PostLoadMoreState(List<PostModel>? posts) : super(posts);
}

class PostLoadSuccessState extends PostState {
  const PostLoadSuccessState(List<PostModel>? posts) : super(posts);
}

class PostLoadFullState extends PostState {
  const PostLoadFullState(List<PostModel>? posts) : super(posts);
}

class PostLoadErrorState extends PostState {
  const PostLoadErrorState(List<PostModel>? posts) : super(posts);
}

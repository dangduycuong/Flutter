import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_search/posts/models/post_model.dart';
import 'package:github_search/posts/services/post_api_service.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

part 'post_event.dart';

part 'post_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

class PostBloc extends Bloc<PostEvent, PostState> {
  final int startIndex = 0;

  PostBloc() : super(const PostStartLoadState(null)) {
    on<PostFetched>(
      _fetchPost,
    );
  }

  void _fetchPost(PostFetched event, Emitter<PostState> emit) async {
    var logger = Logger(
      printer: PrettyPrinter(),
    );

    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));

    logger.i('full url');

    try {
      List<PostModel> posts = await client.getTasks(startIndex, _postLimit);
      await Future.delayed(const Duration(milliseconds: 500));
      if (posts.isEmpty) {
        emit(const PostLoadFullState([]));
      } else {
        emit(PostLoadSuccessState(posts));
      }
    } catch (ex) {
      emit(const PostLoadErrorState(null));
    }

    // emit(const PostLoadErrorState(null));
  }

// Future<void> _onPostFetched(
//   PostFetched event,
//   Emitter<PostState> emit,
// ) async {
//   // if (state.hasReachedMax) return;
//   try {
//     final posts = await _fetchPosts();
//
//     posts.isEmpty
//         ? emit(const PostLoadFullState(null))
//         : emit(PostLoadSuccessState(posts));
//   } catch (_) {
//     emit(const PostLoadErrorState(null));
//   }
// }
//
// Future<List<PostModel>> _fetchPosts() async {
//   List<PostModel> posts = [];
//   var logger = Logger(
//     printer: PrettyPrinter(),
//   );
//
//   final client =
//       RestClient(Dio(BaseOptions(contentType: "application/json")));
//
//   client.getTasks(startIndex, _postLimit).then((it) {
//     if (it.isEmpty) {
//       emit(const PostLoadFullState([]));
//     } else {
//       it.toList().map((e) => posts.add(e));
//       emit(PostLoadSuccessState(posts));
//     }
//     logger.i(it);
//   }).catchError((Object obj) {
//     // non-200 error goes here.
//     switch (obj.runtimeType) {
//       case DioError:
//         // Here's the sample to get the failed response error code and message
//         final res = (obj as DioError).response;
//         logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
//         emit(const PostLoadErrorState(null));
//         break;
//
//       default:
//         logger.i('un know');
//         break;
//     }
//   });
//   return posts;
// }
}

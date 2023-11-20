import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/domain/entities/comment.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';
import 'package:route_social_app/Features/home/domain/entities/user.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_comments.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_posts.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_users.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this._getUsersUseCase, this._getPostsUseCase, this._getCommentsUseCase)
      : super(HomeInitial());
  final GetUsersUseCase _getUsersUseCase;
  final GetPostsUseCase _getPostsUseCase;
  final GetCommentsUseCase _getCommentsUseCase;

  List<Post>? posts;
  List<User>? users;
  List<Comment>? comments;

  Future<void> getPosts(
      {required int page,
      required PagingController<int, Post> pagingController}) async {
    emit(PostsLoading());
    _getPostsUseCase.call(page)?.then(
          (value) => value?.fold((l) {
            if (kDebugMode) {
              print(l);
            }
            emit(PostsFailure());
          }, (r) {
            final newItems = r ?? [];
            posts?.addAll(r);
            bool isLastPage = newItems.length < 10;

            if (isLastPage) {
              // 3
              pagingController.appendLastPage(newItems);
            } else {
              final nextPageKey = page + newItems.length;
              pagingController.appendPage(newItems, nextPageKey);
            }
            emit(PostsSuccess());
          }),
        );
  }

  Future<void> getUsers() async {
    emit(UsersLoading());
    _getUsersUseCase.call()?.then(
          (value) => value?.fold((l) {
            if (kDebugMode) {
              print(l);
            }
            emit(UsersFailure());
          }, (r) {
            users = r;
            emit(UsersSuccess());
          }),
        );
  }

  Future<void> getComments(int postId) async {
    comments = null;
    emit(CommentsLoading());
    _getCommentsUseCase.call(postId)?.then(
          (value) => value?.fold((l) {
            if (kDebugMode) {
              print(l);
            }
            emit(CommentsFailure());
          }, (r) {
            comments = r;
            emit(CommentsSuccess());
          }),
        );
  }
}

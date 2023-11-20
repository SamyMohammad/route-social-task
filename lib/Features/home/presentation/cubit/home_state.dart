part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class UsersSuccess extends HomeState {
  @override
  List<Object> get props => [];
}

class UsersFailure extends HomeState {
  @override
  List<Object> get props => [];
}

class PostsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class PostsSuccess extends HomeState {
  @override
  List<Object> get props => [];
}

class PostsFailure extends HomeState {
  @override
  List<Object> get props => [];
}

class CommentsFailure extends HomeState {
  @override
  List<Object> get props => [];
}

class CommentsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class CommentsSuccess extends HomeState {
  @override
  List<Object> get props => [];
}

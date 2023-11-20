import 'package:equatable/equatable.dart';

import '../../domain/entities/post.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  // final PostStatus status;
  // final List<PatientModel> patients;
  // final bool hasReachedMax;
  //
  // SearchState copyWith({
  //   PostStatus? status,
  //   List<PatientModel>? posts,
  //   bool? hasReachedMax,
  // }) {
  //   return SearchState(
  //     status: status ?? this.status,
  //     patients: posts ?? this.patients,
  //     hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  //   );
  // }
  //
  // @override
  // String toString() {
  //   return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${patients.length} }''';
  // }

  @override
  List<Object> get props => [];
}

final class SearchStateEmpty extends SearchState {}

final class SearchStateLoading extends SearchState {}

final class SearchStateSuccess extends SearchState {
  const SearchStateSuccess(this.patients);

  final List<Post> patients;

  @override
  List<Object> get props => [patients];

  @override
  String toString() => 'SearchStateSuccess { items: ${patients.length} }';
}

final class SearchStateError extends SearchState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

enum PostStatus { initial, success, failure }

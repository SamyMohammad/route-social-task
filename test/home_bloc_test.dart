import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_comments.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_posts.dart';
import 'package:route_social_app/Features/home/domain/use_cases/get_users.dart';
import 'package:route_social_app/Features/home/presentation/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetUsersUseCase, GetPostsUseCase, GetCommentsUseCase])
void main() {
  late MockGetPostsUseCase mockGetPostsUseCase;
  late MockGetUsersUseCase mockGetUsersUseCase;
  late MockGetCommentsUseCase mockGetCommentsUseCase;

  late HomeCubit homeCubit;
  setUp(() {
    mockGetPostsUseCase = MockGetPostsUseCase();
    mockGetUsersUseCase = MockGetUsersUseCase();
    mockGetCommentsUseCase = MockGetCommentsUseCase();
    homeCubit = HomeCubit(
        mockGetUsersUseCase, mockGetPostsUseCase, mockGetCommentsUseCase);
  });

  test('initial State should be embty', () {
    expect(homeCubit.state, HomeInitial());
  });

  List<Post> posts = [
    Post(userId: 2, id: 5, body: 'this is body', title: 'this is title'),
    Post(userId: 2, id: 5, body: 'this is body', title: 'this is title'),
    Post(userId: 2, id: 5, body: 'this is body', title: 'this is title')
  ];
  blocTest<HomeCubit, HomeState>(
    'when get data successfully',
    build: () {
      when(mockGetPostsUseCase.call(1)).thenAnswer((_) async => Right(posts));
      return homeCubit;
    },
    act: (bloc) {
      bloc.getPosts(
          page: 1, pagingController: PagingController(firstPageKey: 1));
    },
    wait: const Duration(milliseconds: 1000),
    expect: () => <HomeState>[PostsLoading(), PostsSuccess()],
  );
}

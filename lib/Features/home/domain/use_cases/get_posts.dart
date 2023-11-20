import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';
import 'package:route_social_app/Features/home/domain/repositories/repository.dart';
import 'package:route_social_app/core/network/failure.dart';
import 'package:route_social_app/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetPostsUseCase with UseCases<Either<Failure, List<Post>>, int> {
  final HomeRepository repository;

  GetPostsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Post>>?>? call(int params) async {
    return await repository.getPosts(pageNumber: params);
  }
}

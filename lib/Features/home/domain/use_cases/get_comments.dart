import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/domain/entities/comment.dart';
import 'package:route_social_app/Features/home/domain/repositories/repository.dart';
import 'package:route_social_app/core/network/failure.dart';
import 'package:route_social_app/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetCommentsUseCase with UseCases<Either<Failure, List<Comment>>, int> {
  final HomeRepository repository;

  GetCommentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Comment>>?>? call(int params) async {
    return await repository.getComments(params);
  }
}

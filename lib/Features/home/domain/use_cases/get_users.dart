import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/domain/entities/user.dart';
import 'package:route_social_app/Features/home/domain/repositories/repository.dart';
import 'package:route_social_app/core/network/failure.dart';
import 'package:route_social_app/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetUsersUseCase with NoParamUseCases<Either<Failure, List<User>>> {
  final HomeRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<Either<Failure, List<User>>?>? call() async {
    return await repository.getUsers();
  }
}

import 'package:dartz/dartz.dart';
import 'package:route_social_app/Features/home/domain/entities/comment.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';
import 'package:route_social_app/Features/home/domain/entities/user.dart';
import 'package:route_social_app/core/network/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Post>>> getPosts({required int pageNumber});

  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, List<Comment>>> getComments(int postId);
}

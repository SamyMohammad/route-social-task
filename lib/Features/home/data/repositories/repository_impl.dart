import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/data/remote/models/posts_response.dart';
import 'package:route_social_app/Features/home/domain/entities/comment.dart';
import 'package:route_social_app/Features/home/domain/entities/user.dart';
import 'package:route_social_app/Features/home/domain/repositories/repository.dart';
import 'package:route_social_app/core/network/error_handler.dart';
import 'package:route_social_app/core/network/failure.dart';
import 'package:route_social_app/core/network/network_info.dart';

import '../remote/data_sources/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<PostResponse>>> getPosts(
      {required int pageNumber}) async {
    // cache is not existing or cache is not valid

    // its the time to get from API side
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response =
            await _remoteDataSource.getPosts(pageNumber: pageNumber);

        if (response[0].title != null) {
          // success
          // return either right
          // return data
          // save home response to cache

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, 'there is an error'));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    // its the time to get from API side
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getUsers();

        if (response[0].name != null) {
          // success
          // return either right
          // return data
          // save home response to cache

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, 'there is an error'));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getComments(postId);

        if (response[0].name != null) {
          // success
          // return either right
          // return data
          // save home response to cache

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, 'there is an error'));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

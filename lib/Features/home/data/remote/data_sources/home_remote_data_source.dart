import 'package:injectable/injectable.dart';
import 'package:route_social_app/Features/home/data/remote/models/comment_response.dart';
import 'package:route_social_app/Features/home/data/remote/models/posts_response.dart';
import 'package:route_social_app/Features/home/data/remote/models/user_response.dart';
import 'package:route_social_app/core/network/app_api.dart';

abstract class HomeRemoteDataSource {
  Future<List<PostResponse>> getPosts({required int pageNumber});

  Future<List<UserResponse>> getUsers();

  Future<List<CommentResponse>> getComments(int postId);
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final AppServiceClient _appServiceClient;

  HomeRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<List<PostResponse>> getPosts({required int pageNumber}) async {
    return await _appServiceClient.getPosts(pageNumber: pageNumber);
  }

  @override
  Future<List<UserResponse>> getUsers() async {
    return await _appServiceClient.getUsers();
  }

  @override
  Future<List<CommentResponse>> getComments(int postId) async {
    return await _appServiceClient.getComments(postId);
  }
}

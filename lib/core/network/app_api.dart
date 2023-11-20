import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:route_social_app/Features/home/data/remote/models/comment_response.dart';
import 'package:route_social_app/Features/home/data/remote/models/posts_response.dart';
import 'package:route_social_app/Features/home/data/remote/models/user_response.dart';
import 'package:route_social_app/core/utils/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  @factoryMethod
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/posts")
  Future<List<PostResponse>> getPosts({
    @Field('page') int? pageNumber,
    @Field('per_page') int? perPage = 10,
  });

  @GET("/users")
  Future<List<UserResponse>> getUsers();

  @GET("/comments")
  Future<List<CommentResponse>> getComments(
    @Query('post_id') int? postId,
  );
}

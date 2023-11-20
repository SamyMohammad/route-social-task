import 'package:json_annotation/json_annotation.dart';
import 'package:route_social_app/Features/home/domain/entities/post.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class PostResponse extends Post {
  PostResponse({
    @JsonKey(name: "id") super.id,
    @JsonKey(name: "user_id") super.userId,
    @JsonKey(name: "title") super.title,
    @JsonKey(name: "body") super.body,
  });

  // toJson
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

//fromJson
  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}

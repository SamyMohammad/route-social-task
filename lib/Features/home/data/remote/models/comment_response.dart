import 'package:json_annotation/json_annotation.dart';
import 'package:route_social_app/Features/home/domain/entities/comment.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse extends Comment {
  CommentResponse({
    @JsonKey(name: "id") super.id,
    @JsonKey(name: "post_id") super.postId,
    @JsonKey(name: "name") super.name,
    @JsonKey(name: "body") super.body,
    @JsonKey(name: "email") super.email,
  });

  // toJson
  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);

//fromJson
  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
}

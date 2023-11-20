// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      id: json['id'] as num?,
      postId: json['postId'] as num?,
      name: json['name'] as String?,
      body: json['body'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'name': instance.name,
      'body': instance.body,
      'email': instance.email,
    };

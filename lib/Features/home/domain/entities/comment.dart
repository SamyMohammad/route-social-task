import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  Comment({this.id, this.postId, this.body, this.name, this.email});

  num? id;
  num? postId;
  String? name;
  String? body;
  String? email;

  @override
  List<Object?> get props => [id, postId, name, body, email];
}

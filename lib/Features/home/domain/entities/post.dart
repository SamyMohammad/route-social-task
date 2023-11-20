import 'package:equatable/equatable.dart';

class Post extends Equatable {
  Post({this.id, this.userId, this.body, this.title});

  num? id;
  num? userId;
  String? title;
  String? body;

  @override
  List<Object?> get props => [id, userId, title, body];
}

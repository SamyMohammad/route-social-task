import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({this.id, this.name, this.email, this.gender, this.status});

  num? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  @override
  List<Object?> get props => [id, name, email, gender, status];
}

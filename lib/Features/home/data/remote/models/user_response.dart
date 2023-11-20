import 'package:json_annotation/json_annotation.dart';
import 'package:route_social_app/Features/home/domain/entities/user.dart';

/// id : 5711493
/// name : "Elakshi Abbott"
/// email : "elakshi_abbott@oconnell-cronin.test"
/// gender : "male"
/// status : "inactive"
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends User {
  UserResponse({
    super.id,
    super.name,
    super.email,
    super.gender,
    super.status,
  });

  // toJson
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

//fromJson
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late num id;
  late String name;
  late String password;
  late String gueszyId;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

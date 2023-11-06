// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..password = json['password'] as String
  ..gueszyId = json['gueszyId'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'gueszyId': instance.gueszyId,
    };

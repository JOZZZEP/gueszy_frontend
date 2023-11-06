// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..image = json['image'] as String
  ..categoryId = Category.fromJson(json['categoryId'] as Map<String, dynamic>)
  ..userId = User.fromJson(json['userId'] as Map<String, dynamic>)
  ..play = json['play'] as num
  ..access = json['access'] as num
  ..createAt = json['createAt'] as String;

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'categoryId': instance.categoryId,
      'userId': instance.userId,
      'play': instance.play,
      'access': instance.access,
      'createAt': instance.createAt,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorys _$CategorysFromJson(Map<String, dynamic> json) => Categorys()
  ..categorys = (json['categorys'] as List<dynamic>)
      .map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CategorysToJson(Categorys instance) => <String, dynamic>{
      'categorys': instance.categorys,
    };

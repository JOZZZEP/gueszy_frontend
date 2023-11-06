// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabularys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabularys _$VocabularysFromJson(Map<String, dynamic> json) => Vocabularys()
  ..vocabularys = (json['vocabularys'] as List<dynamic>)
      .map((e) => Vocabulary.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$VocabularysToJson(Vocabularys instance) =>
    <String, dynamic>{
      'vocabularys': instance.vocabularys,
    };

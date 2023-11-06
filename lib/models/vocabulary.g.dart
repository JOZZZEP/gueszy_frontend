// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) => Vocabulary()
  ..id = json['id'] as num
  ..word = json['word'] as String
  ..gameId = Game.fromJson(json['gameId'] as Map<String, dynamic>);

Map<String, dynamic> _$VocabularyToJson(Vocabulary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'gameId': instance.gameId,
    };

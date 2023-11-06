// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Games _$GamesFromJson(Map<String, dynamic> json) => Games()
  ..games = (json['games'] as List<dynamic>)
      .map((e) => Game.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'games': instance.games,
    };

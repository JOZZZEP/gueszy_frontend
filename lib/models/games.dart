import 'package:json_annotation/json_annotation.dart';
import "game.dart";
part 'games.g.dart';

@JsonSerializable()
class Games {
  Games();

  late List<Game> games;
  
  factory Games.fromJson(Map<String,dynamic> json) => _$GamesFromJson(json);
  Map<String, dynamic> toJson() => _$GamesToJson(this);
}

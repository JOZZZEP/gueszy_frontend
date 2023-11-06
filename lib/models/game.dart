import 'package:json_annotation/json_annotation.dart';
import "category.dart";
import "user.dart";
part 'game.g.dart';

@JsonSerializable()
class Game {
  Game();

  late num id;
  late String name;
  late String image;
  late Category categoryId;
  late User userId;
  late num play;
  late num access;
  late String createAt;
  
  factory Game.fromJson(Map<String,dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}

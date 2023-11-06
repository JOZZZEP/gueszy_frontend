import 'package:json_annotation/json_annotation.dart';
import "game.dart";
part 'vocabulary.g.dart';

@JsonSerializable()
class Vocabulary {
  Vocabulary();

  late num id;
  late String word;
  late Game gameId;
  
  factory Vocabulary.fromJson(Map<String,dynamic> json) => _$VocabularyFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyToJson(this);
}

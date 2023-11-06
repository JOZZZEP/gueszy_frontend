import 'package:json_annotation/json_annotation.dart';
import "vocabulary.dart";
part 'vocabularys.g.dart';

@JsonSerializable()
class Vocabularys {
  Vocabularys();

  late List<Vocabulary> vocabularys;
  
  factory Vocabularys.fromJson(Map<String,dynamic> json) => _$VocabularysFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularysToJson(this);
}

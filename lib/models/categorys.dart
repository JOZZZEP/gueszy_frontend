import 'package:json_annotation/json_annotation.dart';
import "category.dart";
part 'categorys.g.dart';

@JsonSerializable()
class Categorys {
  Categorys();

  late List<Category> categorys;
  
  factory Categorys.fromJson(Map<String,dynamic> json) => _$CategorysFromJson(json);
  Map<String, dynamic> toJson() => _$CategorysToJson(this);
}

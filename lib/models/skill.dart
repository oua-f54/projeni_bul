import 'package:json_annotation/json_annotation.dart';
part "skill.g.dart";


@JsonSerializable()
class Skill{
  String? id;
  String? name;

  Skill({required this.id, required this.name});

  factory Skill.fromJson(Map<String,dynamic> json) => _$SkillFromJson(json);
  Map<String,dynamic> toJson() => _$SkillToJson(this);
}
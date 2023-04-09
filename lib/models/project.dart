import 'package:json_annotation/json_annotation.dart';
part 'project.g.dart';

@JsonSerializable()
class Project{
  String? id;
  String? author;
  String? description;
  String? image;
  String? name;
  String? skill;

  Project({required this.id, required this.author, required this.description, required this.image, required this.name, required this.skill});

  factory Project.fromJson(Map<String,dynamic> json) => _$ProjectFromJson(json);
  Map<String,dynamic> toJson() => _$ProjectToJson(this);

}
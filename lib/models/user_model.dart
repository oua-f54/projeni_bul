import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  String? id;
  String? name;
  String? email;
  String? password;

  UserModel({required this.id,required this.name,required this.email,required this.password});

  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
  Map<String,dynamic> toJson() => _$UserModelToJson(this);
}


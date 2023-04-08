import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  final String id;
  final String name;
  final String email;
  final String password;

  UserModel(this.id, this.name, this.email, this.password);

  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
  Map<String,dynamic> toJson() => _$UserModelToJson(this);
}


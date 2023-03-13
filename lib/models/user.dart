import 'package:json_annotation/json_annotation.dart';
import "role.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  // 用户名
  late String username;
  // 年龄
  late num age;
  String? gender;
  List<Role>? roles;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

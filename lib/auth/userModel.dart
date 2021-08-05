// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.mobile,
    this.token,
  });
// 5220180, 2601356
  int id;

  String email;
  String password;
  String name;
  String mobile;
  String token;

  // UserModel(this.name, this.mobile, this.address);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        mobile: json["mobile"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "mobile": mobile,
        "token": token,
      };
}

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.rut,
    this.accessToken,
    this.email,
    this.name,
    this.lastname,
    this.career,
    this.profileImage,
    this.id,
  });

  String rut;
  String accessToken;
  String email;
  String name;
  String lastname;
  String career;
  String profileImage;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        rut: json["rut"],
        accessToken: json["accessToken"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        career: json["career"],
        profileImage: json["profileImage"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "rut": rut,
        "accessToken": accessToken,
        "email": email,
        "name": name,
        "lastname": lastname,
        "career": career,
        "profileImage": profileImage,
        "_id": id,
      };
}

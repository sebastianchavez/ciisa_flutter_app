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
    this.profileImage,
    this.id,
  });

  String rut;
  String accessToken;
  String email;
  String name;
  String profileImage;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        rut: json["rut"],
        accessToken: json["accessToken"],
        email: json["email"],
        name: json["name"],
        profileImage: json["profileImage"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "rut": rut,
        "accessToken": accessToken,
        "email": email,
        "name": name,
        "profileImage": profileImage,
        "_id": id,
      };
}

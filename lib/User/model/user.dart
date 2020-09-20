import 'package:flutter/material.dart';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String lastname;
  final DateTime lastLogin;
  final String profileImage;
  final String type;
  final String state;
  final bool active;
  final String accessToken;
  final String deviceToken;

  User({
    Key key,
    @required this.email,
    @required this.name,
    @required this.type,
    @required this.state,
    @required this.active,
    this.accessToken,
    this.id,
    this.deviceToken,
    this.lastLogin,
    this.lastname,
    this.password,
    this.profileImage
  });
}
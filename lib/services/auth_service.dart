import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ingenieria_flutter/global/environment.dart';
import 'package:ingenieria_flutter/models/user.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _auth = false;
  // final _storage = new FlutterSecureStorage();

  bool get auth => this._auth;
  set auth(bool value) {
    this._auth = value;
    notifyListeners();
  }

  Future<bool> login(String rut, String password) async {
    this.auth = true;

    final data = {'rut': rut.trim(), 'password': password.trim()};

    final resp = await http.put('${Environment.apiUrl}/users/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.auth = false;
    print('Response: ${resp.body}');
    if (resp.statusCode == 200) {
      final response = userFromJson(resp.body);
      this.user = response;

      // TODO: Guardar token y datos de usuario

      return true;
    } else {
      return false;
    }
  }
}

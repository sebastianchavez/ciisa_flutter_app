import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ingenieria_flutter/global/environment.dart';
import 'package:ingenieria_flutter/models/response.dart';
import 'package:ingenieria_flutter/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _auth = false;
  final _storage = new FlutterSecureStorage();

  bool get auth => this._auth;
  set auth(bool value) {
    this._auth = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<DefaultResponse> login(String rut, String password) async {
    this.auth = true;

    final data = {'rut': rut.trim(), 'password': password.trim()};

    final resp = await http.put('${Environment.apiUrl}/users/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.auth = false;
    print('Response: ${resp.body}');
    final response = responseFromJson(resp.body);
    if (resp.statusCode == 200) {
      this.user = userFromJson(resp.body);
      // TODO: Guardar token y datos de usuario

      await this._saveToken(this.user.accessToken);

      response.data = [this.user];
      response.message = 'Exito';
      return response;
    } else {
      response.ok = false;
      return response;
    }
  }

  Future _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await _storage.deleteAll();
  }
}

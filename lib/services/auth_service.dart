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
  bool _rutIsValid = false;
  bool _passwordIsValid = false;
  bool _loginSubmit = false;
  final _storage = new FlutterSecureStorage();

  bool get auth => this._auth;
  set auth(bool value) {
    this._auth = value;
    notifyListeners();
  }

  bool get rutIsValid => this._rutIsValid;
  set rutIsValid(bool value) {
    this._rutIsValid = value;
    notifyListeners();
  }

  bool get passwordIsValid => this._passwordIsValid;
  set passwordIsValid(bool value) {
    this._passwordIsValid = value;
    notifyListeners();
  }

  bool get loginSubmit => this._loginSubmit;
  set loginSubmit(bool value) {
    this._loginSubmit = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String> getUser() async {
    final _storage = new FlutterSecureStorage();
    final user = await _storage.read(key: 'currentUser');
    return user;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<DefaultResponse> login(String rut, String password) async {
    this._auth = true;
    final firebaseToken = await _storage.read(key: 'firebaseToken');
    final data = {
      'rut': rut.trim(),
      'password': password.trim(),
      'firebaseToken': firebaseToken
    };

    final resp = await http.put('${Environment.apiUrl}/users/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print('Response: ${resp.body}');
    final response = responseFromJson(resp.body);
    if (resp.statusCode == 200) {
      this.user = userFromJson(resp.body);
      await this._saveUser(this.user);
      await this._saveToken(this.user.accessToken);

      response.data = [this.user];
      response.message = 'Exito';
      response.ok = true;
      this._auth = false;
      return response;
    } else {
      response.ok = false;
      this._auth = false;
      return response;
    }
  }

  Future _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await _storage.deleteAll();
  }

  Future isLoggedIn() async {
    try {
      String accessToken = await _storage.read(key: 'token');
      if (accessToken != '') {
        final resp = await http.get('${Environment.apiUrl}/users/accessToken',
            headers: {'Authorization': 'Bearer ${accessToken}'});
        if (resp.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print('Catch error: ${e}');
      return false;
    }
  }

  Future _saveUser(User user) async {
    final value = {
      "id": user.id,
      "name": user.name,
      "lastname": user.lastname,
      "email": user.email,
      "": user.profileImage
    };
    await _storage.write(key: 'currentUser', value: value.toString());
  }
}

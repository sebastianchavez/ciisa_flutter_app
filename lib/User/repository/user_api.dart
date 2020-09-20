import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ingenieria_flutter/env.dart';

class UserApi {
  Dio dio = new Dio();

  signIn(email, password) async {
    try {
      return await dio.put('${Environment().apiUrl}/users/login', data: {
        "email": email.toString().trim(),
        "password": password.toString().trim(),
        "type": "user"
      }, options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: e.response.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  signOut() {

  }

  getUser() {

  }

  updateUser() {

  }

}
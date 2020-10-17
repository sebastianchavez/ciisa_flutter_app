import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.0.11:3006/api'
      : 'http://localhost:3006/api';
}
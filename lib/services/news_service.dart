import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ingenieria_flutter/global/environment.dart';
import 'package:ingenieria_flutter/models/news.dart';
import 'package:ingenieria_flutter/models/response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NewsService with ChangeNotifier {
  final _storage = new FlutterSecureStorage();
  dynamic _news;
  List<dynamic> _listNews;

  List get listNews => this._listNews;
  set listNews(List value) {
    this._listNews = value;
    notifyListeners();
  }

  dynamic get news => this._news;
  set news(dynamic value) {
    this._news = value;
    notifyListeners();
  }

  bool get hasNews => (this._news != null) ? true : false;

  Future<DefaultResponse> getFirstNews() async {
    String accessToken = await this._storage.read(key: 'token');
    final resp = await http.get('${Environment.apiUrl}/news/first',
        headers: {'Authorization': 'Bearer ${accessToken}'});
    final response = responseFromJson(resp.body);
    print('RESPONSE: ${response.data}');
    if (resp.statusCode == 200) {
      // this._listNews = response.data;
      response.ok = true;
      return response;
    } else {
      response.ok = false;
      return response;
    }
  }
}

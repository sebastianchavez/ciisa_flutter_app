
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ingenieria_flutter/global/environment.dart';
import 'package:ingenieria_flutter/models/response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActivitiesService with ChangeNotifier {
  final _storage = new FlutterSecureStorage();
  dynamic _activities;
  List<dynamic> _listActivities;

  List get listActivities => this._listActivities;
  set listActivities(List value) {
    this._listActivities = value;
    notifyListeners();
  }

  dynamic get activities => this._activities;
  set activities(dynamic value) {
    this._activities = value;
    notifyListeners();
  }

  bool get hasActivities => (this._activities != null) ? true : false;

  Future<DefaultResponse> getFirstActivities() async {
    String accessToken = await this._storage.read(key: 'token');
    final resp = await http.get('${Environment.apiUrl}/activities/',
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

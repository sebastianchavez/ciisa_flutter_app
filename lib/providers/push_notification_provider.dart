import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PushNotificationsProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _storage = new FlutterSecureStorage();

  final _messageStreamController = StreamController<String>.broadcast();
  Stream<String> get messages => _messageStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print("===== FCM Token =====");
      this._storage.write(key: 'firebaseToken', value: token);
      print(token);
      // TODO: Guardar token en local para usar en caso de autenticar
    });

    _firebaseMessaging.configure(onMessage: (info) {
      print("===== On Message =====");
      print(info);

      String argument = 'no-data';
      if (Platform.isAndroid) {
        argument = info['data']['comida'] ?? 'no-data';
      }

      print(argument);

      _messageStreamController.sink.add(argument);
    }, onLaunch: (info) {
      print("===== On Launch =====");
      print(info);
    }, onResume: (info) {
      print("===== On Resume =====");
      print(info);
      String argument = 'no-data';
      if (Platform.isAndroid) {
        // TODO: manejar data
        // argument = info['data']['comida'] ?? 'no-data';
      }

      print(argument);

      _messageStreamController.sink.add(argument);
    });
  }

  dispose() {
    _messageStreamController?.close();
  }
}

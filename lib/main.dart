import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/pages/comentary.dart';
import 'package:ingenieria_flutter/pages/config.dart';
import 'package:ingenieria_flutter/pages/detail.dart';
import 'package:ingenieria_flutter/pages/home.dart';
import 'package:ingenieria_flutter/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (_) => Login(),
        '/home': (_) => Home(),
        '/detail': (_) => Detail(),
        '/comentary': (_) => Comentary(),
        '/config': (_) => Config()
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/pages/login.dart';
import 'package:ingenieria_flutter/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //initialRoute: 'login',
      //routes: {'login': (_) => Login()},
      home: Profile("Sebastian", "Cornejo", "sebastian.cornejo.silva@ciisa.cl"),
    );
  }
}

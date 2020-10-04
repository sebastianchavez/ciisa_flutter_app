import 'package:flutter/material.dart';
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
      initialRoute: '/home',
      routes: {'/login': (_) => Login(), '/home': (_) => Home()},
    );
  }
}

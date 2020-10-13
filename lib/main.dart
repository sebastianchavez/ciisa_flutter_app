import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/pages/calendar.dart';
import 'package:ingenieria_flutter/pages/change_password.dart';
import 'package:ingenieria_flutter/pages/comentary.dart';
import 'package:ingenieria_flutter/pages/config.dart';
import 'package:ingenieria_flutter/pages/detail.dart';
import 'package:ingenieria_flutter/pages/home.dart';
import 'package:ingenieria_flutter/pages/login.dart';
import 'package:ingenieria_flutter/pages/next_events.dart';
import 'package:ingenieria_flutter/pages/profile.dart';
import 'package:ingenieria_flutter/pages/recovery_pass.dart';
import 'package:ingenieria_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/login',
        routes: {
          '/login': (_) => Login(),
          '/home': (_) => Home(),
          '/detail': (_) => Detail(),
          '/comentary': (_) => Comentary(),
          '/config': (_) => Config(),
          '/calendar': (_) => Calendar(),
          '/change-password': (_) => ChangePassword(),
          '/next-events': (_) => NextEvents(),
          '/profile': (_) => Profile(),
          '/recovery-pass': (_) => RecoveryPass()
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/pages/calendar_page.dart';
import 'package:ingenieria_flutter/pages/change_password_page.dart';
import 'package:ingenieria_flutter/pages/comentary_page.dart';
import 'package:ingenieria_flutter/pages/config_page.dart';
import 'package:ingenieria_flutter/pages/detail_page.dart';
import 'package:ingenieria_flutter/pages/home_page.dart';
import 'package:ingenieria_flutter/pages/loading_page.dart';
import 'package:ingenieria_flutter/pages/login_page.dart';
import 'package:ingenieria_flutter/pages/next_events_page.dart';
import 'package:ingenieria_flutter/pages/profile_page.dart';
import 'package:ingenieria_flutter/pages/recovery_pass_page.dart';
import 'package:ingenieria_flutter/services/auth_service.dart';
import 'package:ingenieria_flutter/services/news_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => NewsService())
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/loading',
        routes: {
          '/loading': (_) => LoadingPage(),
          '/login': (_) => LoginPage(),
          '/home': (_) => HomePage(),
          '/detail': (_) => DetailPage(),
          '/comentary': (_) => ComentaryPage(),
          '/config': (_) => ConfigPage(),
          '/calendar': (_) => CalendarPage(),
          '/change-password': (_) => ChangePasswordPage(),
          '/next-events': (_) => NextEventsPage(),
          '/profile': (_) => ProfilePage(),
          '/recovery-pass': (_) => RecoveryPassPage()
        },
      ),
    );
  }
}

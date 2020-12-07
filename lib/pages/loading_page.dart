import 'package:flutter/material.dart';
import 'package:ingenieria_flutter/pages/home_page.dart';
import 'package:ingenieria_flutter/pages/login_page.dart';
import 'package:ingenieria_flutter/services/auth_service.dart';
import 'package:ingenieria_flutter/services/news_service.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final newsService = Provider.of<NewsService>(context, listen: false);

    final authenticated = await authService.isLoggedIn();

    print('AUTH: ${authenticated}');
    if (authenticated) {
      final news = await newsService.getFirstNews();
      newsService.listNews = news.data;
      // Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomePage(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}

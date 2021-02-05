import 'package:base_project/presenter/screens/home/home_page.dart';
import 'package:base_project/presenter/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static const HOME_PATH = '/';
  static const LOGIN_PATH = '/login';
  static const POST_PATH = '/post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PATH:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case LOGIN_PATH:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case POST_PATH:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

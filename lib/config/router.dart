import 'package:base_project/data/home_state.dart';
import 'package:base_project/data/login_state.dart';
import 'package:base_project/presenter/screens/home/home_controller.dart';
import 'package:base_project/presenter/screens/home/home_page.dart';
import 'package:base_project/presenter/screens/login/login_controller.dart';
import 'package:base_project/presenter/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => StateNotifierProvider<HomeController, HomeState>(
            create: (_) => HomeController(),
            builder: (context, child) {
              return HomePage();
            },
          ),
        );
      case 'login':
        return MaterialPageRoute(
          builder: (_) => StateNotifierProvider<LoginController, LoginState>(
            create: (_) => LoginController(),
            builder: (context, child) {
              return LoginPage();
            },
          ),
        );
      case 'post':
        return MaterialPageRoute(
          builder: (_) => StateNotifierProvider<HomeController, HomeState>(
            create: (_) => HomeController(),
            builder: (context, child) {
              return HomePage();
            },
          ),
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

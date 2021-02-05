import 'package:base_project/base/result.dart';
import 'package:base_project/config/app_router.dart';
import 'package:base_project/data/login_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<LoginController, LoginState>(
      create: (_) => LoginController(),
      builder: (context, child) {
        return BasePage<LoginState, LoginController>(
          onPageInitialized: (result) {},
          errorView: Center(
            child: Scaffold(
              body: Text('Login error view!'),
            ),
          ),
          loadedView: _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, controller, child) {
        return Center(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    controller.login().then((result) {
                      if (result is Success) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRouter.HOME_PATH);
                      }
                    });
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

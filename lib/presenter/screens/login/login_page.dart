import 'package:base_project/data/login_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<LoginState>(
      onModelReady: () {
        // context.read<LoginController>().
        // not do anything
      },
      errorView: Center(
        child: Scaffold(
          body: Text('An error!'),
        ),
      ),
      loadedView: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, controller, child) {
        return Center(
          child: Scaffold(
            body: Column(
              children: [
                FlatButton(
                  onPressed: () {
                    controller.login();
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

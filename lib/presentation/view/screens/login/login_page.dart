import 'package:base_project/base/base_page.dart';
import 'package:base_project/data/result.dart';
import 'package:base_project/presentation/resource/color.dart';
import 'package:base_project/presentation/route/app_router.dart';
import 'package:base_project/presentation/state/login_state.dart';
import 'package:base_project/presentation/view/widgets/validated_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<LoginController, LoginState>(
      create: (_) => LoginController(),
      builder: (context, child) {
        return BasePage<LoginController, LoginState>(
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValidatedTextFormField(
                hintText: 'username',
              ),
              SizedBox(
                height: 8,
              ),
              ValidatedTextFormField(
                hintText: 'password',
              ),
              SizedBox(
                height: 120,
              ),
              FlatButton(
                color: AppColors.cornflowerBlue,
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
        );
      },
    );
  }
}

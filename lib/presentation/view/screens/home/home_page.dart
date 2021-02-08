import 'package:base_project/base/base_page.dart';
import 'package:base_project/presentation/route/app_router.dart';
import 'package:base_project/presentation/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeController, HomeState>(
      create: (_) => HomeController(),
      builder: (context, child) {
        return BasePage<HomeController, HomeState>(
          onPageInitialized: (result) {
            // todo:
          },
          loadedView: _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Selector<HomeState, int>(
                selector: (context, homeState) => homeState.count,
                builder: (_, count, __) {
                  return Text(
                    'Home loaded with $count!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  );
                }),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              color: Colors.orangeAccent,
              onPressed: () {
                context.read<HomeController>().increase();
              },
              child: Text('increase'),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              color: Colors.grey,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRouter.LOGIN_PATH);
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}

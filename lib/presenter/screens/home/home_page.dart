import 'package:base_project/config/app_router.dart';
import 'package:base_project/data/home_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_page.dart';
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
          return BasePage<HomeState, HomeController>(
            onPageInitialized: (result) {
              print('hoan.dv: onPageInitialized');
            },
            errorView: Container(),
            loadedView: _buildContent(context),
          );
        },
      );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Selector<HomeState, int>(
          selector: (context, homeState) => homeState.count,
          builder: (_, count, __) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 200,),
                  Text('Home loaded with $count!'),
                  FlatButton(
                    onPressed: () {
                      context.read<HomeController>().increase();
                    },
                    child: Text('increase'),
                  ),
                  Spacer(),
                  FlatButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(AppRouter.LOGIN_PATH);
                  }, child: Text('Logout'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

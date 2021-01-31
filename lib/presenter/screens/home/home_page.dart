import 'package:base_project/data/home_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<HomeState>(
      onModelReady: () {
        context.read<HomeController>().loadData();
      },
      errorView: Container(),
      loadedView: _buildContent(context),
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
                children: [
                  Text('Home loaded with $count!'),
                  FlatButton(
                    onPressed: () {
                      context.read<HomeController>().increase();
                    },
                    child: Text('increase'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

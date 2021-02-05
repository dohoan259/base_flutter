import 'package:base_project/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Something wrong!!!'),
          FlatButton(onPressed: () {
            context.read<BaseController>().reload();
          }, child: Text('Retry'),)
        ],
      ),
    );
  }
}

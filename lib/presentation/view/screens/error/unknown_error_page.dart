import 'package:base_project/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnknownErrorPage<C extends BaseController> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Something wrong!!!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50,),
            FlatButton(
              color: Colors.lightGreen,
              onPressed: () {
                context.read<C>().reload();
              },
              child: Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}

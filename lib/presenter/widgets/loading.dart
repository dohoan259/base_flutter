import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  
  Loading({this.opacity = 1.0});
  
  final double opacity;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(this.opacity),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppStyles {
  static InputDecoration validatedTextFormFieldDecoration(
      {String hintText = ''}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelText: hintText,
      labelStyle: TextStyle(
        color: Colors.black.withOpacity(0.3),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }
}

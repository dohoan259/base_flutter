import 'package:base_project/presentation/resource/style.dart';
import 'package:flutter/material.dart';

class ValidatedTextFormField extends StatefulWidget {
  const ValidatedTextFormField({
    Key key,
    this.focusNode,
    this.hintText,
    this.errorText,
  }) : super(key: key);

  final FocusNode focusNode;
  final String hintText;
  final String errorText;

  @override
  _ValidatedTextFormFieldState createState() => _ValidatedTextFormFieldState();
}

class _ValidatedTextFormFieldState extends State<ValidatedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: AppStyles.validatedTextFormFieldDecoration(
              hintText: widget.hintText,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(widget.errorText ?? ''),
      ],
    );
  }
}

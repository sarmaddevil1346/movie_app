import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
  TextFieldsWidget(
      {super.key,
      required this.text,
      this.icon,
      this.outlineInputBorder,
      this.obscureText = false});
  String text;
  OutlineInputBorder? outlineInputBorder;
  final Icon? icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: text,
        border: outlineInputBorder,
        suffixIcon: icon,
      ),
    );
  }
}

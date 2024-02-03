import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
  TextFieldsWidget({
    super.key,
    required this.text,
    this.suffixIcon,
    this.outlineInputBorder,
    this.obscureText = false,
    this.style,
    this.hintTextStyle,
    this.preFixColor,
    this.preFixIcon,
    this.filled = false,
    this.fillColor,
    this.image,
  });
  String text;
  OutlineInputBorder? outlineInputBorder;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final Color? preFixColor;
  final Icon? preFixIcon;
  final bool? filled;
  final Color? fillColor;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: text,
          border: outlineInputBorder,
          suffixIcon: suffixIcon,
          prefixIcon: preFixIcon,
          prefixIconColor: preFixColor,
          hintStyle: hintTextStyle,
          filled: filled,
          prefix: image,
          fillColor: fillColor),
    );
  }
}

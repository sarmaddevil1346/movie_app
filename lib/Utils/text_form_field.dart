import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

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
    required this.controller,
    this.focusNode,
  });

  final String text;
  final OutlineInputBorder? outlineInputBorder;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final Color? preFixColor;
  final Icon? preFixIcon;
  final bool? filled;
  final Color? fillColor;
  final Image? image;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.whiteColor),
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          border: outlineInputBorder,
          suffixIcon: suffixIcon,
          prefixIcon: preFixIcon,
          prefixIconColor: preFixColor,
          hintStyle: const TextStyle(color: Colors.white60),
          filled: filled,
          prefix: image,
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: fillColor),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultTextDecoration extends StatelessWidget {
  const DefaultTextDecoration({
    super.key,
    this.textSize = 16,
    this.textColor = Colors.black,
    required this.text,
    this.fontWeight = FontWeight.normal,
    int? maxLines,
    this.textAlign,
  });

  final String text;
  final double? textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor, fontSize: textSize, fontWeight: fontWeight),
    );
  }
}

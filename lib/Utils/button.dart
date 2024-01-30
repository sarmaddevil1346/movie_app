import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.text, this.style});
  String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          text,
          style: style,
        )),
      ),
    );
  }
}
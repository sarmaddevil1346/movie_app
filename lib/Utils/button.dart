import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    this.style,
    this.color = AppColors.whiteColor,
    required this.onTap,
  });
  String text;
  final TextStyle? style;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 190,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Text(
            text,
            style: style,
          )),
        ),
      ),
    );
  }
}

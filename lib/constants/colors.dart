// color_constants.dart

import 'package:flutter/material.dart';

class AppColors {
  static const Color loginColor = Color.fromRGBO(104, 119, 239, 1.0);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color textFieldFillColor = Color.fromRGBO(57, 65, 76, 1);
  static const Color profileBackgroundColor = Color.fromRGBO(28, 37, 47, 1);
  static const Color navBarColor = Color.fromRGBO(56, 64, 73, 1);
  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    tileMode: TileMode.mirror,
    stops: [0.4, 0.7],
    colors: [
      Color.fromRGBO(104, 119, 239, 1),
      Color.fromRGBO(45, 206, 239, 1),
    ],
  );
}

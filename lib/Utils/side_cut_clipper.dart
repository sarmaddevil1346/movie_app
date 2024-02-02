import 'package:flutter/material.dart';

class SideCutClipper extends CustomClipper<Path> {
  final double xFactor;
  final double yFactor;

  SideCutClipper({this.xFactor = 22.5, this.yFactor = 22.5});

  @override
  Path getClip(Size size) {
    double height = size.height;
    double startY = (height - height / 2.5) - yFactor;
    double xVal = size.width;
    double yVal = 3;
    final path = Path();

    path.lineTo(xVal, yVal);

    yVal = startY;
    path.lineTo(xVal, yVal);

    double scale = 1.1;
    path.cubicTo(xVal, yVal, xVal, yVal + yFactor * scale,
        xVal - xFactor * scale, yVal + yFactor * scale);
    xVal = xVal - xFactor * scale;
    yVal = yVal + yFactor * scale;

    double scale1 = 1.1;
    path.cubicTo(xVal, yVal, xVal - xFactor * scale1, yVal,
        xVal - scale1 * xFactor, yVal + yFactor * scale1);
    xVal = xVal - scale1 * xFactor;
    yVal = yVal + scale1 * yFactor;

    double scale2 = 1.3;
    path.cubicTo(xVal, yVal, xVal, yVal + yFactor * scale2,
        xVal + xFactor * scale2, yVal + yFactor * scale2);
    xVal = xVal + xFactor * scale2;
    yVal = yVal + yFactor * scale2;

    scale = 3;

    path.cubicTo(xVal, yVal, xVal + xFactor * scale, yVal,
        xVal + xFactor * scale, yVal + yFactor * scale);
    xVal = xVal + xFactor * scale;
    yVal = yVal + yFactor * scale;

    path.lineTo(xVal, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

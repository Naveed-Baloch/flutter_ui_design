import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter(
      {required this.bgColor,
      required this.lineColor,
      required this.percent,
      required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgline = Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint Colorline = Paint()
      ..color = lineColor
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 1 / 2, size.height * 1 / 2);
    final radius = min(size.width * 1 / 2, size.height * 1 / 2);

    canvas.drawCircle(center, radius, bgline);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * percent, false, Colorline);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

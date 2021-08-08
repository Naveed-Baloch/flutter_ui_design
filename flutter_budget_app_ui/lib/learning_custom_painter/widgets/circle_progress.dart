import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgress extends StatefulWidget {
  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(30.0),
          width: 330,
          height: 330,
          color: CupertinoColors.white,
          child: CustomPaint(
            foregroundPainter: CircleProgressPainter(progress),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (progress < 1) {
                progress += .1;
              } else if (progress == 1) {
                progress = 0;
              }
            });
          },
          child: Text('Increase Progress'),
        ),
      ],
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  double percentage;

  CircleProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final bgline = Paint()
      ..color = Colors.grey
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;
    final lineColor = Paint()
      ..color = Colors.green
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, bgline);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * percentage, false, lineColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

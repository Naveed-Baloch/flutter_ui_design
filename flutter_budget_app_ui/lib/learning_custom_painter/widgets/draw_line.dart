import 'package:flutter/material.dart';

class LinePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: 330,
      color: Colors.white,
      child: CustomPaint(
        foregroundPainter: LineDrawer(),
      ),
    );
  }
}

class LineDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.blue;
    final s = Offset(size.width * 1 / 6, size.height * 1 / 2);
    final d = Offset(size.width * 5 / 6, size.height * 1 / 2);
    canvas.drawLine(s, d, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

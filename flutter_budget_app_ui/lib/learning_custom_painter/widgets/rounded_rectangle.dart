import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 330,
      child: CustomPaint(foregroundPainter: RRectanglePainter()),
    );
  }
}

class RRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final rect = Rect.fromPoints(
        Offset(size.width * 1 / 6, size.height * 1 / 6),
        Offset(size.width * 5 / 6, size.height * 3 / 6));
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(30));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

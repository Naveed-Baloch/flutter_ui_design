import 'package:flutter/material.dart';

class RectanglePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 330,
        color: Colors.white,
        child: CustomPaint(
          foregroundPainter: RectDrawer(),
        ));
  }
}

class RectDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromPoints(
        Offset(size.width * 1 / 6 , size.height * 1 / 6),
        Offset(size.width * 5 / 6, size.height * 3 / 6));
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

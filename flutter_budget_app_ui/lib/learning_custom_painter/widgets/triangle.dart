import 'package:flutter/material.dart';

class TriAngle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 330,
      height: 330,
      child: CustomPaint(
        foregroundPainter: TriAnglePainter(),
      ),
    );
  }
}

class TriAnglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * .5, size.height * 1 / 6);
    path.lineTo(size.width * 1 / 4, size.height * 4 / 6);
    path.lineTo(size.width * 2 / 3, size.height * 4 / 6);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height*4/5);

    final point1 = Offset(size.width  *1/4, size.height );
    final point2 = Offset(size.width / 2, size.height*4/5);
    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);

    final point3 = Offset(size.width * 3 / 4, size.height * 3 / 5);
    final point4 = Offset(size.width, size.height*4/5);
    path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

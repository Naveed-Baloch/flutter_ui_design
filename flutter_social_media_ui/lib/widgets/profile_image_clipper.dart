import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';

class ProfileImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height*4/5);

    final point1 = Offset(size.width  *1/2, size.height );
    final point2 = Offset(size.width, size.height*4/5);
    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>false;
}

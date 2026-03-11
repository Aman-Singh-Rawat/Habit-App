import 'package:flutter/material.dart';

class TopConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);

    path.quadraticBezierTo(
      size.width / 2,
      40, // curve depth (increase for deeper curve)
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

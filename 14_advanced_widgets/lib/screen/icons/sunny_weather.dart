import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class SunnyWeather extends CustomPainter {
  final Color color;
  final double radius;

  const SunnyWeather({
    this.color = gold,
    this.radius = 30,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = radius
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(radius, radius), radius, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

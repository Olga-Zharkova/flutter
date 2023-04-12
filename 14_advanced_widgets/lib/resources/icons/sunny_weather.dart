import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/sun.dart';

class SunnyWeather extends CustomPainter with MixinSun {
  final Color color;
  final double radius;

  const SunnyWeather({
    this.color = gold,
    this.radius = 30,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.height, 0)
      ..lineTo(size.height, size.width)
      ..lineTo(0, size.width)
      ..lineTo(0, 0);

    final paint = Paint()
      ..color = Colors.blueGrey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint);
    paintSun(canvas, size, color, radius);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

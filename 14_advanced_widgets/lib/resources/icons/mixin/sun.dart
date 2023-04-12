import 'package:flutter/material.dart';

mixin MixinSun{
  void paintSun(Canvas canvas, Size size, Color color, double radius) {
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = radius
      ..style = PaintingStyle.fill;

    return canvas.drawCircle(Offset(radius, radius), radius, painter);
  }
}
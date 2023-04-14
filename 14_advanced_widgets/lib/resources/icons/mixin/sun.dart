import 'package:flutter/material.dart';

mixin MixinSun{
  void paintSun(Canvas canvas, double size, Color color) {
    final double radius = size/5;
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    return canvas.drawCircle(Offset(size/2, size/4), radius, painter);
  }
}
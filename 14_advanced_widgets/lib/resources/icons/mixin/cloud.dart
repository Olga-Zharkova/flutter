import 'package:flutter/material.dart';

mixin MixinCloud {
  paintCloud(
    Canvas canvas,
    double size,
    Color color,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size / 2.5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final double dy = size / 2;

    return canvas.drawLine(
      Offset(size * 0.25, dy),
      Offset(size * 0.75, dy),
      paint,
    );
  }
}

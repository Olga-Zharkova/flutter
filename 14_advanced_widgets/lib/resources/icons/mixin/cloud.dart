import 'package:flutter/material.dart';

mixin MixinCloud {
  paintCloud(
    Canvas canvas,
    double size,
    Color color,
    double radius,
  ) {
    final ovalPaint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill;

    final a = Offset(0, size * 2 / 3);
    final b = Offset(size * 3 / 2, size * 4 / 3);
    final rect = Rect.fromPoints(a, b);
    return canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect,
          Radius.circular(radius),
        ),
        ovalPaint);
  }
}

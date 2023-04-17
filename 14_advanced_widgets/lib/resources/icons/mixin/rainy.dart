import 'package:flutter/material.dart';

mixin MixinRainy {
  paintRainy(
      Canvas canvas,
      double size,
      Color color,
      ) {
    final double mySize = size;
    final paint = Paint()
      ..color = color
      ..strokeWidth = mySize / 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double endDy = mySize * 0.85;
    final double startDy = mySize * 0.75;

    canvas.drawLine(
      Offset(mySize * 0.3, startDy),
      Offset(mySize * 0.25, endDy),
      paint,
    );
    canvas.drawLine(
      Offset(mySize * 0.5, startDy),
      Offset(mySize * 0.45, endDy),
      paint,
    );
    canvas.drawLine(
      Offset(mySize * 0.7, startDy),
      Offset(mySize * 0.65, endDy),
      paint,
    );
  }
}

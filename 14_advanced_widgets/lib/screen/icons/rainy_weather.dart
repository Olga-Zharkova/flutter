import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class RainyWeather extends CustomPainter {
  final Color colorRainy;
  final Color colorCloudy;
  final double size;

  const RainyWeather({
    this.colorRainy = skyBlue,
    this.colorCloudy = dimGrey,
    this.size = 90.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final ovalPaint = Paint()
      ..color = colorCloudy
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill;

    final a = Offset(0, this.size * 2 / 3);
    final b = Offset(this.size * 3 / 2, this.size * 4 / 3);
    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(this.size / 3);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), ovalPaint);

    final linePaint = Paint()
      ..color = colorRainy
      ..style = PaintingStyle.fill;

    double widthRainy = 2;
    double dx = this.size / 10;
    double moveToY = this.size * 5 / 3;
    double lineToY = this.size * 4 / 3 + widthRainy;

    var line1 = Path()
      ..moveTo(dx * 2, moveToY)
      ..lineTo(dx * 3, lineToY)
      ..lineTo(dx * 3 + widthRainy, lineToY + widthRainy)
      ..close();

    canvas.drawPath(line1, linePaint);

    var line2 = Path()
      ..moveTo(dx * 6, moveToY)
      ..lineTo(dx * 7, lineToY)
      ..lineTo(dx * 7 + widthRainy, lineToY + widthRainy)
      ..close();

    canvas.drawPath(line2, linePaint);

    var line3 = Path()
      ..moveTo(this.size, moveToY)
      ..lineTo(dx * 11, lineToY)
      ..lineTo(dx * 11 + widthRainy, lineToY + widthRainy)
      ..close();

    canvas.drawPath(line3, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

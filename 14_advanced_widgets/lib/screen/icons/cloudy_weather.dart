import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class CloudyWeather extends CustomPainter {
  final Color colorSunny;
  final Color colorCloudy;
  final double size;

  const CloudyWeather({
    this.colorSunny = gold,
    this.colorCloudy = lightGrey,
    this.size = 90.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radiusSunny = this.size / 3;
    final sunnyPaint = Paint()
      ..color = colorSunny
      ..strokeCap = StrokeCap.round
      ..strokeWidth = radiusSunny
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(radiusSunny * 2, radiusSunny * 2), radiusSunny, sunnyPaint);

    final ovalPaint = Paint()
      ..color = colorCloudy
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill;

    final a = Offset(0, this.size * 2 / 3);
    final b = Offset(this.size * 3 / 2, this.size * 4 / 3);
    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(radiusSunny);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), ovalPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

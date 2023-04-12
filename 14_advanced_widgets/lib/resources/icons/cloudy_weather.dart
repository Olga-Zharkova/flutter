import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/cloud.dart';
import 'mixin/sun.dart';

class CloudyWeather extends CustomPainter with MixinSun, MixinCloud {
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
    double radiusSunny = this.size / 3;

    paintSun(canvas, size, colorSunny, radiusSunny);

    paintCloud(canvas, this.size, colorCloudy, radiusSunny);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

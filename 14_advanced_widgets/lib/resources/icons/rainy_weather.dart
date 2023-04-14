import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/cloud.dart';

class RainyWeather extends CustomPainter with MixinCloud {
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
    paintCloud(canvas, size.height, colorCloudy);

    final double mySize = size.height;
    final paint = Paint()
      ..color = colorRainy
      ..strokeWidth = mySize / 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double endDy = mySize * 0.9;
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

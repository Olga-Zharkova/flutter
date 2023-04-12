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

    paintCloud(canvas, this.size, colorCloudy, this.size / 3);

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

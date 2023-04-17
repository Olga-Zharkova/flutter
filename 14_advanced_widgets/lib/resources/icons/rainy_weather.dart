import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/cloud.dart';
import 'mixin/rainy.dart';

class RainyWeather extends CustomPainter with MixinCloud, MixinRainy {
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

    paintRainy(canvas, size.height, colorRainy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

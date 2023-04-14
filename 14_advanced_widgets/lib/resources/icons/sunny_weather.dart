import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/sun.dart';

class SunnyWeather extends CustomPainter with MixinSun {
  final Color color;

  const SunnyWeather({
    this.color = gold,
  });

  @override
  void paint(Canvas canvas, Size size) {
    paintSun(canvas, size.height, color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

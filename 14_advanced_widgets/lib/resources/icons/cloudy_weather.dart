import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'mixin/cloud.dart';
import 'mixin/sun.dart';

class CloudyWeather extends CustomPainter with MixinSun, MixinCloud {
  final Color colorSunny;
  final Color colorCloudy;

  const CloudyWeather({
    this.colorSunny = gold,
    this.colorCloudy = lightGrey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    paintSun(canvas, size.height, colorSunny);

    paintCloud(canvas, size.height, colorCloudy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

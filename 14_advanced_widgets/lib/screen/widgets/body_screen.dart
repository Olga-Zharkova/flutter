import 'package:flutter/material.dart';

import '../icons/rainy_weather.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: CustomPaint(
        painter: RainyWeather(),
      ),
    );
  }
}

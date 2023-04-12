import 'package:advanced_widgets/resources/icons/cloudy_weather.dart';
import 'package:advanced_widgets/resources/icons/sunny_weather.dart';
import 'package:flutter/material.dart';

import '../../resources/icons/rainy_weather.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  late double indicator;
  late Widget widgetWeather;

  @override
  void initState() {
    indicator = 0;
    getWidgetWeather(indicator);
    super.initState();
  }

  void getWidgetWeather(double indicator) {
    late Widget newWidget;
    if (indicator < 0.3) {
      newWidget = const CustomPaint(
        painter: SunnyWeather(),
      );
    }
    if (indicator >= 0.3 && indicator <= 7) {
      newWidget = const CustomPaint(
        painter: CloudyWeather(),
      );
    }
    if (indicator > 0.7) {
      newWidget = const CustomPaint(
        painter: RainyWeather(),
      );
    }
    setState(() => widgetWeather = newWidget);
  }

  void increaseIndicator(double oldIndicator) {
    double newIndicator = oldIndicator + 0.1;
    setState(() => indicator = newIndicator);
    getWidgetWeather(newIndicator);
  }

  void decreaseIndicator(double oldIndicator) {
    double newIndicator = oldIndicator - 0.1;
    setState(() => indicator = newIndicator);
    getWidgetWeather(newIndicator);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: Colors.amber,
            height: 300,
            width: 300,
            child: widgetWeather,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: Colors.green,
                onPressed: () => increaseIndicator(indicator),
                icon: const Icon(Icons.add),
              ),
              IconButton(
                color: Colors.green,
                onPressed: () => decreaseIndicator(indicator),
                icon: const Icon(Icons.minimize),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:advanced_widgets/resources/icons/cloudy_weather.dart';
import 'package:advanced_widgets/resources/icons/sunny_weather.dart';
import 'package:flutter/material.dart';

import '../../resources/enum/weather_text.dart';
import '../../resources/icons/rainy_weather.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  late double indicator;
  late Widget widgetWeather;
  late double weatherUnit;
  late String weatherText;
  late int weatherNumber;
  late bool isWeatherEnlargedWidget;

  @override
  void initState() {
    indicator = 0.8;
    _getWeatherElement(indicator);
    weatherUnit = 0.2;
    isWeatherEnlargedWidget = false;
    super.initState();
  }

  void _getWeatherElement(double indicator) {
    late Widget newWidget;
    late String newWeatherText;
    late int newWeatherNumber = ((1 - indicator) * 20).toInt();
    if (indicator < 0.5) {
      newWidget = const CustomPaint(
        painter: SunnyWeather(),
      );
      newWeatherText = WeatherText.sunny.value;
    }
    if (indicator >= 0.5 && indicator < 1) {
      newWidget = const CustomPaint(
        painter: CloudyWeather(),
      );
      newWeatherText = WeatherText.cloudy.value;
    }
    if (indicator == 1) {
      newWidget = const CustomPaint(
        painter: RainyWeather(),
      );
      newWeatherText = WeatherText.rainy.value;
    }
    setState(() {
      widgetWeather = newWidget;
      weatherText = newWeatherText;
      weatherNumber = newWeatherNumber;
    });
  }

  void _increaseIndicator(double oldIndicator) {
    if (oldIndicator > 0.8) return;
    double newIndicator = oldIndicator + weatherUnit;
    setState(() => indicator = newIndicator);
    _getWeatherElement(newIndicator);
  }

  void _decreaseIndicator(double oldIndicator) {
    if (oldIndicator < 0.2) return;
    double newIndicator = oldIndicator - weatherUnit;
    setState(() => indicator = newIndicator);
    _getWeatherElement(newIndicator);
  }

  void _changeWeatherSizeWidget() {
    setState(() => isWeatherEnlargedWidget = !isWeatherEnlargedWidget);
  }

  AlignmentGeometry _getAlignmentWeatherWidget() {
    return isWeatherEnlargedWidget ? Alignment.center : Alignment.topRight;
  }

  double _getSizeWeatherWidget() {
    return isWeatherEnlargedWidget ? 200 : 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 300,
          width: 300,
          child: GestureDetector(
            onTap: _changeWeatherSizeWidget,
            child: AnimatedContainer(
              curve:  Curves.ease,
              alignment: _getAlignmentWeatherWidget(),
              duration: const Duration(seconds: 2),
              height: _getSizeWeatherWidget(),
              width: _getSizeWeatherWidget(),
              child: SizedBox(
                height: _getSizeWeatherWidget(),
                width: _getSizeWeatherWidget(),
                child: widgetWeather,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isWeatherEnlargedWidget,
          child: Text(
            '$weatherText, $weatherNumber',
            style: const TextStyle(color: Colors.red),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Colors.green,
              onPressed: () => _increaseIndicator(indicator),
              icon: const Icon(Icons.add),
            ),
            IconButton(
              color: Colors.green,
              onPressed: () => _decreaseIndicator(indicator),
              icon: const Icon(Icons.minimize),
            ),
          ],
        ),
      ],
    );
  }
}

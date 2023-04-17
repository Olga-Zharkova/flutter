import 'package:advanced_widgets/resources/icons/cloudy_weather.dart';
import 'package:advanced_widgets/resources/icons/sunny_weather.dart';
import 'package:flutter/material.dart';

import '../../resources/enums/weather_text.dart';
import '../../resources/icons/rainy_weather.dart';
import '../../resources/renders/text_decoration.dart';

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
  late GlobalKey animatedContainerKey;

  @override
  void initState() {
    indicator = 0.8;
    weatherUnit = 0.1;
    isWeatherEnlargedWidget = false;
    _getWeatherElements(indicator);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 500,
          width: 300,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            alignment: _getAlignmentWeatherWidget(),
            duration: const Duration(seconds: 2),
            height: _getSizeWeatherWidget(),
            width: _getSizeWeatherWidget(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _changeWeatherSizeWidget,
                  child: SizedBox(
                    height: _getSizeWeatherWidget(),
                    width: _getSizeWeatherWidget(),
                    child: widgetWeather,
                  ),
                ),
                Visibility(
                  visible: isWeatherEnlargedWidget,
                  child: TextDecoration(
                    color: Theme.of(context).cardColor,
                    child: Text(
                      '$weatherText, $weatherNumber',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
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

  void _getWeatherElements(double indicator) {
    late Widget newWidget;
    late String newWeatherText;
    late int newWeatherNumber = ((1 - indicator) * 20).toInt();

    String colorSunSt = "#ffd700";
    String colorCloudSt = "#d3d3d3";
    String colorRainySt = "#87ceeb";

    double opacityRainy = _getRainyOpacity(indicator);
    double opacitySun = _getSunOpacity(indicator);
    double opacityCloud = _getCloudOpacity(indicator);

    Color colorRainy = _getHexColor(
      color: colorRainySt,
      opacity: opacityRainy,
    );

    Color colorSun = _getHexColor(
      color: colorSunSt,
      opacity: opacitySun,
    );

    Color colorCloud = _getHexColor(
      color: colorCloudSt,
      opacity: opacityCloud,
    );

    if (indicator < 0.5) {
      newWidget = CustomPaint(
        painter: SunnyWeather(color: colorSun),
      );
      newWeatherText = WeatherText.sunny.value;
    }
    if (indicator >= 0.4 && indicator <= 0.7) {
      newWidget = CustomPaint(
        painter: CloudyWeather(colorCloudy: colorCloud, colorSunny: colorSun),
      );
      newWeatherText = WeatherText.cloudy.value;
    }
    if (indicator > 0.7) {
      newWidget = CustomPaint(
        painter: RainyWeather(colorRainy: colorRainy, colorCloudy: colorCloud),
      );
      newWeatherText = WeatherText.rainy.value;
    }
    setState(() {
      widgetWeather = newWidget;
      weatherText = newWeatherText;
      weatherNumber = newWeatherNumber;
    });
  }

  Color _getHexColor({
    required String color,
    required double opacity,
  }) {
    int decOpacity = (opacity * 255).toInt();
    String opacityString = decOpacity.toRadixString(16);
    final buffer = StringBuffer();
    if (color.length == 6 || color.length == 7) buffer.write(opacityString);
    buffer.write(color.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  double _getRainyOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }
    return 10 / 3 * value - 7 / 3;
  }

  double _getSunOpacity(double value) {
    if (value > 0.7) {
      return 0;
    }
    return -10 / 7 * value + 1;
  }

  double _getCloudOpacity(double value) {
    if (value < 0.4) {
      return 0;
    }
    return 3/5 * value -2/3;
  }

  void _increaseIndicator(double oldIndicator) {
    if (oldIndicator > 0.8) return;
    double newIndicator = oldIndicator + weatherUnit;
    setState(() => indicator = newIndicator);
    _getWeatherElements(newIndicator);
  }

  void _decreaseIndicator(double oldIndicator) {
    if (oldIndicator < weatherUnit) return;
    double newIndicator = oldIndicator - weatherUnit;
    setState(() => indicator = newIndicator);
    _getWeatherElements(newIndicator);
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
}

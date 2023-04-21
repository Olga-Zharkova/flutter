import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  textTheme: _textLight(_themeLight.textTheme),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  navigationBarTheme: _navigationBarLight(_themeLight.navigationBarTheme),
  bottomNavigationBarTheme: _bottomNavigationBarLight(
    _themeLight.bottomNavigationBarTheme,
  ),
  chipTheme: _chipLight(_themeLight.chipTheme),
  cardColor: firstColor,
  focusColor: Colors.red,
  hoverColor: secondColor,
  indicatorColor: secondColor,
  colorScheme: ColorScheme(
    background: secondColor,
    primary: firstColor,
    onPrimary: firstColor,
    secondary: firstColor,
    brightness: Brightness.light,
    onSecondary: firstColor,
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.red,
    secondaryContainer: Colors.green,
    onSecondaryContainer: Colors.green,
    onErrorContainer: Colors.red,
    surface: Colors.tealAccent,
    onSurface: secondColor,
  ),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyLarge: TextStyle(color: secondColor),
    bodySmall: const TextStyle(color: Colors.white, fontSize: 22),
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: secondColor,
  );
}

ChipThemeData _chipLight(ChipThemeData base) {
  return base.copyWith(
    selectedColor: firstColor,
    backgroundColor: secondColor,
    checkmarkColor: Colors.white,
    labelStyle: _chipLightLabelStyle(base.labelStyle),
  );
}

TextStyle _chipLightLabelStyle(TextStyle? textStyle) {
  const Color color = Colors.white;
  return textStyle?.copyWith(color: color) ?? const TextStyle(color: color);
}

BottomNavigationBarThemeData _bottomNavigationBarLight(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    backgroundColor: secondColor,
  );
}

NavigationBarThemeData _navigationBarLight(NavigationBarThemeData base) {
  return base.copyWith(backgroundColor: secondColor);
}

Color firstColor = Colors.deepOrange.shade100;
Color secondColor = Colors.black54;

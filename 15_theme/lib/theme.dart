import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  textTheme: _textLight(_themeLight.textTheme),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  navigationBarTheme: _navigationBarLight(_themeLight.navigationBarTheme),
  bottomNavigationBarTheme:
      _bottomNavigationBarLight(_themeLight.bottomNavigationBarTheme),
  cardColor: firstColor,
  focusColor: Colors.red,
  hoverColor: secondColor,
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
    bodySmall: const TextStyle(color: Colors.white),
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: secondColor,
  );
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

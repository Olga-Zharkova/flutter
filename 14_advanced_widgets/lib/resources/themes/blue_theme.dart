import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData blueTheme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.cyan,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.blue),
        headline2: TextStyle(color: Colors.blue),
        headline3: TextStyle(color: Colors.blue),
        headline4: TextStyle(color: Colors.blue),
        headline5: TextStyle(color: Colors.blue),
        headline6: TextStyle(color: Colors.blue),
        subtitle1: TextStyle(color: Colors.blue),
        subtitle2: TextStyle(color: Colors.blue),
        bodyText1: TextStyle(color: Colors.blue),
        bodyText2: TextStyle(color: Colors.blue),
        caption: TextStyle(color: Colors.blue),
        button: TextStyle(color: Colors.blue),
        overline: TextStyle(color: Colors.blue),
      ),
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.cyan,
      cardColor: Colors.cyan,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: lightCyan,
    );

import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData yellowTheme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.yellow,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.yellow),
        headline2: TextStyle(color: Colors.yellow),
        headline3: TextStyle(color: Colors.yellow),
        headline4: TextStyle(color: Colors.yellow),
        headline5: TextStyle(color: Colors.yellow),
        headline6: TextStyle(color: Colors.yellow),
        subtitle1: TextStyle(color: Colors.yellow),
        subtitle2: TextStyle(color: Colors.yellow),
        bodyText1: TextStyle(color: Colors.yellow),
        bodyText2: TextStyle(color: Colors.yellow),
        caption: TextStyle(color: Colors.yellow),
        button: TextStyle(color: Colors.yellow),
        overline: TextStyle(color: Colors.yellow),
      ),
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.yellow,
      cardColor: Colors.yellow,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: lightGoldenrodYellow,
    );

import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData redTheme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.red),
        headline2: TextStyle(color: Colors.red),
        headline3: TextStyle(color: Colors.red),
        headline4: TextStyle(color: Colors.red),
        headline5: TextStyle(color: Colors.red),
        headline6: TextStyle(color: Colors.red),
        subtitle1: TextStyle(color: Colors.red),
        subtitle2: TextStyle(color: Colors.red),
        bodyText1: TextStyle(color: Colors.red),
        bodyText2: TextStyle(color: Colors.red),
        caption: TextStyle(color: Colors.red),
        button: TextStyle(color: Colors.red),
        overline: TextStyle(color: Colors.red),
      ),
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.red,
      cardColor: Colors.red,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: mistyRose,
    );

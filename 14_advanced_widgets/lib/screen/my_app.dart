import 'package:flutter/material.dart';

import '../resources/themes/theme_list.dart';
import '../resources/themes/yellow_theme.dart';
import 'widgets/body_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Icon _iconColorTheme(Color color) {
    return Icon(Icons.radio_button_checked, color: color);
  }

  ThemeData _selectTheme = yellowTheme();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _selectTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButton<ThemeData>(
              items: themeList.map((ThemeData themeData) {
                return DropdownMenuItem<ThemeData>(
                  value: themeData,
                  child: Center(
                    child: _iconColorTheme(themeData.primaryColor),
                  ),
                );
              }).toList(),
              onChanged: (ThemeData? newTheme) {
                if (newTheme != null) {
                  setState(() => _selectTheme = newTheme);
                }
              },
            ),
          ],
        ),
        body: const BodyScreen(),
      ),
    );
  }
}

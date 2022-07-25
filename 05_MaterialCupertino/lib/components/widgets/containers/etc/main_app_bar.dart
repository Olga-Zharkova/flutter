//главная панель приложения
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.openEndDrawer,
  }) : super(key: key);

  final Function() openEndDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Flutter Demo Home Page',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: openEndDrawer,
          icon: const Icon(
            Icons.person,
            size: 35,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  static const _styleTitleButton = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: const Text('Home', style: _styleTitleButton),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/albums');
            },
            child: const Text('Albums', style: _styleTitleButton),
          ),
        ],
      ),
    );
  }
}

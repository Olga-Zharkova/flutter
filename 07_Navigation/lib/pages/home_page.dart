import 'package:flutter/material.dart';
import 'package:navigation/pages/my_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: const ColoredBox(color: Colors.lightBlue),
      drawer: const MyDrawer(),
    );
  }
}

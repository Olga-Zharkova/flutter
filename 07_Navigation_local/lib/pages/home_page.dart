import 'package:flutter/material.dart';
import 'package:untitled5/pages/my_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text('Home page'),
        backgroundColor: Colors.purple.shade500,
      ),
      body: Container(),
      drawer: const MyDrawer(),
    );
  }
}

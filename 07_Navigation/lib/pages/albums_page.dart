
import 'package:flutter/material.dart';
import 'package:navigation/pages/my_drawer.dart';

class AlbumsPage extends StatefulWidget {
  static const routeName ='/albums';
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(),
      drawer: const MyDrawer(),
    );
  }
}

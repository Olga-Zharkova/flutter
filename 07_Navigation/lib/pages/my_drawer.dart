
import 'package:flutter/material.dart';
import 'package:navigation/models/fetch_file.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final Future<String> dataList = fetchFileFromAssets('lib/models/data.json');

  static const _styleTitle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
              child: const Text('Home', style: _styleTitle)),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/albums');
              },
              child: const Text('Albums', style: _styleTitle)),
        ],
      ),
    );
  }
}

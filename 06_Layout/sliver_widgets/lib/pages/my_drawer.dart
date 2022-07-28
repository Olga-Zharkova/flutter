import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          DrawerHeader(
            curve: SawTooth(20),
            child: Text(' I am Drawer'),
          ),
        ],
      ),
    );
  }
}

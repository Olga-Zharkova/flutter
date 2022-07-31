import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          index,
          style: const TextStyle(fontSize: 22),
        ),
        dense: false,
      ),
    );
  }
}

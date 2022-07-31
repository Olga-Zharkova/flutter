import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 500 ? 40 : 150,
          child: Card(
            color: Colors.green,
            margin: const EdgeInsets.all(10),
            //shape: ShapeBorder(BorderRadius.circular(8.0)),
            child: Text(
              index,
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ));
  }
}

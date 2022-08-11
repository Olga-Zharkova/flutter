import 'package:flutter/material.dart';

class DataOutput extends StatelessWidget {
  final String nameFile;
  final String text;

  const DataOutput({Key? key, required this.nameFile, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nameFile.toUpperCase(), style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 15),
          Text(text),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FileIsEmpty extends StatelessWidget {
  const FileIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.red,
      child: Center(
        child: Text(
          'Error! Файл пустой!',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

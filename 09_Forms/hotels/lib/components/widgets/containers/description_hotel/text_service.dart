import 'package:flutter/material.dart';

class TextService extends StatelessWidget {
  final String service;

  const TextService({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Text(service, style: const TextStyle(fontSize: 16, height: 1));
  }
}

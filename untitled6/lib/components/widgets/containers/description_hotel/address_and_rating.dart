import 'package:flutter/material.dart';

class AddressAndRating extends StatelessWidget {
  final String type;
  final String name;

  const AddressAndRating({super.key, required this.type, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$type: ',
        style: const TextStyle(fontSize: 16, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

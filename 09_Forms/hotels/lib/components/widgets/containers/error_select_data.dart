import 'package:flutter/material.dart';

class ErrorSelectData extends StatelessWidget {
  final String errorMessage;

  const ErrorSelectData({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text(
            errorMessage,
            style: const TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

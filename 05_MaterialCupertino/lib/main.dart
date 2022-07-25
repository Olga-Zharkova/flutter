import 'package:flutter/material.dart';
import 'package:untitled2/pages/scaffold_example.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ScaffoldExample(),
    ),
  );
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

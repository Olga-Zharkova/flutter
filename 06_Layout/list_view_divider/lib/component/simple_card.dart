import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  const SimpleCard({Key? key, required this.index}) : super(key: key);

  final String index;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  void initState() {
    super.initState();
  }

  void disponce() {
    super.dispose();
    //print('dispose ${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(widget.index, style: const TextStyle(fontSize: 22)),
        dense: false,
      ),
    );
  }
}

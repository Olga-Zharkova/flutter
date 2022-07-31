import 'package:flutter/material.dart';

class VerticalScreenLayout extends StatefulWidget {
  const VerticalScreenLayout({Key? key, required this.data}) : super(key: key);
  final List<Widget> data;

  @override
  State<VerticalScreenLayout> createState() => _VerticalScreenLayoutState();
}

class _VerticalScreenLayoutState extends State<VerticalScreenLayout> {
  final ScrollController _controller = ScrollController(initialScrollOffset: 0);

  @override
  void initstate() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset.floor());
      print('MAX SCROLL EXTENT: ${_controller.position.maxScrollExtent}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: widget.data.length,
        itemBuilder: (context, index) => widget.data[index],
      ),
    );
  }
}

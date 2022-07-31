import 'package:flutter/material.dart';

class HorizontalScreenLayout extends StatefulWidget {
  const HorizontalScreenLayout({Key? key, required this.data})
      : super(key: key);
  final List<Widget> data;

  @override
  State<HorizontalScreenLayout> createState() => _HorizontalScreenLayoutState();
}

class _HorizontalScreenLayoutState extends State<HorizontalScreenLayout> {
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 5),
      itemCount: widget.data.length,
      itemBuilder: (context, index) => widget.data[index],
    );
  }
}

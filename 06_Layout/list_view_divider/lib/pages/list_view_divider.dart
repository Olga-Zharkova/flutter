import 'package:flutter/material.dart';
import 'package:untitled4/components/widgets/containers/etc/simple_card.dart';

class ListViewDivider extends StatefulWidget {
  const ListViewDivider({Key? key}) : super(key: key);

  @override
  State<ListViewDivider> createState() => _ListViewDividerState();
}

class _ListViewDividerState extends State<ListViewDivider> {
  final List<Widget> _data = List.generate(1000, (index) {
    return SimpleCard(index: index.toString());
  });

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
    return Scaffold(
      body: ListView.separated(
        controller: _controller,
        itemCount: _data.length,
        itemBuilder: (context, index) => _data[index],
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled4/components/widgets/containers/etc/horizontal_screen_layout.dart';
import 'package:untitled4/components/widgets/containers/etc/simple_card.dart';
import 'package:untitled4/components/widgets/containers/etc/vertical_screen_layout.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<Widget> _data = List.generate(
    1000,
    (index) {
      return SimpleCard(
        index: index.toString(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return width > 500
                ? HorizontalScreenLayout(data: _data)
                : VerticalScreenLayout(data: _data);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/carousel_slider_widget.dart';
import 'package:untitled/image_svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Hello!',
                style: TextStyle(fontFamily: 'TiroDevanagariSanskrit'),
              ),
            ),
            body: ListView(
              children: const [
                Padding(padding: EdgeInsets.only(top: 5)),
                Text('Первое задание'),
                ImageSVG(),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text('Второе задание'),
                CarouselSliderWidget(),
                Padding(padding: EdgeInsets.only(top: 5)),
              ],
            )));
  }
}

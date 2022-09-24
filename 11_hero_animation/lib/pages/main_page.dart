import 'package:flutter/material.dart';
import 'package:val1/components/data/articleList.dart';

import 'package:val1/components/widgets/card_animation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Animation'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (context, index) {
          return CardAnimation(article: articleList[index]);
        },
      ),
    );
  }
}

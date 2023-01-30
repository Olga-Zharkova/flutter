import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../business/counter.dart';
import '../basket_content.dart';

class MyBadge extends StatelessWidget {
  final int count;

  const MyBadge({
    super.key,
    required this.count,
  });

  void getBasket(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BasketContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 3, end: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent:
      Consumer<Counter>(
        builder: (context, state, child) => Text(
          count.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      // Observer(
      //   builder: (context) => Text(
      //     count.toString(),
      //     style: const TextStyle(color: Colors.white),
      //   ),
      // ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        padding: const EdgeInsets.only(right: 30.0),
        onPressed: () => getBasket(context),
      ),
    );
  }
}

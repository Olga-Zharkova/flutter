import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../basket_content.dart';

class MyBadge extends StatelessWidget {
  final Widget count;

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
      badgeContent: count,
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        padding: const EdgeInsets.only(right: 30.0),
        onPressed: () => getBasket(context),
      ),
    );
  }
}

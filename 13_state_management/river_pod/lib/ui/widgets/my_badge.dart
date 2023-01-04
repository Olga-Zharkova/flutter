
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';


class MyBadge extends StatelessWidget {
  final int count;
  const MyBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 3, end: 18),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        padding: const EdgeInsets.only(right: 30.0),
        onPressed: () {},
      ),
    );
  }
}

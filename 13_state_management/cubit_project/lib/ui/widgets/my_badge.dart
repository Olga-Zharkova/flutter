import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;

  const MyBadge({super.key, required this.count, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Badge(
        position: BadgePosition.topEnd(top: 3, end: 3),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          count.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onPressed,
        ),
      ),
    );
  }
}


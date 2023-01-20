import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business/counter.dart';

class MyBadge extends StatelessWidget {
  final VoidCallback onPressed;

  const MyBadge({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Badge(
        position: BadgePosition.topEnd(top: 3, end: 3),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Consumer<Counter>(
          builder: (context, state, child) => Text(
            state.selectProduct.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

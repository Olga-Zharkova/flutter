
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business/counter.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 3, end: 18),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Consumer<Counter>(
        builder: (context, state, child) => Text(
          state.value.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        padding: const EdgeInsets.only(right: 30.0),
        onPressed: () {},
      ),
    );
  }
}

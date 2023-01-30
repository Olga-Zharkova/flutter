import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../business/counter.dart';

import 'widgets/card_basket_product.dart';

class BasketContent extends ConsumerWidget {
  const BasketContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final setProducts = count.toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: setProducts.length,
        itemBuilder: (context,
                index) => //Container(color: Colors.blue, height: 20, width: 10,)
            CardBasketProduct(
          product: setProducts.toList()[index],
          count: count
              .where((element) => element == setProducts.toList()[index])
              .length,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features.dart';

import '../../business/counter.dart';

class CardBasketProduct extends ConsumerWidget {
  final Product product;
  final int count;

  const CardBasketProduct({
    super.key,
    required this.product,
    required this.count,
  });

  void incrementProduct(provider, Product product) {
    provider.increment(product);
  }

  void decreaseProduct(provider, Product product) {
    provider.decrease(product);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(counterProvider.notifier);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  child: Image.asset('assets/images/${product.image}.jpg'),
                ),
                const SizedBox(width: 10),
                Text(product.name),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => incrementProduct(provider, product),
                  icon: const Icon(Icons.add),
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(color: Colors.green),
                ),
                IconButton(
                    onPressed: () => decreaseProduct(provider, product),
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

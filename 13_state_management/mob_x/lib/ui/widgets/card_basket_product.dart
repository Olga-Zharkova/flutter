import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features.dart';

import '../../business/counter.dart';

class CardBasketProduct extends StatelessWidget {
  final Product product;
  final int count;

  const CardBasketProduct({
    super.key,
    required this.product,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Counter>(context);

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
                  onPressed: () => state.increment(product),
                  icon: const Icon(Icons.add),
                ),
                Consumer<Counter>(
                  builder: (context, state, child) => Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
                // Observer(
                //   builder: (context) => Text(
                //     count.toString(),
                //     style: const TextStyle(color: Colors.black),
                //   ),
                // ),
                IconButton(
                    onPressed: () => state.decrease(product),
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

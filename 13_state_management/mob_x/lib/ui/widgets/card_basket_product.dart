import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features.dart';

import '../../business/counter.dart';

class CardBasketProduct extends StatefulWidget {
  final Product product;
  final Widget count;

  const CardBasketProduct({
    super.key,
    required this.product,
    required this.count,
  });

  @override
  State<CardBasketProduct> createState() => _CardBasketProductState();
}

class _CardBasketProductState extends State<CardBasketProduct> {
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
                  child:
                      Image.asset('assets/images/${widget.product.image}.jpg'),
                ),
                const SizedBox(width: 10),
                Text(widget.product.name),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => state.increment(widget.product),
                  icon: const Icon(Icons.add),
                ),
                widget.count,
                IconButton(
                    onPressed: () => state.decrease(widget.product),
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

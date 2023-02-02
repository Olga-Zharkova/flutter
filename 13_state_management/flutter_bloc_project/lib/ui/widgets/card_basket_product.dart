import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features.dart';

import '../../business/counter_bloc.dart';
import '../../business/counter_event.dart';

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
  void incrementProduct(Product product) {
    context.read<CounterBloc>().add(CounterIncrementPressed(product));
  }

  void decreaseProduct(Product product) {
    context.read<CounterBloc>().add(CounterDecreasePressed(product));
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => incrementProduct(widget.product),
                  icon: const Icon(Icons.add),
                ),
                widget.count,
                IconButton(
                    onPressed: () => decreaseProduct(widget.product),
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

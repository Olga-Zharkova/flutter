import 'package:flutter/material.dart';
import 'package:untitled1/features.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/product_list_bloc/basket_bloc.dart';
import '../../business/product_list_bloc/basket_event.dart';

class CardHomeProduct extends StatelessWidget {
  final Product product;

  const CardHomeProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    void addProduct(Product product) {
      context.read<BasketBloc>().add(BasketIncrementPressed(product));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/${product.image}.jpg'),
                  //pseudo-code here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.name,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: 100,
              color: Colors.blue.shade300,
              child: TextButton(
                onPressed: () => addProduct(product),
                child: const Text(
                  'купить',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

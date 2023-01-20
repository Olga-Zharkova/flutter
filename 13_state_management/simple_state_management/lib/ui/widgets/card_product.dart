import 'package:flutter/material.dart';
import 'package:untitled1/features.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final VoidCallback addProduct;

  const CardProduct({
    super.key,
    required this.product,
    required this.addProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 170,
              child: Image.asset(product.image),
            ),
            const SizedBox(height: 5),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: 130,
              color: Colors.green,
              child: TextButton(
                onPressed: addProduct,
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

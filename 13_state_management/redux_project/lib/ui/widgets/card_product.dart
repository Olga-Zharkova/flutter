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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 22),
          ),
          IconButton(onPressed: addProduct, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

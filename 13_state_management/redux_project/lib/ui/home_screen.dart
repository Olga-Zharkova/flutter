import 'package:flutter/material.dart';

import 'package:untitled1/features.dart';

import 'widgets/card_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends StatelessWidget {
  final int value;
  final VoidCallback increase;

  const HomeScreen({
    super.key,
    required this.value,
    required this.increase,
  });

  @override
  Widget build(BuildContext context) {
    final DummyProductService dummyProductService = DummyProductService();

    Future<List<Product>> getListProduct() async {
      final newGetProducts = await dummyProductService.getListProduct();
      return newGetProducts;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux'),
        actions: [MyBadge(count: value)],
      ),
      body: FutureBuilder<List<Product>>(
        future: getListProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data;
            return products != null
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProduct(
                        addProduct: increase,
                        product: products[index],
                      );
                    })
                : const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

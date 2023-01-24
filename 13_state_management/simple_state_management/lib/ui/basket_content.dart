import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/ui/widgets/card_basket_product.dart';
import '../business/counter.dart';
import 'package:untitled1/features.dart';

class BasketContent extends StatelessWidget {
  const BasketContent({super.key});

  @override
  Widget build(BuildContext context) {
    Set<Product> setProducts = context.watch<Counter>().selectProduct.toSet();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: setProducts.length,
        itemBuilder: (context, index) => CardBasketProduct(
          product: setProducts.toList()[index],
          count: (context.watch<Counter>().selectProduct)
              .where((element) => element == setProducts.toList()[index])
              .length,
        ),
      ),
    );
  }
}

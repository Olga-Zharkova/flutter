import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features.dart';
import '../business/counter.dart';
import 'widgets/card_basket_product.dart';

class BasketContent extends StatelessWidget {
  const BasketContent({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Counter>(context);
    final Set<Product> setProduct = state.listProduct.toSet();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: setProduct.length,
        itemBuilder: (context, index) => CardBasketProduct(
          product: setProduct.toList()[index],
          count: state.listProduct
              .where((element) => element == setProduct.toList()[index])
              .length,
        ),
      ),
    );
  }
}

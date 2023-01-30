import 'package:flutter/material.dart';
import '../business/counter.dart';

import 'widgets/card_basket_product.dart';

class BasketContent extends StatefulWidget {
  final Counter bloc;
  const BasketContent({super.key, required this.bloc});

  @override
  State<BasketContent> createState() => _BasketContentState();
}

class _BasketContentState extends State<BasketContent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: widget.bloc.selectProduct.toSet().length,
        itemBuilder: (context, index) =>
            CardBasketProduct(
          product: widget.bloc.selectProduct.toSet().toList()[index],
          count: (widget.bloc.selectProduct)
              .where((element) =>
          element == widget.bloc.selectProduct.toSet().toList()[index])
              .length,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/features.dart';
import '../business/product_list_bloc/basket_bloc.dart';
import 'widgets/card_basket_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketContent extends StatelessWidget {
  const BasketContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: BlocBuilder<BasketBloc, List<Product>>(builder: (_, state) {
        final Set<Product> setProduct = state.toSet();
        return ListView.builder(
          itemCount: setProduct.length,
          itemBuilder: (context, index) => CardBasketProduct(
            product: setProduct.toList()[index],
            count: Text(
              state
                  .where((element) => element == setProduct.toList()[index])
                  .length
                  .toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }),
    );
  }
}

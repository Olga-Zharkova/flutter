import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/features.dart';

import '../business/counter.dart';
import 'widgets/card_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DummyProductService dummyProductService = DummyProductService();

    Future<List<Product>> getListProduct() async {
      final newGetProducts = await dummyProductService.getListProduct();
      return newGetProducts;
    }

    final state = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mob X'),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Observer(
              builder: (context) => Text(
                state.value.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              padding: const EdgeInsets.only(right: 30.0),
              onPressed: () {},
            ),
          ),
        ],
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
                        addProduct: state.increment,
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

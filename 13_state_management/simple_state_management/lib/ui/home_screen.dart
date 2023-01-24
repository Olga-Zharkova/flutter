import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/ui/basket_content.dart';
import 'package:simple_state_management/ui/widgets/card_home_product.dart';
import 'package:simple_state_management/ui/widgets/my_badge.dart';
import 'package:untitled1/features.dart';

import '../business/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DummyProductService _dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await _dummyProductService.getListProduct();
    return newGetProducts;
  }

  void addProduct(Product product) {
    context.read<Counter>().increment(product);
  }

  void getBasket() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BasketContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple state management'),
        actions: [MyBadge(onPressed: getBasket)],
      ),
      body: FutureBuilder<List<Product>>(
        future: getListProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data;
            return products != null
                ? GridView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardHomeProduct(
                        addProduct: () => addProduct(products[index]),
                        product: products[index],
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

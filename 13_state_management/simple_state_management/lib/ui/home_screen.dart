import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/ui/widgets/card_product.dart';
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

  void addProduct() {
    context.read<Counter>().increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple state management'),
        actions: const [MyBadge()],
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
                        addProduct: addProduct,
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

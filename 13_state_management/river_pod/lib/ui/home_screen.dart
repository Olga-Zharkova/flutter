import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled1/features.dart';

import '../business/counter.dart';
import 'widgets/card_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DummyProductService dummyProductService = DummyProductService();
    final count = ref.watch(counterProvider);
    final provider = ref.watch(counterProvider.notifier);

    Future<List<Product>> getListProduct() async {
      final newGetProducts = await dummyProductService.getListProduct();
      return newGetProducts;
    }

    void addProduct() {
      provider.increment();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod'),
        actions: [MyBadge(count: count)],
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

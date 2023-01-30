import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/ui/basket_content.dart';

import 'package:untitled1/features.dart';
import '../business/counter.dart';

import '../model/service_provider.dart';
import 'widgets/card_home_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void addProduct(provider, Product product) {
    provider.increment(product);
  }

  void getBasket(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BasketContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final provider = ref.watch(counterProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod'),
        actions: [
          MyBadge(
            count: count.length,
            onPressed: () => getBasket(context),
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ServiceProvider().getListProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data;
            return products != null
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardHomeProduct(
                        addProduct: () => addProduct(
                          provider,
                          products[index],
                        ),
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

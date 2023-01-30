import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x/ui/widgets/my_badge.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/features.dart';

import '../business/counter.dart';
import '../model/service_provider.dart';
import 'widgets/card_home_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mob X'),
        actions: [
          MyBadge(count:state.listProduct.length),
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
                        product: products[index],
                        onPressed: () => state.increment(products[index]),
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

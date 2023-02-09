import 'package:flutter/material.dart';

import 'package:untitled1/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/product_list_bloc/basket_bloc.dart';
import '../model/service_provider.dart';
import 'basket_content.dart';
import 'widgets/card_home_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final BasketBloc bloc;

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
        title: const Text('Flutter bloc'),
        actions: [
          BlocBuilder<BasketBloc, List<Product>>(
            builder: (context, state) => MyBadge(
              count: state.length,
              onPressed: () => getBasket(),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ServiceProvider().getListProduct(),
        builder: (context, snapshotList) {
          if (snapshotList.hasData) {
            final products = snapshotList.data;
            return products != null
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardHomeProduct(
                        product: products[index],
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

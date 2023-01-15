import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/business/counter_event.dart';

import 'package:untitled1/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/counter_bloc.dart';

import 'widgets/card_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CounterBloc bloc;
  final DummyProductService dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await dummyProductService.getListProduct();
    return newGetProducts;
  }

  void addProduct(BuildContext context) {
    context.read<CounterBloc>().add(CounterIncrementPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter bloc'),
        actions: [
          BlocBuilder<CounterBloc, int>(
            builder: (_, state) => MyBadge(count: state),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: getListProduct(),
        builder: (context, snapshotList) {
          if (snapshotList.hasData) {
            final products = snapshotList.data;
            return products != null
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProduct(
                        addProduct: () => addProduct(context),
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

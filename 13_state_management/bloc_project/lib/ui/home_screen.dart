import 'package:flutter/material.dart';

import 'package:untitled1/features.dart';

import '../business/counter.dart';
import '../data/couner_event.dart';
import 'widgets/card_product.dart';
import 'widgets/my_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Counter bloc;
  final DummyProductService dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await dummyProductService.getListProduct();
    return newGetProducts;
  }

  void addProduct() {
    bloc.action.add(CounterEvent.increase);
  }

  @override
  void initState() {
    bloc = Counter();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
        actions: [
          StreamBuilder<int>(
            stream: bloc.state,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return MyBadge(count: snapshot.data!);
              } else {
                return MyBadge(count: bloc.value);
              }
            },
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
                        addProduct: addProduct,
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

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
  void initState(){
    super.initState();
    bloc = Counter();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.state,
      builder: (_, snapshot) {
        print('not snapshot');
        if (snapshot.hasData) {
          print('snapshot');
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bloc'),
              actions: [MyBadge(count: snapshot.data!)],
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
                      : const Center(child: CircularProgressIndicator(color: Colors.black,));
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Bloc'),
                    ),
                    body: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bloc'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

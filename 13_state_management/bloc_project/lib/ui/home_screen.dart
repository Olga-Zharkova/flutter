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


  void addProduct(Product product) {
    bloc.action.add(CounterEvent.increase, product);
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
          StreamBuilder<List<Product>>(
            stream: bloc.state,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return MyBadge(count: snapshot.data!.length);
              } else {
                return MyBadge(count: bloc.selectProduct.length);
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
                        addProduct: ()=>addProduct(products[index]),
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

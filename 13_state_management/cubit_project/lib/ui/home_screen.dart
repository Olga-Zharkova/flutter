import 'package:flutter/material.dart';

import 'package:untitled1/features.dart';

import '../business/counter.dart';
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
  late final Counter bloc;

  void addProduct(Product product) {
    bloc.increment(product);
  }

  void getBasket(Counter bloc) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasketContent(bloc: bloc),
      ),
    );
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
        title: const Text('Cubit project'),
        actions: [
          StreamBuilder<List<Product>>(
            stream: bloc.state,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return MyBadge(
                    count: snapshot.data!.length,
                    onPressed: () => getBasket(bloc));
              } else {
                return MyBadge(
                    count: bloc.selectProduct.length,
                    onPressed: () => getBasket(bloc));
              }
            },
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
                        addProduct: () => addProduct(products[index]),
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

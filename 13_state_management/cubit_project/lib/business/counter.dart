import 'dart:async';

import 'package:untitled1/features.dart';

import 'couner_event.dart';


class Counter {
  List<Product> selectProduct = [];
  final _stateController = StreamController<List<Product>>();

  Stream<List<Product>> get state => _stateController.stream;

  void dispose() {
    _stateController.close();
  }

  void increment(Product product) async {
    selectProduct.add(product);
    _stateController.add(selectProduct);
  }
  void decrease(Product product) async {
    selectProduct.removeAt(selectProduct
        .indexOf(selectProduct.lastWhere((element) => element == product)));
    _stateController.add(selectProduct);
  }
}

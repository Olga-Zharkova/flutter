import 'dart:async';

import 'package:untitled1/features.dart';

import 'couner_event.dart';

//Constructor({ this.myGrowableList = const [], }) { if (myGrowableList.isNotEmpty) { this.myGrowableList = myGrowableList; } else { this.myGrowableList = List.empty(growable: true); } }

class Counter {
  List<Product> selectProduct = const [];
  final _stateController = StreamController<List<Product>>();

  Stream<List<Product>> get state => _stateController.stream;

  void dispose() {
    _stateController.close();
  }

  void increment(Product product) async {
    selectProduct = [...selectProduct, product];
    _stateController.add(selectProduct);
  }

  void decrease(Product product) async {
    List<Product> result = [...selectProduct];
    result.removeAt(selectProduct
        .indexOf(selectProduct.lastWhere((element) => element == product)));
    _stateController.add(result);
  }
}

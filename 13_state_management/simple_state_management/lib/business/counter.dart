import 'package:flutter/material.dart';
import 'package:untitled1/features.dart';

class Counter with ChangeNotifier {
  List<Product> selectProduct = [];

  void increment(Product product) {
    selectProduct.add(product);
    notifyListeners();
  }

  void decrease(Product product) {
    selectProduct.removeAt(selectProduct
        .indexOf(selectProduct.lastWhere((element) => element == product)));
    notifyListeners();
  }
}

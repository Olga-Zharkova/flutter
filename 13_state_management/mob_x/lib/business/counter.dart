import 'package:mobx/mobx.dart';
import 'package:untitled1/features.dart';

part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  List<Product> listProduct = [];

  @observable
  bool isLoaded = false;

  @action
  void increment(Product product) {
    listProduct = [...listProduct, product];
  }

  @action
  void decrease(Product product) {
    if (listProduct.length > 1) {
      List<Product> result = [...listProduct];
      result.removeAt(listProduct
          .indexOf(listProduct.lastWhere((element) => element == product)));
      listProduct = [...result];
    }
  }

  @action
  void changeLoadingState() {
    isLoaded = !isLoaded;
  }
}

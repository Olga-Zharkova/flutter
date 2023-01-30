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
    listProduct.add(product);
  }

  @action
  void decrease(Product product) {
    listProduct.removeAt(listProduct
        .indexOf(listProduct.lastWhere((element) => element == product)));
  }

  @action
  void changeLoadingState() {
    isLoaded = !isLoaded;
  }
}

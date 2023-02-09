import 'package:untitled1/features.dart';

abstract class ProductListEvent {}

class BasketIncrementPressed extends ProductListEvent {
  Product product;

  BasketIncrementPressed(this.product);
}

class BasketDecreasePressed extends ProductListEvent {
  Product product;

  BasketDecreasePressed(this.product);
}

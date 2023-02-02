import 'package:untitled1/features.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {
  Product product;

  CounterIncrementPressed(this.product);
}

class CounterDecreasePressed extends CounterEvent {
  Product product;

  CounterDecreasePressed(this.product);
}

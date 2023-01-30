import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features.dart';

final counterProvider = StateNotifierProvider<Counter, List<Product>>((_) => Counter());

class Counter extends StateNotifier<List<Product>> {
  Counter() : super([]);

  void increment(Product product) {
    state.add(product);
  }

  void decrease(Product product){
    state.removeAt(state
        .indexOf(state.lastWhere((element) => element == product)));
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features.dart';

final counterProvider =
    StateNotifierProvider<Counter, List<Product>>((_) => Counter());

class Counter extends StateNotifier<List<Product>> {
  Counter() : super([]);

  void increment(Product product) {
    state = [...state, product];
  }

  void decrease(Product product) {
    List<Product> result = [...state];
    result.removeAt(
        state.indexOf(state.lastWhere((element) => element == product)));
    state = [...result];
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

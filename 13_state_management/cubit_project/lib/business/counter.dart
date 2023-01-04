import 'dart:async';

import '../data/couner_event.dart';

class Counter {
  int value = 0;
  final _stateController = StreamController<int>();

  Stream<int> get state => _stateController.stream;

  void dispose() {
    _stateController.close();
  }

  void increment() async {
    value++;
    _stateController.add(value);
  }
}

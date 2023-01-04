import 'dart:async';

import '../data/couner_event.dart';

class Counter {
  int value = 0;
  final _stateController = StreamController<int>();
  final _eventsController = StreamController<CounterEvent>();

  Stream<int> get state => _stateController.stream;

  Sink<CounterEvent> get action => _eventsController.sink;

  Counter() {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(CounterEvent action) async {
    if (action == CounterEvent.increase) {
      value++;
    }
    _stateController.add(value);
  }
}

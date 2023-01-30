import 'dart:async';

import 'package:untitled1/features.dart';

import '../data/couner_event.dart';

class Counter {
  List<Product> selectProduct = [];
  final _stateController = StreamController<List<Product>>();
  final _eventsController = StreamController<CounterEvent>();

  Stream<List<Product>> get state => _stateController.stream;

  Sink<CounterEvent> get action => _eventsController.sink;

  Counter({required this.selectProduct}) {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(CounterEvent action, Product product) async {
    if (action == CounterEvent.increase) {
      selectProduct.add(product);
    }
    if (action == CounterEvent.decrease) {
      selectProduct.removeAt(selectProduct
          .indexOf(selectProduct.lastWhere((element) => element == product)));
    }
    _stateController.add(selectProduct);
  }
}

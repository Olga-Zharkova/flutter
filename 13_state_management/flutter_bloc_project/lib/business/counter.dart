import 'dart:async';

import '../data/couner_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends Bloc<CounterEvent, int> {
  int value = 0;

  Counter() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increase) {
      value++;
    }
    yield value;
  }
}

import 'dart:async';

import 'package:flutter_bloc_project/business/event.dart';

import 'event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'event.dart';

class Counter extends Bloc<CounterEvent, int> {
  /// {@macro counter_bloc}
  Counter() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit (state  + 1));
  }
}


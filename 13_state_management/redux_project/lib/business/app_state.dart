import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'counter_increment_action.dart';

@immutable
class AppState {
  final int value;
  final bool isLoaded;

  const AppState({
    this.value = 0,
    this.isLoaded = false,
  });

  factory AppState.initial() => const AppState();

  AppState copyWith({
    int? value,
    bool? isLoaded,
  }) {
    return AppState(
      value: value ?? this.value,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'AppState{value: $value}';
  }
}

final incrementReducer = combineReducers<int>([
  TypedReducer<int, CounterIncrementAction>(_increment),
]);

int _increment(int value, CounterIncrementAction action) => ++value;

AppState appReducer(AppState state, action) {
  return AppState(
    value: incrementReducer(state.value, action),
  );
}
